SENTRY_AUTH_TOKEN=sntrys_eyJpYXQiOjE3MDg1MjAxMDkuMTEyMTYsInVybCI6Imh0dHBzOi8vc2VudHJ5LmlvIiwicmVnaW9uX3VybCI6Imh0dHBzOi8vdXMuc2VudHJ5LmlvIiwib3JnIjoiZ25vdmF0aW9uIn0=_M6jct/9sbh7esiuRUtIKl3oNYZH1OavoayLBQxcNEEgsntrys_eyJpYXQiOjE3MDg1MjAxMDkuMTEyMTYsInVybCI6Imh0dHBzOi8vc2VudHJ5LmlvIiwicmVnaW9uX3VybCI6Imh0dHBzOi8vdXMuc2VudHJ5LmlvIiwib3JnIjoiZ25vdmF0aW9uIn0=_M6jct/9sbh7esiuRUtIKl3oNYZH1OavoayLBQxcNEEg
SENTRY_ORG=gnovation
SENTRY_PROJECT=node
VERSION=`sentry-cli releases propose-version`

deploy: install create_release associate_commits run_django

install:
	pip install -r ./requirements.txt

create_release:
	sentry-cli releases -o $(SENTRY_ORG) new -p $(SENTRY_PROJECT) $(VERSION)

associate_commits:
	sentry-cli releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) \
		set-commits $(VERSION) --auto

run_django:
	VERSION=$(VERSION) python manage.py runserver
