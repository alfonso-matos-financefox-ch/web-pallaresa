#!/usr/bin/env bash
# Flip the 80-anys anniversary skin on/off in one commit.
# Usage:
#   ./toggle-anniversary.sh on    # activate (do this on 2027-01-01)
#   ./toggle-anniversary.sh off   # deactivate (do this after 2027)
#
# What changes:
#   - <body class="(no-)anniversary">  -> controls CSS visibility of all
#     anniversary elements (ribbon, crest, corner badge, nav+footer CTAs).
#   - favicon.svg <-> favicon-80.svg   -> swaps the browser-tab logo so
#     the "80" crest only appears during the anniversary year.

set -e
cd "$(dirname "$0")"

case "${1:-}" in
  on)
    find . -name "*.html" -not -path "./.git/*" \
      -exec sed -i '' 's|<body class="no-anniversary">|<body class="anniversary">|g' {} \;
    find . -name "*.html" -not -path "./.git/*" \
      -exec sed -i '' 's|<link rel="icon" type="image/svg+xml" href="\([^"]*/\)favicon\.svg"|<link rel="icon" type="image/svg+xml" href="\1favicon-80.svg"|g' {} \;
    echo "Aniversari 80 anys ACTIVAT (classe body + favicon)."
    echo "Revisa a localhost i després: git add -A && git commit -m 'Activa 80 anys' && git push"
    ;;
  off)
    find . -name "*.html" -not -path "./.git/*" \
      -exec sed -i '' 's|<body class="anniversary">|<body class="no-anniversary">|g' {} \;
    find . -name "*.html" -not -path "./.git/*" \
      -exec sed -i '' 's|<link rel="icon" type="image/svg+xml" href="\([^"]*/\)favicon-80\.svg"|<link rel="icon" type="image/svg+xml" href="\1favicon.svg"|g' {} \;
    echo "Aniversari 80 anys DESACTIVAT (classe body + favicon)."
    echo "Revisa a localhost i després: git add -A && git commit -m 'Desactiva 80 anys' && git push"
    ;;
  *)
    echo "Ús: $0 on|off" >&2
    exit 1
    ;;
esac
