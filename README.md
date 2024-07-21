# webhook

## Why

We want to clone postgres, apply changes and create a Pull Request from it.
Community does not (yet) accept Pull Requests, but even then using a PR to compile mails to the community is a nice entrypoint for any automation.
We do want use github actions for CI/CD, but we don't want github actions in our PR.
Therefore we have CI/CD in another repo, and we will use webhooks from github to initiate CI/CD.
Unfortunately, the payload for Postgres repo webhooks cannot directly be used as payload for workflow webhook calls.
So, we need translation to change the payload.

## What

This repo is a KISS solution for a webhook transformation service.
You can install it on any publicly available endpoint, and configure it as an endpoint to be triggered from your PostgreSQL repo.
You can use a secret to make sure it is only triggered from Github.

## How

Once properly setup, pushing new PostgreSQL changes to your GitHub repo makes it request the webhook, which translated into a curl command, which triggers your CI repo.
CI runs and you get results on your code changes in your CI repo.
