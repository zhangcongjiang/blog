from django.db import models

# Create your models here.
from blog import settings


class Album(models.Model):
    number = models.IntegerField('编号')
    name = models.CharField('图片标签', max_length=20)
    description = models.TextField('描述', max_length=240, default=settings.SITE_DESCRIPTION,
                                   help_text='用来作为SEO中description,长度参考SEO标准')
    img_url = models.CharField('图片地址', max_length=200)
    loves = models.IntegerField('喜爱量', default=0)
    upload_time = models.DateTimeField(verbose_name='上传时间', auto_now_add=True)

    class Meta:
        verbose_name = '图片标签'
        verbose_name_plural = verbose_name
        ordering = ['-upload_time']
