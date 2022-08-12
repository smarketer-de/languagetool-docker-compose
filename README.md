# LanguageTool Docker-Compose Quickstart

This repository hosts a ready-to-use Docker-Compose file for hosting a custom LanguageTool server with custom hunspell dictionary and automatic installation of german (and optionally english) ngrams library.

It also contains a GitHub actions workflow for automatically deploying to AWS Elastic Beanstalk.

## Requirements

- Docker
- Docker Compose

## Installation

1. Clone this repository
2. Run `docker-compose up -d` to build and start the server

The first start may be slow because the server needs to download the ngrams library (approx. 1.6GiB).

## Beanstalk integration

The repository contains a GitHub actions workflow that automatically deploys to AWS Elastic Beanstalk when commits to the `main` branch are made.

To set up the integration, define these secrets in GitHub Actions:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION` (e.g. "eu-central-1")
- `EB_APPLICATION_NAME` (Application name in AWS Elastic Beanstalk)
- `EB_ENV_NAME` (Environment name in AWS Elastic Beanstalk)

## Usage

After deploying, the LanguageTool server is accessible at `http://example.com/v2/check`. For more information on using the API, see [the LanguageTool API documentation](https://languagetool.org/http-api/#!/default/post_check).
