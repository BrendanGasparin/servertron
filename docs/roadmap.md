# Project: SERVERTRON Roadmap

## 1. Executive Summary

SERVERTRON is a DevOps homelab and production-style infrastructure for hosting websites, media, game services, and other future services.

The goal is to mirror real-world enterprise infrastructure as closely as possible (without unnecessary costs or drawbacks) for learning purposes.  

This roadmap outlines the phased development of the SERVERTRON infrastructure from planning through to coding, testing, deployment, operations, and monitoring.  

## 2. Guiding Principles

The guiding principles of Project: SERVERTRON are as follows:  

- To build production-style architecture
- To prioritise learning and real-world relevance
- Keep services isolated with a VM-first approach
- Prefer open source tools due to transparency and quality
- Document everything publicly

## 3. Current State

[Planning stage](../phases/01-plan/README.md).  

## 4. DevOps Lifecycle Roadmap

The DevOps lifecycle is an iterative loop, divided into both (software) development and operations, and consists of four phases.  

![Diagram of the DevOps lifecycle.](./images/devops-lifecycle.png)

### Phase 1: PLAN

**Goal:** Define all major architecture and tooling decisions.  

**Deliverables:**  

- Architecture document and diagram
- VM allocation plan
- Tooling evaluation document
- Network design
- Security model (Cloudflare, exposure strategy)

### Phase 2: CODE

**Goal:** 

### Phase 3: BUILD

### Phase 4: TEST

### Phase 5: RELEASE

### Phase 6: DEPLOY

### Phase 7: OPERATE

### Phase 8: MONITOR

## 5. Future Enhancements

- Multinode cluster (Proxmox or Kubernetes) with high availability setup
- VLAN segementation
- VPN access (e.g. Wireguard, Tailscale)
- NextCloud integration (for apps and cloud storage)
- CDN/edge optimisation

## 6. Milestones

| Milestone | Decription                | Status ✅/⏳  |
|-----------|---------------------------|----------------|
| M1        | Architecture defined      | ⏳            |
| M2        | Core VMs deployed         | ⏳            |
| M3        | First public service live | ⏳            | 
| M4        | Monitoring operational    | ⏳            |
| M5        | Kubernetes lab active     | ⏳            |


## 7. Notes

This roadmap is iterative and will evolve in the future.

The focus of this project is on both learning and real world applicability, while also self-hosting services I want.  

Not all features may be implemented immediately.  
