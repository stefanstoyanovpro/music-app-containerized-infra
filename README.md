🎵 Music App – Containerized Infrastructure & CI/CD (Learning Project)

This is a small DevOps learning project I built to understand how all the tools actually work together in real life.
The app itself is super simple (just a tiny PHP page), but the infrastructure around it is what I focused on.
I basically wanted to take a basic app and make it run like a “real” production service using containers, Kubernetes, GitHub Actions, etc.
It’s not perfect, but it works — and I learned a lot while doing it.

🧱 What I Used / Learned
Docker (building images, pushing to Docker Hub)
Docker Compose (local multi-container setup)
Kubernetes with k3s on a Debian VM
NGINX Ingress Controller
Secrets, ConfigMaps, Deployments, Services
GitHub Actions self-hosted runner (this was the hardest part)
CI/CD that automatically deploys the app to k3s on every push

📁 Project Structure
app/
  public/
    index.php         -> the tiny PHP app

infra/
  docker-compose.yml  -> local dev
  web.Dockerfile       -> builds the app image

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

actions-runner/        -> self-hosted GitHub runner (not used by users)

🐳 Running Locally (Docker Compose)
From inside infra/:
docker compose up -d
Then open:
http://localhost:8080
It’s literally just a “hello world” style PHP page.

☸️ Running on Kubernetes (k3s)
I installed k3s on my Debian VM:
curl -sfL https://get.k3s.io | sh -
Then I applied all the Kubernetes manifests:
kubectl apply -f infra/k8s/namespace.yaml
kubectl apply -f infra/k8s/secret.yaml
kubectl apply -f infra/k8s/configmap.yaml
kubectl apply -f infra/k8s/pvc-db.yaml
kubectl apply -f infra/k2s/deployment-db.yaml
kubectl apply -f infra/k8s/service-db.yaml
kubectl apply -f infra/k8s/deployment-web.yaml
kubectl apply -f infra/k8s/service-web.yaml
kubectl apply -f infra/k8s/ingress.yaml
On my Mac, I added this in /etc/hosts so I could reach the VM:
192.168.64.9 music.local
Now the app runs at:
http://music.local

🚀 CI/CD Pipeline (GitHub Actions + Self-Hosted Runner)
This was the biggest thing I learned in this project.
Instead of SSH-ing into my VM (which wouldn't work because it's local),
I installed a self-hosted runner inside the VM.
So whenever I do:
git push
GitHub Actions runs directly inside the VM:
Builds the Docker image
Pushes it to Docker Hub
Pulls it back on the VM
Updates the Kubernetes Deployment
Restarts the pods
App is redeployed automatically
The workflow lives in:
.github/workflows/deploy.yml
And the runner lives inside:
actions-runner/
That part was really tricky, but once it was running, it felt super cool.

🐳 Docker Hub Image
The Docker image gets pushed here automatically:
docker.io/stefanstoyanovpro/music-web:latest

🧠 What I Want to Add Later
Proper health checks
A real backend API
Prometheus + Grafana monitoring
Helm charts instead of plain YAML
Blue/green deployments
Logging with Loki
Maybe switch from PHP to something else

📌 Why I Built This
Mostly to learn:
how Kubernetes actually works (not just theory)
how to deploy something end-to-end
how to set up a real CI/CD pipeline
how Docker images move between systems
what “self-hosted runner” means in practice
It’s a small project but it taught me a lot.

🙌 Thanks for checking it out
