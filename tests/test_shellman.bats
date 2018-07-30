load data

shellm-source shellm/shellman/lib/shellman.sh

_shellman() {
  local arg status=${success}
  for arg in "$@"; do
    if ! shellman -cwi "require,export" "${arg}"; then
      status=${failure}
    fi
  done
  return ${status}
}

_has_tag() {
  local script status=${success}
  local checked_tag="$1"
  shift
  for script in "$@"; do
    if ! shellman_get "${checked_tag}" "${script}" >/dev/null; then
      echo "${script}: missing tag ${checked_tag}"
      status=${failure}
    fi
  done
  return ${status}
}

_usage_matches_script_name() {
  local script usage usages status=${success}
  for script in "$@"; do
    if usages=$(shellman_get "usage" "${script}" | cut -d' ' -f1); then
      for usage in ${usages}; do
        if [ "${usage}" != "$(basename "${script}")" ]; then
          echo "${script}: usage '${usage}' does not match script name"
          status=${failure}
        fi
      done
    fi
  done
  return ${status}
}

@test "scripts have usage tag" {
  _has_tag "usage" ${scripts}
}

@test "scripts have brief tag" {
  _has_tag "brief" ${scripts}
}

@test "scripts usages match names" {
  _usage_matches_script_name ${scripts}
}

@test "shellman on scripts" {
  _shellman ${scripts}
}

@test "shellman on libraries" {
  _shellman ${libs}
}
