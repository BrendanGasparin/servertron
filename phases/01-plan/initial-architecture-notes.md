# Project: SERVERTRON Initial Architecture Notes

Initial notes on architecture for the planning phase of the first iteration of Project: SERVERTRON.  

![Project: SERVERTRON Architecture Diagram](../../images/servertron-architecture.png)
*Project: SERVERTRON Architecture Diagram*

## Internet/Users

External users and systems accessing the web server, media server, game server, and other Internet-facing apps.  

## Cloudflare

Cloudflare is used as the external edge layer for:

- DNS management
- TLS termination (for proxied services only)
- Web Application Firewall (WAF)
- DDoS protection

High-bandiwdth and non-HTTP services (e.g. Jellyfin and Minecraft) bypass Cloudflare proxying and connect directly to Internet clients.  

## SERVERTRON-1

Project: SERVERTRON will be implemented on a single-node mini-PC system (SERVERTRON-1).  

Proxmox will be installed on bare metal to provide a type 1 hypervisor for running virtual machines (VMs) and Linux containers (LXCs).  

### Hardware Specifications

- CPU: Intel Core i7-1360P (12 cores / 16 threads, up to 5.0 GHz)
- RAM: 64 GB DDR4
- Storage: 2 TB NVMe (internal)
- External Storage: 5 TB drive (media storage)

## Storage (ZFS)

ZFS is used for the file system as it provides:

- data integrity (checksumming)
- snapshots
- copy-on-write behaviour
- alignment with production-style infrastructure

## Proxmox VE Host Layer

### Resource Reservations

**CPU:** Leave at least 2 threads uncommitted for host.  
**RAM:** Reserve 8 GB for host before planning guests.  
**ZFS ARC:** Allocate ~6GB (tune if required)

### Storage Allocation

- 100 GB for Proxmox, packages, and logs
- 100 GB for ISOs, templates, backups/snippets/misc
- 200 GB for ZFS/snapshots/free-space

## Virtual Machines / LXC Containers

A layer of virtual machines and Linux containers providing isolated workloads, running on Proxmox.  

### Production Lane

The production lane hosts stable, persisent services intended for operational use.  

#### VM 100 edge-gateway (Edge Gateway)

**vCPU:** 2  
**RAM:** 2 GB  
**Storage:** 32 GB  

Role:  

- Reverse proxy
- TLS termination
- Entry point for external traffic

#### VM 110 apps-platform (Apps Platform)

Role:  

**vCPU:** 4  
**RAM:** 6 GB  
**Storage:** 200 GB  

- Runs Docker / Docker Compose
- Hosts application services (web, APIs, etc.)

#### VM 120 data-services (Data Services)

**vCPU:** 4  
**RAM:** 6 GB  
**Storage:** 400 GB  

- Databases (PostgreSQL, MariaDB)
- Cache (Redis)
- Persistent data layer

#### VM 130 media-server (Media Server)

**vCPU:** 2  
**RAM:** 4 GB  
**Storage:** 100 GB  

- Media server platform (Jellyfin)
- Metadata management and indexing
- External media storage

#### VM 140 games-minecraft (Minecraft Game Server)

**vCPU:** 4  
**RAM:** 10 GB  
**Storage:** 120 GB

- Dedicated Minecraft server
- Persistent game world and server data
- Multiplayer game hosting
- Proof of concept for future persistent game worlds

#### LXC 200 monitoring (Monitoring)

**vCPU:** 2  
**RAM:** 3 GB  
**Storage:** 40 GB

- Prometheus
- Loki
- Grafana

#### LXC 210 utility (Utility Services)

**vCPU:** 1  
**RAM:** 1 GB  
**Storage:** 20 GB  

- Supporting tools
- Internal services

### Lab Lane

#### VM 300 k3s-lab (Kubernetes Lab)

**vCPU:** 4  
**RAM:** 6 GB  
**Storage:** 100 GB

- Kubernetes (K3s)
- Development and experimentation environment only

## Resource Allocation Summary

**Total Available:**  

-16 threads
    - 64 GB RAM

**Assigned:**  

- **vCPUs:** 23 (intentional overcommit)
- **RAM:** 52 GB

### Notes

- CPU overcommit is acceptabled for mixed workloads
- RAM allocation is intentionally conservative to preserve host stability, allow ZFS ARC to function effectively, and provide headroom for future tuning
- ZFS ARC size may be adjusted if underallocated
