# Project: SERVERTRON Phases

Project: SERVERTRON follows a structured DevOps lifecycle to guide the design, implementation, and operation of its infrastructure.  

This lifecycle is usually represented by an iterative loop of eight consecutive steps.  

![DevOps lifecycle diagram](../images/devops-lifecycle.png)
*DevOps lifecycle diagram.*  

## DevOps Lifecycle Phases

These phases, their related documentation, and their roles within Project: SERVERTRON, are:  

1. [PLAN](./01-plan/README.md): Plan the project. For this project, that means defining goals, constraints, architecture, and tooling.
2. CODE: Write the code. For Project: SERVERTRON, this means creating configuration files, infrastructure definitions, and automated installation scripts.
3. BUILD: Build the project. For SERVERTRON, this involves provisioning infrastructure and services.
4. TEST: Validate the system's functionality.
5. RELEASE: Release the project.
6. DEPLOY: Deploy the system into operating environment(s). For SERVERTRON, this means exposing services externally, to the Internet.
7. OPERATE: Run and maintain the system.
8. MONITOR: Observe system performance as feedback for improvement in the next iteration of the lifecycle.

## 2. Notes

- This lifecycle is iterative, with each phase feeding into the next
- Not all phases are fully implemented yet
- Documentation for each phase is stored within the corresponding directory under `/phases/`
