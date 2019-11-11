# terminate on any error and return error code
set -e

. .env

# # ********* RUN TESTS *********
# # run API tests,failed test(s) return a 1 (error) and terminate this script

# # [GOOD PRACTICE] run your tests against a local server
# # requires your Postman collection and environment files to be located within the project directory
# # formatted like: newman run <name-of-collection.json> -e <name-of-environment.json>
# newman run Cosmos.postman_collection.json -e cosmos.postman_environment.json

# # [BETTER PRACTICE] run your tests using the Postman API (https://docs.api.getpostman.com/) to retrieve the latest versions of your collection and environment
# # requires collection UID, environment UID, and your Postman API key
# # formatted like: newman run <authenticated-GET-collection-request> -e <authenticated-GET-environment-request>
newman run https://api.getpostman.com/collections/${POSTMAN_COLLECTION_UID}?apikey=${POSTMAN_API_KEY} -e https://api.getpostman.com/environments/${POSTMAN_ENVIRONMENT_UID}?apikey=${POSTMAN_API_KEY}

# # ********* RUN LINTER *********
# # lint specification file, errors and warnings will terminate this script

# # [GOOD PRACTICE] lint a local specification file
# # requires your API specification file to be located within the project directory
# # formatted like: spectral lint <name-of-specification.yaml>
# spectral lint cosmos.yaml

# # [BETTER PRACTICE] lint the file using the Postman API (https://docs.api.getpostman.com/) to retrieve the latest version of your specification file
# # requires your API schema path and your Postman API key
spectral lint https://api.getpostman.com/${POSTMAN_API_SCHEMA_PATH}?apikey=${POSTMAN_API_KEY}
