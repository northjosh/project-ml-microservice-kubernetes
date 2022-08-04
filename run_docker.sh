# !/usr/bin/env bash

# Step 1:
# Build image and add a descriptive tag
docker build --tag=northjosh/prediction:v1.0.0 .


# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
docker run -p 8000:80 northjosh/prediction:v1.0.0 
