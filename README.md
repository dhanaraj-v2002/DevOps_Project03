# 🚀 DevOps Application Deployment Project

## 📌 Project Overview

This project demonstrates a complete **DevOps CI/CD pipeline** to deploy a React-based application using:

* AWS EC2
* Docker & Docker Hub
* Jenkins (CI/CD)
* Prometheus (Monitoring)
* Grafana (Visualization)
* Alertmanager (Notifications)

---

## 🏗️ Architecture

```
GitHub → Jenkins → Docker Build → Docker Hub
       → EC2 Deployment → Prometheus → Grafana → Alerts
```

---

## 📂 Repository Structure

```
.
├── Dockerfile
├── docker-compose.yml
├── build.sh
├── deploy.sh
├── .gitignore
└── .dockerignore
```

---

## ⚙️ Setup Instructions

### 1️⃣ Clone Repository

```bash
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
```

---

## 🐳 Docker Setup

### Build Image

```bash
docker build -t devops-app .
```

### Run Container

```bash
docker run -d -p 80:80 devops-app
```

---

## 📦 Docker Hub

Two repositories are used:

| Environment | Repository   |
| ----------- | ------------ |
| Dev         | Public repo  |
| Prod        | Private repo |

### Push Image

```bash
docker tag devops-app <docker-username>/devops-app-dev
docker push <docker-username>/devops-app-dev
```

---

## 🔄 CI/CD with Jenkins

### Pipeline Stages

* Clean Workspace
* Clone Code
* Detect Branch (dev / main)
* Build Docker Image
* Login to Docker Hub
* Push to Dev / Prod Repo

### Trigger

* GitHub Webhook → Auto build on push

---

## ☁️ AWS Deployment

* EC2 Instance (t2.micro)
* Security Group:

  * Port 80 → Public access
  * Port 22 → Restricted (your IP)
  * Port 9090 → Prometheus
  * Port 3000 → Grafana

### Run Application

```bash
docker run -d -p 80:80 <docker-username>/devops-app-dev
```

---

## 📊 Monitoring (Prometheus)

### Run Node Exporter

```bash
docker run -d -p 9100:9100 prom/node-exporter
```

### Run Prometheus

```bash
docker run -d -p 9090:9090 \
-v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml \
prom/prometheus
```

### Access

```
http://<EC2-IP>:9090
```

---

## 📈 Visualization (Grafana)

### Run Grafana

```bash
docker run -d -p 3000:3000 grafana/grafana
```

### Access

```
http://<EC2-IP>:3000
```

### Default Login

* Username: admin
* Password: admin

### Add Data Source

* Type: Prometheus
* URL: http://<EC2-PUBLIC-IP>:9090

### Import Dashboard

* Dashboard ID: **1860 (Node Exporter Full)**

---

## 🚨 Alerting (Alertmanager)

### Alert Rule Example

```yaml
- alert: AppDown
  expr: up{job="app"} == 0
  for: 30s
```

### Run Alertmanager

```bash
docker run -d -p 9093:9093 prom/alertmanager
```

---

## 📸 Screenshots (Submission)

* Jenkins Pipeline Success
* GitHub Repository
* Docker Hub Repositories
* EC2 Security Group
* Running Application (Browser)
* Prometheus Targets (UP)
* Grafana Dashboard
* Alert Notification

---

## 🌐 Application URL

```
http://<EC2-PUBLIC-IP>
```

---

## 🧠 Key Learnings

* CI/CD automation using Jenkins
* Containerization with Docker
* Image management with Docker Hub
* Cloud deployment on AWS EC2
* Monitoring using Prometheus
* Visualization using Grafana
* Alerting system integration

---

## 🎯 Conclusion

This project successfully demonstrates a **production-ready DevOps pipeline** including:

✔ Automated build & deployment
✔ Environment-based Docker repositories
✔ Real-time monitoring
✔ Alerting system
✔ Visualization dashboard

---

## 👨‍💻 Author

**Dhanaraj**

---

## ⭐ If you like this project, give it a star!

