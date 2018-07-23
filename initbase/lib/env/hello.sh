if shellm-ndef; then
shellm-define

echo "shellm: ${SHELLM_USR} successfully initialized!"
echo "  This message is printed from your first library file, located in ${SHELLM_USR}/lib/env."
echo "  Feel free to delete it with 'shellm rm lib/env/hello.sh'"
echo "  Or modify it with 'shellm vim lib/env/hello.sh'."

fi  # __ENV_HELLO_SH
