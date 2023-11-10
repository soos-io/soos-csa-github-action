#!/bin/bash -l

SOOS_APP_VERSION=${GITHUB_ACTION_REF}

SOOS_INTEGRATION_NAME="GitHub"
SOOS_INTEGRATION_TYPE="Plugin"

SOOS_BRANCH_NAME=${SOOS_BRANCH_NAME:-${GITHUB_REF}}

PARAMS=(
    "--apiKey ${SOOS_API_KEY}"
    "--apiURL ${SOOS_API_URL}"
    "--appVersion ${SOOS_APP_VERSION}"
    "--branchName ${SOOS_BRANCH_NAME}"
    ${SOOS_BRANCH_URI:+--branchUri ${SOOS_BRANCH_URI}}
    ${SOOS_BUILD_URI:+--buildUri ${SOOS_BUILD_URI}}
    ${SOOS_BUILD_VERSION:+--buildVersion ${SOOS_BUILD_VERSION}}
    "--checkoutDir ${GITHUB_WORKSPACE}"
    "--clientId ${SOOS_CLIENT_ID}"
    "--commitHash ${GITHUB_SHA}"
    "--integrationName ${SOOS_INTEGRATION_NAME}"
    "--integrationType ${SOOS_INTEGRATION_TYPE}"
    ${SOOS_OTHER_OPTIONS:+--otherOptions ${SOOS_OTHER_OPTIONS}}
    "--onFailure ${SOOS_ON_FAILURE}"
    "--projectName ${SOOS_PROJECT_NAME}"
    ${SOOS_VERBOSE:+--verbose}
)

PARAMS_STRING="${PARAMS[@]}"

node /usr/src/app/dist/index.js "${SOOS_TARGET_IMAGE}" ${PARAMS_STRING}
