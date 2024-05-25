# [2024-05-25]

## Added

- Introduced a new GitHub Action for running pre-commit checks on Terraform files, utilizing caching to enhance speed.
- Updated the workflow to use the new pre-commit Terraform GitHub Action.

## Changed

- Optimized the installation of pre-commit dependencies by using a consolidated action with caching capabilities.
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
