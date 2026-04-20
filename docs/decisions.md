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

VMs for an edge gateway, an apps platform, data services, a Minecraft server, and a media server. Linux containers for monitoring and utility applications.  

### Rationale

The edge gateway provides a single control point for traffic coming in and out of the Internet. The web server, game server, and media server must be isolated from each other to enhance security and prevent failures in one from affecting the others. Lightweight tools like monitoring and utility applications can be run in Linux containers to reduce operational workloads.  

### Alternatives Considered

- **Simpler configurations** were considered, such as running all major persistent services from the same virtual machines, but were rejected in favour of best practices of isolation and containerisation.
- **More complex configurations** were considered (e.g. an ARK: Survival Evolved server) but rejected in favour of reducing project scope. Additional virtual machines, containers, and services can be added after the minimum goals of the project have been achieved.

### Consequences
- Isolation and separation between all major services, data services, and the gateway to the Internet
- Monitoring and utility tools each isolated in lightweight containers, reducing system resource consumption
- Plenty of learning experiences managing a relatively complex set of virtual machines and containers in Proxmox
