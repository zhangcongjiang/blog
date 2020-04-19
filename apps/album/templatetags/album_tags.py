from django import template

from album.models import Album

# 注册自定义标签函数
register = template.Library()

@register.simple_tag
def get_album_list():
    return Album.objects.filter(number__lte=20)
