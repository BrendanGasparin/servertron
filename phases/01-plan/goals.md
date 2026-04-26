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

---

- Learn to competently use Proxmox, Docker, and DevOps tools
- Implement a production environment for workloads such as a web server, media server, and Minecraft game server.
- Implement a lab environment for software development, testing, learning, and experimentation. Implement Kubernetes (K3s) in the lab environment for learning purposes.
- Implement a backup strategy that preserves important data regularly, with appropriate levels of redundancy and one off-site backup.
- Document every stage of the project through GitHub and YouTube.
