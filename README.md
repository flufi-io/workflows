# GitHub Workflows
This repository contains GitHub Actions workflows for automating Terraform operations (plan and apply) through comments on pull requests.

## Workflows
### terraform_apply.yaml
This workflow is responsible for running terraform apply after a successful plan. It is triggered when the terraform apply command is added as a comment to a pull request. It will download the generated Terraform plan artifact, decrypt it, and run terraform apply.

### terraform_apply_test.yaml
This is a test workflow that demonstrates how to use the terraform_apply.yaml workflow in a repository.

### terraform_plan.yaml
This workflow is responsible for running terraform plan when a comment is added to a pull request. It will initialize Terraform, run terraform plan, save the generated plan and Terraform state as an artifact, and encrypt the artifact.

### terraform_plan_test.yaml
This is a test workflow that demonstrates how to use the terraform_plan.yaml workflow in a repository.

### valid_comment.yaml
This workflow is responsible for validating the comment that triggered the workflow, extracting relevant information from the comment, and determining if it should trigger a terraform plan or terraform apply operation.

### valid_comment_test.yaml
This is a test workflow that demonstrates how to use the valid_comment.yaml workflow in a repository.

## How to use
1. Add the workflows to your repository.

2. Set up the necessary secrets in your repository (e.g. GITHUB_TOKEN, OIDC_ROLE, AWS_REGION).

3. Add the terraform_apply.yaml, terraform_plan.yaml, and valid_comment.yaml workflows to your .github/workflows directory.

4. Create a test workflow similar to terraform_apply_test.yaml or terraform_plan_test.yaml in your .github/workflows
   directory, and update it to fit your repository structure and requirements.

5. Trigger the workflow by adding a comment containing `terraform plan <environment>` or `terraform apply <environment>`
   to a pull request, where `<environment>` is one of the valid environments specified in the VALID_ENVIRONMENTS variable.


## [Wiki](https://github.com/flufi-io/workflows/wiki)
Please refer to the [wiki](https://github.com/flufi-io/workflows/wiki) page for more detailed documentation on the usage and configuration of these workflows.
