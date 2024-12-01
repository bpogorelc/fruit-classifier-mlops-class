# Sets the Python version for the container
FROM python:3.12-slim

#Set the working directory for the container
WORKDIR /code

#Copy the rquirements file from ou
COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the code inside the app folder in our repo to the code/app in the cont:
COPY ./app /code/app

# set the env variables


#ENV FULL_MODEL_PATH=bogdan-pogorelc-bp/mlops_dsr_batch_40/resnet18:v1
ENV WANDB_API_KEY=""
ENV WANDB_ORG=""
ENV WANDB_PROJECT=""
ENV WANDB_MODEL_NAME=""
ENV WANDB_MODEL_VERSION=""

EXPOSE 8080

#CMD ["fastapi", "run", "app/main.py", "--port", "8080"]

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]