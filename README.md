# Project: SERVERTRON

## 1. Overview
Project: SERVERTRON is an effort to implement a Proxmox-based server infrastructure using modern DevOps principles.  

SERVERTRON's purpose is to use real world infrastructure to host practical workloads, and to document the learning process as I go.  

## 2. Objectives

- To learn and demonstrate DevOps practices
- Web hosting for personal and business websites
- Entertainment services (a media server and a Minecraft server)
- Thorough documentation

## 3. Scope

The following is **in scope** for the project:

- Functional and responsive web hosting
- Internet-facing game server (initially Minecraft)
- Home media server
- Deliverables for each phase (code-as-infrastructure, documentation)
- Cloudflare configuration

The following is **not in the scope** of the project:

- Game servers beyond the initial Minecraft server
- Cloud infrastructure (beyond Cloudflare configuration)

## 4. Architecture Summary

Project: SERVERTRON is built on a single-node virtualised infrastructure running on a single mini-PC (SERVERTRON-1), using Proxmox as a hypervisor.  

The system is structured into two environments:  

- **Production Environment:** Hosts stable, persistent, Internet-facing and complex services requiring strong isolation.  
- **Lab Environment:** Used for experimentation, testing, and learning, with a focus on container orchestration and emerging technologies.  

Workloads are distributed according to the following principles:  

- **Virtual Machines (VMs)** are used for Internet-facing services, and complex services requiring strong isolation.  
- **Linux Containers (LXCs)** are used for lightweight internal utilities and supporting services.
- **Containerised Applications** are deployed within dedicated VMs using Docker and Docker Compose.

The architecture includes dedicated roles for networking, application hosting, data services, and observability. Monitoring and logging are implemented using industry-standard tooling to provide visibility into system performance and health.  

A separate Kubernetes environment (K3s) is maintained within the lab environment, separated from the production environment. This is for experimentation and learning purposes.

This architecture is designed to simulate real-world infrastructure within the constraints of a single-node system. It maintains clear separation of concerns, scalability of design, and alignment with modern DevOps practices.  

For detailed architecture diagrams and specifications, see the documentation in the `/docs` directory.  

## 5. DevOps Lifecycle

## 6. Repository Structure

## 7. Technology Stack

## 8. Environments

## 9. Getting Started

## 10. Roadmap

## 11. Documentation

## 12. Contributing

## 13. License