docker build -t drnickit/multi-client:latest -t drnickit/multi-client:$GIT_SHA -f ./client/profiles/prod/Dockerfile ./client
docker build -t drnickit/multi-server:latest -t drnickit/multi-server:$GIT_SHA -f ./server/profiles/prod/Dockerfile ./server
docker build -t drnickit/multi-worker:latest -t drnickit/multi-worker:$GIT_SHA -f ./worker/profiles/prod/Dockerfile ./worker
docker push drnickit/multi-client:latest
docker push drnickit/multi-server:latest
docker push drnickit/multi-worker:latest

docker push drnickit/multi-client:$GIT_SHA
docker push drnickit/multi-server:$GIT_SHA
docker push drnickit/multi-worker:$GIT_SHA

# kubectl commands (for in google cloud)
#kubectl apply -f k8s
#kubectl set image deployments/client-deployment server=drnickit/multi-client$GIT_SHA
#kubectl set image deployments/server-deployment server=drnickit/multi-server$GIT_SHA
#kubectl set image deployments/worker-deployment server=drnickit/multi-worker$GIT_SHA
