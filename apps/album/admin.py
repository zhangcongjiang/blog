from django.contrib import admin

# Register your models here.
from album.models import Album


@admin.register(Album)
class TagAdmin(admin.ModelAdmin):
    list_display = ('name', 'description', 'img_url')