[![northjosh](https://circleci.com/gh/northjosh/project-ml-microservice-kubernetes.svg?style=svg)](https://app.circleci.com/pipelines/github/northjosh/project-ml-microservice-kubernetes)

## Project Overview

In this project, I will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API.

I am given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

## Setting the Environment

- **_ Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. Running on Ubuntu and Python 3.7 installed, I ran the following: _**

- Run `python3 -m pip install --user virtualenv` to install virtualenv.
- Run `python3 -m virtualenv ~/.devops/bin/activate` .devops to create a virtual environment.
- Run `source ~/.devops/bin/activate` to activate the virtual environment.
- Run `make install` to install the necessary dependencies
- Run `make lint' to lint Dockerfile and Python source code(with Hadolint and Pylint).
- Run 'make all' to run the above two steps.

### Running `app.py`

1. Standalone: `python app.py`
2. Run in Docker
   - Run `./run_docker.sh`
   - Next, run `./make_prediction.sh` to make a prediction.
3. Run in Kubernetes: `./run_kubernetes.sh`

### Kubernetes Steps

- Setup and Configure Docker locally
  - Install docker by following the steps provided [here](https://docs.docker.com/engine/install/ubuntu/)
  - Run `docker ps` to check if docker containers are running.
- Setup and Configure Kubernetes locally
      - Install minikube `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`
      - Next,`sudo install minikube-linux-amd64 /usr/local/bin/minikube`
      - Run `minikube start`. _PS: Setup might take a while, so don't fret!_
      - Run `kubectl get pods` and/or `kubectl get deploy` to check active pods and deployments
      -  Run `./run_kubernetes.sh` to crete kubernetes deployment
      - Run `./make_prediction.sh` to make prediction.
      - Copy Log info to `output_txt_files/kubernetes_out.txt`.
  `
- Create Flask app in Container

  - Run `./run_docker.sh`
  - Next, run `./make_prediction.sh` in a separate terminal to make a prediction
  - run `./upload_docker.sh` to upload to remote repository. (Default is Dockerhub but you can modify to suit your preference eg. eks, gcr)

- Run via kubectl
  - Run `./run_kubernetes.sh'
  - Next, run `./make_prediction.sh` in a separate terminal to make a prediction.
