docker build -t zukowskimichal/multi-client:latest -t zukowskimichal/multi-client:$SHA -f ./complex/client/Dockerfile ./complex/client
docker build -t zukowskimichal/multi-server:latest -t zukowskimichal/multi-server:$SHA -f ./complex/server/Dockerfile ./complex/server
docker build -t zukowskimichal/multi-worker:latest -t zukowskimichal/multi-worker:$SHA -f ./complex/worker/Dockerfile ./complex/worker

docker push zukowskimichal/multi-client:latest
docker push zukowskimichal/multi-worker:latest
docker push zukowskimichal/multi-server:latest

docker push zukowskimichal/multi-client:$SHA
docker push zukowskimichal/multi-worker:$SHA
docker push zukowskimichal/multi-server:$SHA


kubectl apply -f ./complex/k8s
kubectl set image deployments/server-deployment server=zukowskimichal/multi-server:$SHA
kubectl set image deployments/client-deployment client=zukowskimichal/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=zukowskimichal/multi-worker:$SHA
