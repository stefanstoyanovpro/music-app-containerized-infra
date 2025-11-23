<<<<<<< HEAD
# Music Streaming DevOps Project

This project is part of my DevOps learning journey.  
The goal was to take a simple PHP/Apache app and learn how to run it using:

- Docker
- Docker Compose
- Kubernetes (k3s)
- Docker Hub
- NGINX Ingress
- Basic Infrastructure-as-Code structure

The app itself is very simple. The main focus is the infrastructure and deployment process.

---

## Project Structure

app/
public/
index.php
infra/
docker-compose.yml
web.Dockerfile
k8s/
namespace.yaml
secret.yaml
configmap.yaml
pvc-db.yaml
deployment-db.yaml
service-db.yaml
deployment-web.yaml
service-web.yaml
ingress.yaml

---

## Running with Docker Compose

From `infra/`:

docker compose up -d

The web app runs on port 8080 of the VM.

---

## Running on Kubernetes (k3s)

I installed k3s on my Debian VM and applied the Kubernetes manifests in this order:

kubectl apply -f infra/k8s/namespace.yaml
kubectl apply -f infra/k8s/secret.yaml
kubectl apply -f infra/k8s/configmap.yaml
kubectl apply -f infra/k8s/pvc-db.yaml
kubectl apply -f infra/k8s/deployment-db.yaml
kubectl apply -f infra/k8s/service-db.yaml
kubectl apply -f infra/k8s/deployment-web.yaml
kubectl apply -f infra/k8s/service-web.yaml
kubectl apply -f infra/k8s/ingress.yaml

I also installed the NGINX Ingress Controller.

On my Mac, I added this to `/etc/hosts`

192.168.64.9 music.local

The app becomes accessible at:

http://music.local

---

## Docker Hub Image

The web app image is stored here:

`docker.io/stefanstoyanovpro/music-web:latest`

---

This is a learning project, so it will evolve as I experiment with more DevOps tools.
=======
# music-app-containerized-infra
