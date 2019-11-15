# Test APIs and lint specifications with Newman and Spectral

**Cosmos** is a sample API that retrieves constellations as an example to demonstrate features in the OpenAPI 3.0 specification. This project is part of a blog post about [Bringing law and order to APIs with OpenAPI Specifications](https://medium.com/@joycelin.codes/api-specifications-d87588ac874).

![OpenAPI Newman Spectral logos](https://cdn-images-1.medium.com/max/1200/1*yAeA5MTf6B0XO5MRXhFDwg.png)

## Option 1 
**Explore in Postman**: explore this collection (generated from an OpenAPI specification file) by clicking the orange **Run in Postman** button below. Make sure you have [a Postman environment](https://learning.getpostman.com/docs/postman/environments-and-globals/manage-environments/) called `cosmos` selected in the Postman app. There should be a key `baseUrl` with the value `https://e8c086f7-a5c9-4752-b81f-bfac0d0dc5d2.mock.pstmn.io`.

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/83a63bdb74171c8dbd30#?env%5Bcosmos%5D=W3sia2V5IjoiYmFzZVVybCIsInZhbHVlIjoiaHR0cHM6Ly9lOGMwODZmNy1hNWM5LTQ3NTItYjgxZi1iZmFjMGQwZGM1ZDIubW9jay5wc3Rtbi5pbyIsImVuYWJsZWQiOnRydWV9XQ==)

## Option 2 
**Explore in terminal**: follow the quick start below to set up this example project in your terminal or continuous integration workflow.

![run tests and lint specs](https://cdn-images-1.medium.com/max/2400/1*f6mAmgWiUZmgV79-VBaFsQ.gif)

# Quick Start

## Pre-requisites for local development

1. Create a Postman account to use the [Postman API](https://docs.api.getpostman.com) to programmatically access data stored in your Postman account. You can skip this step if you're working with standalone files of your Postman collection and OpenAPI specification.
1. Make sure you have [Node.js](https://nodejs.org/en/) and a package manager like [npm](https://www.npmjs.com/) installed on your machine.

## For Development

    $ git clone https://github.com/postmanlabs/spectral-postman.git // clone this repo
    $ cd spectral-postman // change into the new directory
    $ npm install // install dependencies

**Set up environment variables**: Create a new file called `.env` located in the root of your project directory. You will need to add your own credentials and configuration information as outlined in the following steps. See the example in `.env.example`.

**Run API tests**: If you plan to run Postman tests, then update the `./bin/deploy.sh` file by selecting a method of running your Postman tests. To run the second option, update your Postman collection UID, Postman environment UID, and your [Postman API](https://docs.api.getpostman.com/) key in the `.env` file you created in the previous step.

- [`GET` All collections](https://docs.api.getpostman.com/?version=latest#3190c896-4216-a0a3-aa38-a041d0c2eb72) (to get `collection_uid`)
- [`GET` ALL environments](https://docs.api.getpostman.com/?version=latest#d26bd079-e3e1-aa08-7e21-66f55df99351) (to get `environment_uid`)

**Lint specification file**: If you plan to lint an API specification file, then update your `./bin/deploy.sh` file by selecting a method of linting your specification file. To run the second option, update your Postman API schema path and your [Postman API](https://docs.api.getpostman.com/) key in the `.env` file you created in the first step. The configuration details for the schema path can be identified with the following steps.

- [`GET` All workspaces](https://docs.api.getpostman.com/?version=latest#5b53aa96-042d-4bc2-8c85-c10bc7ea0553) (to get `workspaceId`)
- [`GET` All APIs](https://docs.api.getpostman.com/?version=latest#3ebf9324-fb36-4e44-81cf-c24915515272) (to get `apiId`)
- [`GET` All API versions](https://docs.api.getpostman.com/?version=latest#453556e3-861c-41cc-8d69-708b70654e29) (to get `apiVersionId`)
- [`GET` An API version](https://docs.api.getpostman.com/?version=latest#e7e1d153-a66c-4ecc-b541-864543d14198) (to get `schemaId`)
- [`GET` Schema](https://docs.api.getpostman.com/?version=latest#bd7a4248-24f5-459c-8719-29a78991de02) (this URL contains the schema path to add to your `.env` file)

**Run deployment script**: The deployment script `./bin/deploy.sh` will run the API tests and lint the specification file. If either check returns an error, the deployment script will terminate with the appropriate exit code.

    $ npm run deploy
