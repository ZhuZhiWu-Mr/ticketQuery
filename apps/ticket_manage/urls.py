from django.conf.urls import url
from . import views

urlpatterns = {
    # post添加， get获取 delete
    url(r'^tickets', views.TicketView.as_view()),
    # url(r'^del_tickes', views.TicketView.as_view()),
    url(r'^put_tickets', views.TicketView.as_view()),
    url(r'^list_train_place_position', views.TrainPlacePositon.as_view()),
    # 普通用户查询车票操作
    url(r'^list_train_ordinary', views.TrainOrdinaryView.as_view()),

    # 数据可视化
    # 所有座位类型的剩余票数（南丁图）
    url(r'^list_seat_type_total', views.TrainSeatTypeTotal.as_view()),
    # 出发城市最火的前10(条形)

    url(r'^list_most_cities', views.TrainMostCities.as_view()),
    # 每个车次的商务座剩余票总数（折线）
    url(r'list_monthly_ticket_total', views.TrainMonthlyTicketTotal.as_view())


}
