MANAGE := python manage.py

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: venv
venv: ## Make a new virtual environment
	pipenv shell

.PHONY: install
install: venv ## Install or update dependencies
	pipenv install

freeze: ## Pin current dependencies
	pipenv run pip freeze > requirements.txt

migrate: ## Make and run migrations
	DJANGO_DEBUG=ON $(MANAGE) makemigrations
	DJANGO_DEBUG=ON $(MANAGE) migrate

collectstatic: ## Run collectstatic
	DJANGO_DEBUG=ON $(MANAGE) collectstatic --noinput

changepassword: ## Change password superuser
	DJANGO_DEBUG=ON $(MANAGE) changepassword admin

.PHONY: createsuperuser
createsuperuser: ## Run the Django server
	DJANGO_DEBUG=ON $(MANAGE) createsuperuser --username="admin" --email="admin@pm.me"

.PHONY: dumpdata
dumpdata: ## dumpdata on database
	$(MANAGE) dumpdata --indent=4 --natural-foreign --natural-primary -e contenttypes --format=json users.customuser > fixtures/users.json

.PHONY: loaddata
loaddata: ## Load default data
	$(MANAGE) loaddata fixtures/*.json

.PHONY: movefrontend
movefrontend: ## Move frontend/public/ files to django
	mv frontend/public/favicon.png apps/static/frontend/
	mv frontend/public/global.css apps/static/frontend/

.PHONY: runserver
runserver: ## Launch server
	DJANGO_DEBUG=ON $(MANAGE) runserver
