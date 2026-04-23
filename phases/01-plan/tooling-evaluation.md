# Project: SERVERTRON Tooling Evaluation

## 1. Executive Summary

This document is an evaluation of core infrastructure tooling for Project: SERVERTRON. It exists to justify stack choices before the build phase.  

Proxmox was selected for the hypervisor. Ubuntu Server was selected as the operating system for guest VMs (with Debian-based LXCs). Docker will be used for containerisation in the production environment. Kubernetes will be used for containerisation in the laboratory environment. Nginx will be used on the edge gateway as a reverse proxy.  

The rest of this document contains justification and supporting information for these decisions.  

## 2. Evaluation Criteria

Tools are evaluated according to the following criteria:  

- **Industry Relevance:** Tools used in real-world enterprise environments are used where possible.
- **Learning Value:** Education in new skills is a primary goal of Project: SERVERTRON and this affects tooling choices.
- **Operational Complexity:** In some tooling decisions, tradeoffs were made between realism and ease of use.  
- **Performance & Scalability:** Performance, functionality, and scalability must be considered for each choice of tooling.
- **Documentation Quality:** Quality of documentation enables better learning and troubleshooting of tools.
- **Community & Ecosystem:** Tools with large communities and diverse ecosystems should be favoured.
- **Compliance with Project Constraints:** The constraints of Project: SERVERTRON must be followed in all tooling choices.
- **Cost:** Costs of Project: SERVERTRON must be carefully managed. Free and open source tools are therefore preferred.
- **Resource Usage:** As a single-node system, resource usage must be considered in tooling choices.

## 3. Constraints & Assumptions

The following are the constraints and assumptions for Project: SERVERTRON:

- The host machine, SERVERTRON-1, is pre-existing infrastructure. Further expenditure on the project will be minimal unless necessary hardware fails.
- SERVERTRON-1 is limited by its specifications: 16 logical cores, 64 GB RAM, and a 2 TB NVMe for internal storage.
- Production workloads must be isolated from development, learning, and experimental environments.
- Internet-facing services (and internal ones) must be kept secure and available.
- Kubernetes will not be used in the production environment as it is designed for multi-node systems and adds unnecessary complexity to the project.

## 4. Tooling Categories Overview

The following domains were evaluated for tooling:

- Hypervisor
- Operating system(s)
- Containerisation
- Orchestration
- Reverse proxy / edge gateway
- Databases
- Monitoring and observability
- Networking
- CI/CD and GitOps (in a future iteration)

## 5. Hypervisor Evaluation

### Options Considered

- **VMware ESXi:** An industry-standard hypervisor with strong performance and features. Limited functionality on the free tier and less flexibility for container-based workloads.
- **Microsoft Hyper-V:** Integrates well with Windows environment, but less suitable for the Linux-based stack and tooling planned for Project: SERVERTRON.  
- **Bare-metal Linux (no hypervisor):** This is a simpler setup but lacks isolation, flexibility, and the ability to model multi-system architectures. It should be noted that SERVERTRON-1 was running bare-metal Linux previously to being rebuilt as a Proxmox hypervisor in Project: SERVERTRON.  

### Comparison Criteria

- Enterprise usage
- Cost
- Feature set
- Suitability for project

### Decision

Proxmox VE.

### Rationale

- Features a strong balance of enterprise concept and accessibility
- Built-in clustering, storage, and networking
- Open-source and widely used in homelabs

## 6. Operating System Strategy

### Options Considered

### Evaluation

### Decision

### Rationale

## 7. Containerisation Strategy

### Options Considered

### Decision

### Rationale

## 8. Orchestration Strategy

### Options Considered

### Decision

### Rationale

## 9. Reverse Proxy / Edge Layer

### Options Considered

### Decision

### Rationale

## 10. Database Strategy

### Options Considered

### Decision

### Rationale

## 11. Monitoring & Observability

### Options Considered

### Decision

### Rationale

## 12. Networking Approach

### Design Choices

### Future Considerations

## 13. Final Tooling Stack Summary

## 14. Risks & Trade-Offs

## 15. Future Evolution

## 16. Appendix
