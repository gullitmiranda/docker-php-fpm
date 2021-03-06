DOCUMENT_ROOT="/var/www"

if [ ! -z "$PUBLIC_DIR" ]; then
  rm -rf "${DOCUMENT_ROOT}"
  mkdir -p "${DOCUMENT_ROOT}"

  APP_DIR="${PUBLIC_DIR}"
  dir="${DOCUMENT_ROOT}/public"
elif [ ! -z "$APP_DIR" ]; then
  rm -rf "${DOCUMENT_ROOT}"

  if [ -d "${APP_DIR}/public" ]; then
    dir="${DOCUMENT_ROOT}"
  else
    dir="${DOCUMENT_ROOT}/public"
  fi
fi

echo "linking public folder: ${APP_DIR} -> ${dir}"

if [ ! -z "$APP_DIR" ]; then
  mkdir -p "$(dirname ${dir})"
  ln -s $APP_DIR $dir
fi
