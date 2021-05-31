# 登录验证中间键
from django.http import JsonResponse
from django.utils.deprecation import MiddlewareMixin
from rest_framework.response import Response
# 登录验证
from apps.utils import code
from apps.utils.login_utils import check_token, get_username

# 忽略登录的url
IGNORE_LOGIN_URL = ['/users/singin', '/users/singup', '/ticket/list_seat_type_total', '/ticket/list_most_cities',
                    '/ticket/list_monthly_ticket_total']


def result_data(msg='', data='', code=0):
    return {
        "code": code,
        "msg": msg,
        "data": data}


class LoginMiddle(MiddlewareMixin):
    def process_view(self, request, view_func, view_args, view_kwargs):
        url = request.path
        print(request.META.get('HTTP_AUTHORIZATION'))
        token = request.META.get('HTTP_AUTHORIZATION')
        print(token)
        print(check_token(token))
        if (not self.check_url_ignore(url)) and check_token(token):
            print(token)
            user_name = get_username(token)
            return view_func(request, user_name)
        # 忽略了的，直接返回视图
        if self.check_url_ignore(url):
            return view_func(request)
        return JsonResponse(result_data(code=code.NOT_SING_IN))

    def check_url_ignore(self, this_url):
        for url in IGNORE_LOGIN_URL:
            if this_url == url:
                return True
        return False
