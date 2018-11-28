# TFE Policies Example

This repo provides an example of using Sentinel policies via VCS in Terraform Enterprise.


## Using with TFE

TFE Workspace found here: https://app.terraform.io/app/hashicorp-v2/tfe-policies-example

You can run a remote plan to test changes to Terraform config in `main.tf`. You'll to set the `TFE_TOKEN` environment variable. The plan will show the output for the _previous_ version of any policies associated with your workspace.

    > export TFE_TOKEN='<YOUR TFE TOKEN>'
    > terraform init
    > terraform plan

After you check in your changes. In your VCS's pull request, you'll again see a check using the _previous_ version of the sentinel policies.

When the PR is merged, you'll see a merge commit run in the workspace. Again, this uses only the _previous_ version of your sentinel policies. Once confirmed and applied, runs will use the new sentinel policy you just merged.


## Testing your Sentinel Policies Locally

    > sentinel test
    > sentinel apply passthrough.sentinel


# A Workspace from Scratch

Given that this repo is an example, you can use these files to set up a new workspace instead of just the ["Using with TFE"](#using-with-tfe) directions above.

- Copy the files from this repo
- `terraform init; terraform plan` will create the workspace (if it doesn't already exist) and make sure everything is configured properly.
- Switch the organization and workspace names in `main.tf`.
- Commit and push to your new repo
- Configure the VCS Settings in your new TFE Workspace
- Add your TFE Token to a new `tfe_token` variable (ex. https://app.terraform.io/app/hashicorp-v2/tfe-policies-example/variables)
- Queue a run and apply it

The next run of your workspace should be policy checked by `passthrough.sentinel`!


# Github Actions

This repo contains [an example](.github/main.workflow) of running `sentinel test` against your sentinel files as PR "checks". It uses a third-party action called `thrashr888/sentinel-github-actions/test` to run the tests. After submitting a PR, you'll see any test errors show up as a comment on the PR.

