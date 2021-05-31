import json

# Create your views here.
from django.utils import timezone
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import PlaceType, Ticket, TrainType, PositionType
from apps.utils import code, data_utils

from django.db.models import Sum, Count


def result_data(data='', msg='', code=0, count=0):
    return {
        "code": code,
        "msg": msg,
        "data": data,
        "count": count}


class TicketView(APIView):

    def get(self, request, user_name=''):
        """
        获取所有车票，小于等于当前时间的不显示
        :param user_name:
        :param request:
        :return:
        """
        data = []
        page = int(request.GET.get('page'))
        limit = int(request.GET.get('limit'))
        # {"startTime": "2021-05-03 00:00:00", "startPlace": "海南", "targetPlace": "深圳", "dTrain": "on", "zTrain": "on",
        #  "kTrain": "on"}
        page = (page - 1) * limit
        limit = page + limit
        now_time = timezone.now()
        ticket_count = Ticket.objects.filter(start_time__gt=now_time).values('id').count()
        tickets = Ticket.objects.filter(start_time__gt=now_time).all()[page:limit]
        for ticket in tickets:
            ticket_dict = ticket.__str__()
            # 计算时间
            ticket_dict["duration"] = data_utils.calculation_time_difference(ticket_dict["startTime"],
                                                                             ticket_dict["arriveTime"])
            data.append(ticket_dict)

        return Response(result_data(data=data, count=ticket_count))

    def post(self, request, user_name=''):
        """
        添加车票
        :param request:
        :return:
        """
        data = json.loads(request.data.get('addData'))
        print(data)
        train_type_name = data.get('trainType', '')
        start_place_name = data.get('startPlace', '')
        target_place_name = data.get('targetPlace', '')
        position_type_name = data.get('positionType', '')
        start_time = data.get('startTime', '')
        arrive_time = data.get('arriveTime', '')
        arrive_type = data.get('arriveType', '')

        shang_wu = data.get('shangWu', '-')
        yi_deng = data.get('yiDeng', '-')
        er_deng = data.get('erDeng', '-')
        gao_ji_ruan_wo = data.get('gaoJiRuanWo', '-')
        dong_wo = data.get('dongWo', '-')
        ying_wo = data.get('yingWo', '-')
        ruan_zuo = data.get('ruanZuo', '-')
        ying_zuo = data.get('yingZuo', '-')
        wu_zuo = data.get('wuZuo', '-')
        qi_ta = data.get('qiTa', '-')
        print(train_type_name)
        print(start_time)
        #
        # {"startTime": "2021-03-15 00:00:00", "arriveTime": "2021-05-11 00:00:00", "trainTypeInput": "k12",
        #  "trainType": "k12", "positionName": "一等坐", "startPlace": "深圳", "targetPlace": "深圳", "title": "正点"}

        # 如果目的地不存在，向目的地类型表中添加，再获取他的id，添加到ticket表中
        if not TrainType.objects.filter(type_name=train_type_name).values('id').first():
            train_type = TrainType(type_name=train_type_name)
            train_type.save()

        if not PlaceType.objects.filter(place_name=target_place_name).values('id').first():
            target_place_type = PlaceType(place_name=target_place_name)
            target_place_type.save()

        if not PlaceType.objects.filter(place_name=start_place_name).values('id').first():
            start_place_type = PlaceType(place_name=start_place_name)
            start_place_type.save()

        if not PositionType.objects.filter(position_name=position_type_name).values('id').first():
            position_type = PositionType(position_name=position_type_name)
            position_type.save()

        train_type_id = TrainType.objects.filter(type_name=train_type_name).values('id').first()["id"]
        target_place_id = PlaceType.objects.filter(place_name=target_place_name).values('id').first()["id"]
        start_place_id = PlaceType.objects.filter(place_name=start_place_name).values('id').first()["id"]
        position_type_id = PositionType.objects.filter(position_name=position_type_name).values('id').first()["id"]

        ticket = Ticket()
        ticket.train_type_id = train_type_id
        ticket.start_place_id = start_place_id
        ticket.target_place_id = target_place_id
        ticket.position_type_id = position_type_id
        ticket.start_time = start_time
        ticket.arrive_time = arrive_time
        ticket.arrive_type = arrive_type
        ticket.shang_wu = shang_wu
        ticket.yi_deng = yi_deng
        ticket.er_deng = er_deng
        ticket.gao_ji_ruan_wo = gao_ji_ruan_wo
        ticket.dong_wo = dong_wo
        ticket.ying_wo = ying_wo
        ticket.ruan_zuo = ruan_zuo
        ticket.ying_zuo = ying_zuo
        ticket.wu_zuo = wu_zuo
        ticket.qi_ta = qi_ta
        ticket.save()
        return Response(result_data(code=code.SUCCESS))

    def put(self, request, user_name=''):
        """
        修改车票信息
        :param user_name:
        :param request:
        :return:
        """
        re_data = request.data
        pk = re_data.get('pk')
        column = re_data.get('column')
        tarValue = re_data.get('tarValue')
        update_dict = data_utils.dict_lower_case_name(**{column: tarValue})
        try:
            ticket = Ticket.objects.filter(id=pk)
            ticket.update(**update_dict)
        except Exception:
            return Response(result_data(code=code.PARAMETER_ERROR))
        return Response(result_data())

    def delete(self, request, user_name=''):
        """
        删除车票
        :param request:
        :return:
        """
        data = request.data
        print('data', data)
        pks = data.get('pks')
        print(pks)
        Ticket.objects.get(id=pks).delete()
        return Response(result_data())

    def patch(self, request):
        return Response()


# 获取车票类别
class TrainPlacePositon(APIView):
    def get(self, request, user_name=''):
        data = {"trainTypes": [],
                "placeTypes": [],
                "positionTypes": []}

        train_types = TrainType.objects.filter().all()
        for train_type in train_types:
            data["trainTypes"].append(train_type.__str__())
        place_types = PlaceType.objects.filter().all()
        for place_type in place_types:
            data["placeTypes"].append(place_type.__str__())
        position_types = PositionType.objects.filter().all()
        for position_type in position_types:
            data["positionTypes"].append(position_type.__str__())
        return Response(result_data(data=data))


# 普通用户查询车票
class TrainOrdinaryView(APIView):
    def get(self, request, user_name=''):
        """
         # {"startTime": "2021-05-03 00:00:00", "startPlace": "深圳", "targetPlace": "海南", "gTrain": "on", "dTrain": "on",
        #  "zTrain": "on", "tTrain": "on", "kTrain": "on", "otherTrain": "on"}
        :param request:
        :return:
        """
        response_data = []
        data = json.loads(request.GET.get('data'))
        start_date = data.get('startTime', '')
        start_place = data.get('startPlace', '')
        target_place = data.get('targetPlace', '')

        train_type_dict = []
        g_train = data.get('gTrain', 'off')
        d_train = data.get('dTrain', 'off')
        z_train = data.get('zTrain', 'off')
        t_train = data.get('tTrain', 'off')
        k_train = data.get('kTrain', 'off')
        other_train = data.get('otherTrain', 'off')
        if g_train == "on":
            train_type_dict.append("G")
        if d_train == "on":
            train_type_dict.append("D")
        if z_train == "on":
            train_type_dict.append("Z")
        if t_train == "on":
            train_type_dict.append("T")
        if k_train == "on":
            train_type_dict.append("K")
        if other_train == "on":
            train_type_dict.append("other")

        page = int(request.GET.get('page', -1))
        limit = int(request.GET.get('limit', -1))
        # {"startTime": "2021-05-03 00:00:00", "startPlace": "海南", "targetPlace": "深圳", "dTrain": "on", "zTrain": "on",
        #  "kTrain": "on"}
        page = (page - 1) * limit
        limit = page + limit
        ticket_count = Ticket.objects.filter(start_time__date=start_date, start_place__place_name=start_place,
                                             target_place__place_name=target_place).count()
        # start_time__in=start_time,
        tickets = Ticket.objects.filter(start_time__date=start_date, start_place__place_name=start_place,
                                        target_place__place_name=target_place).all()
        # tickets = Ticket.objects.filter().all()
        for ticket in tickets:
            ticket_dict = ticket.__str__()
            # 过虑掉没有开启显示的数据
            train_type = ticket_dict.get('trainType', '')
            if train_type[0] in train_type_dict:
                # 计算时间
                ticket_dict["duration"] = data_utils.calculation_time_difference(ticket_dict["startTime"],
                                                                                 ticket_dict["arriveTime"])
                response_data.append(ticket_dict)
        return Response(result_data(data=response_data, count=ticket_count))


class TrainSeatTypeTotal(APIView):
    def get(self, request, user_name=''):
        """
        所有座位类型的剩余票数（南丁图）
        :param request:
        :param user_name:
        :return: [{"name": name, "value": value},]
        """

        ans_data = []
        ticket_total_list = Ticket.objects.aggregate(shangWu=Sum("shang_wu"), yiDeng=Sum("yi_deng"),
                                                     erDeng=Sum("er_deng"), gaoJiRuanWo=Sum("gao_ji_ruan_wo"),
                                                     dongWo=Sum("dong_wo"), yingWo=Sum("ying_wo"),
                                                     ruanZuo=Sum("ruan_zuo"), yingZuo=Sum("ying_zuo"),
                                                     wuZuo=Sum("wu_zuo"))

        for key, val in ticket_total_list.items():
            ans_data.append({"name": key, "value": val})
        return Response(result_data(data=ans_data))


class TrainMostCities(APIView):
    def get(self, request, user_name=""):
        """
        出发城市最火的前10
        :param request:
        :param user_name:
        :return: {"names": [], "values": []}
        """
        ans_data = {"names": [], "values": []}
        ticket_total_list = Ticket.objects.values("start_place__place_name").annotate(
            total=Count("start_place")).order_by("-total")[:10]
        print(ticket_total_list)

        for ticket in ticket_total_list:
            ans_data["names"].append(ticket["start_place__place_name"])
            ans_data["values"].append(ticket["total"])
        return Response(result_data(data=ans_data))


class TrainMonthlyTicketTotal(APIView):
    def get(self, request, user_name=""):
        """
        # 每个车次的商务座剩余票总数
        :param request:
        :param user_name:
        :return:{"names": [], "values": []}
        """
        ans_data = {"names": [], "values": []}
        ticket_total_list = Ticket.objects.values("train_type__type_name").annotate(
            total=Count("shang_wu")
        )

        for ticket in ticket_total_list:
            ans_data["names"].append(ticket["train_type__type_name"])
            ans_data["values"].append(ticket["total"])
        return Response(result_data(data=ans_data))
