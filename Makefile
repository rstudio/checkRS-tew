ORG=rstudio
PROJECT=checkrs-tew
TAG=dev-`date +%Y%m%d`
PYTHON_VERSION=3.9.10

pyenv:
	pyenv install ${PYTHON_VERSION} --skip-existing
	pyenv virtualenv-delete ${PROJECT} || true
	pyenv virtualenv ${PYTHON_VERSION} ${PROJECT}
	pyenv local ${PROJECT}
	pip install pipenv


build:
	docker build --build-arg PUID=${PUID:-1000} --build-arg PGID=${PGID:-1000} -t ${ORG}/${PROJECT}:${TAG} .

run:
	docker run --rm -it  ${ORG}/${PROJECT}:${TAG} bash
