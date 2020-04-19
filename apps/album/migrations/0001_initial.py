# Generated by Django 3.0.4 on 2020-04-07 15:53

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Album',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.IntegerField(verbose_name='编号')),
                ('name', models.CharField(max_length=20, verbose_name='标签')),
                ('description', models.TextField(default='StormSha的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好', help_text='用来作为SEO中description,长度参考SEO标准', max_length=240, verbose_name='描述')),
                ('img_url', models.CharField(max_length=200, verbose_name='图片地址')),
                ('loves', models.IntegerField(default=0, verbose_name='喜爱量')),
                ('upload_time', models.DateTimeField(auto_now_add=True, verbose_name='上传时间')),
            ],
            options={
                'verbose_name': '标签',
                'verbose_name_plural': '标签',
                'ordering': ['-upload_time'],
            },
        ),
    ]
