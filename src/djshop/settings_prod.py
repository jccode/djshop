
from settings import *

DEBUG = TEMPLATE_DEBUG = False

ALLOWED_HOSTS = [
    "localhost",
    "127.0.0.1",
    "192.168.34.10",
    "192.168.33.10",

    "120.25.145.61",
]

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'djshop',
        'USER': 'djshop',
        'PASSWORD': '1q2w3e',  #
        'HOST': '127.0.0.1',
        'PORT': '3306',
    }
}

ADMINS = (
    ("Jessie", "492429624@qq.com"),
)

MANAGERS = (
    ("Jessie", "492429624@qq.com"),
)

