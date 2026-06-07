# Project: SERVERTRON Phase 1 Retrospective

## 1. Overview

Phase 1 of Project: SERVERTRON focused on defining the structure, goals, and architecture of the project, before implementation work begins.  

This phase produced:
- [Project goals](./goals.md)
- [Project constraints and assumptions](./constraints.md)
- [Initial architecture notes](./initial-architecture-notes.md)
- [Tooling evaluation](./tooling-evaluation.md)
- [Architecture document](../../docs/architecture.md)
- [Project charter](./project-charter.md)

The objective of establishing a production-style system design prior to implementation was successful.  

## 2. What Went Well

Things that went well with the project included:

- The decision to fully design the system before building provides clarity and direction
- The architecture evolved into a clean, layered structure with separation of concerns
- Production and lab environments were clearly defined and isolated
- Architectural and tooling decisions were made with clear rationales and recorded in the [decisions document](../../docs/decisions.md)
- Research into architecture and tooling topics will make future phases easier
- Decision to switch from Plex media server to Jellyfin will likely save money in the future

The planning phase resulted in a coherent system design that can be implented in the coming phases.  

## 3. What Did Not Go Well

Things that were difficult, inefficient, or unclear included:

- The document structure required revision several times
- Some areas of the design were overthought
- Certain concepts were duplicated across sections before being consolidated
- Infrastructure-as-Code tools were not planned due to time constraints

These issues did not block progress but did reduce efficiency.  

## 4. Key Challenges

Specific challenges encountered in the project included:

- Balancing realism with simplicity in a single-node home environment
- Avoiding overengineering while also aiming to mirror real-world infrastructure
- Deciding the correct level of detail for architectural document
- Maintaining separation between documentation types (e.g. architecture, notes, decisions)

## 5. Lessons Learned

The following lessons were learned in Phase 1:  

- Defining document structure early reduces rework later
- Architecture documents should focus on principles and design, not implementation detail
- Perfect is the enemy of good: better to move forward with a good structure than delay for a perfect one
- Resource allocation should be conservative during planning and adjusted during implementation
- Not all decisions in the planning phase need to be final

## 6. What Would Be Done Differently

Improvements to keep in mind for future projects include:  

- Establishing a full document structure earlier in the phase
- Limiting iteration on non-critical details like wording and formatting
- Moving to implementation sooner once the architecture is coherent
- Avoiding waiting for perfection on every section before progressing

## 7. Decisions Validated

The follow decisions are considered strong and will be carried forward:  

- Use of Proxmox VE as the hypervisor
- VM-based isolation for core services
- Separation of production and lab environments
- Use of Docker for application workloads
- Hybrid exposure model (reverse proxy and direct access)
- Use of ZFS for storage
- Use of Jellyfin as the media server

These decisions form a solid foundation for implementation.  

## 8. Carry Forward Actions

Actions to be carried forward to future phases include:  

- Beginning with a minimal, functional implementation of the core architecture
- Validating networking and service exposure early
- Introducing monitoring alongside initial deployments
- Adjusting resource allocation based on real usage rather than estimates
- Keeping documentation aligned with implementation as the system evolves

## 9. Final Reflection

Phase 1 successfully established a clear and structured foundation for Project: SERVERTRON.  

While some inefficiencies occurred due to iteration and over-refinement, the resulting architecture is coherent, realistic, and implementable.  

The project is now in a strong position to transition into the second phase.  
