<p align="center">
  <img src="https://raw.githubusercontent.com/writerslogic/witnessd/main/assets/logo.svg" alt="witnessd" width="300">
</p>

<p align="center">
  <strong>Homebrew Tap for witnessd</strong><br>
  <em>Cryptographic authorship witnessing for writers and creators</em>
</p>

<p align="center">
  <a href="https://github.com/writerslogic/homebrew-tap/actions/workflows/ci.yml"><img src="https://github.com/writerslogic/homebrew-tap/actions/workflows/ci.yml/badge.svg" alt="Tests"></a>
  <a href="https://github.com/writerslogic/witnessd/releases/latest"><img src="https://img.shields.io/github/v/release/writerslogic/witnessd?label=witnessd" alt="Version"></a>
  <a href="https://github.com/writerslogic/witnessd/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-Apache--2.0-blue" alt="License"></a>
</p>

---

## What is witnessd?

**witnessd** creates tamper-evident cryptographic records of document authorship. It provides irrefutable proof that you wrote what you wrote, when you wrote it.

- **Prove authorship** — Cryptographic evidence chain linking you to your work
- **Detect AI content** — Forensic analysis identifies non-human writing patterns
- **Hardware-backed** — Secure Enclave / TPM 2.0 integration for device binding
- **Verify independently** — Evidence can be verified by anyone, anywhere

## Installation

```bash
# Add the tap
brew tap writerslogic/tap

# Install witnessd
brew install witnessd
```

Or install directly:

```bash
brew install writerslogic/tap/witnessd
```

## Quick Start

```bash
# Initialize witnessd
witnessd init

# Calibrate VDF for your machine
witnessd calibrate

# Create checkpoints as you write
witnessd commit document.md -m "First draft"

# View history
witnessd log document.md

# Export evidence
witnessd export document.md --tier enhanced

# Verify evidence
witnessd verify evidence-packet.json
```

## Updating

```bash
# Update witnessd to the latest version
brew update
brew upgrade witnessd
```

## Verification

All witnessd releases include:
- SHA256 checksums
- SLSA Level 3 provenance attestations
- SBOM (SPDX and CycloneDX)

## Other Platforms

| Platform | Installation |
|----------|--------------|
| Windows | `scoop bucket add writerslogic https://github.com/writerslogic/scoop-bucket && scoop install witnessd` |
| From Source | See [build instructions](https://github.com/writerslogic/witnessd#from-source) |

## Links

- [witnessd Repository](https://github.com/writerslogic/witnessd)
- [Documentation](https://github.com/writerslogic/witnessd#readme)
- [Report Issues](https://github.com/writerslogic/witnessd/issues)
- [Website](https://writerslogic.com)

## License

witnessd is licensed under the [Apache License 2.0](https://github.com/writerslogic/witnessd/blob/main/LICENSE).
