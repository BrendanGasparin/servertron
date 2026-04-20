# Project: SERVERTRON Initial Architecture Notes

## Internet/Users

The Internet and users of the web server, media server, game server, and other Internet-facing apps.  

## Cloudflare

## SERVERTRON-1

Project: SERVERTRON will be implemented on a single-node mini-PC system (SERVERTRON-1). Proxmox will be installed on bare metal to provide a type 1 hypervisor for running virtual machines (VMs) and Linux containers (LXCs).  

SERVERTRON-1 is an Intel NUC 13 Pro Arena Canyon mini-PC with 13th Gen Core 17-1360P (12 cores/16 threads and up to 5.0GHz), 64 GB DDR4 RAM, 2 TB NVMe drive, WiFi6E, BT5.3, 2 x  

## Proxmov VE Host Layer

## Virtual Machines / LXC Containers

A layer of virtual machines and Linux containers each containing isolated workloads.

### Production Lane

The production lane is for hosting complex services and Internet-facing servers.

#### VM 100 - Edge Gateway
- Reverse proxy
- TLS termination
- Entry point for external traffic

#### VM 110 - Apps Platform
- Runs Docker / Docker Compose
- Hosts application services (web, APIs, etc.)

#### VM 120 - Data Services
- Databases (PostgreSQL and MariaDB?)
- Persistent data layer

#### VM 130 - Media Server (Plex? Jellyfin?)

#### VM 140 - Game Server (Minecraft)

#### LXC 200 - Monitoring
- Prometheus?
- Grafana?

#### LXC 210 - Utility Services
- Supporting tools
- Internal helpers

### Lab Lane

#### VM 300 - K3s Lab
- Kubernetes (K3s)
- Development and experimentation environment only
