from django import template
register = template.Library()


@register.filter
def replace_empty(value):
    return value.replace(" ", "-").replace(":", "").replace("%", "")