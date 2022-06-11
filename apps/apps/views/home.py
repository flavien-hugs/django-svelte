# apps.apps.views.home.py

from django.views.generic import TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin


class HomeView(LoginRequiredMixin, TemplateView):
    template_name = "index.html"


home_view = HomeView.as_view()
