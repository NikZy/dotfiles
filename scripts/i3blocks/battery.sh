BAT=`acpi -b | grep -E -o '[0-9][0-9]?%'`

echo "$BAT"
test ${BAT%?} -le 10 && exit 33 || exit 0
