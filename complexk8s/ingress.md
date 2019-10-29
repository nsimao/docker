# Setting up Ingress with Docker Desktop's Kubernetes

This note is only for students that are using Docker Desktop's built-in Kubernetes. If you are using Minikube, this section does not apply to and can be skipped.

In the previous lecture we learned how to setup and enable Ingress for Minikube. If you are using Docker Desktop's Kubernetes, the second step to enable the service is a little different.

1. Make sure you executed the mandatory generic script that was discussed in the lecture:

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml`
 
2. Execute the provider specific script to enable the service:

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud-generic.yaml`
 
The official docs are not very clear about this but the script applies to both Windows and Mac versions of Docker Desktop, even though it only lists Docker for Mac. If you have missed this step, then your Ingress will not work!

3. Verify the service was enabled by running the following:

`kubectl get svc -n ingress-nginx`