FROM python:3.6-alpine

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

ADD ./python /code

WORKDIR /code

RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python"]
CMD ["app.py"]

