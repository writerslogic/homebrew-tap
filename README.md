<!-- repo-header:start -->
<img src="https://github.com/writerslogic.png?size=160" alt="Add the tap logo" width="120" align="left">

<h1>Add the tap</h1>

<p><strong>Homebrew formulae for CPoE CLI</strong></p>

<br clear="left">

[![CI](https://img.shields.io/github/actions/workflow/status/writerslogic/homebrew-tap/update-formula.yml?style=flat-square&labelColor=20232a&branch=main&label=CI)](https://github.com/writerslogic/homebrew-tap/actions/workflows/update-formula.yml) [![Best Practices Evidence](https://img.shields.io/badge/best%20practices-evidence%20reviewed-6a4c93?style=flat-square&labelColor=20232a)](.bestpractices.json) [![GitHub Sponsors](https://img.shields.io/badge/GitHub%20Sponsors-Sponsor-EA4AAA?style=flat-square&labelColor=20232a)](https://github.com/sponsors/dcondrey)
<!-- repo-header:end -->

# Install the WritersProof CLI
brew install writersproof
```

Or install directly:

```bash
brew install writerslogic/tap/writersproof
```

## Quick Start

```bash
# Initialize WritersProof
writersproof-cli init

# Calibrate VDF for your machine
writersproof-cli calibrate

# Create checkpoints as you write
writersproof-cli commit document.md -m "First draft"

# View history
writersproof-cli log document.md

# Export evidence
writersproof-cli export document.md --tier enhanced

# Verify evidence
writersproof-cli verify evidence-packet.json

# Or verify online without installing:
# https://writersproof.com/verify
```

## Updating

```bash
brew update
brew upgrade writersproof
```

## Other Platforms

| Platform | Installation |
|----------|--------------|
| macOS / Linux | `curl -sSf https://writersproof.com/install.sh \| sh` |
| Windows | `scoop bucket add writerslogic https://github.com/writerslogic/scoop-bucket && scoop install writerslogic` |

## Links

- [Website](https://writersproof.com)
- [Downloads](https://writersproof.com/download)
- [Report Issues](https://github.com/writerslogic/writersproof-support/issues)

## License

The WritersProof CLI is licensed under the GNU Affero General Public License v3.0.
