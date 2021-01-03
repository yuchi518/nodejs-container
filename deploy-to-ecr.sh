# Deploy docker image to ECR(Amazon Elastic Container Registry)

AWS_ID=751773497260
REGION=us-west-2
REPO_NAME=nodejs-container-test
ECR_URL="$AWS_ID.dkr.ecr.$REGION.amazonaws.com"
ECR_REPO_URL="$AWS_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME"
TAG_NAME=latest

aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin $ECR_URL
docker build -t $REPO_NAME .
docker tag "$REPO_NAME:$TAG_NAME" "$ECR_REPO_URL:$TAG_NAME"
docker push "$ECR_REPO_URL:$TAG_NAME"
