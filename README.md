---
title: Terraform IaC DevOps using AWS CodePipeline
description: Create AWS CodePipeline with Multiple Environments Dev and Staging
---

# Introduction

1. Infrastructure is defined in Terraform code and is being run from GitHub using AWS CodePipeline.
2. Infrastructure

- VPC (Multi-AZ)
- IAM
- Security Groups
    - Bastion Host
    - Private
    - Load Balancer
- EC2 Instances
    - Single EC2 Instance for Bastion Host
    - Other instances managed with AutoScaling Group and Launch Template
- Application Load Balancer
    - Fixed response
    - Host-based routing based on path pattern
    - HTTPS redirection
- ACM TLS Certificate
- Route53 DNS Registration
- AutoScaling
    - Target Tracking (AVG CPU Load, AVG LB Connections to single target)
    - Scheduled
- Backend for Remote State Storage
- DynamoDB State Lock - Optional - Not required as only single instance of pipeline can run at a given time

3. Multiple environments managed by their respective configuration files.

- AWS CodeBuild
- AWS CodePipeline
- Github

# Architecture

![Infrastructure](./assets/infrastructure.png "")
![Dev Infrastructure](./assets/infrastructure_dev.png "")
![Stag Infrastructure](./assets/infrastructure_stag.png "")

# Configuration / Use

- DNS

## Dependencies

## Manual steps

- AWS Keys in Parameter store
- CloudWatch Log Groups
- Manual Approval Stage

## Pipeline configuration files

### Building new region

- Configure region-specific codebuild
- Configure region-specific codepipeline

# TODO

- .gitignore to ignore manual runs a1-codepipeline.
- storing and distributing EC2 private key
- Load Balancer connections policy
- Modularize the environment for codebuild
- No dependencies on external resources (i.e. S3 resource for the backend, backend MUST exist)
- 1 pipeline using stages and 2 codebuilds to separate environments
- name mismatch in backend

# Disclaimer

This series draws heavily from **Kalyan Reddy Daida**’s [Terraform on AWS with SRE & IaC DevOps](https://www.udemy.com/course/terraform-on-aws-with-sre-iac-devops-real-world-demos/) course on Udemy.

[His content](https://www.udemy.com/user/kalyan-reddy-9/) was a game-changer in helping me understand Terraform.

<!-- About the instructor -->

<table>
  <thead>
      <tr>
          <th>About the instructor</th>
          <th></th>
      </tr>
  </thead>
  <tbody>
      <tr>
          <td>🌐 <a href="https://stacksimplify.com/" target="_blank" rel="noreferrer">Website</a>
</td>
          <td>📺 <a href="http://www.youtube.com/stacksimplify" target="_blank" rel="noreferrer">YouTube</a>
</td>
      </tr>
      <tr>
          <td>💼 <a href="http://www.linkedin.com/in/kalyan-reddy-daida" target="_blank" rel="noreferrer">LinkedIn</a>
</td>
          <td>🗃️ <a href="https://github.com/stacksimplify" target="_blank" rel="noreferrer">GitHub</a>
</td>
      </tr>
  </tbody>
</table>

<!-- /About the instructor -->
