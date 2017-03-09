APP_NAME=web-file-server

RUN_FLAG="-d --restart=always"
if [ "$1" == "debug" ]; then
    RUN_FLAG="--rm"
fi

echo "Building $APP_NAME image"
docker build -t $APP_NAME .

echo "Removing $APP_NAME container if it exists"
docker rm -f $APP_NAME

echo "Running $APP_NAME container"
docker run $RUN_FLAG --name $APP_NAME \
    -p 80:80 \
    -p 443:443 \
    -v $(pwd)/www:/www \
    $APP_NAME