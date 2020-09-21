from ckeditor.fields import RichTextField
from django.db import models
from cloudinary.models import CloudinaryField
from datetime import datetime


class Admin(models.Model):
    username = models.CharField(max_length=15)
    password = models.CharField(max_length=100)
    status = models.CharField(max_length=1, default="1")

    def __str__(self):
        return self.username

    class Meta:
        verbose_name_plural = "Admins"


class Department(models.Model):
    # doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE, null=True, blank=True)
    name_en = models.CharField(max_length=100)
    name_gr = models.CharField(max_length=100)
    name_ru = models.CharField(max_length=100)
    name_tr = models.CharField(max_length=100)
    description_en = models.TextField()
    description_gr = models.TextField()
    description_ru = models.TextField()
    description_tr = models.TextField()
    status = models.CharField(max_length=1, default="1")
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.name_en

    class Meta:
        verbose_name_plural = "Departments"


class Doctor(models.Model):
    image = CloudinaryField('image')
    banner_image = CloudinaryField('banner_image')
    full_name_en = models.CharField(max_length=100)
    full_name_gr = models.CharField(max_length=100)
    full_name_ru = models.CharField(max_length=100)
    full_name_tr = models.CharField(max_length=100)
    profession_en = models.CharField(max_length=100)
    profession_gr = models.CharField(max_length=100)
    profession_ru = models.CharField(max_length=100)
    profession_tr = models.CharField(max_length=100)
    description_en = models.TextField()
    description_gr = models.TextField()
    description_ru = models.TextField()
    description_tr = models.TextField()
    department = models.ForeignKey(Department, on_delete=models.CASCADE, null=True, blank=True,
                                   related_name='doctor_department')
    status = models.CharField(max_length=1, default="1")
    work_experience = models.CharField(max_length=200, null=True, blank=True)
    created_at = models.DateTimeField(default=datetime.now, blank=True)
    email = models.EmailField(null=True, blank=True)

    def __str__(self):
        return self.full_name_en

    class Meta:
        verbose_name_plural = "Doctors"


class Team(models.Model):
    image = CloudinaryField('image')
    banner_image = CloudinaryField('banner_image')
    full_name_en = models.CharField(max_length=100)
    full_name_gr = models.CharField(max_length=100)
    full_name_ru = models.CharField(max_length=100)
    full_name_tr = models.CharField(max_length=100)
    profession_en = models.CharField(max_length=100)
    profession_gr = models.CharField(max_length=100)
    profession_ru = models.CharField(max_length=100)
    profession_tr = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    description_en = models.TextField()
    description_gr = models.TextField()
    description_ru = models.TextField()
    description_tr = models.TextField()
    status = models.CharField(max_length=1, default="1")
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.full_name_en

    class Meta:
        verbose_name_plural = "Team"


class PageText(models.Model):
    name = models.CharField(max_length=255, null=True, blank=True)
    title_en = models.CharField(max_length=255, null=True, blank=True)
    desc_en = models.CharField(max_length=255, null=True, blank=True)
    title_ru = models.CharField(max_length=255, null=True, blank=True)
    desc_ru = models.CharField(max_length=255, null=True, blank=True)
    title_gr = models.CharField(max_length=255, null=True, blank=True)
    desc_gr = models.CharField(max_length=255, null=True, blank=True)
    title_tr = models.CharField(max_length=255, null=True, blank=True)
    desc_tr = models.CharField(max_length=255, null=True, blank=True)


class PageImage(models.Model):
    page = models.ForeignKey(PageText, on_delete=models.CASCADE)
    image = CloudinaryField('image', null=True, blank=True)


class News(models.Model):
    image = CloudinaryField('image')
    title_en = models.CharField(max_length=100)
    title_gr = models.CharField(max_length=100)
    title_ru = models.CharField(max_length=100)
    title_tr = models.CharField(max_length=100)
    description_en = models.TextField()
    description_gr = models.TextField()
    description_ru = models.TextField()
    description_tr = models.TextField()
    keywords = models.TextField()
    post_type = models.CharField(max_length=20)
    display_home = models.CharField(max_length=1, default="1")
    status = models.CharField(max_length=1, default="1")
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE, null=True, blank=True)
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.title_en

    class Meta:
        verbose_name_plural = "News"


class Keywords(models.Model):
    name = models.CharField(max_length=255)
    news = models.ForeignKey(News, on_delete=models.CASCADE, related_name='keyword_news')
    status = models.CharField(max_length=1, default="1")

    def __str__(self):
        return f'{self.news}'


class JobDepartment(models.Model):
    title_en = models.CharField(max_length=100)
    title_gr = models.CharField(max_length=100)
    title_ru = models.CharField(max_length=100)
    title_tr = models.CharField(max_length=100)
    status = models.CharField(max_length=1, default="1")
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.title_en

    class Meta:
        verbose_name_plural = "Job Departments"


class Jobs(models.Model):
    job_department = models.ForeignKey(JobDepartment, on_delete=models.CASCADE)
    title_en = models.CharField(max_length=100)
    title_gr = models.CharField(max_length=100)
    title_ru = models.CharField(max_length=100)
    title_tr = models.CharField(max_length=100)
    short_description_en = models.TextField()
    short_description_gr = models.TextField()
    short_description_ru = models.TextField()
    short_description_tr = models.TextField()
    description_en = models.TextField()
    description_gr = models.TextField()
    description_ru = models.TextField()
    description_tr = models.TextField()
    status = models.CharField(max_length=1, default="1")
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.title_en

    class Meta:
        verbose_name_plural = "Jobs"


class Contact(models.Model):
    address_en = models.CharField(max_length=100)
    address_gr = models.CharField(max_length=100)
    address_ru = models.CharField(max_length=100)
    address_tr = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    phone = models.CharField(max_length=100)

    def __str__(self):
        return self.address_en

    class Meta:
        verbose_name_plural = "Contacts"


class Message(models.Model):
    text = models.TextField()
    full_name = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    subject = models.CharField(max_length=100)
    read_status = models.CharField(max_length=1, default="1")
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.text

    class Meta:
        verbose_name_plural = "Messages"


class Result(models.Model):
    full_name = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    read_status = models.CharField(max_length=1, default="1")
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.full_name

    class Meta:
        verbose_name_plural = "Results"


class ToMail(models.Model):
    email = models.EmailField()


class Thank(models.Model):
    full_name = models.CharField(max_length=100)
    to_whom = models.CharField(max_length=100)
    text = models.TextField()
    read_status = models.CharField(max_length=1, default="1")
    text_type = models.CharField(max_length=10)
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.text

    class Meta:
        verbose_name_plural = "Thanks"


class About(models.Model):
    text_en = models.TextField()
    text_gr = models.TextField()
    text_ru = models.TextField()
    text_tr = models.TextField()
    page_type = models.CharField(max_length=20)

    def __str__(self):
        return self.text_en

    class Meta:
        verbose_name_plural = "About"


class SocialMedia(models.Model):
    icon = models.CharField(max_length=100)
    link = models.CharField(max_length=100)
    status = models.CharField(max_length=1, default="1")

    def __str__(self):
        return self.link

    class Meta:
        verbose_name_plural = "SocialMedia"


class Menu(models.Model):
    title_en = models.CharField(max_length=100)
    title_gr = models.CharField(max_length=100)
    title_ru = models.CharField(max_length=100)
    title_tr = models.CharField(max_length=100)
    link = models.CharField(max_length=30)
    menu_type = models.CharField(max_length=20)
    has_submenu = models.CharField(max_length=1, default="1")
    status = models.CharField(max_length=1, default="1")

    def __str__(self):
        return self.title_en

    class Meta:
        verbose_name_plural = "Menu"


class SubMenu(models.Model):
    menu = models.ForeignKey(Menu, on_delete=models.CASCADE)
    title_en = models.CharField(max_length=100)
    title_gr = models.CharField(max_length=100)
    title_ru = models.CharField(max_length=100)
    title_tr = models.CharField(max_length=100)
    link = models.CharField(max_length=20)
    status = models.CharField(max_length=1, default="1")

    def __str__(self):
        return self.title_en

    class Meta:
        verbose_name_plural = "SubMenu"


class Slider(models.Model):
    image = CloudinaryField('image')
    text_en = RichTextField(null=True, blank=True)
    text_gr = RichTextField(null=True, blank=True)
    text_ru = RichTextField(null=True, blank=True)
    text_tr = RichTextField(null=True, blank=True)
    menu = models.ForeignKey(Menu, on_delete=models.CASCADE)
    status = models.CharField(max_length=1, default="1")
    order = models.PositiveIntegerField(default=0)
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        verbose_name_plural = "Sliders"


class Appointment(models.Model):
    full_name = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    phone = models.CharField(max_length=100)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    date = models.CharField(max_length=100)
    read_status = models.CharField(max_length=1, default="1")
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.full_name

    class Meta:
        verbose_name_plural = "Appointments"


class DoctorQuestion(models.Model):
    full_name = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    phone = models.CharField(max_length=100)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    file = CloudinaryField('file')
    text = models.TextField()
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.full_name

    class Meta:
        verbose_name_plural = "DoctorQuestion"


class Resume(models.Model):
    job = models.ForeignKey(Jobs, on_delete=models.CASCADE)
    resume = CloudinaryField('file')
    name = models.CharField(max_length=100)
    surname = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    phone = models.CharField(max_length=100)
    age = models.CharField(max_length=100)
    gender = models.CharField(max_length=100)
    experience = models.CharField(max_length=100)
    education = models.CharField(max_length=50)
    bachelor = models.CharField(max_length=100, blank=True)
    speciality = models.CharField(max_length=100)
    residency_program = models.CharField(max_length=100, blank=True)
    read_status = models.CharField(max_length=1, default="1")
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = "Resume"


class PatientGuide(models.Model):
    title_en = models.CharField(max_length=100)
    title_gr = models.CharField(max_length=100)
    title_ru = models.CharField(max_length=100)
    title_tr = models.CharField(max_length=100)
    text_en = models.TextField()
    text_gr = models.TextField()
    text_ru = models.TextField()
    text_tr = models.TextField()
    status = models.CharField(max_length=1, default="1")
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.title_en

    class Meta:
        verbose_name_plural = "PatientGuide"


class MedicalTechnologies(models.Model):
    image = CloudinaryField('image')
    title_en = models.CharField(max_length=100)
    title_gr = models.CharField(max_length=100)
    title_ru = models.CharField(max_length=100)
    title_tr = models.CharField(max_length=100)
    description_en = models.TextField()
    description_gr = models.TextField()
    description_ru = models.TextField()
    description_tr = models.TextField()
    status = models.CharField(max_length=1, default="1")
    created_at = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return f'{self.title_en}'
