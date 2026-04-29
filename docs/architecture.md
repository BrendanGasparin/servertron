# Project: SERVERTRON Architecture

## 1. Purpose

This document defines the architecture of Project: SERVERTRON, providing the structure, components, and design principles of the system, as well as the relationships between environments, services, and supporting infrastructure.  

![Project: SERVERTRON architectural diagram](../images/servertron-architecture.png)
*Project: SERVERTRON architectural diagram.*  

It serves as a reference for how the system is designed and intended to operate, and provides a framework to ensure that future decisions remain aligned with project goals and constraints.  

## 2. Design Goals

The architecture of Project: SERVERTRON is guided by a set of design goals that reflect its purpose as a DevOps-focused homelab running real services, as well as a learning platform for new technologies.  

### 2.1. Real-World Alignment

The system is designed to reflect real-world infrastructure patterns, including workload isolation, service separation, and environment-based deployment models. The goal is to simulate production-like systems within a single-node mini-PC.  

### 2.2. Environment Separation

The system is designed with a separation between production and laboratory environments. Production hosts stable, continuously-running services. The lab environment is for development, testing, and experimentation. This separation reduces risk and ensures that experimental changes do not impact operational workloads.  

### 2.3. Appropriate Workload Isolation

Workloads are deployed using a combination of virtual machines and Linux containers based on their requirements. Virtual machines are used for externally exposed or complex services. Containers are used for lightweight internal services. This balances isolation, performance, and flexibility.  

### 2.4. Modularity and Scalability of Design

Although the system operates on a single physical host, the architecture is designed to be modular and scalable. Components are structured in a way that allows expansion to multi-node and distributed systems at a later date without requiring a total redesign.  

### 2.5. Support for Practical Workloads

The platform is intended to run real services, including web hosting, application hosting, media services, and game servers. The architecture prioritises usability and stability for these workloads and the lab environment, while allowing for future expansion.  

### 2.6. Observability and Operational Awareness

The system is designed to support monitoring and observability through standard tools. Visibility into system performance and health is a core requirement of the project for self-education purposes and increased operational awareness.  

### 2.7. Controlled Complexity

The architecture balances realism with practicality. It aims to reflect modern DevOps practices but avoids unnecessary complexity that would hamper progress. Design decisions prioritise clarity, maintainability, and incremental growth.  

### 2.8. Single-Node Constraint

All design decisions are made within the constraint of a single-node system. The architecture must maximise the capability of the available hardware while maintaining separation between services and environments.  

## 3. Architectural Principles

The architecture of Project: SERVERTRON is governed by a set of principles guiding system design, implementation, and evolution.  

The principles are intended to guide all architectural decisions and ensure consistency as the system evolves over time.  

### 3.1 Separation of Environments

Production and lab environments are strictly isolated. Changes are validated in the lab environment before being introduced to the production environment. Experimental changes must not impact production workloads.  

### 3.2 Workload-Appropriate Isolation

Workloads are deployed using virtual machines or Linux containers based on their requirements. Virtual machines are used for externally exposed or complex services, while containers are used for lightweight internal services.  

### 3.3 Single Responsibility per Component

Each system component is designed to perform a single primary function. This reduces complexity, improves maintainability, and simplifies troubleshooting.  

### 3.4 Infrastructure Reflects Real-World Patterns

The system is designed to reflect real-world infrastructure patterns, including service separation, layered architecture, and network segmentation (despite being a single-node deployment).  

### 3.5 Modularity and Loose Coupling

System components are designed to be modular. This allows individual services to be modified, replaced, or extended without requiring changes to unrelated components.  

### 3.6 Lab as a Controlled Experimentation Environment

The lab environment is treated as a safe space for experimentation, failure, and learning. It is intentionally isolated from production workloads.  

### 3.7 Production Stability

The production environment prioritises uptime, stability, and reliability. Changes are introduced in a controlled manner and only after validation in the lab environment.  

### 3.8 Observability

The system is designed to support monitoring and visibility into system behaviour, enabling informed decision-making and troubleshooting.  

### 3.9 Documentation-Driven Development

Architecture, decisions, and system behaviour are documented and version controlled as part of the development process and maintained alongside the system.  

### 3.10 Simplicity and Maintainability

Design decisions prioritise clarity and maintainability over unnecessary complexity, especially within the constraints of a single-node system.  

### 3.11 Conceptual Scalability

The architecture is designed to scale beyond a single node, allowing future expansion without fundamental redesign. Patterns that may impede future growth are avoided.  

### 3.12 Explicit Decision Tracking

All significant architectural decisions are recorded and justified, ensuring traceability and consistency across the system.  

## 4. System Context

## 5. Architecture Overview

### 5.1. High-Level Architecture

Project: SERVERTRON is a single-node, virtualised infrastructure built on Proxmox VE. The system is designed to simulate a production-style environment within the constraints of a homelab.  

The architecture follows a layered model:

- **Edge Layer:** External DNS and security (Cloudflare)
- **Gateway Layer:** Reverse proxy and traffic routing (NGINX on VM 100 edge-gateway)
- **Application Layer:** Cointainerised services (VM 110 apps-platform)
- **Data Layer:** Databases and persistent storage (VM 120 data-services)
- **Service Layer:** Media and game services (VM 130 media-server and VM 140 games-minecraft)
- **Observability Layer:** Monitoring and logging (LXC 200)
- **Lab Environment:** Isolated Kubernetes environment (VM 300)

Each layer is logically separated to improve maintainability, security, and clarity of system behaviour.  

### 5.2. Traffic Flow

External traffic enters the system through Cloudflare, which provides DNS resolution, TLS termination for proxied services, and security features such as WAF and DDoS protection.  

Traffic is handled in two distinct paths:  

#### Proxied Web Traffic

1. Client → Cloudflare (proxied)
2. Cloudflare → NGINX (VM 100 edge-gateway)
3. NGINX routes requests to:
    - application services (VM 110 apps-platform)
    - lab services (VM 300 k3s-lab, if exposed)
4. Services interact with the data layer (VM 120 data-services) as required

#### Direct Service Access

Certain services bypass Cloudflare proxying due to bandwidth or protocol constraints, and Cloudflare's terms and conditions. These include:  

- Jellyfin (media server)
- Minecraft (game server)

These services are accessed via direct connections:

1. Client → Public IP (via DNS-only record in Cloudflare)
2. Router → Port forwarding
3. Target VM (VM 130 media-server for Jellyfin, VM 140 games-minecraft for Minecraft)

### 5.3. Environment Separation

The system is divided into two primary environments:  

- Production Environment: Hosts stable, persistent services (web, media, game, and data services)
- Lab Environment: Hosts experimental workloads, including Kubernetes (K3s)

The lab environment is isolated to prevent experimental changes from impacting production services.  

### 5.4. Architecture Characteristics

The architecture is defined by the following characteristics:  

- **Single-node deployment:** All services run on the mini-PC SERVERTRON-1
- **Layered design:** Clear separation between edge, gateway, application, and data layers
- **Workload isolation:** Services are separated using virtual machines and containers
- **Hybrid exposure model:** Combination of proxied (web) and direct (media/game) access
- **Incremental scalability:** Designed to support future expansion without redesign

### 5.5. Diagram References

The architecture is illustrated in the diagram below:

![Project: SERVERTRON architectural diagram](../images/servertron-architecture.png)
*Project: SERVERTRON architectural diagram.*  

The network flow is shown in the diagram below:

![Project: SERVERTRON network flow diagram](../images/servertron-network-flow.png)

These diagrams show:  

- system architecture details
- traffic flow through the system
- relationships between virtual machines
- separation between production and lab environments

## 6. Environment Model
### 6.1. Production Environment
### 6.2. Lab Environment

## 7. Host Platform
### 7.1. Hardware Overview
### 7.2. Proxmox Host Configuration
### 7.3. Resource Allocation Strategy

## 8. Compute and Workload Model
### 8.1. Virtual Machines
### 8.2. Linux Containers (LXC)
### 8.3. Containerised Workloads (Docker)

## 9. Network Architecture
### 9.1. External Edge (Cloudflare)
### 9.2. Edge Gateway (NGINX)
### 9.3. Internal Networking
### 9.4. Direct Exposure (Jellyfin, Minecraft)

## 10. Service Architecture
### 10.1. Edge and Ingress
### 10.2. Application Services
### 10.3. Data Services
### 10.4. Monitoring and Observability
### 10.5. Media and Game Services

## 11. Lab Environment Architecture
### 11.1. Purpose
### 11.2. K3s Scope
### 11.3. Workload Isolation

## 12. Data and Storage Design

## 13. Security Architecture
### 13.1. Exposure Model
### 13.2. Network Security
### 13.3. Host and VM Hardening
### 13.4. Secrets Management

## 14. Operations Model
### 14.1. Provisioning Approach
### 14.2. Backup and Recovery
### 14.3. Update Strategy
### 14.4. Observability (Logging, Metrics, and Alerts)

## 15. DevOps Alignment

## 16. Constraints and Trade-Offs

## 17. Planned Evolution
