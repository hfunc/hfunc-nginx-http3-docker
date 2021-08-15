#!/bin/bash

target=$1

if [ "$target" == "" ]; then
  echo "you can ./build.sh [all,env,nginx]"
  exit 1
fi

buildEnv(){
  docker buildx build -f Dockerfile.build -t hfunc/nginx-http3-build:latest .
  docker push hfunc/nginx-http3-build:latest
}

buildNginx(){
  docker buildx build -f Dockerfile -t hfunc/nginx-http3:latest .
  docker push hfunc/nginx-http3:latest
}

buildOff(){
  docker buildx build -f Dockerfile.off -t hfunc/nginx-http3:off .
  docker push hfunc/nginx-http3:latest
}

if [ "$target" == "all" ]; then
  echo "build all"
  buildEnv
  buildNginx
  buildOff
fi

if [ "$target" == "env" ]; then
  echo "build env"
  buildEnv
fi

if [ "$target" == "latest" ]; then
  echo "build latest"
  buildNginx
fi

if [ "$target" == "off" ]; then
  echo "build official"
  buildOff
fi
