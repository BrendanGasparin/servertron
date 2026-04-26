# Project: SERVERTRON Initial Goals

The following are the goals of Project: SERVERTRON:  

## 1. Core Infrastructure

- Install a type 1 hypervisor on a single-node host system (SERVERTRON-1 using )
- Configure ZFS storage on SERVERTRON-1 for virtual machines and container workloads
- Provision and configure virtual machines to support:
    - reverse proxy (NGINX)
    - application hosting (Docker / Compose)
    - data services (PostgreSQL, MariaDB, Redis)
    - media services (Jellyfin)
    - game server (Minecraft)
    - lab environment (K3s)
- Provision and configure Linux containers to support:
    - monitoring (Prometheus, Loki, Grafana)
    - utilities

## 2. Production Environment

- Implement a production-style environment capable of running:
    - web services (HTTPS via NGINX)
    - media server (Jellyfin)
    - Minecraft server
- Expose services securely using Cloudflare where appropriate, using it as a proxy for web services (but as DNS only for high bandwidth services such as Jellyfin and Minecraft).

## 3. Lab Environment

- Implement a dedicated lab environment for development, testing, learning, and experimentation
- Deploy K3s in the lab environment for learning container orchestration concepts

## 4. Data Protection

- Implement a backup strategy that includes:
    - regular automated backups
    - local redundancy where appropriate
    - at least one off-site backup
- Validate backups by performing at least one successful restore for each type of media

## 5. Learning Objectives

Develop practical competency with:

- Proxmox (virtualisation, networking, storage)
- Docker and Docker Compose
- reverse proxy configuration (NGINX)
- basic networking and service exposure
- monitoring and obervability
- infrastructure as code

## 6. Documentation

- Document all stages of the project in a public GitHub repository
- Produce supporting content covering:
    - Architectural decisions
    - Setup process
    - Lessons learned

## 7. Completion Criteria

The initial phase of Project: SERVERTRON is complete when:

- The hypervisor and storage are fully configured
- Core services are deployed and operational
- At least one web service is accessible over HTTPS
- Jellyfin and Minecraft are accessible externally
- Backups are functioning and verified
- Documentation is complete and up to date

