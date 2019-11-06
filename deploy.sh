# terminate on any error
set -e

. .env

npm run build

# ********* RUN TESTS *********
# run API tests against a local server, failed test(s) return a 1 (error) and terminate this script

# # [GOOD PRACTICE] run your tests against a local server
# # requires your Postman collection and environment files to be located within the project directory
# # formatted like: newman run <name-of-collection.json> -e <name-of-environment.json>

# # [BETTER PRACTICE] run your tests using the Postman API (https://docs.api.getpostman.com/) to retrieve the latest versions of your collection and environment
# # requires collection UID, environment UID, and your Postman API key
# # formatted like: newman run <authenticated-GET-collection-request> -e <authenticated-GET-environment-request>
newman run https://api.getpostman.com/collections/1559979-11741a32-035d-46d8-928c-b94ae0b782fb?apikey=${POSTMAN_API_KEY}

# can use a Postman environment switch tests over to run against container on http://localhost:5501
set +e
newman run ...
EXIT_CODE=$?

# ********* RUN LINTER *********
# an example of an OpenAPI v3 file from https://github.com/OAI/OpenAPI-Specification/blob/master/examples/v3.0/petstore.yaml
spectral lint https://api.getpostman.com/apis/${POSTMAN_API_SCHEMA_PATH}?apikey=${POSTMAN_API_KEY}

