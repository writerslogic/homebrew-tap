### WritersProof Homebrew Tap

Homebrew formulae for the CPoE CLI.

[![CI](https://img.shields.io/github/actions/workflow/status/writerslogic/homebrew-tap/update-formula.yml?branch=main&label=CI)](https://github.com/writerslogic/homebrew-tap/actions/workflows/update-formula.yml)

## Installation

```bash
# Add the tap
brew tap writerslogic/tap

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
