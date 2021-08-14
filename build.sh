docker buildx build -f Dockerfile.build -t hfunc/nginx-http3-build:latest .
docker push hfunc/nginx-http3-build:latest

docker buildx build -f Dockerfile -t hfunc/nginx-http3:latest .
docker push hfunc/nginx-http3:latest
