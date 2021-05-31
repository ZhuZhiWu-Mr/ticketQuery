from django.db import models
from datetime import datetime


class TrainType(models.Model):
    type_name = models.CharField(verbose_name="车次类型名", unique=True, max_length=128)

    def __str__(self):
        return {
            "id": self.id,
            "typeName": self.type_name}


class PlaceType(models.Model):
    place_name = models.CharField(verbose_name="地名", unique=True, max_length=128)

    def __str__(self):
        return {
            "id": self.id,
            "placeName": self.place_name
        }


class PositionType(models.Model):
    position_name = models.CharField(verbose_name="位置（一等、二等...）", max_length=128)

    def __str__(self):
        return {
            "id": self.id,
            "positionName": self.position_name
        }


# Create your models here.
class Ticket(models.Model):
    train_type = models.ForeignKey(TrainType, verbose_name="车次类型（k..z..）", on_delete=models.CASCADE, null=True,
                                   blank=True)
    start_place = models.ForeignKey(PlaceType, related_name="start_place", verbose_name="出发地",
                                    on_delete=models.CASCADE,
                                    null=True, blank=True)
    target_place = models.ForeignKey(PlaceType, related_name="target_place", verbose_name="目的地",
                                     on_delete=models.CASCADE, null=True, blank=True)
    position_type = models.ForeignKey(PositionType, verbose_name="位置类型", on_delete=models.CASCADE, null=True,
                                      blank=True)
    start_time = models.DateTimeField(verbose_name="出发时间", default=datetime.now)
    arrive_time = models.DateTimeField(verbose_name="到达时间", default=datetime.now)
    arrive_type = models.CharField(verbose_name="正点/晚点", max_length=32, default="正点")
    shang_wu = models.IntegerField(verbose_name="商务座", default=0)
    yi_deng = models.IntegerField(verbose_name="一等座", default=0)
    er_deng = models.IntegerField(verbose_name="二等座", default=0)
    gao_ji_ruan_wo = models.IntegerField(verbose_name="高级软卧", default=0)
    dong_wo = models.IntegerField(verbose_name="动卧", default=0)
    ying_wo = models.IntegerField(verbose_name="硬卧", default=0)
    ruan_zuo = models.IntegerField(verbose_name="软座", default=0)
    ying_zuo = models.IntegerField(verbose_name="硬座", default=0)
    wu_zuo = models.IntegerField(verbose_name="无座", default=0)
    qi_ta = models.IntegerField(verbose_name="其他", default=0)

    def __str__(self):
        return {"id": self.id, "trainType": self.train_type.type_name,
                "startPlace": self.start_place.place_name, "targetPlace": self.target_place.place_name,
                "positionType": self.position_type.position_name, "startTime": str(self.start_time),
                "arriveTime": str(self.arrive_time), "arriveType": self.arrive_type, "shangWu": self.shang_wu,
                "yiDeng": self.yi_deng, "erDeng": self.er_deng, "gaoJiRuanWo": self.gao_ji_ruan_wo,
                "dongWo": self.dong_wo, "yingWo": self.ying_wo, "ruanZuo": self.ruan_zuo, "yingZuo": self.ying_zuo,
                "wuZuo": self.wu_zuo, "qiTa": self.qi_ta
                }
