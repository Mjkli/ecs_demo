FROM alpine:latest

RUN apk update
RUN apk add python3 py3-pip
RUN pip install flask
COPY app/app.py /
ENV FLASK_APP=app.py

ENTRYPOINT [ "flask","run","--host=0.0.0.0" ]