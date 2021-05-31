import json

from rest_framework.views import APIView
from rest_framework.response import Response
from ..utils import code, data_utils
from .models import UserProfile
from apps.utils.login_utils import create_token
from apps.utils.data_utils import dict_lower_case_name


# Create your views here.

def result_data(msg='', data='', code=0):
    return {
        "code": code,
        "msg": msg,
        "data": data}


class UserProfiles(APIView):

    def get(self, request, user_name=''):
        """
        获取用户信息
        :param user_name:
        :param request:
        :return:
        """
        print('user_name', user_name)

        user_str = UserProfile.objects.filter(user_name=user_name).first().__str__()
        return Response(result_data(data=user_str))

    def post(self, request):
        """
        注册
        :param request:
        :return:
        """
        data = request.data
        password = data.get('passwd', '')
        user_name = data.get('userName', '')
        user_type = request.POST.get("userType", 99)

        if (password == '') or (user_name == ''):
            return Response(result_data(code=code.LACK_PARAMETER))

        # 账号已经存在
        if UserProfile.objects.filter(user_name=user_name).count() > 0:
            return Response(result_data(code=code.ACCOUNT_EXISTS))

        user_profile = UserProfile()
        user_profile.user_name = user_name
        user_profile.password = password
        user_profile.user_type = user_type
        user_profile.save()
        return Response(result_data(code=code.SUCCESS, msg="登录过期"))

    def put(self, request, user_name=''):
        """
        修改用户信息
        :param user_name:
        :param request:
        :return:
        """
        print('user_name',user_name)
        data = json.loads(request.data.get('data'))
        print(data, type(data))
        data = data_utils.dict_lower_case_name(**data)
        print(data)
        try:
            user_profile = UserProfile.objects.filter(user_name=user_name)
            user_profile.update(**data)
        except BaseException as e:
            print(e)
            return Response(result_data(code=code.PARAMETER_ERROR))
        return Response(result_data())

    def delete(self, request):
        """
        删除用户
        :param request:
        :return:
        """
        return Response('delete')

    def patch(self, request):
        """
        登录
        :param request:
        :return:
        """
        print('登录')
        data = request.data
        password = data.get('password', '')
        user_name = data.get('userName', '')
        if (password == '') or (user_name == ''):
            return Response(result_data(code=code.LACK_PARAMETER))
        user_info = UserProfile.objects.filter(user_name=user_name, password=password).values('nick_name',
                                                                                              'user_type').first()
        if not user_info:
            return Response(result_data(code=code.ACCOUNT_NOT_EXISTS))

        result = {"token": create_token(user_name),
                  "nickName": user_info["nick_name"],
                  "userType": user_info["user_type"]}
        return Response(result_data(data=result))
