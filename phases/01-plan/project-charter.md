# Project: SERVERTRON Charter

## 1. Project Overview

Project: SERVERTRON is a single-node, self-hosted infrastructure designed to simulate real-world DevOps environments within the context of a homelab.  

The system provides a production environment for running practical workloads and a lab environment for development, testing, and experimentation.  

## 2. Purpose

The purpose of Project: SERVERTRON is to:

- Build and operate a production-style infrastructure system
- Develop practical DevOps and system administration skills
- Provide a platform for hosting real services (web, media, and game servers)
- Create a documented, portfolio-grade system demonstrating real-world architecture and operational practices

## 3. Objectives

The primary objectives of the project are:  

- Deploy a virtualised infrastructure using Proxmox VE
- Implement a production environment for stable services
- Implement a lab environment for experimentation (including K3s)
- Establish monitoring, logging, and observability
- Implement a backup and recovery strategy
- Document all architectural decisions and system behaviour

## 4. Scope

### In Scope

- Single-node infrastructure (SERVERTRON-1)
- Virtual machines and Linux containers
- Application hosting via Docker
- Media and game server hosting
- Monitoring and observability stack
- Public exposure of selected services
- Documentation and DevOps lifecycle alignment

### Out of Scope

- High availability or multi-node clustering
- Enterprise-grade SLAs or uptime guarantees
- Full automation in the initial phase
- Production use of Kubernetes

## 5. Constraints

- Single physical host system
- Fixed hardware resources (CPU, RAM, storage)
- Residential Internet connection
- Limited exposure of services
- Minimal additional hardware investment

## 6. Assumptions

- Services must be accessible over the Internet when required
- Failures may occur and are mitigated through backups and monitoring
- The system prioritises learning and practical functionality over enterprise-level resilience
- Infrastructure will evolve incrementally over time

## 7. High-Level Architecture

The system follows a layered architecture:

- Edge layer (Cloudflare)
- Gateway layer (NGINX)
- Application layer (Docker workloads)
- Data layer (databases and storage)
- Service layer (media and game servers)
- Observability layer (monitoring stack)
- Lab environment (K3s)

Workloads are separated across virtual machines and containers to ensure isolation and maintainability.  

## 8. Success Criteria

The project will be considered successful when:

- All core services are deployed and operational
- The system is externally accessible where required
- Monitoring and logging provide visibility into system behaviour
- Backups are functional and restorable
- Architecture and operations are fully documented
- The system demonstrates real-world infrastructure patterns

## 9. Risks

- Single point of failure (single-node system)
- Resource contention under load
- Misconfiguration during experimentation
- Direct exposure of selected services

These risks are mitigated through controlled exposure, monitoring, and backups.  

## 10. Project Approach

The project follows an iterative DevOps lifecycle:  

![The DevOps lifecycle](../../../images/devops-lifecycle.png)
*The DevOps lifecycle.*

Phase 1 (PLAN) establishes the architecture, goals, constraints, and tooling decisions.  

Subsequent phases implement and refine the system.  

## 11. Deliverables (Phase 1)

- [Architecture document](../../docs/architecture.md)
- [Goals](goals.md) and [constraints](constraints.md) documentation
- [Tooling evaluation](tooling-evaluation.md)
- [Initial architecture notes](initial-architecture-notes.md)
- Project charter (this document)

## 12. Future Direction

The system is designed to evolve through:  

- Increased automation (Infrastructure as Code)
- CI/CD implementation
- Expanded service offerings
- Potential transition to multi-node architecture
