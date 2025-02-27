DOCKER=docker
PYTHON=python3
PIP=pip3

API_TOKEN=OVERRIDE_ME
DOCKER_IMAGE=tingvarsson/telegram.ongabot:latest
VENV_PATH=venv

.PHONY: venv install run clean docker-build docker-run

venv:
	$(PYTHON) -m venv $(VENV_PATH)
	echo "To activate venv: source venv/bin/activate"

install:
	$(PIP) install -r requirements.txt

run:
	cd ongabot && API_TOKEN=$(API_TOKEN) $(PYTHON) ongabot.py

clean:
	rm -rf $(VENV_PATH)

docker-build:
	$(DOCKER) build . -f Dockerfile -t $(DOCKER_IMAGE)

docker-run:
	$(DOCKER) run --rm --env API_TOKEN=$(API_TOKEN) -it $(DOCKER_IMAGE)
