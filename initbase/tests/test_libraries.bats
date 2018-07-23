load data

_use_if_ndef_define() {
  local ifndef_clause define_clause def1 def2 expected lib status=${success}
  for lib in "$@"; do
    ifndef_clause=$(grep -E '^[[:space:]]*if[[:space:]]+ndef[[:space:]]+[a-zA-Z_][a-zA-Z0-9_]*' "${lib}" || true)
    define_clause=$(grep -E '^[[:space:]]*define[[:space:]]+[a-zA-Z_][a-zA-Z0-9_]*' "${lib}" || true)
    if [ ! -n "${ifndef_clause}" ]; then
      status=${failure}
      echo "${lib}: missing 'if ndef' clause"
    fi
    if [ ! -n "${define_clause}" ]; then
      status=${failure}
      echo "${lib}: missing 'define' clause"
    fi
    def1=$(echo "${ifndef_clause}" | tr -s ' ' | cut -d' ' -f3 | sed 's/\;//g')
    def2=$(echo "${define_clause}" | tr -s ' ' | cut -d' ' -f2)
    if [ "${def1}" != "${def2}" ]; then
      status=${failure}
      echo "${lib}: define don't match ifndef ${def1} / ${def2}"
    fi
    expected=${lib#lib/}
    expected=${expected^^}
    expected=${expected//\//_}
    expected=__${expected//./_}
    if [ "${def1}" != "${expected}" ]; then
      status=${failure}
      echo "${lib}: define should be ${expected}"
    fi
  done
  return ${status}
}

_declare_contents() {
  local lib status=${success}
  for lib in "$@"; do
    if ! grep -Eq "define[[:space:]]+[^'\"]+['\"]" "$lib"; then
      status=${failure}
      echo "${lib}: define should declare contents between single/double quotes"
    fi
  done
  return ${status}
}

_names_dont_clash() {
  local lib contents declarations status=${success}
  declarations=$(
    for lib in "$@"; do
      contents=$(pcregrep -M "define\s+[^'\"]*['\"](\n|[^'\"])*['\"]" "${lib}")
      contents=${contents#*[\"\']}
      contents=${contents%[\"\']*}

      for content in ${contents}; do
        echo "('${content}','${lib}'),"
      done
    done
  )

  python_code="
m = {}
for d, f in [${declarations}]:
    if m.get(d, None) is None:
        m[d] = [f]
    else:
        m[d].append(f)

for d, f in m.items():
    if len(f) > 1:
        print('%s:%s' % (d, ','.join(f)))"

  local clash clashes declaration files
  clashes="$(python -c "${python_code}")"
  if [ -n "${clashes}" ]; then
    status=${failure}
    for clash in ${clashes}; do
      declaration=${clash%%:*}
      files=${clash#*:}
      echo "${declaration}: declaration clashes between files ${files}"
    done
  fi

  return ${status}
}

@test "libraries use if ndef define" {
  if [ ! -n "${libs}" ]; then
    skip "No libraries found"
  fi
  _use_if_ndef_define ${libs}
}

@test "libraries declare their contents" {
  if [ ! -n "${libs}" ]; then
    skip "No libraries found"
  fi
  _declare_contents ${libs}
}

@test "libraries contents names don't clash" {
  if [ ! -n "${libs}" ]; then
    skip "No libraries found"
  fi
  _names_dont_clash ${libs}
}
