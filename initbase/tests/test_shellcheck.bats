load data

@test "shellcheck on scripts" {
  if [ ! -n "${scripts}" ]; then
    skip "No scripts found"
  fi
  shellcheck -x ${scripts}
}

@test "shellcheck on libraries" {
  if [ ! -n "${libs}" ]; then
    skip "No libraries found"
  fi
  shellcheck -xe SC2148 ${libs}
}
