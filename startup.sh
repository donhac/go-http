#!/bin/bash
cd `dirname $0`

img_output="donh/go-http"

docker build -t donh/go-build .

docker run -it -v $PWD/data/go:/data/go \
 --rm donh/go-build /bin/bash \
 -c 'cd /data/go/ && CGO_ENABLED=0 GOOS=linux go build main.go' 

cd $PWD/data/go

# 删除旧容器和镜像
docker rm -f go-http &> /dev/null
docker rmi $img_output

# 构建最终需要运行的镜像
docker build --rm --no-cache -t $img_output .

# 运行
docker run -d -p 9013:8080 --name go-http $img_output
