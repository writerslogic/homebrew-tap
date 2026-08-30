<p align="center">
  <strong>Homebrew Tap for WritersProof</strong><br>
  <em>Cryptographic authorship witnessing for writers and creators</em>
</p>

<p align="center">
  <a href="https://github.com/writerslogic/homebrew-tap/actions/workflows/update-formula.yml"><img src="https://github.com/writerslogic/homebrew-tap/actions/workflows/update-formula.yml/badge.svg" alt="Update Formula"></a>
  <a href="https://writersproof.com"><img src="https://img.shields.io/badge/license-AGPL--3.0-blue" alt="License"></a>
</p>

---

## What is WritersProof?

**WritersProof** creates tamper-evident cryptographic records of document authorship. It provides irrefutable proof that you wrote what you wrote, when you wrote it.

- **Prove authorship** — Cryptographic evidence chain linking you to your work
- **Detect AI content** — Forensic analysis identifies non-human writing patterns
- **Hardware-backed** — Secure Enclave / TPM 2.0 integration for device binding
- **Verify independently** — Evidence can be verified by anyone, anywhere

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
