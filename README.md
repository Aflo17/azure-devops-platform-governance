# Azure DevOps Platform Governance with Terraform Validation

## Project Overview

This project demonstrates **enterprise-grade Azure DevOps (ADO) platform governance** using real-world controls, policies, and automation.  
It simulates how a central **Platform Enablement / DevOps Governance team** would design, enforce, and operationalize standards across teams—without relying on tribal knowledge or manual enforcement.

By the end of this project, you will have:
- A protected `main` branch
- Mandatory pull requests with reviewer enforcement
- Work item traceability
- Terraform validation enforced via CI
- A self-hosted Azure DevOps agent
- Governance dashboards that reflect platform health

This is **not** a simple pipeline demo—this mirrors how mature enterprises run Azure DevOps at scale.

---

## Scenario

**Organization:** Northwind Health  
**Platform Team:** Platform Enablement  
**Problem:**  
Multiple app teams are pushing changes inconsistently:
- Direct pushes to `main`
- No consistent reviews
- Terraform changes not validated
- Poor traceability between work and code

**Goal:**  
Design and implement **defensible, auditable Azure DevOps governance** that:
- Enforces consistency
- Reduces risk
- Scales across teams
- Balances control with developer velocity

---

## Architecture Summary

- **Azure DevOps Organization**
- **Single Governance Project**
- **Multiple App Teams**
- **Protected `main` branch**
- **Terraform CI validation**
- **Self-hosted Windows agent**
- **Governance dashboards**

---

## Phase 1 – Azure DevOps Organization & Project Setup

### Step 1: Create Azure DevOps Organization
- Create a new Azure DevOps organization
- Choose region (United States recommended)

### Step 2: Create Project
- Project name: `Northwind-Platform-Governance-ado`
- Visibility: Private
- Version control: Git
- Work item process: Basic

---

## Phase 2 – Team & Area Path Design

### Step 3: Create Teams
Create the following teams:
- `Platform Enablement` (governance & CI/CD)
- `App Team Atlas`
- `App Team Borealis`
- `App Team Cygnus`

### Step 4: Configure Area Paths
Under **Project Settings → Boards → Project configuration → Areas**:
- Root: `Northwind-Platform-Governance-ado`
- Child areas:
  - `Platform Enablement`
  - `App Team Atlas`
  - `App Team Borealis`
  - `App Team Cygnus`

Associate each team with its respective area path.

---

## Phase 3 – Work Item Governance

### Step 5: Create Governance Work Items
Create work items such as:
- Epics (strategic initiatives)
- Issues (governance requirements)
- Tasks (implementation work)

Examples:
- *Improve reporting and compliance*
- *Establish repo governance policies*
- *Enforce Terraform validation*

Tag work items (`governance`, `terraform`, `compliance`) to improve visibility.

---

## Phase 4 – Repository & Branch Governance

### Step 6: Initialize Repository
- Create a Git repo in Azure DevOps
- Clone locally
- Add initial README and Terraform structure

### Step 7: Branch Strategy
- `main` → protected
- `feature/*` → development branches
- All changes flow via Pull Requests

---

## Phase 5 – Branch Policies (Core Governance)

Configure **Branch Policies** on `main`:

### Required Policies
- ✅ Minimum 1 reviewer
- ✅ Reviewer must be **Project Administrators**
- ✅ Prohibit most recent pusher from approving
- ✅ Reset approvals on new pushes
- ✅ Require linked work items
- ✅ Require comment resolution
- ✅ Block direct pushes to `main`

This enforces **separation of duties** and **change accountability**.

---

## Phase 6 – Terraform CI Validation

### Step 8: Add Terraform Structure
Example directory:

terraform/
└── sample/
├── main.tf

### Step 9: Create Azure Pipeline (YAML)

Pipeline validates Terraform **without deploying anything**.

Key stages:
- Checkout repo
- Install Terraform
- `terraform fmt -check`
- `terraform init -backend=false`
- `terraform validate`

### Sample Pipeline Logic
- Runs on pull requests
- Fails fast on formatting or validation errors
- Blocks merge if validation fails

---

## Phase 7 – Self-Hosted Agent Setup

### Why Self-Hosted?
Microsoft-hosted parallelism is often unavailable in free orgs.  
Self-hosted agents are common in enterprises.

### Steps
1. Create a Windows VM or use local machine
2. Download Azure DevOps agent
3. Create a Personal Access Token (PAT)
4. Configure agent:
   - Pool: `Default`
   - Run as a service
5. Confirm agent is **Online**

---

## Phase 8 – Build Validation Policy

### Step 10: Enforce CI on Pull Requests
Under **Branch Policies → Build Validation**:
- Pipeline: Terraform validation pipeline
- Trigger: Automatic
- Policy: Required
- Path filter: `/terraform/*`

Result:
> No Terraform changes can be merged without passing validation.

---

## Phase 9 – Dashboards & Visibility

### Dashboard Widgets
- **Pull Requests** – shows active governance pressure
- **Markdown** – documents governance rules
- **Query Results** – shows active governance work
- **Build History** – CI health over time

### Important Note
Pull Request widgets **only show active PRs**.  
Completed PRs disappearing is expected and indicates healthy governance.

---

## Governance Controls Summary

The platform enforces:

- ✔ All changes require Pull Requests
- ✔ Minimum 1 approver (Project Administrators)
- ✔ Work items must be linked
- ✔ Terraform validation required before merge
- ✔ Direct pushes to `main` are blocked
- ✔ CI failures block PR completion

---

## Why This Project Matters

This project demonstrates:
- Platform-level thinking
- Governance without over-automation
- Real Azure DevOps constraints
- Enterprise-grade DevOps practices
- Defensible design decisions with tradeoffs

It is suitable for:
- Cloud Engineer
- DevOps Engineer
- Platform Engineer
- Infrastructure Engineer
- Azure-focused roles

---

## How to Use This Repo

1. Fork or clone the repository
2. Recreate the Azure DevOps project
3. Follow each phase step-by-step
4. Compare your results with the governance outcomes
5. Extend with:
   - Security scanning
   - Approval gates
   - Environment promotions

---

## Final Notes

This project intentionally avoids:
- Over-engineering
- Paid-only features
- Unrealistic shortcuts

Everything here reflects **how Azure DevOps is actually used in production environments**.

---

## Author

Built as a hands-on platform governance project to demonstrate real-world Azure DevOps expertise.

---

✅ **Project Status: Complete**
