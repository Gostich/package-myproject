FROM python:3.9.5-slim-buster AS sandbox

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git

RUN mkdir -p /code
WORKDIR /code

COPY requirements.txt /usr/local/pip-requirements/
RUN pip3 install \
    --quiet \
    --no-binary :none: \
    -r /usr/local/pip-requirements/requirements.txt

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
