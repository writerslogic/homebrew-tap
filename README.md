<p align="center">
  <img src="https://raw.githubusercontent.com/writerslogic/witnessd/main/assets/logo.svg" alt="WritersLogic" width="300">
</p>

<p align="center">
  <strong>Homebrew Tap for WritersLogic</strong><br>
  <em>Cryptographic authorship witnessing for writers and creators</em>
</p>

<p align="center">
  <a href="https://github.com/writerslogic/homebrew-tap/actions/workflows/ci.yml"><img src="https://github.com/writerslogic/homebrew-tap/actions/workflows/ci.yml/badge.svg" alt="Tests"></a>
  <a href="https://github.com/writerslogic/witnessd/releases/latest"><img src="https://img.shields.io/github/v/release/writerslogic/witnessd?label=version" alt="Version"></a>
  <a href="https://github.com/writerslogic/witnessd/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-AGPL--3.0-blue" alt="License"></a>
</p>

---

## What is WritersLogic?

**WritersLogic** creates tamper-evident cryptographic records of document authorship. It provides irrefutable proof that you wrote what you wrote, when you wrote it.

- **Prove authorship** — Cryptographic evidence chain linking you to your work
- **Detect AI content** — Forensic analysis identifies non-human writing patterns
- **Hardware-backed** — Secure Enclave / TPM 2.0 integration for device binding
- **Verify independently** — Evidence can be verified by anyone, anywhere

## Installation

```bash
# Add the tap
brew tap writerslogic/tap

# Install WritersLogic
brew install writerslogic
```

Or install directly:

```bash
brew install writerslogic/tap/writerslogic
```

## Quick Start

```bash
# Initialize WritersLogic
wld init

# Calibrate VDF for your machine
wld calibrate

# Create checkpoints as you write
wld commit document.md -m "First draft"

# View history
wld log document.md

# Export evidence
wld export document.md --tier enhanced

# Verify evidence
wld verify evidence-packet.json

# Or verify online without installing:
# https://writerslogic.com/verify
```

## Updating

```bash
# Update WritersLogic to the latest version
brew update
brew upgrade writerslogic
```

## Verification

All WritersLogic releases include:
- SHA256 checksums
- SLSA Level 3 provenance attestations
- SBOM (SPDX and CycloneDX)

## Other Platforms

| Platform | Installation |
|----------|--------------|
| macOS | `brew install writerslogic/tap/writerslogic` |
| Windows | `scoop bucket add writerslogic https://github.com/writerslogic/scoop-bucket && scoop install writerslogic` |
| From Source | See [build instructions](https://github.com/writerslogic/witnessd#from-source) |

## Links

- [WritersLogic Repository](https://github.com/writerslogic/witnessd)
- [Documentation](https://github.com/writerslogic/witnessd#readme)
- [Report Issues](https://github.com/writerslogic/witnessd/issues)
- [Website](https://writerslogic.com)

## License

WritersLogic is licensed under the [GNU Affero General Public License v3.0](https://github.com/writerslogic/witnessd/blob/main/LICENSE).
