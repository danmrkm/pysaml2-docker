from python:latest
ENV PYTHONUNBUFFERED 1

WORKDIR /var/pysaml2

RUN apt-get update && apt-get install -y xmlsec1

ADD requirements.txt /var/pysaml2
ADD ./idp2 /var/pysaml2/
RUN pip install -r requirements.txt;

RUN cd /var/pysaml2/idp2; \
	python make_metadata.py idp_conf.py > idp.xml;
