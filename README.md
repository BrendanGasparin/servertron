# Project: SERVERTRON

![Project SERVERTRON cover image](./images/servertron-github-cover.png)

## 1. Overview

Project: SERVERTRON is a single-node Proxmox-based server infrastructure project designed to replicate production-style systems within a home environment.  

The project focuses on:
- running real workloads (web, media, and game services)
- applying modern DevOps practices
- documenting the full lifecycle of design, deployment, and operation

## 2. Goals

- Demonstrate practical DevOps workflows across a full system lifecycle
- Host real-world workloads (web, media, and game services)
- Built a production-style infrastructure within a single-node constraint
- Maintain comprehensive public documentation of all decisions and implementation

## 3. Scope

The following is **in scope** for the project:

- Functional and responsive web hosting
- Internet-facing game server (initially Minecraft)
- Home media server
- Deliverables for each phase (code-as-infrastructure, documentation)
- Cloudflare configuration

The following are **out of scope** of the first iteration of the project lifecycle:

- Game servers beyond the initial Minecraft server
- Full cloud infrastructure (beyond DNS and edge services)

## 4. Architecture Summary

Project: SERVERTRON is built on a single-node virtualised infrastructure running on a single mini-PC (SERVERTRON-1), using Proxmox as a hypervisor.  

The system is structured into two environments:  

- **Production Environment:** Hosts stable, persistent, Internet-facing and complex services requiring strong isolation.  
- **Lab Environment:** Used for development, experimentation, testing, and learning, with a focus on container orchestration and emerging technologies.  

Workloads are distributed according to the following principles:  

- **Virtual Machines (VMs)** are used for Internet-facing services, and complex services requiring strong isolation.  
- **Linux Containers (LXCs)** are used for lightweight internal utilities and supporting services.
- **Containerised Applications** are deployed within dedicated VMs using Docker and Docker Compose.

The architecture includes dedicated roles for networking, application hosting, data services, and observability. Monitoring and logging are implemented to monitor system performance and health.  

A Kubernetes environment (K3s) is maintained within the lab environment, separated from the production environment. This is for experimentation and learning purposes.

This architecture is designed to simulate real-world infrastructure within the constraints of a single-node system. It focuses on separation of concerns, scalability of design, and alignment with modern DevOps practices.  

For detailed architecture diagrams and specifications, see [architecture.md](./docs/architecture.md) in the `/docs` directory.  

## 5. DevOps Lifecycle

Project: SERVERTRON follows a structured DevOps lifecycle to guide the design, implementation, and operation of its infrastructure. Each stage represents a distinct phase in the continuous delivery of systems and services.  

The lifecycle consists of the following stages:  

1. [PLAN:](./phases/01-plan/README.md) Define objectives, architecture, and constraints. Establish documentation, system design, and project scope.  
2. **CODE:** Develop configuration files, scripts, and infrastructure definitions. This includes version controlled assets and Infrastructure as Code where applicable.  
3. **BUILD:** Provision infrastructure and construct system components, including virtual machines, containers, and supporting services.  
4. **TEST:** Validate system functionality, networking, and service behaviour within controlled environments prior to release.  
5. **RELEASE:** Approve stable builds and define versioned milestones for deployment.
6. **DEPLOY:** Deploy approved configurations and services into the target environment.
7. **OPERATE:** Run an maintain live systems, ensuring availability, reliability, and performance of deployed services.
8. **MONITOR:** Observe system health and performance using monitoring and logging tools, providing feedback for continuous improvement.

This is an iterative cycle, with the feedback from the monitoring phase informing the planning of the next iteration. This enables continuous refinement of the system while maintaining alignment with DevOps principles and real-world operational practices.  

## 6. Repository Structure

Decisions made during the project are logged in the [decisions.md](./docs/decisions.md) file.

## 7. Technology Stack

- **Infrastructure:** A single-node homelab running on an Intel NUC 13 Pro mini-PC.
- **Virtualisation:** Proxmox will be used as a hypervisor.
- **Operating systems:** 
- **Containerisation:** Docker will be used to run containers.
- **Orchestration:** Kubernetes/K3s is used in the lab environment for learning and experimentation, but not in the production environment.
- **Networking:** (Reverse proxy. DNS handled by ???. Networking model.)
- **Data & Storage:** Database systems have yet to be defined. MariaDB will be used for WordPress sites. SERVERTRON-1 has a 2 TB NVMe drive for Proxmox, virtual machines, and containers. A 5 TB external drive is used for storing the media library.
- **Monitoring & Observability:** Prometheus, Grafana, and logging tools will be used for monitoring and observability.
- **Version Control & DevOps:** GitHub will be used to store the project repository. (CI/CD tools? GitOps tools (e.g. ArgoCD)?)

## 8. Environments

The scope of the project involves two environments: a production environment and a lab environment.  

- The **production environment** is for hosting services such as web, media, and game servers.  
- The **lab environment** is used for learning, development, and experimentation.

## 9. Getting Started

## 10. Roadmap

## 11. Documentation

## 12. Contributing

## 13. License