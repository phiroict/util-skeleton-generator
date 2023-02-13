UTIL_NAME=${1:-"UTIL"}
UTIL_TYPE=${2:-"bash"}
TEST_RESULT="${3:-"true"}"
OUTPUT_DIR="${4:-"."}"
SOURCE_DIR="src"
ADR_DIR="adr"
DIRS="${SOURCE_DIR} ${ADR_DIR} infra test init/resources"
cd ..
SCRIPT_DIR=$(pwd)
cd -

function create_skeleton
{
  UTIL_NAME="${1}"
  DIRS="${2}"
  OUTPUT_DIR="${3}"
  mkdir -p  "${OUTPUT_DIR}/${UTIL_NAME}"
  cd "${OUTPUT_DIR}/${UTIL_NAME}" || exit 1
  for DIR in $DIRS; do
    mkdir -p "${DIR}"
  done
}

function create_source_file
{
  UTIL_TYPE="${1}"
  SOURCE_DIR="${2}"
  UTIL_NAME="${3}"
  OUTPUT_DIR="${4}"
  if [ "bash" == "${UTIL_TYPE}" ]; then
    touch "${OUTPUT_DIR}/${SOURCE_DIR}/${UTIL_NAME}.sh"
    echo "#! /bin/bash" >> "${SOURCE_DIR}/${UTIL_NAME}.sh"
  elif [ "python" == "${UTIL_TYPE}" ]; then
    touch "${OUTPUT_DIR}/${SOURCE_DIR}/${UTIL_NAME}.py"
  elif [ "terraform" ==  "${UTIL_TYPE}" ]; then
    touch "${OUTPUT_DIR}/${SOURCE_DIR}/${UTIL_NAME}.tf"
  elif [ "ansible" == "${UTIL_TYPE}" ]; then
    touch "${OUTPUT_DIR}/${SOURCE_DIR}/${UTIL_NAME}.yaml"
  else
    touch "${OUTPUT_DIR}/${SOURCE_DIR}/${UTIL_NAME}.txt"
  fi
}

function run_adr_init_if_exists
{
  if which adr >/dev/null; then
      ORIGINAL_DIR=$(pwd)
      cd "${1}" || exit 1
      adr init
      cd "${ORIGINAL_DIR}" || exit 1
  else
      echo "ADR tools are not installed, skipping this step"
  fi
}

function result_report
{
  if "${1}"; then
    tree .
  fi
}

function set_resources
{
  cd /src/src
  OUTPUT_DIR="${1}"
  UTIL_NAME="${2}"
  SCRIPT_DIR="${3}"
  # Using find here as mv and cp do unexpected things with wildcards, like not finding any files.
  find "${SCRIPT_DIR}/init/resources" -type f -exec cp {} "${OUTPUT_DIR}/${UTIL_NAME}" \;
  find "${OUTPUT_DIR}/${UTIL_NAME}" -type f -exec sed -i "s/{{ UTILNAME }}/$UTIL_NAME/g"  {} \;

}

create_skeleton "${UTIL_NAME}" "${DIRS}" "${OUTPUT_DIR}"
create_source_file "${UTIL_TYPE}" "${SOURCE_DIR}" "${UTIL_NAME}" "${OUTPUT_DIR}"
run_adr_init_if_exists "${ADR_DIR}"
set_resources "${OUTPUT_DIR}" "${UTIL_NAME}" "${SCRIPT_DIR}"
result_report "${TEST_RESULT}"