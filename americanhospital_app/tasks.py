from django.core.mail import send_mail
from django.core.mail import EmailMultiAlternatives
from celery import shared_task
from .models import ToMail

from django.conf import settings

mail = ToMail.objects.last()
to_mail = mail.email

@shared_task()
def contact_email(text, full_name, email):
    subject, from_email, to = 'From Contact', 'settings.EMAIL_HOST_USER', to_mail
    text_content = 'From Contact'
    html_content = f"<tbody><tr><td><b>Text:</b></td><td>{text}</td></tr><tr><td><b>Full Name:</b></td><td>{full_name}</td></tr><tr><td><b>Email:</b></td><td>{email}</td></tr></tbody>"
    msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
    msg.attach_alternative(html_content, "text/html")
    msg.send()
