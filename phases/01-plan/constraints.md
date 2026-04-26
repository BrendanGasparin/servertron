# Project: SERVERTRON Constraints and Assumptions

The following constraints and assumptions define the operating boundaries of Project: SERVERTON:

## 1. Hardware Constraints

- The host machine, SERVERTRON-1, is pre-existing infrastructure
- Further expenditure on the project will be minimal and limited to necessary hardware due to failure.
- SERVERTRON-1 is a single-node environment with the following limits:
    - 16 logical cores
    - 64 GB RAM
    - 2 TB NVMe internal storage.

## 2. Architecture Constraints

- The environment is limited to a **single-node deployment** with no high availability or clustering
- Workloads must be isolated by function, including:
    - production services
    - developmental, experimental, and testing environments
- Virtual machines are preferred for service isolation; containers are used for dedicated application environments

## 3. Networking and Exposure Constraints

- Internet-facing services must be:
    - secured (TLS, firewalling, access control)
    - reliably accessible within the limits of a residential connection
- Cloudflare is used for DNS and selective proxying
- High-bandwidth and non-HTTP services (e.g. Minecraft server and Jellyfin server) bypass Cloudflare proxying and connect directly to the client

## 4. Platform Assumptions

- The system is built using Proxmox as the primary hypervisor
- Ubuntu Server is used as the standard operating system for all virtual machines
- Docker is used for application deployment within the applications platform VM
- Kubernetes is not used in the production environment due to its complexity and typical multi-mode design
- Kubernetes is used only within the lab environment for learning and experimentation

## 5. Operational Assumptions

- The system operates in a homelab environment, not a data centre
- Power redundancy (e.g. UPS) is not currently implemented
- Availability is **best effort**, not an enterprise-grade SLA
- Backups are configured to mitigate risk from:
    - hardware failure
    - data corruption
    - configuration errors
