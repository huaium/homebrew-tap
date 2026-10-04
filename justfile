[private]
default:
    @just --list

# Apply style fixes, run all checks, install the edited formula, and test it.
pre-push:
    #!/usr/bin/env bash
    set -euo pipefail
    brew style --fix huaium/tap
    ruby -c Formula/cockup.rb
    ruby -e 'require "yaml"; ARGV.each { |path| YAML.parse_file(path) }' .github/workflows/*.yml
    git diff --check
    brew style huaium/tap
    brew audit --except=installed --tap=huaium/tap
    if brew list --formula cockup >/dev/null 2>&1; then
        brew reinstall huaium/tap/cockup
    else
        brew install huaium/tap/cockup
    fi
    brew test huaium/tap/cockup
