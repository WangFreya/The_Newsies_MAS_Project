FROM python:3.8-alpine

RUN mkdir -p /usr/src/app
COPY . /usr/src/app
COPY ./requirements.txt /usr/src/app/requirements.txt

WORKDIR /usr/src/app

# add and install requirements
RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python3"]
CMD ["/usr/src/app/app.py"]