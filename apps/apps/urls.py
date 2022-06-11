# apps.apps.urls.py

from django.urls import path

from apps.apps.views import home, api


urlpatterns = [
    path(route="", view=home.home_view, name="home_view_path"),
    path(route="api/greet", view=api.greeting_api),
]
