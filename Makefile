build:
	@pip install -r requirements.txt

test: FORCE
	@pytest -v

cov:
	@pytest --cov-report term-missing --cov=src tests

hook:
	@git config --local core.hooksPath "./.hooks"

report: generate
	@pytest --cov-report annotate:reports --cov=src tests
	@rm reports/python_template___init__.py,cover
	@cat reports/*.py,cover

commit:
	@gommit check range HEAD~2 HEAD

generate:
	@mkdir reports

lint:
	@pylint src/*.py

FORCE:
