# apps.apps.urls.py

from django.urls import path

from apps.apps.views import home


urlpatterns = [
    path(
        route="",
        view=home.homepage_view,
        name="home_view_path"
    ),
]
