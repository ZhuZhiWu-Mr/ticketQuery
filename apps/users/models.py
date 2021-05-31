from django.db import models


# Create your models here.
class UserProfile(models.Model):
    user_name = models.CharField("账号", max_length=128)
    password = models.CharField("密码", max_length=256)
    nick_name = models.CharField("昵称", max_length=128, default="小鬼")
    user_type = models.IntegerField("用户类型（0.超级管理员 99 普通用户）", default=99)
    head_img_url = models.CharField("用户头像地址", max_length=512)
    full_name = models.CharField("真实姓名", max_length=32)
    age = models.IntegerField("年龄", default=0)
    sex = models.CharField("性别", max_length=4)
    email = models.CharField("邮箱", max_length=128)
    phone = models.CharField("手机号", max_length=16)
    personal = models.CharField("个人简介", max_length=4096)

    def __str__(self):
        return {"id": self.id,"userName": self.user_name, "nickName": self.nick_name,
                "fullName": self.full_name, "age": self.age, "sex": self.sex,
                "email": self.email, "phone": self.phone, "personal": self.personal}
