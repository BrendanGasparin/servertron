# Phase 2: Code

Phase 2: CODE of Project: SERVERTRON defines the architecture and design decisions created in Phase 1: PLAN as version-controlled infrastructure code and configuration files.  

The purpose of this phase is to establish a reproducible, maintainable, and documented codebase from which SERVERTRON infrastructure can be provisioned, configured, and managed.  

## 1. Objectives

The objective of this phase is to define infrastructure as code (IaC) and configuration as code (CaC) capable of:  

- Provisioning virtual machines and containers on Proxmox VE.
- Automating initial operating system configuration.  
- Managing operating system and application configuration.  
- Defining containerised services and their dependencies.  
- Defining networking, reverse proxy, and security configurations.
- Supporting separate production and lab environments.
- Validating infrastructure code and configuration before deployment.
- Maintaining GitHub as the source of truth for infrastructure definitions.

These objectives build upon the goals, constraints, and architecture established in [Phase 1: PLAN](../01-plan/README.md).  

## 2. Implementation Scope

The following technologies and configuration types are included in Phase 2:  

### 2.1. Terraform

Terraform is used to define and provision Proxmox VE infrastructure, including virtual machines, containers, storage allocations, and networking configurations.  

### 2.2. Cloud-init

Cloud-init is used to automate the initial configuration of Ubuntu Server virtual machines, including user accounts, SSH access, and networking.  

### 2.3. Ansible

Ansible is used to automate operating system configuration, security hardening, package installation, and service configuration.  

### 2.4. Docker Compose

Docker Compose files define containerised applications, dependencies, networks, volumes, and configuration.  

### 2.5. Service Configuration

Version-controlled configuration files define the operation of infrastructure services, including NGINX, monitoring components, and the K3s lab environment.  

### 2.6. Validation and Automation

Scripts and automated validation workflows check configuration correctness and maintain code quality before infrastructure changes are applied.

## 3. Related Project Documentation

General documents related to the project that may be modified after Phase 2:

- [docs/roadmap.md](../../docs/roadmap.md): Project roadmap and lifecycle stages
- [docs/architecture.md](../../docs/architecture.md): System architecture and design
- [docs/decisions.md](../../docs/architecture.md): Architecture decisions and rationales

## 4. Phase 2 Documentation and Code

The principal implementation artefacts for this phase are maintained in the project's infrastructure directories.  

- `infrastructure/terraform/`: Infrastructure provisioning definitions.
- `infrastructure/cloud-init/`: Initial virtual machine configuration.
- `infrastructure/ansible`: Configuration management playbooks and roles.
- `services/`: Application and infrastructure service definitions.

Phase-specific documentation will record implementation decisions, configuration conventions, technical challenges, and lessons learned.  

Code and configuration files will continue to evolve as SERVERTRON progresses through subsequent lifecycle phases.  

## 5. Completion Criteria

Phase 2 will be considered complete when:  

- [ ] Core infrastructure resources are defined in version-controlled code.  
- [ ] Initial VM configuration is automated using cloud-init.  
- [ ] Baseline configuration management is defined using Ansible.  
- [ ] Initial application and infrastructure service configurations are defined.  
- [ ] Sensitive credentials and environment-specific secrets are excluded from version control.  
- [ ] Infrastructure code and configurations pass appropriate validation checks.  
- [ ] Impelementation instructions and dependencies are documented.  
- [ ] The codebase is sufficiently prepared to support Phase 3: BUILD.  

The completion of Phase 2 establishes the code foundation for provisioning and configuring SERVERTRON. Infrastructure deployment, functional testing, and operational validation are addressed in subsequent lifecycle phases.  
