# Local checks for the cockup tap. Run `just --list` to see the recipes.

default:
    @just --list

syntax:
    ruby -c Formula/cockup.rb
    ruby -e 'require "yaml"; ARGV.each { |path| YAML.parse_file(path) }' .github/workflows/*.yml

style:
    brew style huaium/tap

audit:
    brew audit --except=installed --tap=huaium/tap

check: syntax style audit

format:
    brew style --fix huaium/tap

fix: format
    brew audit --fix huaium/tap/cockup

# Install the release binary using the edited formula, then run its test block.
test:
    if brew list --formula cockup >/dev/null 2>&1; then brew reinstall huaium/tap/cockup; else brew install huaium/tap/cockup; fi
    brew test huaium/tap/cockup

pre-push: check test
