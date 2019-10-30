docker build -t nsimao/multi-client:latest -t nsimao/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t nsimao/multi-server:latest -t nsimao/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t nsimao/multi-worker:latest -t nsimao/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push nsimao/multi-client:latest
docker push nsimao/multi-server:latest
docker push nsimao/multi-worker:latest

docker push nsimao/multi-client:$SHA
docker push nsimao/multi-server:$SHA
docker push nsimao/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=nsimao/multi-server:$SHA
kubectl set image deployments/client-deployment client=nsimao/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=nsimao/multi-worker:$SHA