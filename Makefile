# Python environment
PYENV=$(CURDIR)/.env


.PHONY: help
# target: help - Display callable targets
help:
	@egrep "^# target:" [Mm]akefile | sed -e 's/^# target: //g'

.PHONY: pyenv
# target: pyenv - Install python environment and Ansible
pyenv:
	python3 -m venv $(PYENV)
	$(PYENV)/bin/pip install --upgrade pip
	$(PYENV)/bin/pip install ansible==2.4.2.0

.PHONY: install
# target: install - Install playbooks
install: pyenv
	$(PYENV)/bin/ansible-galaxy install --force --role-file=requirements.yml
