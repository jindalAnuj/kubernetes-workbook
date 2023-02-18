### Setup docker.
if you are on mac then you can use homebrew
```
brew install --cask docker
```
this will install docker desktop
go to docker desktop and then start the server.

### Setup minikube.

``` 
brew install minikube
```

You will have docker, kubectl and minikube installed till now.

### start a cluster.

```
kubectl start --driver=docker
```


### Creating deployment configuration.

**Create base64 value**

- echo -n admin | base64 # YWRtaW4=
- echo -n password | base64 # cGFzc3dvcmQ=

**Create secrets**
```
kubectl apply -f secrets.yml
```
**Verify created secrets** 
```
kubectl get secret mongodb-secrets -o jsonpath='{.data}'
```

**Create mongodb deployment**
```
kubectl apply -f deployments/mongo.yml
```
**Verify kubernetes deployment**
```bash
kubectl get deployment
kubectl get pods 
```
**Verify kubernetes pods**
```
kubectl get pods 
```

**Adding service and reapply**
```bash
kubectl apply -f deployments/mongo.yml
# output
# deployment.apps/mongodb-deployment unchanged
# service/mongodb-service created
```

**Verify services**

```
kubctl get services
```

**Create ConfigMap**
```
kubectl apply -f configMap.yml
```
**Verify configMaps**
```
kubectl describe configmaps mongodb-configmap
```

**Create Mongo express deployment**
```
kubectl apply -f deployments/mongo-express.yml 
```
**Verify Deployment** 
```
kubectl get pod -o wide
```

### watch pods every 5 sec (Monitor pods every 5 sec)
watch -n5 kubectl get pods -o wide 

**Add service then again***
```
kubectl apply -f deployments/mongo-express.yml 
```
**Verify services**
```
kubectl get services
```

**finally check the deployment**
``` 
minikube service mongo-express-service
```

<img width="1268" alt="image" src="https://user-images.githubusercontent.com/31108317/219877593-b6d5a60f-477a-4771-9e33-9399ab594bcd.png">



*TODO:* configuring a ingress ( ingress allow us to access the service without port.)


### setting up active namespace.

- install kubectx
```
brew install kubectx
```

- list all namespace names
```
kubens
```

**Activate a namespace**
```
kubens <namespace-name>
```

### Entering a pod
```
kubectl exec -it <pod-name> -- /bin/sh
```

minikube addons enable ingress, we can install any of them

### TODO:
- Add ingress
- Add Storage class and persistent volume claims
- Add local storage
- Add Monitoring 
