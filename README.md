🎵 Music App – Containerized Deployment Platform
A minimal PHP service deployed using a fully containerized architecture with Kubernetes (k3s), GitHub Actions, and automated CI/CD.

🔧 Tech & Tools
Docker (image builds, Docker Hub pushes)
Docker Compose for local setup
Kubernetes (k3s) on a Debian VM
NGINX Ingress Controller
Secrets, ConfigMaps, Deployments, Services, PVC
GitHub Actions with a self-hosted runner
Automatic deploys to k3s on each push

📁 Structure
app/ – small PHP page
infra/ – Dockerfile, docker-compose, Kubernetes manifests
actions-runner/ – self-hosted GitHub runner config

🐳 Local Usage
docker compose up -d
App runs at: http://localhost:8080

☸️ Kubernetes Setup
Installed k3s on Debian
Applied all manifests from infra/k8s/
Added local DNS entry (e.g., music.local)
App accessible through NGINX Ingress

🚀 CI/CD Workflow
GitHub Actions runs directly on the VM
Builds image → pushes to Docker Hub → updates Kubernetes Deployment → rolls out new pods automatically

📌 What I Want to Add
Health/readiness probes
Proper backend API
Monitoring (Prometheus + Grafana)
Helm charts
Blue/green or canary deployments
Centralized logging (Loki)
