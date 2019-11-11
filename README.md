### Pre-requisites for local development

1. Download and install [Node.js](https://nodejs.org/en/) and a package manager like [npm](https://www.npmjs.com/)

### For Development

    npm install // install dependencies
    npm start // start app

### For Production

**Environment variables**: Create a new file called `.env` located in the root of your project directory. You will need to add your own credentials and configuration information. See the example in `.env.example`.

**API tests**: If you plan to run Postman tests, then update the `./bin/deploy.sh` file by selecting a method of running your Postman tests. To run the second option, update your Postman collection UID, Postman environment UID, and your [Postman API](https://docs.api.getpostman.com/) key in the `.env` file you created in the previous step.

- [`GET` All collections](https://docs.api.getpostman.com/?version=latest#3190c896-4216-a0a3-aa38-a041d0c2eb72) (to get `collection_uid`)
- [`GET` ALL environments](https://docs.api.getpostman.com/?version=latest#d26bd079-e3e1-aa08-7e21-66f55df99351) (to get `environment_uid`)

**Lint specification file**: If you plan to lint an API specification file, then update your Postman API schema path and your [Postman API](https://docs.api.getpostman.com/) key in the `.env` file you created in the first step. The configuration details for the schema path can be identified with the following steps.

- [`GET` All workspaces](https://docs.api.getpostman.com/?version=latest#5b53aa96-042d-4bc2-8c85-c10bc7ea0553) (to get `workspaceId`)
- [`GET` All APIs](https://docs.api.getpostman.com/?version=latest#3ebf9324-fb36-4e44-81cf-c24915515272) (to get `apiId`)
- [`GET` All API versions](https://docs.api.getpostman.com/?version=latest#453556e3-861c-41cc-8d69-708b70654e29) (to get `apiVersionId`)
- [`GET` An API version](https://docs.api.getpostman.com/?version=latest#e7e1d153-a66c-4ecc-b541-864543d14198) (to get `schemaId`)
- [`GET` Schema](https://docs.api.getpostman.com/?version=latest#bd7a4248-24f5-459c-8719-29a78991de02) (this URL contains the schema path to add to your `.env` file)

**Deploy**: Run the deployment script

npm run deploy // run API tests, and then lint specification file
