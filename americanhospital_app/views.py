import hashlib
from django.shortcuts import render, redirect
from django.utils import timezone
from django.views.generic.base import View
from django.db.models import Q
from .tasks import contact_email

from americanhospital_app.models import Admin, Doctor, News, Slider, Contact, Message, SocialMedia, About, Team, Menu, \
    SubMenu, Appointment, Department, Resume, DoctorQuestion, Thank, Result, PatientGuide, Jobs, JobDepartment, \
    Keywords, PageText, PageImage, MedicalTechnologies


def check_admin_login(username, password):
    try:
        admin_check = Admin.objects.filter(username=username, password=password, status='1').count()
    except:
        admin_check = 0

    if admin_check > 0:
        return True
    else:
        return False


def fetch_contact_info():
    pass
    # contact = Contact.objects.get(id=1)
    # return contact


def search(request):
    context = {}
    if 'q' in request.GET:
        query = request.GET.get('q')
    news = News.objects.filter(
        Q(title_en__icontains=query) |
        Q(title_ru__icontains=query)
    )
    context['news'] = news
    return render(request, 'pages/website/search.html', context)


def fetch_social_media():
    social_media = SocialMedia.objects.filter(status='1').order_by('-id')
    return social_media


def fetch_menu():
    menu = Menu.objects.filter(status='1').order_by('id')
    return menu


def fetch_submenu():
    submenu = SubMenu.objects.filter(status='1').order_by('id')
    return submenu


class LanguageView(View):

    def get(self, request, *args, **kwargs):
        request.session['lang'] = self.kwargs.get("slug")

        return redirect('/')


import locale


class IndexView(View):
    template_name = 'pages/website/home.html'

    def get(self, request):
        sliders = Slider.objects.filter(status=1).order_by('-id')
        news = News.objects.filter(display_home='1', status='1').order_by('-id')[:3]
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        context = {
            'title': 'American Hospital Tbilisi',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'sliders': sliders,
            'news': news,
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class AboutView(View):
    template_name = 'pages/website/about.html'

    def get(self, request, *args, **kwargs):

        page_type = self.kwargs.get("slug")

        if page_type == 'news':
            return redirect('news')
        if page_type == 'members':
            return redirect('members')

        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        about = About.objects.get(page_type=page_type)
        menu = fetch_menu()
        submenu = fetch_submenu()

        context = {
            'title': 'About us',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'about': about,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class TeamView(View):
    template_name = 'pages/website/members.html'

    def get(self, request):
        members = Team.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        context = {
            'title': 'Managment Team',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'members': members,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class MemberInfoView(View):
    template_name = 'pages/website/member_info.html'

    def get(self, request, *args, **kwargs):

        member = Team.objects.get(id=self.kwargs.get("id"), status='1')
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        title = ''

        if request.session.get('lang') == 'en' or request.session.get('lang') is None:
            title = member.full_name_en
        if request.session.get('lang') == 'gr':
            title = member.full_name_gr
        if request.session.get('lang') == 'ru':
            title = member.full_name_ru
        if request.session.get('lang') == 'tr':
            title = member.full_name_tr

        context = {
            'title': title,
            'image': 'https://res.cloudinary.com/dvljbh7jn/image/upload/v1575654181/' + str(
                member.banner_image) + '.jpg',
            'url': 'https://ahtbilisi.com/member_info/' + str(member.id) + '/' + member.full_name_en.replace(' ', '-'),
            'member': member,
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class DoctorsView(View):
    template_name = 'pages/website/doctors.html'

    def get(self, request):
        doctors = Doctor.objects.filter(status='1').order_by('full_name_en')
        departments = Department.objects.all()
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        images = PageImage.objects.filter(page__name='Doctors')

        submenu = fetch_submenu()

        context = {
            'title': 'Doctors',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'doctors': doctors,
            'department': departments,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'image_page': images,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)

    def post(self, request):
        text = request.POST.get('departments')
        print(text, '++++++++++++++++++++++')

        doctors = Doctor.objects.filter(status='1', department__name_en=text).order_by('full_name_en')
        departments = Department.objects.all()
        # print(departments.user)
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        images = PageImage.objects.filter(page__name='Doctors')

        submenu = fetch_submenu()

        context = {
            'title': 'Doctors',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'doctors': doctors,
            'department': departments,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'image_page': images,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class DoctorInfoView(View):
    template_name = 'pages/website/doctor_info.html'

    def get(self, request, *args, **kwargs):

        doctor = Doctor.objects.get(id=self.kwargs.get("id"), status='1')
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        title = ''

        if request.session.get('lang') == 'en' or request.session.get('lang') is None:
            title = doctor.full_name_en
        if request.session.get('lang') == 'gr':
            title = doctor.full_name_gr
        if request.session.get('lang') == 'ru':
            title = doctor.full_name_ru
        if request.session.get('lang') == 'tr':
            title = doctor.full_name_tr

        context = {
            'title': title,
            'image': 'https://res.cloudinary.com/dvljbh7jn/image/upload/v1575654181/' + str(
                doctor.banner_image) + '.jpg',
            'url': 'https://ahtbilisi.com/doctor_info/' + str(doctor.id) + '/' + doctor.full_name_en.replace(' ', '-'),
            'doctor': doctor,
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class DepartmentsView(View):
    template_name = 'pages/website/departments.html'

    def get(self, request):
        departments = Department.objects.filter(status='1').order_by('name_en')

        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        images = PageImage.objects.filter(page__name='Department')
        submenu = fetch_submenu()

        context = {
            'title': 'Departments',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'departments': departments,
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'image_page': images,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class DepartmentInfoView(View):
    template_name = 'pages/website/department_info.html'

    def get(self, request, *args, **kwargs):

        department_info = Department.objects.get(id=self.kwargs.get("id"), status='1')
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        images = PageImage.objects.filter(page__name='Department_info').last()

        menu = fetch_menu()
        submenu = fetch_submenu()

        title = ''

        if request.session.get('lang') == 'en' or request.session.get('lang') is None:
            title = department_info.name_en
        if request.session.get('lang') == 'gr':
            title = department_info.name_gr
        if request.session.get('lang') == 'ru':
            title = department_info.name_ru
        if request.session.get('lang') == 'tr':
            title = department_info.name_tr

        context = {
            'title': title,
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'department_info': department_info,
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'image_page': images,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class JobsView(View):
    template_name = 'pages/website/jobs.html'

    def iterateSlides(self, sliders, lang):
        for slide in sliders:
            ret = {
                'image': slide.image,
                'title': getattr(slide, f'title_{lang}', ''),
                'text': getattr(slide, f'text_{lang}', ''),
            }

            yield ret

    def get(self, request):
        jobs = Jobs.objects.filter(status='1').order_by('title_en')
        job_departments = JobDepartment.objects.filter(status='1').order_by('title_en')
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()
        sliders = Slider.objects.filter(Q(menu__link='jobs'), status=1).order_by('-order', '-id')

        context = {
            'sliders': self.iterateSlides(sliders, request.session.get('lang', 'en')),
            'slider_indicator': range(sliders.count()),
            'title': 'Jobs',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'jobs': jobs,
            'job_departments': job_departments,
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class JobInfoView(View):
    template_name = 'pages/website/job_info.html'

    def get(self, request, *args, **kwargs):

        job_info = Jobs.objects.get(id=self.kwargs.get("id"), status='1')
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        title = ''

        if request.session.get('lang') == 'en' or request.session.get('lang') is None:
            title = job_info.title_en
        if request.session.get('lang') == 'gr':
            title = job_info.title_gr
        if request.session.get('lang') == 'ru':
            title = job_info.title_ru
        if request.session.get('lang') == 'tr':
            title = job_info.title_tr

        context = {
            'title': title,
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/job_info/' + str(job_info.id) + '/' + job_info.title_en.replace(" ",
                                                                                                          "-").replace(
                ":", "").replace("%", ""),
            'job_info': job_info,
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


def success_contact(request):
    return render(request, 'pages/website/success_contact.html')


class ContactView(View):
    template_name = 'pages/website/contact.html'

    def get(self, request):

        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        context = {
            'title': 'Contact',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang'),
            'subject': 'contact'
        }
        return render(request, self.template_name, context)

    def post(self, request):
        try:

            if request.method == 'POST':
                message = Message()
                text = request.POST.get('text')
                full_name = request.POST.get('full_name')
                email = request.POST.get('email')
                subject = request.POST.get('subject')

                message.text = request.POST.get('text')
                message.full_name = request.POST.get('full_name')
                message.email = request.POST.get('email')
                message.subject = request.POST.get('subject')
                message.save()
                contact_email.delay(text, full_name, email)

                doctors = Doctor.objects.filter(status='1').order_by('-id')
                contact_info = fetch_contact_info()
                social_media = fetch_social_media()
                menu = fetch_menu()
                submenu = fetch_submenu()

                context = {
                    'title': 'Contact',
                    'image': 'https://ahtbilisi.com/static/website/img/logo.png',
                    'url': 'https://ahtbilisi.com/',
                    'doctors': doctors,
                    'contact_info': contact_info,
                    'social_media': social_media,
                    'menu': menu,
                    'submenu': submenu,
                    'success_text': 'Success',
                    'lang': request.session.get('lang')
                }
                return redirect('succes')

        except:
            return redirect("/")


class WriteToManagmentView(View):
    template_name = 'pages/website/write_to_managment.html'

    def get(self, request):
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        context = {
            'title': 'Write to Managment',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang'),
            'subject': 'contact'
        }
        return render(request, self.template_name, context)


class EComplaintView(View):
    template_name = 'pages/website/e-complaint.html'

    def get(self, request):
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        images = PageImage.objects.filter(page__name='E-complaint')

        menu = fetch_menu()
        submenu = fetch_submenu()

        context = {
            'title': 'E-Complaint',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'image_page': images,
            'submenu': submenu,
            'lang': request.session.get('lang'),
            'subject': 'complaint'
        }
        return render(request, self.template_name, context)


class ESuggestionView(View):
    template_name = 'pages/website/e-suggestion.html'

    def get(self, request):
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        images = PageImage.objects.filter(page__name='E-suggestion')

        menu = fetch_menu()
        submenu = fetch_submenu()

        context = {
            'title': 'E-Suggestion',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'image_page': images,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang'),
            'subject': 'suggestion'
        }
        return render(request, self.template_name, context)


class EServicesView(View):

    def get(self, request, *args, **kwargs):

        page_type = self.kwargs.get("slug")

        if page_type == 'e-result':
            return redirect('e-result')
        if page_type == 'e-thanks':
            return redirect('e-thanks')
        if page_type == 'e-getwell':
            return redirect('e-getwell')
        if page_type == 'e-complaint':
            return redirect('e-complaint')
        if page_type == 'e-suggestion':
            return redirect('e-suggestion')
        if page_type == 'ask_to_us':
            return redirect('contact')
        if page_type == 'ask_to_doctor':
            return redirect('ask_to_doctor')
        if page_type == 'write_to_managment':
            return redirect('write_to_managment')
        if page_type == 'jobs':
            return redirect('jobs')


class EResultView(View):
    template_name = 'pages/website/e-result.html'

    def get(self, request):

        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()
        images = PageImage.objects.filter(page__name='E-result')

        news = News.objects.filter(display_home='1', status='1').order_by('-id')

        context = {
            'title': 'E-Result',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'news': news,
            'image_page': images,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)

    def post(self, request):
        try:

            if request.method == 'POST':
                result = Result()

                result.full_name = request.POST.get('full_name')
                result.email = request.POST.get('email')

                result.save()

                doctors = Doctor.objects.filter(status='1').order_by('-id')
                contact_info = fetch_contact_info()
                social_media = fetch_social_media()
                menu = fetch_menu()
                submenu = fetch_submenu()

                context = {
                    'title': 'E-Result',
                    'image': 'https://ahtbilisi.com/static/website/img/logo.png',
                    'url': 'https://ahtbilisi.com/',
                    'doctors': doctors,
                    'contact_info': contact_info,
                    'social_media': social_media,
                    'menu': menu,
                    'submenu': submenu,
                    'success_text': 'Success',
                    'lang': request.session.get('lang')
                }
                return render(request, self.template_name, context)

        except:
            return redirect("/")


class EThanksView(View):
    template_name = 'pages/website/e-thanks.html'

    def get(self, request):

        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        title = ''
        text_type = ''

        if request.resolver_match.url_name == 'e-thanks':
            title = 'E-Thanks'
            text_type = 'thanks'
            images = PageImage.objects.filter(page__name='E-thanks')

        elif request.resolver_match.url_name == 'e-getwell':
            title = 'E-Getwell'
            text_type = 'getwell'
            images = PageImage.objects.filter(page__name='E-Getwellz')

        context = {
            'title': title,
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'text_type': text_type,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'image_page': images,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)

    def post(self, request):
        try:

            if request.method == 'POST':

                thank = Thank()

                thank.full_name = request.POST.get('full_name')
                thank.to_whom = request.POST.get('to_whom')
                thank.text = request.POST.get('text')
                thank.text_type = request.POST.get('text_type')

                thank.save()

                doctors = Doctor.objects.filter(status='1').order_by('-id')
                contact_info = fetch_contact_info()
                social_media = fetch_social_media()
                menu = fetch_menu()
                submenu = fetch_submenu()

                title = ''
                text_type = ''

                if request.resolver_match.url_name == 'e-thanks':
                    title = 'E-Thanks'
                    text_type = 'thanks'
                elif request.resolver_match.url_name == 'e-getwell':
                    title = 'E-Getwell'
                    text_type = 'getwell'

                context = {
                    'title': title,
                    'image': 'https://ahtbilisi.com/static/website/img/logo.png',
                    'url': 'https://ahtbilisi.com/',
                    'text_type': text_type,
                    'doctors': doctors,
                    'contact_info': contact_info,
                    'social_media': social_media,
                    'menu': menu,
                    'submenu': submenu,
                    'success_text': 'Success',
                    'lang': request.session.get('lang')
                }
                return render(request, self.template_name, context)

        except:
            return redirect("/")


class AskToDoctorView(View):
    template_name = 'pages/website/ask_to_doctor.html'

    def get(self, request):

        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        context = {
            'title': 'Ask to Doctor',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)

    def post(self, request):
        try:

            if request.method == 'POST':

                question = DoctorQuestion()

                question.full_name = request.POST.get('full_name')
                question.email = request.POST.get('email')
                question.phone = request.POST.get('phone')
                question.doctor_id = request.POST.get('doctor')
                if request.FILES.get('file') is not None:
                    question.file = request.FILES.get('file')
                question.text = request.POST.get('text')

                question.save()

                doctors = Doctor.objects.filter(status='1').order_by('-id')
                contact_info = fetch_contact_info()
                social_media = fetch_social_media()
                menu = fetch_menu()
                submenu = fetch_submenu()

                context = {
                    'title': 'Ask to Doctor',
                    'image': 'https://ahtbilisi.com/static/website/img/logo.png',
                    'url': 'https://ahtbilisi.com/',
                    'doctors': doctors,
                    'contact_info': contact_info,
                    'social_media': social_media,
                    'menu': menu,
                    'submenu': submenu,
                    'success_text': 'Success',
                    'lang': request.session.get('lang')
                }
                return redirect('succes')

        except:
            return redirect("/")


class SendCVView(View):
    template_name = 'pages/website/send_cv.html'

    def get(self, request, *args, **kwargs):

        job_id = self.kwargs.get("id")

        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        context = {
            'title': 'American Hospital Tbilisi',
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'job_id': job_id,
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)

    def post(self, request):
        try:

            if request.method == 'POST':
                resume = Resume()

                resume.job_id = request.POST.get('job')
                resume.resume = request.FILES.get('file')
                resume.name = request.POST.get('name')
                resume.surname = request.POST.get('surname')
                resume.email = request.POST.get('email')
                resume.phone = request.POST.get('phone')
                resume.age = request.POST.get('age')
                resume.gender = request.POST.get('gender')
                resume.experience = request.POST.get('experience')
                resume.education = request.POST.get('education')
                resume.bachelor = request.POST.get('bachelor')
                resume.speciality = request.POST.get('speciality')
                resume.residency_program = request.POST.get('residency_program')

                resume.save()

                doctors = Doctor.objects.filter(status='1').order_by('-id')
                contact_info = fetch_contact_info()
                social_media = fetch_social_media()
                menu = fetch_menu()
                submenu = fetch_submenu()

                context = {
                    'title': 'American Hospital Tbilisi',
                    'image': 'https://ahtbilisi.com/static/website/img/logo.png',
                    'url': 'https://ahtbilisi.com/',
                    'doctors': doctors,
                    'contact_info': contact_info,
                    'social_media': social_media,
                    'menu': menu,
                    'submenu': submenu,
                    'success_text': 'Success',
                    'lang': request.session.get('lang')
                }
                return redirect('succes')

        except:
            return redirect("/")


class NewsView(View):
    template_name = 'pages/website/news.html'

    def get(self, request):

        if request.resolver_match.url_name == 'news':
            title = ''

            if request.session.get('lang') == 'en' or request.session.get('lang') is None:
                title = 'News'
            if request.session.get('lang') == 'gr':
                title = 'სიახლეები'
            if request.session.get('lang') == 'ru':
                title = 'Новости'
            if request.session.get('lang') == 'tr':
                title = 'Haberler'

            post_type = 'news'
        else:
            title = ''

            if request.session.get('lang') == 'en' or request.session.get('lang') is None:
                title = 'Health Guides'
            if request.session.get('lang') == 'gr':
                title = 'გზამკვლევი თქვენი ჯანმრთელობისთვის'
            if request.session.get('lang') == 'ru':
                title = 'Руководство к вашему здоровью'
            if request.session.get('lang') == 'tr':
                title = 'Sağlık Rehberi'

            post_type = 'health_guide'

        news = News.objects.filter(status='1', post_type=post_type).order_by('-id')
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        context = {
            'title': title,
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'news': news,
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class NewsDetailView(View):
    template_name = 'pages/website/news_detail.html'

    def get(self, request, *args, **kwargs):

        news_detail = News.objects.get(id=self.kwargs.get("id"), status='1')
        news = News.objects.filter(status='1', post_type=news_detail.post_type).order_by('-id')[:4]
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        keyword = Keywords.objects.filter(news=news_detail)
        print(keyword)
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        title = ''

        if request.session.get('lang') == 'en' or request.session.get('lang') is None:
            title = news_detail.title_en
        if request.session.get('lang') == 'gr':
            title = news_detail.title_gr
        if request.session.get('lang') == 'ru':
            title = news_detail.title_ru
        if request.session.get('lang') == 'tr':
            title = news_detail.title_tr

        context = {
            'title': title,
            'keyword': keyword,
            'image': "https://res.cloudinary.com/dvljbh7jn/image/upload/c_scale,w_750,h_375/v1575654181/" + str(
                news_detail.image) + ".jpg",
            'url': 'https://ahtbilisi.com/news_detail/' + str(news_detail.id) + '/' + news_detail.title_en.replace(" ",
                                                                                                                   "-").replace(
                ":", "").replace("%", ""),
            'news_detail': news_detail,
            'news': news,
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class AppointmentView(View):

    def post(self, request):
        try:

            if request.method == 'POST':
                appointment = Appointment()

                appointment.full_name = request.POST.get('full_name')
                appointment.email = request.POST.get('email')
                appointment.phone = request.POST.get('phone')
                appointment.doctor_id = request.POST.get('doctor')
                appointment.date = request.POST.get('date')

                appointment.save()

                sliders = Slider.objects.filter(status='1').order_by('-id')
                news = News.objects.filter(status='1').order_by('-id')
                doctors = Doctor.objects.filter(status='1').order_by('-id')
                contact_info = fetch_contact_info()
                social_media = fetch_social_media()
                menu = fetch_menu()
                submenu = fetch_submenu()

                context = {
                    'title': 'American Hospital Tbilisi',
                    'sliders': sliders,
                    'news': news,
                    'doctors': doctors,
                    'contact_info': contact_info,
                    'social_media': social_media,
                    'success_text': 'We received your appointment request. We will be in touch soon',
                    'menu': menu,
                    'submenu': submenu,
                    'lang': request.session.get('lang')
                }
                return render(request, self.template_name, context)

        except:
            return redirect("/")


class PatientGuideView(View):
    template_name = 'pages/website/patient_guides.html'

    def get(self, request):

        patient_guides = PatientGuide.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        title = ''

        if request.session.get('lang') == 'en' or request.session.get('lang') is None:
            title = 'Patient Guide'
        if request.session.get('lang') == 'ru':
            title = 'Руководство для пациентов'
        if request.session.get('lang') == 'tr':
            title = 'Hasta Rehberi'
        if request.session.get('lang') == 'gr':
            title = 'გზამკვლევი პაციენტისთვის'

        context = {
            'title': title,
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'patient_guides': patient_guides,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class PatientGuideDetailView(View):
    template_name = 'pages/website/patient_guide.html'

    def get(self, request, *args, **kwargs):

        patient_guide = PatientGuide.objects.get(id=self.kwargs.get("id"), status='1')
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        title = ''

        if request.session.get('lang') == 'en' or request.session.get('lang') is None:
            title = patient_guide.title_en
        if request.session.get('lang') == 'gr':
            title = patient_guide.title_gr
        if request.session.get('lang') == 'ru':
            title = patient_guide.title_ru
        if request.session.get('lang') == 'tr':
            title = patient_guide.title_tr

        context = {
            'title': title,
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'patient_guide': patient_guide,
            'doctors': doctors,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


## Admin


class AdminLoginView(View):
    template_name = 'pages/admin/login.html'

    def get(self, request):
        if request.session.get('admin_id') is None:
            return render(request, self.template_name)
        else:
            return redirect('admin_dashboard')

    def post(self, request, *args, **kwargs):
        try:
            if request.method == 'POST':

                try:
                    username = request.POST.get('username').lower()
                    password = request.POST.get('password').strip()

                    password = hashlib.sha256(password.encode('utf-8')).hexdigest()

                    is_admin_true = check_admin_login(username, password)

                    if is_admin_true is True:
                        admin_info = Admin.objects.get(username=username, password=password, status='1')
                        request.session['admin_id'] = admin_info.id
                        return redirect("admin_dashboard")
                    else:
                        return redirect("admin_login")
                except:
                    return redirect("admin_login")

            else:
                return redirect("admin_login")
        except:
            return redirect("admin_login")


class AdminLogoutView(View):

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:
            del request.session['admin_id']
            return redirect('admin_login')
        else:
            return redirect('/')


class AdminDashboardView(View):
    template_name = 'pages/admin/dashboard.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            doctor_count = Doctor.objects.filter(status='1').count()
            member_count = Team.objects.filter(status='1').count()
            news_count = News.objects.filter(status='1', post_type='news').count()
            job_department_count = JobDepartment.objects.filter(status='1').count()
            job_count = Jobs.objects.filter(status='1').count()
            patient_guide_count = PatientGuide.objects.filter(status='1').count()
            health_guide_count = News.objects.filter(status='1', post_type='health_guide').count()
            slider_count = Slider.objects.filter(status='1').count()
            department_count = Department.objects.filter(status='1').count()
            message_count = Message.objects.filter(subject='contact').count()
            new_messages_count = Message.objects.filter(read_status='1', subject='contact').count()
            doctor_question_count = DoctorQuestion.objects.all().count()
            appointment_count = Appointment.objects.all().count()
            new_appointment_count = Appointment.objects.filter(read_status='1').count()
            resume_count = Resume.objects.all().count()
            new_resume_count = Resume.objects.filter(read_status='1').count()
            thank_count = Thank.objects.filter(text_type='thanks').count()
            new_thank_count = Thank.objects.filter(read_status='1', text_type='thanks').count()
            result_count = Result.objects.all().count()
            new_result_count = Result.objects.filter(read_status='1').count()
            getwell_count = Thank.objects.filter(text_type='getwell').count()
            new_getwell_count = Thank.objects.filter(read_status='1', text_type='getwell').count()
            complaint_count = Message.objects.filter(subject='complaint').count()
            new_complaint_count = Message.objects.filter(read_status='1', subject='complaint').count()
            suggestion_count = Message.objects.filter(subject='suggestion').count()
            new_suggestion_count = Message.objects.filter(read_status='1', subject='suggestion').count()
            contact_info = Contact.objects.get(id=1)
            social_media = SocialMedia.objects.filter(status='1')
            menu = Menu.objects.filter(status='1').order_by('id')
            submenu = SubMenu.objects.filter(status='1').order_by('id')

            context = {
                'title': 'Dashboard',
                'doctor_count': doctor_count,
                'member_count': member_count,
                'news_count': news_count,
                'job_department_count': job_department_count,
                'job_count': job_count,
                'patient_guide_count': patient_guide_count,
                'health_guide_count': health_guide_count,
                'slider_count': slider_count,
                'department_count': department_count,
                'message_count': message_count,
                'new_messages_count': new_messages_count,
                'doctor_question_count': doctor_question_count,
                'appointment_count': appointment_count,
                'new_appointment_count': new_appointment_count,
                'resume_count': resume_count,
                'new_resume_count': new_resume_count,
                'thank_count': thank_count,
                'new_thank_count': new_thank_count,
                'result_count': result_count,
                'new_result_count': new_result_count,
                'getwell_count': getwell_count,
                'new_getwell_count': new_getwell_count,
                'complaint_count': complaint_count,
                'new_complaint_count': new_complaint_count,
                'suggestion_count': suggestion_count,
                'new_suggestion_count': new_suggestion_count,
                'contact_info': contact_info,
                'social_media': social_media,
                'menu': menu,
                'submenu': submenu
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminAccountView(View):
    template_name = 'pages/admin/account.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            admins = Admin.objects.all()

            context = {
                'title': 'Account',
                'admins': admins
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminAboutView(View):
    template_name = 'pages/admin/about.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            page_type = self.kwargs.get("slug")

            about_info = About.objects.get(page_type='about')
            introduction_info = About.objects.get(page_type='introduction')
            history_info = About.objects.get(page_type='history')
            television_info = About.objects.get(page_type='television')
            mission_info = About.objects.get(page_type='mission')
            vision_info = About.objects.get(page_type='vision')
            quality_policy_info = About.objects.get(page_type='quality_policy')
            facility_info = About.objects.get(page_type='facility')
            policy_info = About.objects.get(page_type='policy')

            context = {
                'title': 'About',
                'page_type': page_type,
                'about_info': about_info,
                'introduction_info': introduction_info,
                'history_info': history_info,
                'television_info': television_info,
                'mission_info': mission_info,
                'vision_info': vision_info,
                'quality_policy_info': quality_policy_info,
                'facility_info': facility_info,
                'policy_info': policy_info
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminAddDoctorView(View):
    template_name = 'pages/admin/doctor/add_doctor.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:
            department = Department.objects.filter(status=1).all()

            context = {
                'title': 'Add Doctor',
                'department': department

            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')

    def post(self, request):
        department = Department.objects.filter(status=1).all()

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                doctor = Doctor()
                department = request.POST.get('department')
                test = Department.objects.filter(name_en=department).last()
                doctor.image = request.FILES.get('image')
                doctor.banner_image = request.FILES.get('banner_image')
                doctor.full_name_en = request.POST.get('full_name_en')
                doctor.full_name_gr = request.POST.get('full_name_gr')
                doctor.full_name_ru = request.POST.get('full_name_ru')
                doctor.full_name_tr = request.POST.get('full_name_tr')
                doctor.profession_en = request.POST.get('profession_en')
                doctor.profession_gr = request.POST.get('profession_gr')
                doctor.profession_ru = request.POST.get('profession_ru')
                doctor.profession_tr = request.POST.get('profession_tr')
                doctor.description_en = request.POST.get('description_en')
                doctor.description_gr = request.POST.get('description_gr')
                doctor.description_ru = request.POST.get('description_ru')
                doctor.description_tr = request.POST.get('description_tr')
                doctor.work_experience = request.POST.get('work_experience')
                doctor.email = request.POST.get('email')
                doctor.department = test

                doctor.save()

                context = {
                    'title': 'Add Doctor',
                    'success_text': 'Doctor added',
                    'department': department
                }

                return render(request, self.template_name, context)

        except:
            return redirect('/')


class AdminAddMedicalView(View):
    template_name = 'pages/admin/medical_tech/medical.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            context = {
                'title': 'Add Medical Technologies'
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                doctor = MedicalTechnologies()

                doctor.image = request.FILES.get('image')
                doctor.title_en = request.POST.get('title_en')
                doctor.title_gr = request.POST.get('title_gr')
                doctor.title_ru = request.POST.get('title_ru')
                doctor.title_tr = request.POST.get('title_tr')
                doctor.description_en = request.POST.get('description_en')
                doctor.description_gr = request.POST.get('description_gr')
                doctor.description_ru = request.POST.get('description_ru')
                doctor.description_tr = request.POST.get('description_tr')
                doctor.status = request.POST.get('status')

                doctor.save()

                context = {
                    'title': 'Add Medical Technologies',
                    'success_text': 'Medical Technologies Added!'
                }

                return render(request, self.template_name, context)

        except:
            return redirect('/')


class AdminMedicallistView(View):
    template_name = 'pages/admin/medical_tech/medical_list.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            news = MedicalTechnologies.objects.filter(status='1').order_by('-id')

            context = {
                'news': news,
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminMedicalDetailView(View):
    template_name = 'pages/admin/medical_tech/medical_edit.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:
            # news = News.objects.all()
            id_ = self.kwargs.get("id")

            news_info = MedicalTechnologies.objects.get(id=id_, status='1')

            context = {
                # 'title': news_info.title_en,
                'news_info': news_info,
                # 'news': news
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')

    def post(self, request, id):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                doctor = MedicalTechnologies.objects.filter(id=id).last()

                doctor.image = request.FILES.get('image')
                doctor.title_en = request.POST.get('title_en')
                doctor.title_gr = request.POST.get('title_gr')
                doctor.title_ru = request.POST.get('title_ru')
                doctor.title_tr = request.POST.get('title_tr')
                doctor.description_en = request.POST.get('description_en')
                doctor.description_gr = request.POST.get('description_gr')
                doctor.description_ru = request.POST.get('description_ru')
                doctor.description_tr = request.POST.get('description_tr')
                doctor.status = request.POST.get('status')

                doctor.save()

                context = {
                    'title': 'Add Medical Technologies',
                    'success_text': 'Medical Technologies Added!'
                }

                return redirect('admin_medical_list')

        except:
            return redirect('/')


class AdminKeywordView(View):
    template_name = 'pages/admin/news/keywords.html'

    def get(self, request):

        if request.session.get('admin_id') is not None:
            post = News.objects.all()

            context = {
                'title': 'Add Keyword',
                'news': post
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                keyword = Keywords()
                new = request.POST.get('news')
                test = News.objects.filter(title_en=new).last()

                print(test)

                keyword.name = request.POST.get('name')
                keyword.news = test
                keyword.status = request.POST.get('status')

                keyword.save()
                # print(keyword.news)

                context = {
                    'title': 'Add Keyword',
                    'success_text': 'Keyword added'
                }

                return render(request, self.template_name, context)

        except:
            return redirect('/')


class AdminAppointmentsView(View):
    template_name = 'pages/admin/e-services/appointments.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            appointments = Appointment.objects.all().order_by('-id')

            context = {
                'title': 'Appointments',
                'appointments': appointments
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminReadAppointmentView(View):
    template_name = 'pages/admin/e-services/read-appointment.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            id_ = self.kwargs.get("id")

            appointment = Appointment.objects.get(id=id_)

            if appointment.read_status == '1':
                Appointment.objects.filter(id=id_).update(read_status='0')

            context = {
                'title': 'Appointments',
                'appointment': appointment
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminResumesView(View):
    template_name = 'pages/admin/e-services/resumes.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            resumes = Resume.objects.all().order_by('-created_at')

            context = {
                'title': 'Resumes',
                'resumes': resumes
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminEResultView(View):
    template_name = 'pages/admin/e-services/e-result.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            results = Result.objects.all().order_by('-id')

            context = {
                'title': 'Results',
                'results': results
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminCheckEResultView(View):

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:
            id_ = self.kwargs.get("id")
            Result.objects.filter(id=id_).update(read_status='0')
            return redirect('admin_eresults')
        else:
            return redirect('/')


class AdminEThanksView(View):
    template_name = 'pages/admin/e-services/e-thanks.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            title = ''
            post_type = ''

            if request.resolver_match.url_name == 'admin_ethanks':
                title = 'E-Thanks'
                post_type = 'thanks'
            elif request.resolver_match.url_name == 'admin_egetwell':
                title = 'E-Getwell'
                post_type = 'getwell'

            thanks = Thank.objects.filter(text_type=post_type).order_by('-id')

            context = {
                'title': title,
                'thanks': thanks
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminReadEThanksView(View):
    template_name = 'pages/admin/e-services/read-thanks.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            id_ = self.kwargs.get("id")

            thank = Thank.objects.get(id=id_)

            if thank.read_status == '1':
                Thank.objects.filter(id=id_).update(read_status='0')

            context = {
                'title': 'Message',
                'thank': thank
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminDoctorsView(View):
    template_name = 'pages/admin/doctor/doctors.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            doctors = Doctor.objects.filter(status='1').order_by('-id')

            context = {
                'title': 'Doctors',
                'doctors': doctors
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminDoctorDetailView(View):
    template_name = 'pages/admin/doctor/edit_doctor.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            id_ = self.kwargs.get("id")

            doctor_info = Doctor.objects.get(id=id_, status='1')

            context = {
                'title': doctor_info.full_name_en,
                'doctor_info': doctor_info
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminEditDoctorView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:

                doctor = Doctor.objects.get(id=request.POST.get('id'))

                doctor.id = request.POST.get('id')
                if request.FILES.get('image') is not None:
                    doctor.image = request.FILES.get('image')
                if request.FILES.get('banner_image') is not None:
                    doctor.banner_image = request.FILES.get('banner_image')
                doctor.full_name_en = request.POST.get('full_name_en')
                doctor.full_name_gr = request.POST.get('full_name_gr')
                doctor.full_name_ru = request.POST.get('full_name_ru')
                doctor.full_name_tr = request.POST.get('full_name_tr')
                doctor.profession_en = request.POST.get('profession_en')
                doctor.profession_gr = request.POST.get('profession_gr')
                doctor.profession_ru = request.POST.get('profession_ru')
                doctor.profession_tr = request.POST.get('profession_tr')
                doctor.description_en = request.POST.get('description_en')
                doctor.description_gr = request.POST.get('description_gr')
                doctor.description_ru = request.POST.get('description_ru')
                doctor.description_tr = request.POST.get('description_tr')

                doctor.save()

                return redirect('/admin_doctor_detail/' + str(doctor.id))

        except:
            return redirect('/')


class AdminDoctorQuestionView(View):
    template_name = 'pages/admin/doctor/doctor_questions.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            questions = DoctorQuestion.objects.all().order_by('-id')

            context = {
                'title': 'Doctor Questions',
                'questions': questions
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminAddDepartmentView(View):
    template_name = 'pages/admin/department/add_department.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            context = {
                'title': 'Add Department'
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                department = Department()

                department.name_en = request.POST.get('name_en')
                department.name_gr = request.POST.get('name_gr')
                department.name_ru = request.POST.get('name_ru')
                department.name_tr = request.POST.get('name_tr')
                department.description_en = request.POST.get('description_en')
                department.description_gr = request.POST.get('description_gr')
                department.description_ru = request.POST.get('description_ru')
                department.description_tr = request.POST.get('description_tr')

                department.save()

                context = {
                    'title': 'Add Department',
                    'success_text': 'Department added'
                }

                return render(request, self.template_name, context)

        except:
            return redirect('/')


class AdminDepartmentsView(View):
    template_name = 'pages/admin/department/departments.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            departments = Department.objects.filter(status='1').order_by('-id')

            context = {
                'title': 'Departments',
                'departments': departments
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminDepartmentDetailView(View):
    template_name = 'pages/admin/department/edit_department.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            id_ = self.kwargs.get("id")

            department_info = Department.objects.get(id=id_, status='1')

            context = {
                'title': department_info.name_en,
                'department_info': department_info
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminEditDepartmentView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                department = Department.objects.get(id=request.POST.get('id'))

                department.id = request.POST.get('id')
                department.name_en = request.POST.get('name_en')
                department.name_gr = request.POST.get('name_gr')
                department.name_ru = request.POST.get('name_ru')
                department.name_tr = request.POST.get('name_tr')
                department.description_en = request.POST.get('description_en')
                department.description_gr = request.POST.get('description_gr')
                department.description_ru = request.POST.get('description_ru')
                department.description_tr = request.POST.get('description_tr')

                department.save()

                return redirect('/admin_department_detail/' + str(department.id))

        except:
            return redirect('/')


class AdminAddTeamMemberView(View):
    template_name = 'pages/admin/team/add_team_member.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            context = {
                'title': 'Add Team Member'
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                team = Team()

                team.image = request.FILES.get('image')
                team.banner_image = request.FILES.get('banner_image')
                team.full_name_en = request.POST.get('full_name_en')
                team.full_name_gr = request.POST.get('full_name_gr')
                team.full_name_ru = request.POST.get('full_name_ru')
                team.full_name_tr = request.POST.get('full_name_tr')
                team.profession_en = request.POST.get('profession_en')
                team.profession_gr = request.POST.get('profession_gr')
                team.profession_ru = request.POST.get('profession_ru')
                team.profession_tr = request.POST.get('profession_tr')
                team.email = request.POST.get('email')
                team.description_en = request.POST.get('description_en')
                team.description_gr = request.POST.get('description_gr')
                team.description_ru = request.POST.get('description_ru')
                team.description_tr = request.POST.get('description_tr')

                team.save()

                context = {
                    'title': 'Add Team Member',
                    'success_text': 'Team member added'
                }

                return render(request, self.template_name, context)

        except:
            return redirect('/')


class AdminMembersView(View):
    template_name = 'pages/admin/team/members.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            members = Team.objects.filter(status='1').order_by('-id')

            context = {
                'title': 'Members',
                'members': members
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminMemberDetailView(View):
    template_name = 'pages/admin/team/edit_member.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            id_ = self.kwargs.get("id")

            member_info = Team.objects.get(id=id_, status='1')

            context = {
                'title': member_info.full_name_en,
                'member_info': member_info
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminEditMemberView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:

                member = Team.objects.get(id=request.POST.get('id'))

                member.id = request.POST.get('id')
                if request.FILES.get('image') is not None:
                    member.image = request.FILES.get('image')
                if request.FILES.get('banner_image') is not None:
                    member.banner_image = request.FILES.get('banner_image')
                member.full_name_en = request.POST.get('full_name_en')
                member.full_name_gr = request.POST.get('full_name_gr')
                member.full_name_ru = request.POST.get('full_name_ru')
                member.full_name_tr = request.POST.get('full_name_tr')
                member.profession_en = request.POST.get('profession_en')
                member.profession_gr = request.POST.get('profession_gr')
                member.profession_ru = request.POST.get('profession_ru')
                member.profession_tr = request.POST.get('profession_tr')
                member.email = request.POST.get('email')
                member.description_en = request.POST.get('description_en')
                member.description_gr = request.POST.get('description_gr')
                member.description_ru = request.POST.get('description_ru')
                member.description_tr = request.POST.get('description_tr')

                member.save()

                return redirect('/admin_member_detail/' + str(member.id))

        except:
            return redirect('/')


class AdminDeleteView(View):

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            id_ = self.kwargs.get("id")
            delete_type = self.kwargs.get("slug")

            if delete_type == 'doctor':
                Doctor.objects.filter(id=id_, status='1').update(status='0')
                return redirect('admin_doctors')
            if delete_type == 'news':
                News.objects.filter(id=id_, status='1').update(status='0')
                return redirect('admin_news')
            if delete_type == 'keyword':
                Keywords.objects.filter(id=id_, status='1').update(status='0')
                return redirect('admin_keywords')
            if delete_type == 'medical':
                MedicalTechnologies.objects.filter(id=id_, status='1').update(status='0')
                return redirect('admin_medical_list')
            if delete_type == 'hide':
                News.objects.filter(id=id_, status='1').update(display_home='0')
                return redirect('admin_news')
            if delete_type == 'display':
                News.objects.filter(id=id_, status='1').update(display_home='1')
                return redirect('admin_news')
            if delete_type == 'patient_guide':
                PatientGuide.objects.filter(id=id_, status='1').update(status='0')
                return redirect('admin_patient_guides')
            if delete_type == 'slider':
                Slider.objects.filter(id=id_, status='1').update(status='0')
                return redirect('admin_sliders')
            if delete_type == 'member':
                Team.objects.filter(id=id_, status='1').update(status='0')
                return redirect('admin_members')
            if delete_type == 'department':
                Department.objects.filter(id=id_, status='1').update(status='0')
                return redirect('admin_departments')
            if delete_type == 'jobd':
                JobDepartment.objects.filter(id=id_, status='1').update(status='0')
            if delete_type == 'job':
                Jobs.objects.filter(id=id_, status='1').update(status='0')
                return redirect('admin_jobs')
            if delete_type == 'deactive':
                Admin.objects.filter(id=id_, status='1').update(status='0')
                return redirect('admin_account')
            if delete_type == 'active':
                Admin.objects.filter(id=id_, status='0').update(status='1')
                return redirect('admin_account')

        else:
            return redirect('/')


class AdminWriteNewsView(View):
    template_name = 'pages/admin/news/write_news.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:
            doctors = Doctor.objects.all()

            if request.resolver_match.url_name == 'admin_write_news':

                title = 'Write News'
                post_type = 'news'
            else:
                title = 'Write Health Guide'
                post_type = 'health_guide'

            context = {
                'title': title,
                'post_type': post_type,
                'doctor': doctors
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:

                news = News()
                doc = request.POST.get('doctor')
                test = Doctor.objects.filter(full_name_en=doc).last()
                print(test.id, '++++++++++++++')

                news.image = request.FILES.get('image')
                news.title_en = request.POST.get('title_en')
                news.title_gr = request.POST.get('title_gr')
                news.title_ru = request.POST.get('title_ru')
                news.title_tr = request.POST.get('title_tr')
                news.description_en = request.POST.get('description_en')
                news.description_gr = request.POST.get('description_gr')
                news.description_ru = request.POST.get('description_ru')
                news.description_tr = request.POST.get('description_tr')
                # news.keywords = request.POST.get('keywords')
                news.doctor = test

                news.post_type = request.POST.get('post_type')

                news.save()

                if news.post_type == 'news':
                    title = 'Write News'
                    success_text = 'News added'
                else:
                    title = 'Write Health Guide'
                    success_text = 'Health Guide added'

                context = {
                    'title': title,
                    'success_text': success_text
                }

                return render(request, self.template_name, context)

        except:
            return redirect('/')


class AdminNewsView(View):
    template_name = 'pages/admin/news/news.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            if request.resolver_match.url_name == 'admin_news':
                title = 'News'
                post_type = 'news'
            else:
                title = 'Health Guides'
                post_type = 'health_guide'

            news = News.objects.filter(status='1', post_type=post_type).order_by('-id')

            context = {
                'title': title,
                'news': news,
                'page_type': request.resolver_match.url_name
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminKeywordsView(View):
    template_name = 'pages/admin/news/keywordlist.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            news = Keywords.objects.filter(status='1').order_by('-id')

            context = {
                'news': news,
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminKeywordDetailView(View):
    template_name = 'pages/admin/news/edit_keyword.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:
            news = News.objects.all()
            id_ = self.kwargs.get("id")

            news_info = Keywords.objects.get(id=id_, status='1')

            context = {
                # 'title': news_info.title_en,
                'news_info': news_info,
                'news': news
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')

    def post(self, request, id):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                keyword = Keywords.objects.filter(id=id).last()
                new = request.POST.get('news')
                test = News.objects.filter(title_en=new).last()

                print(test)

                keyword.name = request.POST.get('name')
                keyword.news = test
                keyword.status = request.POST.get('status')

                keyword.save()
                # print(keyword.news)

                context = {
                    'title': 'Add Keyword',
                    'success_text': 'Keyword added'
                }

                return redirect('admin_keywords')

        except:
            return redirect('/')


class AdminNewsDetailView(View):
    template_name = 'pages/admin/news/edit_news.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            id_ = self.kwargs.get("id")

            news_info = News.objects.get(id=id_, status='1')

            context = {
                'title': news_info.title_en,
                'news_info': news_info
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminEditNewsView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:

                news = News.objects.get(id=request.POST.get('id'))

                news.id = request.POST.get('id')
                if request.FILES.get('image') is not None:
                    news.image = request.FILES.get('image')
                news.title_en = request.POST.get('title_en')
                news.title_gr = request.POST.get('title_gr')
                news.title_ru = request.POST.get('title_ru')
                news.title_tr = request.POST.get('title_tr')
                news.description_en = request.POST.get('description_en')
                news.description_gr = request.POST.get('description_gr')
                news.description_ru = request.POST.get('description_ru')
                news.description_tr = request.POST.get('description_tr')
                news.keywords = request.POST.get('keywords')

                news.save()

                return redirect('/admin_news_detail/' + str(news.id))

        except:
            return redirect('/')


class AdminDepartmentsView(View):
    template_name = 'pages/admin/news/news.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            if request.resolver_match.url_name == 'admin_news':
                title = 'News'
                post_type = 'news'
            else:
                title = 'Health Guides'
                post_type = 'health_guide'

            news = News.objects.filter(status='1', post_type=post_type).order_by('-id')

            context = {
                'title': title,
                'news': news,
                'page_type': request.resolver_match.url_name
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminPatientGuideView(View):
    template_name = 'pages/admin/guide/patient_guides.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            patient_guides = PatientGuide.objects.filter(status='1').order_by('-id')

            context = {
                'title': 'Patient Guide',
                'patient_guides': patient_guides
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminAddPatientGuideView(View):
    template_name = 'pages/admin/guide/add_patient_guide.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            context = {
                'title': 'Add Patient Guide'
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                patient_guide = PatientGuide()

                patient_guide.title_en = request.POST.get('title_en')
                patient_guide.title_gr = request.POST.get('title_gr')
                patient_guide.title_ru = request.POST.get('title_ru')
                patient_guide.title_tr = request.POST.get('title_tr')
                patient_guide.text_en = request.POST.get('text_en')
                patient_guide.text_gr = request.POST.get('text_gr')
                patient_guide.text_ru = request.POST.get('text_ru')
                patient_guide.text_tr = request.POST.get('text_tr')

                patient_guide.save()

                context = {
                    'title': 'Add Patient Guide',
                    'success_text': 'Patient Guide added'
                }

                return render(request, self.template_name, context)

        except:
            return redirect('/')


class AdminPatientGuideDetailView(View):
    template_name = 'pages/admin/guide/edit_patient_guide.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            id_ = self.kwargs.get("id")

            patient_guide_info = PatientGuide.objects.get(id=id_, status='1')

            context = {
                'title': patient_guide_info.title_en,
                'patient_guide_info': patient_guide_info
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminEditPatientGuideView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                patient_guide = PatientGuide.objects.get(id=request.POST.get('id'))

                patient_guide.id = request.POST.get('id')
                patient_guide.title_en = request.POST.get('title_en')
                patient_guide.title_gr = request.POST.get('title_gr')
                patient_guide.title_ru = request.POST.get('title_ru')
                patient_guide.title_tr = request.POST.get('title_tr')
                patient_guide.text_en = request.POST.get('text_en')
                patient_guide.text_gr = request.POST.get('text_gr')
                patient_guide.text_ru = request.POST.get('text_ru')
                patient_guide.text_tr = request.POST.get('text_tr')

                patient_guide.save()

                return redirect('/admin_patient_guide_detail/' + str(patient_guide.id))

        except:
            return redirect('/')


class AdminAddJobDepartmentView(View):
    template_name = 'pages/admin/jobs/add_job_department.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            context = {
                'title': 'Add Job Department'
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                job_department = JobDepartment()

                job_department.title_en = request.POST.get('title_en')
                job_department.title_gr = request.POST.get('title_gr')
                job_department.title_ru = request.POST.get('title_ru')
                job_department.title_tr = request.POST.get('title_tr')

                job_department.save()

                context = {
                    'title': 'Add Job Department',
                    'success_text': 'Job Department added'
                }

                return render(request, self.template_name, context)

        except:
            return redirect('/')


class AdminJobDepartmentsView(View):
    template_name = 'pages/admin/jobs/job_departments.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            job_departments = JobDepartment.objects.filter(status='1').order_by('-id')

            context = {
                'title': 'Job Departments',
                'job_departments': job_departments
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminJobDepartmentDetailView(View):
    template_name = 'pages/admin/jobs/edit_job_department.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            id_ = self.kwargs.get("id")

            job_info = JobDepartment.objects.get(id=id_, status='1')

            context = {
                'title': job_info.title_en,
                'job_info': job_info
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminEditJobDepartmentView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                job_department = JobDepartment.objects.get(id=request.POST.get('id'))

                job_department.id = request.POST.get('id')
                job_department.title_en = request.POST.get('title_en')
                job_department.title_gr = request.POST.get('title_gr')
                job_department.title_ru = request.POST.get('title_ru')
                job_department.title_tr = request.POST.get('title_tr')

                job_department.save()

                return redirect('/admin_job_department_detail/' + str(job_department.id))

        except:
            return redirect('/')


class AdminJobsView(View):
    template_name = 'pages/admin/jobs/jobs.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            jobs = Jobs.objects.filter(status='1').order_by('-id')

            context = {
                'title': 'Jobs',
                'jobs': jobs
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminAddJobView(View):
    template_name = 'pages/admin/jobs/add_job.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            job_departments = JobDepartment.objects.filter(status='1').order_by('-id')

            context = {
                'title': 'Add Job',
                'job_departments': job_departments
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                job = Jobs()

                job.job_department_id = request.POST.get('job_department')
                job.title_en = request.POST.get('title_en')
                job.title_gr = request.POST.get('title_gr')
                job.title_ru = request.POST.get('title_ru')
                job.title_tr = request.POST.get('title_tr')
                job.short_description_en = request.POST.get('short_description_en')
                job.short_description_gr = request.POST.get('short_description_gr')
                job.short_description_ru = request.POST.get('short_description_ru')
                job.short_description_tr = request.POST.get('short_description_tr')
                job.description_en = request.POST.get('description_en')
                job.description_gr = request.POST.get('description_gr')
                job.description_ru = request.POST.get('description_ru')
                job.description_tr = request.POST.get('description_tr')

                job.save()

                context = {
                    'title': 'Add Job',
                    'success_text': 'Job added'
                }

                return render(request, self.template_name, context)

        except:
            return redirect('/')


class AdminJobDetailView(View):
    template_name = 'pages/admin/jobs/edit_job.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            id_ = self.kwargs.get("id")

            job_info = Jobs.objects.get(id=id_, status='1')
            job_departments = JobDepartment.objects.filter(status='1').order_by('-id')

            context = {
                'title': job_info.title_en,
                'job_info': job_info,
                'job_departments': job_departments
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminEditJobView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                job = Jobs.objects.get(id=request.POST.get('id'))

                job.id = request.POST.get('id')
                job.job_department_id = request.POST.get('job_department')
                job.title_en = request.POST.get('title_en')
                job.title_gr = request.POST.get('title_gr')
                job.title_ru = request.POST.get('title_ru')
                job.title_tr = request.POST.get('title_tr')
                job.short_description_en = request.POST.get('short_description_en')
                job.short_description_gr = request.POST.get('short_description_gr')
                job.short_description_ru = request.POST.get('short_description_ru')
                job.short_description_tr = request.POST.get('short_description_tr')
                job.description_en = request.POST.get('description_en')
                job.description_gr = request.POST.get('description_gr')
                job.description_ru = request.POST.get('description_ru')
                job.description_tr = request.POST.get('description_tr')

                job.save()

                return redirect('/admin_job_detail/' + str(job.id))

        except:
            return redirect('/')


class AdminAddSliderView(View):
    template_name = 'pages/admin/slider/add_slider.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            menu = fetch_menu()

            context = {
                'title': 'Add Slider',
                'menu': menu
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                slider = Slider()

                slider.image = request.FILES.get('image')
                slider.title_en = request.POST.get('title_en')
                slider.title_gr = request.POST.get('title_gr')
                slider.title_ru = request.POST.get('title_ru')
                slider.title_tr = request.POST.get('title_tr')
                slider.text_en = request.POST.get('text_en')
                slider.text_gr = request.POST.get('text_gr')
                slider.text_ru = request.POST.get('text_ru')
                slider.text_tr = request.POST.get('text_tr')
                slider.menu_id = request.POST.get('call_to_action')

                slider.save()

                context = {
                    'title': 'Add Slider',
                    'success_text': 'Slider added'
                }

                return render(request, self.template_name, context)

        except:
            return redirect('/')


class AdminSlidersView(View):
    template_name = 'pages/admin/slider/sliders.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            sliders = Slider.objects.filter(status='1').order_by('menu', '-order', '-id')

            context = {
                'title': 'Sliders',
                'sliders': sliders
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminSliderDetailView(View):
    template_name = 'pages/admin/slider/edit_slider.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            id_ = self.kwargs.get("id")

            slider_info = Slider.objects.get(id=id_, status='1')
            menu = fetch_menu()

            context = {
                'title': slider_info.title_en,
                'slider_info': slider_info,
                'menu': menu
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminEditSliderView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:

                slider = Slider.objects.get(id=request.POST.get('id'))

                slider.id = request.POST.get('id')
                if request.FILES.get('image') is not None:
                    slider.image = request.FILES.get('image')
                slider.title_en = request.POST.get('title_en')
                slider.title_gr = request.POST.get('title_gr')
                slider.title_ru = request.POST.get('title_ru')
                slider.title_tr = request.POST.get('title_tr')
                slider.text_en = request.POST.get('text_en')
                slider.text_gr = request.POST.get('text_gr')
                slider.text_ru = request.POST.get('text_ru')
                slider.text_tr = request.POST.get('text_tr')
                slider.menu_id = request.POST.get('call_to_action')

                try:
                    slider.order = int(request.POST.get('slider_position', 0))
                except:
                    pass

                slider.save()

                return redirect('/admin_slider_detail/' + str(slider.id))

        except:
            return redirect('/')


class AdminEditContactView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                contact = Contact.objects.get(id=1)

                contact.id = 1
                contact.address_en = request.POST.get('address_en')
                contact.address_gr = request.POST.get('address_gr')
                contact.address_ru = request.POST.get('address_ru')
                contact.address_tr = request.POST.get('address_tr')
                contact.email = request.POST.get('email')
                contact.phone = request.POST.get('phone')

                contact.save()

                return redirect('admin_dashboard')

        except:
            return redirect('/')


class AdminEditAboutView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:

                page_type = request.POST.get('page_type')

                id_ = 1

                if page_type == 'about':
                    id_ = 1
                if page_type == 'introduction':
                    id_ = 2
                if page_type == 'history':
                    id_ = 3
                if page_type == 'television':
                    id_ = 4
                if page_type == 'mission':
                    id_ = 5
                if page_type == 'vision':
                    id_ = 6
                if page_type == 'quality_policy':
                    id_ = 7
                if page_type == 'facility':
                    id_ = 8
                if page_type == 'policy':
                    id_ = 9

                about = About.objects.get(id=id_)

                about.id = id_
                about.text_en = request.POST.get('text_en')
                about.text_gr = request.POST.get('text_gr')
                about.text_ru = request.POST.get('text_ru')
                about.text_tr = request.POST.get('text_tr')

                about.save()

                return redirect('admin_dashboard')

        except:
            return redirect('/')


class AdminMessagesView(View):
    template_name = 'pages/admin/e-services/messages.html'

    def get(self, request):
        if request.session.get('admin_id') is not None:

            title = ''
            subject = ''

            if request.resolver_match.url_name == 'admin_ecomplaint':
                title = 'E-Complaints'
                subject = 'complaint'
            elif request.resolver_match.url_name == 'admin_esuggestion':
                title = 'E-Suggestions'
                subject = 'suggestion'
            elif request.resolver_match.url_name == 'admin_messages':
                title = 'Messages'
                subject = 'contact'

            messages_to_read = Message.objects.filter(subject=subject, read_status='1').order_by('-id')
            messages = Message.objects.filter(subject=subject, read_status='0').order_by('-id')

            context = {
                'title': title,
                'messages_to_read': messages_to_read,
                'messages': messages
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminReadMessagesView(View):
    template_name = 'pages/admin/e-services/read-message.html'

    def get(self, request, *args, **kwargs):
        if request.session.get('admin_id') is not None:

            id_ = self.kwargs.get("id")

            message = Message.objects.get(id=id_)

            if message.read_status == '1':
                Message.objects.filter(id=id_).update(read_status='0')

            context = {
                'title': message.full_name,
                'message': message
            }

            return render(request, self.template_name, context)
        else:
            return redirect('/')


class AdminSocialMediaView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:

                if request.POST.get('post_type') == 'add':
                    social_media = SocialMedia()

                    social_media.icon = request.POST.get('icon')
                    social_media.link = request.POST.get('link')

                    social_media.save()

                if request.POST.get('post_type') == 'edit':
                    social_media = SocialMedia.objects.get(id=request.POST.get('id'))

                    social_media.link = request.POST.get('link')

                    social_media.save()

                return redirect('admin_dashboard')

        except:
            return redirect('/')


class AdminEditMenuView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                menu = Menu.objects.get(id=request.POST.get('id'))

                menu.title_en = request.POST.get('title_en')
                menu.title_gr = request.POST.get('title_gr')
                menu.title_ru = request.POST.get('title_ru')
                menu.title_tr = request.POST.get('title_tr')

                menu.save()

                return redirect('admin_dashboard')

        except:
            return redirect('/')


class AdminEditSubMenuView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                submenu = SubMenu.objects.get(id=request.POST.get('id'))

                submenu.title_en = request.POST.get('title_en')
                submenu.title_gr = request.POST.get('title_gr')
                submenu.title_ru = request.POST.get('title_ru')
                submenu.title_tr = request.POST.get('title_tr')

                submenu.save()

                return redirect('admin_dashboard')

        except:
            return redirect('/')


class AdminAddAdminView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:
                admin = Admin()

                admin.username = request.POST.get('username')
                admin.password = hashlib.sha256(request.POST.get('psw').encode('utf-8')).hexdigest()

                # if Admin.objects.filter(username__iexact=admin.username, status='1').exists():
                #     return redirect('admin_account')
                # else:
                admin.save()

                return redirect('admin_account')

        except:
            return redirect('/')


class AdminChangePswView(View):

    def post(self, request):

        try:
            if request.method == 'POST' and request.session.get('admin_id') is not None:

                new_psw = request.POST.get('new_psw').strip()
                confirm_psw = request.POST.get('confirm_psw').strip()

                if new_psw.strip() == confirm_psw.strip() and 5 < len(new_psw.strip()) < 32:
                    new_psw = hashlib.sha256(new_psw.encode('utf-8')).hexdigest()
                    Admin.objects.filter(id=request.session.get("admin_id"), status='1').update(password=new_psw)

                return redirect('admin_account')

        except:
            return redirect('/')


class MedicalTechView(View):
    template_name = 'pages/website/medical_tech.html'

    def get(self, request):

        if request.resolver_match.url_name == 'medical_tech':
            title = ''

            if request.session.get('lang') == 'en' or request.session.get('lang') is None:
                title = 'News'
            if request.session.get('lang') == 'gr':
                title = 'სიახლეები'
            if request.session.get('lang') == 'ru':
                title = 'Новости'
            if request.session.get('lang') == 'tr':
                title = 'Haberler'

            post_type = 'news'
        else:
            title = ''

            if request.session.get('lang') == 'en' or request.session.get('lang') is None:
                title = 'Health Guides'
            if request.session.get('lang') == 'gr':
                title = 'გზამკვლევი თქვენი ჯანმრთელობისთვის'
            if request.session.get('lang') == 'ru':
                title = 'Руководство к вашему здоровью'
            if request.session.get('lang') == 'tr':
                title = 'Sağlık Rehberi'

            post_type = 'health_guide'

        news = MedicalTechnologies.objects.filter(status='1').order_by('-id')
        doctors = Doctor.objects.filter(status='1').order_by('-id')
        images = PageImage.objects.filter(page__name='Medical_Tech')

        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        context = {
            'title': title,
            'image': 'https://ahtbilisi.com/static/website/img/logo.png',
            'url': 'https://ahtbilisi.com/',
            'news': news,
            'doctors': doctors,
            'image_page': images,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)


class MedicalTechDetailView(View):
    template_name = 'pages/website/medicaltech_detail.html'

    def get(self, request, *args, **kwargs):

        news_detail = MedicalTechnologies.objects.get(id=self.kwargs.get("id"), status='1')
        news = MedicalTechnologies.objects.filter(status='1').order_by('-id')[:4]
        # doctors = Doctor.objects.filter(status='1').order_by('-id')
        # keyword = Keywords.objects.filter(news=news_detail)
        # print(keyword)
        contact_info = fetch_contact_info()
        social_media = fetch_social_media()
        menu = fetch_menu()
        submenu = fetch_submenu()

        title = ''

        if request.session.get('lang') == 'en' or request.session.get('lang') is None:
            title = news_detail.title_en
        if request.session.get('lang') == 'gr':
            title = news_detail.title_gr
        if request.session.get('lang') == 'ru':
            title = news_detail.title_ru
        if request.session.get('lang') == 'tr':
            title = news_detail.title_tr

        context = {
            'title': title,
            'image': "https://res.cloudinary.com/dvljbh7jn/image/upload/c_scale,w_750,h_375/v1575654181/" + str(
                news_detail.image) + ".jpg",
            'url': 'https://ahtbilisi.com/news_detail/' + str(news_detail.id) + '/' + news_detail.title_en.replace(" ",
                                                                                                                   "-").replace(
                ":", "").replace("%", ""),
            'news_detail': news_detail,
            'news': news,
            'contact_info': contact_info,
            'social_media': social_media,
            'menu': menu,
            'submenu': submenu,
            'lang': request.session.get('lang')
        }
        return render(request, self.template_name, context)
