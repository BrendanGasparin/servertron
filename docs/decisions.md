# Project: SERVERTRON Decisions

This document logs all decisions made about Project: SERVERTRON.  

## DEC-001: Use Proxmox as a Hypervisor

- Status: Accepted
- Date: 2026-04-17

### Context

Project: SERVERTRON requires a virtualisation platform to support multiple isolated workloads, including application services, data services, monitoring, and experimental environments. The platform must support both virtual machines and lightweight containers while remaining suitable for a single-node deployment.  

### Decision

Provmox VE will be used as the primary hypervisor for Project: SERVERTRON.  

### Rationale

Proxmox provides support for both virtual machines and Linux containers, allowing flexible workload placement within a unified management interface. It provides a web-based management UI, strong community support, and features such as snapshots, backups, and network configuration. This makes it appropriate for practical operation.  

Compared to alternatives, Proxmox aligns best with the goals of the project. It balances usability and capability with relevance to real-world infrastructure. The system will be able to simulate production-like environments while remaining manageable on a single-node host.  

Using Proxmox also offers a learning opportunity, as I have never used a type 1 hypervisor before.  

### Alternatives considered

- **VMware ESXi:** An industry-standard hypervisor with strong performance and features. Limited functionality on the free tier and less flexibility for container-based workloads.

- **Microsoft Hyper-V:** Integrates well with Windows environment, but less suitable for the Linux-based stack and tooling planned for Project: SERVERTRON.  

- **Bare-metal Linux (no hypervisor):** This is a simpler setup but lacks isolation, flexibility, and the ability to model multi-system architectures. It should be noted that SERVERTRON-1 (the node) was running bare-metal Linux previously to being rebuilt as a Proxmox hypervisor in Project: SERVERTRON.  

### Consequences

- The system will rely on Proxmox-based tooling and workflows for virtualisation management.
- Both VM-based and container-based deployment strategies can be used on the same platform.
- Future expansion to a multi-node cluster is possible (although not in the current project scope).
- Some features available in other hypervisors may be unavailable in Proxmox, or may require additional configuration.

## DEC-002: Separate Production and Lab Environments

- Status: Accepted
- Date: 2026-04-17

### Context

The project requires isolation between production-level services (web server, media server, game server, and supporting services), and experimental environments. This will prevent mistakes made in experimental contexts from affecting production environments.  

### Decision

Separate the lab into two isolated environments: a production environment for continually operating workloads, and a laboratory environment for software development, testing, validation, learning, and experimentation.  

### Rationale

Isolated production and lab environments allow SERVERTRON-1 to support continually operating workloads (e.g. web server, other business functions) in the production environment, while also allowing for software development, testing, and validation in the lab environment.  

The lab environment can be used for development, testing learning, and experimentation without negatively affecting the production environment. This allows me to "break stuff" in the lab environment with confidence that the production environment will continue to function properly.  

This also maintains flexibility for the introduction of other environments (e.g. development or testing environments) after the completion of the project.  

### Alternatives Considered

- **Single Environment:** A single environment would be simpler, but an objective of Project: SERVERTRON is the simulation of an enterprise system, with containerisation, separation of concerns, and adherence to DevOps principles. This aligns better with running multiple environments for different stages of the DevOps lifecycle.
- **More Than Two Environments:** Multiple environments were considered, including development and testing environments, but creating more than two environments was deemed unnecessarily complex for the scope of the initial project.

### Consequences

- Production workloads will take place in the production environment, while the lab environment will be used for development, testing, learning, and experimentation.
- The lab environment can be stressed, broken, and rebuilt without affecting production workloads.
- Future expansion to more than two environments is possible, but not within the scope of the project.

## DEC-003: Virtual Machines for Persistent Services, LXC for Lightweight Utilities

- Status: Accepted
- Date: 2026-04-20

### Context

The system must include both persistent services, like web, game, and media servers, while also supporting lightweight tools and utilities.  

### Decision

Virtual machines will be used for persistent services, and Linux containers (LXCs) will be used for lightweight tools and utilities.  

### Rationale

Not all workloads need the same level of isolation, flexibility, or operational overhead.  

Complex and persistent services benefit from the strong isolation of full virtual machines, with their own kernel, and can be treated as distinct systems. This best reflects how production infrastructures are commonly segmented. Internet-facing services in particular should be isolated so that failures, misconfiguration, or compromise in one service is less likely to affect others.  

LXCs are more efficient for lightweight ools and utilities as they use fewer resources, start quickly, and are simpler to run when full isolation is necessary.  

This approach balances realism and practicality on a single-node system, providing workload-appropriate isolation while avoiding unnecessary overhead for small services.  

### Alternatives Considered

### Consequences

## DEC-004: Docker for Containers in the Production Environment

- Status: Accepted
- Date: 2026-04-20

### Context

A container technology must be selected for use in Project: SERVERTRON. Two primary container technologies were identified for the selection process: Docker and Kubernetes.  

Docker runs containers and manages containers on a single host, or manually across hosts.  

Kubernetes manages containers across one or more machines, and handles scheduling, scaling, networking, and self-healing.  

### Decision

Use Docker for persistent containers in the production environment.

### Rationale

Docker is specifically designed as a lightweight solution to running and managing containerised applications within virtual machines. Kubernetes is designed to manage containers across multiple nodes.  

Kubernetes is powerful technology and should eventually be adopted. But to reduce the complexity of the project, Docker will be used to manage all containerised applications in the production environment.  

### Alternatives Considered

- **Kubernetes Only:** Kubernetes is used to orechstrate container workloads across multiple nodes. It would ass significant and unnecessary operational overhead and architectural complexity to the project.
- **Docker Only:** This is a feasible option that is sufficient for current workloads, but was not selected because it does not support the goal of learning Kubernetes and orchestration concepts.
- **No containers:** SERVERTRON-1 ran bare-metal Ubuntu Server and did not use container technology previous to Project: SERVERTRON. A goal of this project is to provide a containerised DevOps environment on the existing hardware.  

### Consequences

- Docker used to simplify deployment and management of application services in the production environment
- Lower operation overhead, faster iteration, easier troubleshooting
- Kubernetes currently restricted to lab environments for learning purposes only
- Unfortunately, less representative of large-scale distributed systems

## DEC-005: Run Kubernetes in the Lab Environment Only

- Status: Accepted
- Date: 2026-04-20

### Context

A goal of Project: SERVERTRON is to provide a learning environment for modern technologies. Kubernetes is a popular containerisation and container orchestration platform that should be available on the system for learning purposes.  

### Decision

Run Kubernetes, but initially only in the laboratory environment.  

### Rationale

Kubernetes is a powerful tool for clustering and container orchestration that should be harnessed at some point in the future. SERVERTRON-1 is a single-node system and does not currently require clustering technology, however.  

Learning to use Kubernetes in the lab environment will enable later integration of clustering technology into the broader system without adding unnecessary complexity to the initial project.  

### Alternatives Considered

- **Kubernetes in the Production Environment:** Kubernetes could be installed in the production environment, but this would drastically increase the complexity of the project. Restricting Kubernetes to the lab environment allows training in Kubernetes with unnecessary overhead during project completion.
- **No Kubernetes:** Kubernetes could be left out of the project entirely, but this would be missing an opportunity to incorporate a powerful technology into the system at a later date.

### Consequences
- Kubernetes will be available for learning and experimentation (despite the single-node host system)
- Kubernetes will not be available in the production environment (within the scope of the initial project)

## DEC-006: Define Initial VM and LXC Workload Layout

- Status: Proposed
- Date: 2026-04-20

### Context

SERVERTRON-1 requires a workload layout for virtual machines and Linux containers. These must support Internet-facing servers, apps, utilities, monitoring, and a lab environment running Kubernetes.  

### Decision

VMs for an edge gateway, an apps platform, data services, a Minecraft server, and a media server. Linux containers for monitoring and utility applications. An isolated virtual machine running Kubernetes.  

### Rationale

The edge gateway provides a single control point for traffic coming in and out of the Internet. The web server, game server, and media server must be isolated from each other to enhance security and prevent failures in one from affecting the others. Lightweight tools like monitoring and utility applications can be run in Linux containers to reduce operational workloads. Kubernetes (K3s) will be implemented in a separate lab environment from production workloads.  

### Alternatives Considered

- **Simpler configurations** were considered, such as running all major persistent services from the same virtual machines, but were rejected in favour of best practices of isolation and containerisation.
- **More complex configurations** were considered (e.g. an ARK: Survival Evolved server) but rejected in favour of reducing project scope. Additional virtual machines, containers, and services can be added after the minimum goals of the project have been achieved.

### Consequences
- Isolation and separation between all major services, data services, and the gateway to the Internet
- Monitoring and utility tools each isolated in lightweight containers, reducing system resource consumption
- Plenty of learning experiences managing a relatively complex set of virtual machines and containers in Proxmox

# DEC-007: Use ZFS for File System

Status: Accepted  
Date: 2026-04-20  

## Context

A file system must be chosen for SERVERTRON-1.  

## Decision

Use ZFS for SERVERTRON-1's file system.  

## Rationale

Although RAID capability will not be implemented, ZFS provides data integrity with checksums, corruption detection, and corruption repair (if redundancy existed).  

ZFS snapshots are instant, lightweight, and easier to roll back. Proxmox supports VM disks, snapshotting, and easy backup workflows.  

ZFS is used in enterprise storage, production systems, and serious homelabs. This aligns with the goal of mirroring real-world DevOps infrastructure, even if only on a single node (and storage drive).  

### Alternatives Considered

- **ext4:** ext4 is simpler and uses less RAM than ZFS, but the primary goals of Project: SERVERTRON is to provide a learning environment for new technologies, 

### Consequences

- Excellent recoverability with snapshots and backups
- Increased RAM usage (for the ARC cache)
- Observability into health and other metrics
- ZFS pools are not as flexible to expand as some other systems

## DEC-008: Allocate Initial System Resources to VMs and LXCs

- Status: Accepted
- Date: 2026-04-20

### Context

Virtual machines and Linux containers require resource allocations for CPU, RAM, and storage.  

### Decision

Initial resource allocation is outlined in [Initial Architecture Notes](../phases/01-plan/initial-architecture-notes.md#virtual-machines--lxc-containers).  

### Rationale

CPU and RAM have been allocated conservatively, as they may be modified later. Storage space has been allocated generously, as this is more difficult to change once configured.  

Current resource allocations still allow for the addition of new VMs, LXCs, and services at a later date.  

### Alternatives Considered

**Different resource allocatons:** Different resource allocations were considered. This includes both less and more of CPU cores, RAM, and storage space. The current configuration was settled on as a good initial configuration, and alternatives were discarded until the current configuration is tested.  

### Consequences

- Adequate CPU and RAM allocation for each VM and container according to purpose and workload
- Plenty of storage for Minecraft and media server metadata
- Surplus resources for allocation to future endeavours

## DEC-009: Use Jellyfin for Media Server

### Context

Project: SERVERTRON requires a media server application. The most popular options are Plex and Jellyfin. Plex was used on SERVERTRON-1 previous to Project: SERVERTRON.  

### Decision

Use Jellyfin as the media server platform and store media on a dedicated external USB 3.2 drive.  

### Alternatives Considered

- **Plex:** Plex was considered (and used on SERVERTRON-1 prior to this project). But the Plex Pass is prohibitively expensive and is required for hardware transcoding and remote streaming. These features are free with Jellyfin.
- **No media server platform:** The media server platform could be hosted on a different dedicated system like a NAS, but it is included in the scope of this project to get as much functionality out of SERVERTRON-1 as possible, and because SERVERTRON-1's iGPU is capable of hardware transcoding.

### Consequences

- Allows for free hardware transcoding and rmeote streaming of media.
- Free, open source, and entirely
- Will require hardware passthrough of iGPU for hardware transcoding
- No client app for PlayStation 5 and perhaps some smart TVs. Fairly good support on all other platforms.  

## DEC-010: Use External USB Storage in ext4 Format

- Status: Accepted
- Date: 2026-04-22

## Context

The media server requires a lot of storage for the current catalogue of media. The media collection already exceeds 2 TB, which is the size of SERVERTRON-1's internal NVMe drive.  

### Decision

Media for the media server will be stored on a 5 TB USB drive formatted in ext4 format.  

### Rationale

An external media drive (or NAS) is necessary as there is not enough room on SERVERTRON-1's internal NVMe drive to store exisiting media.  

ext4 was selected for the filesystem because it is stable, low-overhead, and well-suited to large, mostly read-heavy files such as video content.

Because the drive will be connected through USB, the filesystem must tolerate occasional disconnects or instability. ext4's simplicity and makturity makes it more resilient for this context than more complex filesystems that assume stable, persistently connected disks.  

External storage will be kept simple and separated from the more robust ZFS internal storage used for critical data.  

## Alternatives Considered

- **Internal storage:** Internal storage for media files was briefly considered but rejected because there is not enough space on existing storage, and adequate internal storage would be prohibitively expensive.
- **ZFS:** Provides data integrity, snapshots, advanced features, and is already used for the internal storage. Rejected as a solution for media because it introduces significant overhead, depends on stable disk connections, and is not suitable for USB-attached storage.
- **Btrfs:** Offers modern features such as snapshots and checksumming with lower overhead than ZFS. Rejected due to increased complexity and unpredictable behaviour under failure conditions, particularly on unstable storage (such as USB). The additional features do not provide meaningful value for the media workload.
- **NTFS/exFAT:** Provides cross-platform compatibility with Windows and other operating systems. Rejected because these filesystems have weaker integration with Linux, including less reliable permissions and lower performance in Linux-based environments. Cross-platform compatibility is not required from this drive.

## Consequences

- 5 TB of external storage, allowing for storage of current media and addition of more at a later date
- The media drive is simple, reliable, and easy to recover or remount
- No advanced features such as snapshots or checksumming will be available on this storage layer
- The drive is treated as non-critical storage with reliability handled through external backups instead of filesystem-level redundancy
- Operational complexity is reduced using a filesystem that requires minimal tuning and maintenance

## DEC-011: Use an Edge Gateway with NGINX Reverse Proxy

Status: Accepted
Date: 2026-04-22

### Context

A networking model is required for Project: SERVERTRON's VMs and LXCs.  

### Decision

Use a dedicated edge gateway VM as a reverse proxy server and TLS termination point.  

### Rationale

An edge gateway VM with a reverse proxy (NGINX) providing a single entry point into the system that will receive Internet traffic and route it to the correct internal service. Routing and security can be largely managed on a single VM.  

### Alternative Considered
- **Port forwarding for all VMs and LXCs:** Individually configuring each VM and LXC to access the Internet would increase complexity and reduce security. An edge gateway is better practice, so this alternative was discarded.  

### Consequences

- Only one machine will be exposed to the Internet
- Routing and security can be managed in one place
- TLS termination allows all incoming requests to be handled with a single certificate
- Steep learning curve to use Nginx for everything it is required for

## DEC-012: Run Docker on Ubuntu Server for VM 110 apps-platform

### Context

One of the goals of Project: SERVERTRON is to learn modern DevOps technologies such as containerisation. Docker has been chosen for the primary production lane containerisation platform, and will be installed on Ubuntu server in VM 110 apps-platform to manage containers for applications and services.  

### Decision

Run Docker on Ubuntu Server in VM 100 apps-platform.  

### Rationale

Ubuntu Server provides a large ecosystem and extensive documentation. It behaves predictably, and has long term support (5+ years).  

Ubuntu Server has excellent Docker support, and is often the standard guest operating system in DevOps environments.  

### Alternatives Considered

- **Red Hat Enterprise Linux (RHEL) as OS:** RHEL is more suited to data centers than modern DevOps platforms. Ubuntu Server aligns well with the use of Docker and DevOps practices.
- **Docker on multiple VMs:** Other VMs (databases, media server, Minecraft server, etc.) are better suited to dedicated Virtual Machines than containerised environments. Databases require stability and predictable storage, and while Jellyfin and Minecraft could both run in Docker it will reduce complexity and support isolation for them to have their own virtual machines.
- **No Docker:** It is one of the goals of Project: SERVERTRON to learn modern DevOps techniques and technology and this includes Docker. Project: SERVERTRON is centred around virtualisation and containerisation and these are indispensible to the purpose of the project.

### Consequences

- Containerisation through Docker on VM 110 apps-platform
- Clean application layer with apps groups by purpose
- Separation of concerns
- VM 110 becomes a concentration point and single point of failure for multiple application services
- Extra abstraction layer to manage, more moving parts
- Data persistence must be handled more carefully (lest a VM or container with important data be deleted)


## DEC-013: Use Ubuntu Server as the Standard Guest Operating System

- Status: Accepted
- Date: 2026-04-22

### Context

Project: SERVERTRON reqiures a guest operating system strategy for virtual machines and containers, including multiple workloads. This strategy must support the goals of reflecting real-world architecture, and enabling learning across Proxmox, Docker, Kubernetes, and other tooling. It must also avoid introducing unnecessary complexity to the platform and learning process.  

### Decision

Ubuntu Server will be used as the standard guest operating system across all VMs, with Debian-based lightweight templates used for containers where appropriate.  

### Rationale

Ubuntu service provides a balance of stability, ecosystem support, and alignment with modern infrastructure practices. It is widely used in cloud, DevOps, container, and self-hosted environments.  

Using Ubuntu Server across the main VMs reduces unnecessary variation in package management, service administration, documentation, and troubleshooting. It also reduces the learning complexity required to administer and operate the system.  

### Alternatives Considered

- **Rocky Linux:** Used for traditional enterprise infrasttrucure, especially on-premises environments. Rejected for VM 120 data-services because it would introduce an additional operating system and related overhead and reduce consistency across the platform.
- **AlmaLinux:** Similar to Rocky Linux. Rejected for the same reasons as Rocky Linux.
- **Debian:** Stable, lightweight, and well-suited to infrastructure services. Not selected because Ubuntu offers stronger documentation, alignment with the rest of the infrastructure, and a common reference point for container and Kubernetes workflows. Debian is still a valid option for lightweight LXCs.
**Mixed operating system strategy from the outset:** While this might more slosely reflect some real-world environments, it was rejected for adding complexity before establishing a baseline architecture and operations.

### Consequences

- Guest operating systems across SERVERTRON will remain consistent, reducing operational overhead and simplifying documentation and learning
- Integration with Docker, Kubernetes, and other core tools will be more consistent
- Ubuntu Server reflects modern cloud and DevOps infrasture patterns better than a RHEL-centric environment
- The project will not initially model a heterogeneous enterprise operating system environment
- Future introduction of other guest OSes remains possible if later design decisions or learning goals support the additional complexity

## DEC-014: Use NGINX for Networking and Reverse Proxy on VM 110

## DEC-015: Use Cloudflare for DNS, Proxy, SSL, and Zero-Trust Tunnels

### Context

Cloudflare provides a proxy, DNS services, SSL, DDoS protection, a web application firewall, and zero-trust tunnels to protect the system from unauthorised access and use.  

### Decision

Cloudflare will be used as a proxy for VM 100 edge-gateway, and for SSL, a web application firewall, and DDoS protection on related services. It will also be used as a DNS server for all components of the architecture. High bandwidth applications such as Jellyfin and Plex are against Cloudflare's Terms of Service and will be port-forwarded through the router directly to the client.  

## DEC-016: Use PostgreSQL as Primary Database and MariaDB for WordPress

### Context

Databases are required for VM 120 data-services to run as a persistent data layer in the SERVERTRON system. Compatibility with WordPress is also required.  

### Decision

PostgreSQL will be used as a primary database. MariaDB will be used a secondary database for WordPress compatibility.  

### Rationale

PostgreSQL is open-source and commonly used in enterprise and production environments.  

MariaDB will be as a secondary database for WordPress compatibility.  

### Alternatives Considered

- PostgreSQL
- MariaDB
- MySQL

### Consequences

- 

## DEC-017: Use Redis for Fast, Temporary Data

### Context

Redis can be used on VM 120 data-services as fast, temporary storage for working values.  

### Decision

Use Redis for fast, temporary storage.  

### Rationale

Redis is an in-memory data store used for caching, session management, and real-time data, complementing PostgreSQL by handling high-speed, temporary workloads that do not require persistence.  

## DEC-018: Expose Jellyfin via an NGINX Reverse Proxy

### Decision

Expose Jellyfind via an NGINX reverse proxy with TLS termination using Let's Encrypt certificates.  

### Consequences

- Provide encrypted HTTPS access to media while avoiding Cloudflare proxy limitations by using DNS-only routing  

## DEC-019: Use Prometheus, Grafana, and Loki for Monitoring and Observability

### Context

Tooling is required for LXC 200 monitoring to perform its function of monitoring and reporting on the rest of the system.  

### Decision

Prometheus will be used to collect metrics, Loki will be used to collect logs, and Grafana will provide dashboards and visualisation.  

### Rationale

Prometheus collects system metrics such as CPU, RAM, and disk usage, network traffic, container stats, and service health. This data can be queried using PromQL or viewed through Grafana.  

Loki collects and stores logs such as NGINX access logs, Jellyfin logs, Docker container logs, and system logs.  

Grafana connects to Promethus and Loki and displays their relevant data in visual dashboards (graphs, charts, alerts, and overview panels).  

These tools are industry standard and well-suited to working with Docker, Kubernetes, NGINX, and Linux VM. They are scaleable and separate concerns into three neat tools for metrics, logs, and visualisation.  
