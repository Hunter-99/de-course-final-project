FROM apache/airflow:2.5.2

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PIP_ROOT_USER_ACTION=ignore

USER airflow

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
         openjdk-11-jre-headless \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64


