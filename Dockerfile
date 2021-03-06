FROM python:3.9.5-slim-buster AS sandbox

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git

RUN mkdir -p /code
WORKDIR /code

COPY requirements.txt /usr/local/pip-requirements/
ADD "https://github.com/Gostich/package-myapp.git" skipcache
RUN pip3 install \
    --quiet \
    --no-cache \
    --no-binary :none: \
    -r /usr/local/pip-requirements/requirements.txt \
    --exists-action w \
    --src /pip-src/

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
