# Project: SERVERTRON Architecture

## 1. Purpose

This document defines the architecture of Project: SERVERTRON, providing the structure, components, and design principles of the system, along with the relationships between environments, services, and supporting infrastructure.  

The purpose of this document is to provide a reference for how the system is designed and intended to operate. It also provides benchmarks to ensure that architectural decisions remain aligned with project goals and constraints.  

## 2. Design Goals

The architecture of Project: SERVERTRON is guided by a set of design goals that reflect its purpose as a DevOps-focused homelab running real services, as well as a learning platform for new technologies.  

### 2.1. Real-World Alignment

The system is designed to reflect real-world infrastructure patterns and practices. These include workload isolation, service separation, and environment-based deployment models.  
The goal is to simulate production-like systems within a single-node mini-PC.  

### 2.2. Environment Separation

A separation is maintained between Production and Lab environments. Production is intended for stable, continuously-running services. The lab environment is for development, testing, learning, and experimentation. This ensures that experimental changes do not impact operational workloads.  

### 2.3. Appropriate Workload Isolation

Workloads are deployed using a combination of virtual machines and Linux containers based on their requirements. Virtual machines are used for externally exposed or complex services. Containers are used for lightweight internal services. This balances isolation, performance, and flexibility.  

### 2.4. Modularity and Scalability of Design

Although the system operates on a single physical host, the architecture is designed to modular and scalable. Components are structured in a way that allows expansion to multi-node or distributed systems at a later date without requiring a total redesign.  

### 2.5. Support for Practical Workloads

The platform is intended to run real services, including web hosting, application hosting, media services, and game servers. The architecture prioritises usability and stability for these workloads and the lab environment, while supporting the possibility for future expansions.  

### 2.6. Observability and Operational Awareness

The system is designed to support monitoring and observability through standard tools. Visibility into system performance and health is a core requirement of the project for both operational effectiveness and self-education purposes.  

### 2.7. Controlled Complexity

The architecture balances realism with practicality. It aims to reflect modern DevOps practices but avoids unnecessary complexity that would hamper progress. Design decisions prioritise clarity, learning value, and incremental growth.  

### 2.8. Single-Node Constraint

All design decisions are made within the constraint of a single-node system. The architecture must maximise the capability of the available hardware while maintaining separation between services and environments.  

## 3. Architectural Principles

The architecture of Project: SERVERTRON is governed by a set of principles that guide system design, implementation, and evolution.

### 3.1 Separation of Environments

Production and lab environments are logically separated. Production hosts stable services, while the lab is used for experimentation and testing. Changes are validated in the lab before being introduced to production.  

### 3.2 Workload-Appropriate Isolation

Workloads are deployed using virtual machines or Linux containers based on their requirements. Virtual machines are used for externally exposed or complex services, while containers are used for lightweight internal services.  

### 3.3 Single Responsibility per Component

Each system component is designed to perform a single primary function. This reduces complexity, improves maintainability, and simplifies troubleshooting.  

### 3.4 Real-World Architectural Alignment

The system is designed to reflect real-world infrastructure patterns, including service separation, layered architecture, and network segmentation, even within a single-node deployment.  

### 3.5 Modularity and Loose Coupling

System components are designed to be modular. This allows individual services to be modified, replaced, or extended without requiring changes to unrelated components.  

### 3.6 Lab as a Controlled Experimentation Environment

The lab environment is treated as a safe space for experimentation, failure, and learning. It is intentionally isolated from production workloads.  

### 3.7 Production Stability

The production environment prioritises stability and reliability. Changes are introduced in a controlled manner and only after validation.  

### 3.8 Observability

The system is designed to support monitoring and visibility into system behaviour, enabling informed decision-making and troubleshooting.  

### 3.9 Documentation-Driven Development

Architecture, decisions, and system behaviour are documented as part of the development process and maintained alongside the system.  

### 3.10 Simplicity and Maintainability

Design decisions prioritise clarity and maintainability over unnecessary complexity, especially within the constraints of a single-node system.  

### 3.11 Conceptual Scalability

The architecture is designed to scale conceptually beyond a single node, allowing future expansion without fundamental redesign.  

### 3.12 Explicit Decision Tracking

All significant architectural decisions are recorded and justified, ensuring traceability and consistency across the system.  

## 4. System Context

## 5. Environment Model
### 5.1. Production Environment
### 5.2. Lab Environment

## 6. Host Platform

## 7. Virtualisation Strategy
### 7.1. Hypervisor
### 7.2. Virtual Machines
### 7.3. Linux Containers
### 7.4. Containerised Workloads

## 8. Network Architecture
### 8.1. Network Objectives
### 8.2. Bridges and Segmentation
### 8.3. External Access
### 8.4. Internal Service Communication

## 9. Service Architecture
### 9.1. Edge and Ingress
### 9.2. Application Services
### 9.3. Data Services
### 9.4. Utility Services
### 9.5. Monitoring and Observability
### 9.6. Game and Media Services

## 10. Lab Platform Architecture
### 10.1. Purpose of the Lab
### 10.2. Kubernetes / K3s Scope
### 10.3. Non-Production Workloads

## 11. Data and Storage Design

## 12. Security Architecture
### 12.1. Access Control
### 12.2. Network Security
### 12.3. Host Hardening
### 12.4. Secrets and Sensitive Data

## 13. Operations Model
### 13.1. Provisioning Approach
### 13.2. Backup and Recovery
### 13.3. Update and Patch Strategy
### 13.4. Logging, Monitoring, and Alerting

## 14. DevOps Alignment

## 15. Constraints and Trade-Offs

## 16. Planned Evolution