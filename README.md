# AWS Org Units Terraform module

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/cgetzen/terraform-aws-org-units-map)


Terraform module that collects existing AWS organizational units into a map for easy consumption.

## Usage

```hcl
module "org_units" {
  source = "cgetzen/org-units-map/aws"
  depth = 4
}

resource "aws_organizations_policy" "example" {
  ...
}

resource "aws_organizations_policy_attachment" "example" {
  policy_id = aws_organizations_policy.example.id
  target_id = module.org_units.ids["production_ou"]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| depth | The org unit depth | `number` | `5` | no |


## Outputs

| Name | Description |
|------|-------------|
| ous | OU structure showing parents and children |
| ids | Map of OU names to ids |
