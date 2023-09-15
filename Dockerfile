FROM python:latest

RUN apt-get update

WORKDIR /app

RUN pip install django==3.2

# Install project dependencies
RUN pip install -r requirements.txt

COPY . .

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
