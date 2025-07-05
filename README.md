# summer2025_project
Building a Sports Data microservice to practice on architecture and tools.

This project will have three faces:
1. Microservice-face-phase, one of the core reasons this project idea was chose was to make sure there was an implementation of a microservice that would let me work more with containers - and hopefully touch Kubernetes too.

2. Two primary API: one that generates mock data and simulates a host that is livefed data that will be processed externally. And another that is the backend, handling the data and providing endpoints. Both written in. NET.

3. A super simple Frontend, its service is just to be the visualisation of what the rest of the project really does.

# This is the rough outline and initial idea:

## Core architecture concepts:
- Sports Data Generator API (.NET) - Simulates match results, player stats, league standings
- Sports Results API (NET) - Consumes and stores data, provides endpoints for frontend
- Simple Web Frontend - Razor pages initially, maybe swap to HTMX
- Data flow: Generator creates events -> Result-API processes/stores -> FE displays

## Software and Coding tools:
- openSUSE Tumbleweed with a minimal install and Sway/Wayland as window handlers
- VS Codium to use a telemetry-limited but still fullscale IDE
- C# Dev Tools for the debugger and dotnet toolings
- Software will primarily be written in .NET, frontend might be HTMX but might also be a super simple template bootstrap Razor

## Hosting and storage:
- Will use a pre-existing Virtual Machine at the Hetzner Cloud Host
- PostgreSQL
- Containers, containers, containers

## DevOps, IaC and CI/CD:
- Push to Main (scaled trunk deploy)
- GitHub Actions -> build containers -> push to registry -> Ansible deployment
- Docker Compose: (1) PostgreSQL-container, (2) "External" simulator-Generator-API-container, (3) Sports-results-.NET-API-container, (4) Frontend-container, (5) nginx/traefik-routing?
- Ansible: (a) handle Docker Container deploy, (b) PostgreSQL initialize/migration, (c) service updates, (d) configuration managements
- Terraform for provisioning/config
- Kubernetes: look at k3s-integration eventually
- Monitoring: Simple health checks (maaaybe Prometheus/Grafana later)

## Things to consider:
- API-communication: HTTP initially? RabbitMQ? Redis? etc for async comm?
- Monitoring: basic health checks, logging. This is Containers-land.
- Secrets: Kubernetes secrets? GitHub Secrets will be the easy initial path.

### Football League simulator:
- Generate 2-3 matches per week across multiple leagues
- Track: team standings, player goals, match results, season progress?
- Low data volume but realistic complexity
- Easy to visualize (statistics)

### Infrastructure strategy for Hetzner VM
- Single VM multi-container approach (keep costs down.. practice project)
- Use Docker Compose locally for development
- Deploy containers to Hetzner VM
- Reverse proxy for routing (nginx/traefik)?

#### Progression path:
1. Docker containers on VM with Docker Compose
2. Terraform steps in to provision and config the VM
3. Ansible is introduced to deploy application
4. Migrate to k3s-cluster on same VM as above

---

# Organisational, repo and folder structure

I am using this structure for the project: created a separate organisation to handle this project. There will be four repos under it:

```bash
sports-microservices/
├── sports_microservice_infrastructure/     # Terraform, Ansible, K8s configs
├── sports_microservice_generator_api/      # Mock data generation service API
├── sports_microservice_results_api/        # Core business logic (backend) API
├── sports_microservice_frontend/           # Razor Pages + HTMX? Frontend repo
└── .github/workflows/                      # Separate workflows per service
```
  
  