# [2024-05-25]

## Changed

- Updated GitHub Actions workflows to trigger on comments starting with '/terraform' instead of containing '/terraform'.
- Updated the terraform_apply workflow to use a specific YAML file for the apply operation.
- Enabled version updates for Terraform in the .github/actions directory in dependabot configuration.

# [2024-05-25] [20](https://github.com/flufi-io/workflows/issues/20)

## Added

- Introduced a new GitHub Action for Terraform initialization to streamline workflows.

## Changed

- Moved Terraform initialization steps from `terraform_precommit.yaml` to a dedicated GitHub Action to reduce workflow
  complexity.
