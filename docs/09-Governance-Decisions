# Platform Governance Decisions

## Branch Protection Strategy
**Decision:** Direct pushes to `main` are prohibited.

**Why:**
- Prevents unreviewed changes
- Ensures traceability and accountability

**Tradeoffs:**
- Slower for urgent changes
- Mitigated by clear PR workflows

---

## Required Reviewers
**Decision:** Project Administrators group required for approvals.

**Why:**
- Enforces separation of duties
- Prevents self-approval

---

## Work Item Enforcement
**Decision:** All pull requests must link a work item.

**Why:**
- Improves auditability
- Aligns code changes to business intent

---

## CI Validation for Terraform
**Decision:** Enforce `terraform fmt`, `init`, and `validate` on PRs.

**Why:**
- Prevents broken IaC from reaching main
- Avoids state/backend dependencies

---

## Self-Hosted Agent Usage
**Decision:** Use self-hosted agents due to hosted parallelism constraints.

**Why:**
- Ensures pipeline availability
- Enables consistent tooling
