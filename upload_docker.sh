#Step 1
#Create dockerpath
dockerpath=wolusiter1990/udacity_capstone

#Step 2
#Authentication and tag
echo "Docker ID and Image: $dockerpath"
export DOCKER_ID_USER="wolusiter1990"
docker login
docker tag wolusiter1990/udacity_capstone $DOCKER_ID_USER/udacity_capstone

#Step 3
# push image to a docker repository
docker push $DOCKER_ID_USER/udacity_capstone
