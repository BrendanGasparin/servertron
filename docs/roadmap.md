# Project: SERVERTRON Roadmap

## 1. Executive Summary

SERVERTRON is a DevOps homelab and production-style infrastructure for hosting websites, media, game services, and other future services.

The goal is to mirror real-world enterprise infrastructure as closely as possible (without adding unnecessary costs, complexity, or  other major drawbacks) for learning purposes.  

This roadmap outlines the phased development of the SERVERTRON infrastructure from planning through to coding, testing, deployment, operations, and monitoring. The DevOps lifecycle is outlined in section 4.  

## 2. Guiding Principles

The guiding principles of Project: SERVERTRON are as follows:  

- To build production-style architecture
- To prioritise learning and real-world relevance
- Keep services isolated with a VM-first approach
- Prefer open source tools due to transparency and quality
- Document everything publicly

## 3. Current State

[Planning stage](../phases/01-plan/README.md).  

## 4. DevOps Lifecycle Roadmap

The DevOps lifecycle is an iterative loop, divided into both (software) development and operations, and consists of four phases.  

![Diagram of the DevOps lifecycle.](../images/devops-lifecycle.png)

### Phase 1: PLAN

**Goal:** Define all major architecture and tooling decisions.  

**Deliverables:**  

- Architecture document and diagram
- VM allocation plan
- Tooling evaluation document
- Network design
- Security model (Cloudflare, exposure strategy)

### Phase 2: CODE

**Goal:** Define instrastructure as code (or code-adjacent configurations).  

**Tasks:**  

- Create repository structure
- Create Docker Compose files
- Define cloud-init templates
- Version control all configs

**Output:**

- Github repo becomes **source of truth**

### Phase 3: BUILD

**Goal:** Provision infrastructure  

**Tasks:**  

- Install and configure Proxmox
- Create Ubuntu Server VM template
- Configure networking (vmbr0, static IPs)
- Create VMs:
    - VM 100: Edge Gateway (NGINX)
    - VM 110: Apps Platform (Docker)
    - VM 120: Data Services (PostgreSQL, MariaDB, Redis)
    - VM 130: Media Server (Jellyfin)
    - VM 140: Game Server (Minecraft)
    - VM 300: K3s Lab
- Configure storage and backups

### Phase 4: TEST

**Goal:** Validate system functionality

**Tasks:**  

- Test internal networking
- Validate NGINX routing
- Test HTTPS (Let's Encrypt)
- Validate Docker Compose stacks
- Test database connections
- Verify Jellyfin and Minecraft access
- Basic performance checks

### Phase 5: RELEASE

**Goal:** Prepare stable configurations for deployment  

**Tasks:**  

- Finalise configurations (NGINX, Docker, firewall)
- Tag versions in GitHub
- Document setup procedures
- Create rollback strategy
- Ensure reproducibility

### Phase 6: DEPLOY

**Goal:** Expose service externally

**Tasks:**

- Configure Cloudflare DNS
- Set proxy vs DNS-only:
    - Web: proxied
    - Jellyfin and Minecraft: DNS only
- Configure router port forwarding
- Enable HTTPS for all web services
- Harden firewall (UFW)
- Secure SSH

### Phase 7: OPERATE

**Goal:** Run and maintain services

**Tasks:**  

- Deploy real applications
- Maintain Jellyfin and Minecraft servers
- Manage updates and patching
- Implement backup routines
- Monitor uptime manually (initially)

### Phase 8: MONITOR

**Goal:** Full observability  

**Tasks:**  

- Deploy the monitoring stack (LXC 200)
    - Prometheus
    - Loki
    - Grafana
- Create dashboards (VMs, Docker, network)
- Configure alerting
- Centralise logs

## 5. Milestones

| Milestone | Decription                | Status ✅/⏳  |
|-----------|---------------------------|----------------|
| M1        | Architecture defined      | ⏳            |
| M2        | Core VMs deployed         | ⏳            |
| M3        | First public service live | ⏳            | 
| M4        | Monitoring operational    | ⏳            |
| M5        | Kubernetes lab active     | ⏳            |

## 6. Future Enhancements

- Multinode cluster (Proxmox or Kubernetes) with high availability setup
- VLAN segementation
- VPN access (e.g. Wireguard, Tailscale)
- NextCloud integration (for cloud storage and apps)
- CDN/edge optimisation
- CI/CD pipelines
- GitOps (ArgoCD)
- Advanced security hardening

## 7. Notes

This roadmap is iterative and will evolve in the future.  

The focus of this project is on both learning and real world applicability, while also self-hosting services I want.  

Phases may overlap in practice.  

Not all features may be implemented immediately.  
