minikube start

kubectl apply -f secrets.yml
kubectl apply -f configMap.yml

kubectl apply -f mongo.yml

kubectl apply -f mongo-express.yml

minikube service mongo-express-service

