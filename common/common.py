
from rest_framework.exceptions import APIException
from rest_framework import status
from django.utils.encoding import force_text
from django.conf import settings
from django.core.mail import send_mail

class CustomValidation(APIException):
    status_code = status.HTTP_500_INTERNAL_SERVER_ERROR
    default_detail = 'A server error occurred.'

    def __init__(self, detail, field, status_code):
        if status_code is not None:self.status_code = status_code
        if detail is not None:
            self.detail = {field: force_text(detail)}
        else: self.detail = {'detail': force_text(self.default_detail)}

def getFirstError(errors):
    msg = ""
    for error in errors:
        if isinstance(errors[error], dict):
            for error2 in errors[error]:
                msg = errors[error][error2][0]
        else:
            if isinstance(errors[error][0], dict):
                for error2 in errors[error][0]:
                    msg =  errors[error][0][error2][0]
            else:
                if errors[error][0].startswith('This'):
                    msg = error + errors[error][0][4:]
                else:
                    msg =  errors[error][0]
    return {"error" : msg}

from django.template.loader import get_template
from django.core.mail import EmailMessage
from django.template import Context

def send_email(subject, message, recipient_list):
    email_from = settings.EMAIL_HOST_USER
    send_mail( subject, message, email_from, recipient_list )
    
def send_email_for_foget_password(subject, message, recipient_list):
    email_from = settings.EMAIL_HOST_USER
    send_mail( subject, message, email_from, recipient_list )
    
from io import BytesIO
import datetime
from xhtml2pdf import pisa

def render_to_pdf(template_src, context_dict={}):
    template = get_template(template_src)
    html  = template.render(context_dict)
    result = BytesIO()
    pdf = pisa.pisaDocument(BytesIO(html.encode("ISO-8859-1")), result)
    if not pdf.err:
        return result.getvalue()
    return None
    
def convert_html_to_pdf():
    template = get_template('invoice.html')
    context = {
            "invoice_id": 123,
            "customer_name": "John Cooper",
            "amount": 1399.99,
            "today": "Today",
        }
    html = template.render(context)
    pdf = render_to_pdf('invoice.html', context)
    if pdf:
        return pdf
    return None

def send_order_email_confirmation(instance, **kwargs):
    email_from = settings.EMAIL_HOST_USER
    order = instance
    pdf = convert_html_to_pdf()
    message = get_template("order_invoice.html").render({
        'order': instance
    })
    mail = EmailMessage(
        subject="Order confirmation",
        body=message,
        from_email=email_from,
        to=[order.user.email],
        reply_to=[email_from],
    )
    mail.content_subtype = "html"
    mail.attach("invoice.pdf", pdf, 'application/pdf')
    return mail.send()
