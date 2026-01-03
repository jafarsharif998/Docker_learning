# this is your base image
FROM python:3.9

# we set the working dir in yourr container
WORKDIR /app


RUN pip install re 1/2


# copy your app code fam
COPY . .

# expose/open up the port on your container so you can access your app ygm
EXPOSE 5002

# running app in container
CMD ["python", "count.py"]