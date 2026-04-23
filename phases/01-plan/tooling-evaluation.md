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

## 4. Tooling Categories Overview

## 5. Hypervisor Evaluation

### Options Considered

### Comparison Criteria

### Decision

### Rationale

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
