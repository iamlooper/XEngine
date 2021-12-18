[[ -e "/storage/emulated/0/XEngine" ]] && rm -rf "/storage/emulated/0/XEngine"

# DO NOT MODIFY THIS SCRIPT!

if [ -f $INFO ]; then
  while read LINE; do

    if [[ "$(echo -n $LINE | tail -c 1)" == "~" ]]; then
      continue

    elif [ -f "$LINE~" ]; then
      mv -f $LINE~ $LINE

    else
      rm -rf $LINE
      while true; do
        LINE=$(dirname $LINE)
        [[ "$(ls -A $LINE 2>/dev/null)" ]] && break 1 || rm -rf $LINE
      done

    fi
  done < $INFO
  rm -rf $INFO
fi