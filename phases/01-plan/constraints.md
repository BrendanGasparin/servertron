# Project: SERVERTRON Constraints and Assumptions

The following constraints and assumptions define the operating boundaries of Project: SERVERTON:

## 1. Hardware Constraints

- The host machine, SERVERTRON-1, is pre-existing infrastructure
- Further expenditure on the project will be minimal and limited to necessary hardware due to failure.
- SERVERTRON-1 is a single-node environment with the following limits:
    - 16 logical cores
    - 64 GB RAM
    - 2 TB NVMe internal storage.

---

- Production workloads must be isolated from development, learning, and experimental environments.
- Internet-facing services (and internal ones) must be kept secure and available.
- Kubernetes will not be used in the production environment as it is designed for multi-node systems and adds unnecessary complexity to the project.
