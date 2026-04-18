#!/usr/bin/env bash
# Flip the 80-anys anniversary skin on/off in one commit.
# Usage:
#   ./toggle-anniversary.sh on    # activate (do this on 2027-01-01)
#   ./toggle-anniversary.sh off   # deactivate (do this after 2027)

set -e
cd "$(dirname "$0")"

case "${1:-}" in
  on)
    find . -name "*.html" -not -path "./.git/*" \
      -exec sed -i '' 's|<body class="no-anniversary">|<body class="anniversary">|g' {} \;
    echo "Aniversari 80 anys ACTIVAT."
    echo "Revisa a localhost i després: git add -A && git commit -m 'Activa 80 anys' && git push"
    ;;
  off)
    find . -name "*.html" -not -path "./.git/*" \
      -exec sed -i '' 's|<body class="anniversary">|<body class="no-anniversary">|g' {} \;
    echo "Aniversari 80 anys DESACTIVAT."
    echo "Revisa a localhost i després: git add -A && git commit -m 'Desactiva 80 anys' && git push"
    ;;
  *)
    echo "Ús: $0 on|off" >&2
    exit 1
    ;;
esac
