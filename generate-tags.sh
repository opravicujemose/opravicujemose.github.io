#!/usr/bin/env bash
set -e

mkdir -p tag

awk '
  /^---[[:space:]]*$/ { fm = !fm; next }
  fm && /^[[:space:]]*tags:[[:space:]]*\[/ {
    line = $0
    sub(/^[[:space:]]*tags:[[:space:]]*\[/, "", line)
    sub(/\][[:space:]]*$/, "", line)
    print line
  }
' _posts/*.md \
| tr ',' '\n' \
| sed 's/^[[:space:]]*//;s/[[:space:]]*$//' \
| sed '/^$/d' \
| sort -u \
| while read -r tag; do

  slug=$(echo "$tag" \
    | tr '[:upper:]' '[:lower:]' \
    | sed \
      -e 's/č/c/g' \
      -e 's/š/s/g' \
      -e 's/ž/z/g' \
      -e 's/ć/c/g' \
      -e 's/đ/d/g' \
      -e 's/[^a-z0-9]/-/g' \
      -e 's/--*/-/g' \
      -e 's/^-//' \
      -e 's/-$//')

  file="tag/$slug.md"

  if [ ! -f "$file" ]; then
    cat > "$file" <<EOF
---
layout: tag
tag: "$tag"
permalink: /tag/$slug/
---
EOF
  fi

done