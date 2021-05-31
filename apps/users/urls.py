from django.conf.urls import url, include
from .views import UserProfiles

urlpatterns = [
    # 注册 post # 登录 patch  # 获取用户信息 get  # 修改用户信息 put
    url(r'^singup$', UserProfiles.as_view()),

    url(r'^singin$', UserProfiles.as_view()),

    url('^get_users$', UserProfiles.as_view()),

    url('^put_users', UserProfiles.as_view())

]
