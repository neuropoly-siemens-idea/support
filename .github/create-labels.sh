#!/usr/bin/env bash
# Creates (or updates) the repo's labels. Requires the GitHub CLI: https://cli.github.com
# Usage: bash .github/create-labels.sh
set -euo pipefail
REPO="neuropoly-siemens-idea/support"

label() { gh label create "$1" --repo "$REPO" --color "$2" --description "$3" --force; }

# Sequences
label "seq:neuropoly_gre_advshim"        "1D76DB" "neuropoly_gre_advshim sequence"
label "seq:neuropoly_ep2d_bold_advshim"  "5319E7" "neuropoly_ep2d_bold_advshim sequence"

# Platforms
label "platform:XA60"   "0E8A16" "Siemens XA60"
label "platform:XA61B"  "006B75" "Siemens XA61B"

# Types
label "type:bug"       "D73A4A" "Something isn't working"
label "type:question"  "D876E3" "Question about usage"
label "type:feature"   "A2EEEF" "New feature or request"

# Remove GitHub's default labels that overlap with the ones above
for l in bug question enhancement; do
  gh label delete "$l" --repo "$REPO" --yes 2>/dev/null || true
done
