# 字典--驼峰转下划线
import time


def dict_lower_case_name(**kwargs):
    result_dict = {}
    for key, value in kwargs.items():
        # 将所有key驼峰转下划线
        lst = []
        new_key = ''
        for index, char in enumerate(key):
            if char.isupper() and index != 0:
                lst.append("_")
            lst.append(char)
        new_key = "".join(lst).lower()
        result_dict[new_key] = value
    return result_dict


def calculation_time_difference(present_time, future_time):
    """

    :param present_time: 现在时间
    :param future_time: 未来时间
    :return: float n个小时
    """
    # 转为时间数组
    present_time_array = time.strptime(present_time, "%Y-%m-%d %H:%M:%S")
    future_time_array = time.strptime(future_time, "%Y-%m-%d %H:%M:%S")
    # timeArray可以调用tm_year等
    # 转为时间戳
    present_time_stamp = int(time.mktime(present_time_array))
    future_time_stamp = int(time.mktime(future_time_array))
    hour = (future_time_stamp - present_time_stamp) / 3600
    return hour


if __name__ == '__main__':
    #
    # 2021-05-03 00:00:00
    present_time = '2021-05-02 00:00:00'
    future_time = '2021-05-01 0:00:00'
    time_hour = calculation_time_difference(present_time, future_time)
    test = {"userName": "tes", "password": "41", "singIn": 42}
    print(time_hour)
