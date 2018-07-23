## \fn init_data [script]
## \brief Initialize DATADIR variable and create directory
## \stdout Path to data directory
init_data() {
  local script="${1:-$0}"
  # shellcheck disable=SC2154
  local data_dir="${SHELLM_DATA}/${script##*/}"
  mkdir -p "${data_dir}" 2>/dev/null
  echo "${data_dir}"
}

## \fn get_data_dir [script]
## \brief Echo the path to data directory
## \stdout Path to data directory
get_data_dir() {
  local script="${1:-$0}"
  echo "${SHELLM_DATA}/${script##*/}"
}
