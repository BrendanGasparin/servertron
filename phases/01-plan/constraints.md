# Project: SERVERTRON Constraints

The following are constraints of Project: SERVERTRON:

- The host machine, SERVERTRON-1, is pre-existing infrastructure. Further expenditure on the project will be minimal unless necessary hardware fails.
- Production workloads must be isolated from development, learning, and experimental environments.
- Internet-facing services (and internal ones) must be kept secure and available.
- Kubernetes will not be used in the production environment as it is designed for multi-node systems and adds unnecessary complexity to the project.
- SERVERTRON-1 is limited by its specifications: 16 logical cores, 64 GB RAM, and a 2 TB NVMe for internal storage.
