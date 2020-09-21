from django.urls import path
from americanhospital_app.views import LanguageView, IndexView, AboutView, DoctorsView, DoctorInfoView, DepartmentsView, \
    DepartmentInfoView, ContactView, PatientGuideView, PatientGuideDetailView, JobsView, JobInfoView, MemberInfoView, \
    NewsView, SendCVView, AskToDoctorView, TeamView, WriteToManagmentView, EServicesView, EResultView, EThanksView, \
    EComplaintView, ESuggestionView, NewsDetailView, AppointmentView, AdminLoginView, AdminLogoutView, \
    AdminDashboardView, AdminAddDoctorView, AdminDoctorsView, AdminDoctorDetailView, AdminEditDoctorView, \
    AdminDeleteView, AdminWriteNewsView, AdminNewsView, \
    AdminNewsDetailView, AdminEditNewsView, AdminAddSliderView, AdminSlidersView, AdminSliderDetailView, \
    AdminEditSliderView, AdminEditContactView, AdminMessagesView, AdminSocialMediaView, AdminEditAboutView, \
    AdminAddTeamMemberView, AdminMembersView, AdminMemberDetailView, AdminEditMemberView, AdminEditMenuView, \
    AdminEditSubMenuView, \
    AdminAppointmentsView, AdminAddDepartmentView, AdminDepartmentsView, AdminDepartmentDetailView, \
    AdminEditDepartmentView, AdminDoctorQuestionView, AdminAboutView, AdminResumesView, AdminEThanksView, \
    AdminEResultView, AdminAccountView, AdminAddAdminView, \
    AdminChangePswView, AdminPatientGuideView, AdminAddPatientGuideView, AdminEditPatientGuideView, \
    AdminPatientGuideDetailView, AdminJobsView, AdminAddJobView, AdminJobDetailView, AdminEditJobView, \
    AdminReadMessagesView, AdminReadAppointmentView, AdminCheckEResultView, AdminReadEThanksView, \
    AdminJobDepartmentsView, AdminAddJobDepartmentView, AdminJobDepartmentDetailView, AdminEditJobDepartmentView, \
    search,success_contact,MedicalTechView,MedicalTechDetailView

urlpatterns = [
    path('lang/<str:slug>/', LanguageView.as_view(), name='lang'),
    path('', IndexView.as_view(), name='index'),
    path('about/<str:slug>/', AboutView.as_view(), name='about'),
    path('members/', TeamView.as_view(), name='members'),
    path('search/', search, name="search"),
    path('success/', success_contact, name="succes"),
    path('member_info/<int:id>/', MemberInfoView.as_view(), name='member_info'),
    path('doctors/', DoctorsView.as_view(), name='doctors'),
    path('doctor_info/<int:id>/<str:slug>/', DoctorInfoView.as_view(), name='doctor_info'),
    path('departments/', DepartmentsView.as_view(), name='departments'),
    path('department_info/<int:id>/', DepartmentInfoView.as_view(), name='department_info'),
    path('jobs/', JobsView.as_view(), name='jobs'),
    path('job_info/<int:id>/<str:slug>/', JobInfoView.as_view(), name='job_info'),
    path('contact/', ContactView.as_view(), name='contact'),
    path('write_to_managment/', WriteToManagmentView.as_view(), name='write_to_managment'),
    path('ask_to_doctor/', AskToDoctorView.as_view(), name='ask_to_doctor'),
    path('send_cv/<int:id>/<str:slug>/', SendCVView.as_view(), name='send_cv'),
    path('apply/', SendCVView.as_view(), name='apply'),
    path('appointment/', AppointmentView.as_view(), name='appointment'),
    path('news/', NewsView.as_view(), name='news'),
    path('medical_tech/', MedicalTechView.as_view(), name='medical_tech'),
    path('health_guides/', NewsView.as_view(), name='health_guides'),
    path('news_detail/<int:id>/<str:slug>/', NewsDetailView.as_view(), name='news_detail'),
    path('medical_detail/<int:id>/<str:slug>/', MedicalTechDetailView.as_view(), name='medical_detail'),
    path('patient_guides/', PatientGuideView.as_view(), name='patient_guides'),
    path('patient_guide/<int:id>/<str:slug>/', PatientGuideDetailView.as_view(), name='patient_guide'),
    path('e-services/<str:slug>/', EServicesView.as_view(), name='e-services'),
    path('e-result/', EResultView.as_view(), name='e-result'),
    path('e-thanks/', EThanksView.as_view(), name='e-thanks'),
    path('e-getwell/', EThanksView.as_view(), name='e-getwell'),
    path('e-complaint/', EComplaintView.as_view(), name='e-complaint'),
    path('e-suggestion/', ESuggestionView.as_view(), name='e-suggestion'),
    path('admin_login/', AdminLoginView.as_view(), name='admin_login'),
    path('admin_logout/', AdminLogoutView.as_view(), name='admin_logout'),
    path('admin_dashboard/', AdminDashboardView.as_view(), name='admin_dashboard'),
    path('admin_account/', AdminAccountView.as_view(), name='admin_account'),
    path('admin_add_admin/', AdminAddAdminView.as_view(), name='admin_add_admin'),
    path('admin_change_psw/', AdminChangePswView.as_view(), name='admin_change_psw'),
    path('admin_about/<str:slug>/', AdminAboutView.as_view(), name='admin_about'),
    path('admin_delete/<int:id>/<str:slug>/', AdminDeleteView.as_view(), name='admin_delete'),
    path('admin_add_doctor/', AdminAddDoctorView.as_view(), name='admin_add_doctor'),
    path('admin_doctors/', AdminDoctorsView.as_view(), name='admin_doctors'),
    path('admin_doctor_detail/<int:id>/', AdminDoctorDetailView.as_view(), name='admin_doctor_detail'),
    path('admin_edit_doctor/', AdminEditDoctorView.as_view(), name='admin_edit_doctor'),
    path('admin_doctor_questions/', AdminDoctorQuestionView.as_view(), name='admin_doctor_questions'),
    path('admin_add_department/', AdminAddDepartmentView.as_view(), name='admin_add_department'),
    path('admin_departments/', AdminDepartmentsView.as_view(), name='admin_departments'),
    path('admin_department_detail/<int:id>/', AdminDepartmentDetailView.as_view(), name='admin_department_detail'),
    path('admin_edit_department/', AdminEditDepartmentView.as_view(), name='admin_edit_department'),
    path('admin_add_team_member/', AdminAddTeamMemberView.as_view(), name='admin_add_team_member'),
    path('admin_members/', AdminMembersView.as_view(), name='admin_members'),
    path('admin_member_detail/<int:id>/', AdminMemberDetailView.as_view(), name='admin_member_detail'),
    path('admin_edit_member/', AdminEditMemberView.as_view(), name='admin_edit_member'),
    path('admin_write_news/', AdminWriteNewsView.as_view(), name='admin_write_news'),
    path('admin_write_health_guide/', AdminWriteNewsView.as_view(), name='admin_write_health_guide'),
    path('admin_news/', AdminNewsView.as_view(), name='admin_news'),
    path('admin_health_guides/', AdminNewsView.as_view(), name='admin_health_guides'),
    path('admin_news_detail/<int:id>/', AdminNewsDetailView.as_view(), name='admin_news_detail'),
    path('admin_edit_news/', AdminEditNewsView.as_view(), name='admin_edit_news'),
    path('admin_patient_guides/', AdminPatientGuideView.as_view(), name='admin_patient_guides'),
    path('admin_add_patient_guide/', AdminAddPatientGuideView.as_view(), name='admin_add_patient_guide'),
    path('admin_patient_guide_detail/<int:id>/', AdminPatientGuideDetailView.as_view(), name='admin_patient_guide_detail'),
    path('admin_edit_patient_guide/', AdminEditPatientGuideView.as_view(), name='admin_edit_patient_guide'),
    path('admin_add_slider/', AdminAddSliderView.as_view(), name='admin_add_slider'),
    path('admin_sliders/', AdminSlidersView.as_view(), name='admin_sliders'),
    path('admin_slider_detail/<int:id>/', AdminSliderDetailView.as_view(), name='admin_slider_detail'),
    path('admin_edit_slider/', AdminEditSliderView.as_view(), name='admin_edit_slider'),
    path('admin_edit_contact/', AdminEditContactView.as_view(), name='admin_edit_contact'),
    path('admin_edit_about/', AdminEditAboutView.as_view(), name='admin_edit_about'),
    path('admin_messages/', AdminMessagesView.as_view(), name='admin_messages'),
    path('admin_ecomplaint/', AdminMessagesView.as_view(), name='admin_ecomplaint'),
    path('admin_esuggestion/', AdminMessagesView.as_view(), name='admin_esuggestion'),
    path('admin_read_message/<int:id>/', AdminReadMessagesView.as_view(), name='admin_read_message'),
    path('admin_social_media/', AdminSocialMediaView.as_view(), name='admin_social_media'),
    path('admin_edit_menu/', AdminEditMenuView.as_view(), name='admin_edit_menu'),
    path('admin_edit_submenu/', AdminEditSubMenuView.as_view(), name='admin_edit_submenu'),
    path('admin_appointments/', AdminAppointmentsView.as_view(), name='admin_appointments'),
    path('admin_read_appointment/<int:id>/', AdminReadAppointmentView.as_view(), name='admin_read_appointment'),
    path('admin_resumes/', AdminResumesView.as_view(), name='admin_resumes'),
    path('admin_eresults/', AdminEResultView.as_view(), name='admin_eresults'),
    path('admin_check_eresult/<int:id>/', AdminCheckEResultView.as_view(), name='admin_check_eresult'),
    path('admin_ethanks/', AdminEThanksView.as_view(), name='admin_ethanks'),
    path('admin_read_ethanks/<int:id>/', AdminReadEThanksView.as_view(), name='admin_read_ethanks'),
    path('admin_egetwell/', AdminEThanksView.as_view(), name='admin_egetwell'),
    path('admin_job_departments/', AdminJobDepartmentsView.as_view(), name='admin_job_departments'),
    path('admin_add_job_department/', AdminAddJobDepartmentView.as_view(), name='admin_add_job_department'),
    path('admin_job_department_detail/<int:id>/', AdminJobDepartmentDetailView.as_view(), name='admin_job_department_detail'),
    path('admin_edit_job_department/', AdminEditJobDepartmentView.as_view(), name='admin_edit_job_department'),
    path('admin_jobs/', AdminJobsView.as_view(), name='admin_jobs'),
    path('admin_add_job/', AdminAddJobView.as_view(), name='admin_add_job'),
    path('admin_job_detail/<int:id>/', AdminJobDetailView.as_view(), name='admin_job_detail'),
    path('admin_edit_job/', AdminEditJobView.as_view(), name='admin_edit_job'),
]