# apps.apps.views.home.py

from django.views.generic import TemplateView


class HomePageView(TemplateView):
    template_name = "index.html"


homepage_view = HomePageView.as_view()
