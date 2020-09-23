from django.contrib import admin
from .models import *


class PageImg(admin.StackedInline):
    model = PageImage
    extra = 3


@admin.register(PageText)
class PageText(admin.ModelAdmin):
    inlines = [PageImg]
    # list_display = ['title']


admin.site.register([Admin, Slider, Menu])
admin.site.register(SocialMedia)
admin.site.register(News)
admin.site.register(SubMenu)
admin.site.register(DoctorQuestion)
admin.site.register(Doctor)
admin.site.register(Keywords)
admin.site.register(ToMail)
admin.site.register(MedicalTechnologies)
admin.site.register(Contact)
admin.site.register(Department)
