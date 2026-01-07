# GPL 2+ Compliance Documentation

## Overview

This document provides detailed information about GPL 2.0+ compliance for projects using FFmpeg, specifically for the **CONV2** application.

## Legal Requirements

### Why Compliance is Necessary

FFmpeg uses various open-source licenses:
- **LGPL 2.1+** - Lesser General Public License (default for core libraries)
- **GPL 2+** - General Public License (when using certain components)

When you distribute software that uses FFmpeg with GPL components, you must comply with GPL requirements.

## GPL Compliance Requirements

### 1. Source Code Access

**Requirement:** Provide access to the complete source code of GPL-licensed components.

**CONV2 Compliance:**
- FFmpeg source code is publicly available at https://ffmpeg.org
- This repository documents where to obtain FFmpeg source
- Specific versions used are tracked and documented

### 2. License Notices

**Requirement:** Include the full text of the GPL/LGPL license with your distribution.

**CONV2 Compliance:**
- FFmpeg license information is included in CONV2's `licenses.json`
- License viewing is available in the application (Settings → View Credits)
- This repository provides license documentation

### 3. Build Instructions

**Requirement:** Provide instructions for building the software from source.

**CONV2 Compliance:**
- FFmpeg build instructions are provided in this repository
- Platform-specific build guides available for:
  - macOS (ARM64 and Intel)
  - Windows
  - Linux

### 4. No Additional Restrictions

**Requirement:** You cannot impose additional restrictions beyond what GPL allows.

**CONV2 Compliance:**
- CONV2 uses MPL 2.0, which is compatible with GPL
- Users have full freedom to use, modify, and distribute FFmpeg
- No DRM or technical restrictions on FFmpeg usage

## CONV2 Application Architecture

### How CONV2 Uses FFmpeg

CONV2 is designed as a **GUI frontend** for FFmpeg:

```
┌─────────────────────────────────────┐
│         CONV2 Application           │
│      (Electron/TypeScript)          │
│         License: MPL 2.0            │
└──────────────┬──────────────────────┘
               │
               │ spawns process
               ├──→ ffmpeg (encoding)
               └──→ ffprobe (info)
               
┌─────────────────────────────────────┐
│      FFmpeg (External Binary)       │
│    License: LGPL 2.1+ / GPL 2+      │
│    Installation: User's System      │
└─────────────────────────────────────┘
```

### Key Points

1. **Separate Processes**: CONV2 spawns FFmpeg as a separate process
2. **No Static Linking**: FFmpeg is not compiled into CONV2
3. **User Installation**: FFmpeg must be installed separately by the user
4. **Dynamic Invocation**: CONV2 calls FFmpeg via command-line interface

### License Compatibility

```
CONV2 (MPL 2.0)
    │
    │ Spawns external process (not linking)
    │
    └──→ FFmpeg (GPL 2+)
```

**Result:** This architecture maintains clear license boundaries. CONV2 remains MPL 2.0, while FFmpeg remains under its original licenses.

## FFmpeg Components and Licenses

### LGPL Components (Default)

These are available under LGPL 2.1+:
- Core libraries (libavcodec, libavformat, libavutil, etc.)
- Basic codec support
- Container format handling

### GPL Components (Optional)

These components require GPL compliance:
- **libx264** (H.264 encoder) - GPL 2+
- **libx265** (H.265/HEVC encoder) - GPL 2+
- **libxvid** (MPEG-4 encoder) - GPL 2+
- **libx264rgb** - GPL 2+

### CONV2's Use of GPL Components

CONV2 supports but does not require GPL encoders:
- Users can choose CPU encoding (may use libx264/libx265)
- Hardware encoders (NVENC, AMF, QSV, VideoToolbox) are not GPL
- Alternative encoders available (e.g., libsvtav1 for AV1)

## Distribution Methods

### Method 1: Separate Distribution (Current)

**How it works:**
- CONV2 is distributed as a standalone application
- Users install FFmpeg separately
- CONV2 detects FFmpeg in the system PATH

**Compliance:**
- ✅ Clear separation between CONV2 and FFmpeg
- ✅ No GPL obligations for CONV2 code
- ✅ Users obtain FFmpeg from official sources
- ✅ Source code readily available at ffmpeg.org

### Method 2: Bundled Distribution (Alternative)

If you choose to bundle FFmpeg:

**Requirements:**
1. Include complete FFmpeg source code or download link
2. Provide build instructions
3. Include GPL/LGPL license text
4. Document any modifications made to FFmpeg

**Implementation:**
```
CONV2-Package/
├── CONV2.exe / CONV2.app / CONV2.AppImage
├── ffmpeg/ (or ffmpeg.exe)
├── licenses/
│   ├── FFmpeg-LICENSE.txt
│   └── FFmpeg-SOURCES.txt (download links)
└── README.txt (explains FFmpeg inclusion)
```

## Written Offer for Source Code

If you distribute FFmpeg binaries, you must either:

### Option A: Include Source Code
Distribute the complete FFmpeg source code alongside binaries.

### Option B: Written Offer (Current Approach)
Provide a written offer to supply the source code. Example:

```
The FFmpeg libraries used by CONV2 are licensed under LGPL 2.1+ 
and/or GPL 2+. Complete source code is available at:

https://ffmpeg.org/download.html
https://github.com/BurntToasters/FFMPEG-ARCHIVES

For a physical copy of the source code, contact:
BurntToasters
Email: code@rosie.run

This offer is valid for three years from the date of distribution.
```

## Compliance for Different Platforms

### Windows

**Distribution:**
- CONV2 distributed via GitHub releases, Microsoft Store
- FFmpeg installed separately by user

**Compliance:**
- Provide links to FFmpeg downloads
- Include license information in CONV2
- Document FFmpeg requirement in README

### macOS

**Distribution:**
- Universal binary (ARM64 + Intel) via GitHub releases
- Notarized and signed for macOS Gatekeeper

**Compliance:**
- Document Homebrew installation (`brew install ffmpeg`)
- Include FFmpeg licenses in application
- Provide build instructions for custom FFmpeg builds

### Linux

**Distribution:**
- AppImage, DEB, RPM, Flatpak formats

**Compliance:**
- List FFmpeg as package dependency
- Distribution repositories provide FFmpeg
- User receives FFmpeg from distro (with GPL compliance)

**Flatpak Special Case:**
```yaml
# Flatpak manifest includes FFmpeg
modules:
  - name: ffmpeg
    sources:
      - type: archive
        url: https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz
    # This makes FFmpeg part of the bundle
    # Must include source code access
```

## Verification Checklist

Use this checklist to verify GPL compliance:

- [ ] FFmpeg source code is accessible
  - [ ] Direct link to ffmpeg.org provided
  - [ ] This repository documents source availability
  
- [ ] License information included
  - [ ] LGPL 2.1+ text available
  - [ ] GPL 2+ text available (if using GPL components)
  - [ ] Attribution to FFmpeg developers
  
- [ ] Installation instructions provided
  - [ ] Windows installation documented
  - [ ] macOS installation documented
  - [ ] Linux installation documented
  
- [ ] Build instructions available
  - [ ] Basic build process documented
  - [ ] Platform-specific guides provided
  - [ ] Required dependencies listed
  
- [ ] No additional restrictions
  - [ ] No DRM on FFmpeg usage
  - [ ] Users can replace FFmpeg binary
  - [ ] No technical restrictions on modification
  
- [ ] Written offer (if applicable)
  - [ ] Valid for 3+ years
  - [ ] Contact information provided
  - [ ] Method to obtain source described

## Common Questions

### Q: Do I need to make CONV2 open source?

**A:** No. Since CONV2 uses FFmpeg as an external process (not linking), it maintains license independence. However, FFmpeg itself must remain available under GPL/LGPL.

### Q: Can I distribute CONV2 commercially?

**A:** Yes. CONV2 is licensed under MPL 2.0, which allows commercial use. Ensure FFmpeg GPL compliance is maintained.

### Q: What if I modify FFmpeg?

**A:** Any modifications to FFmpeg must be:
1. Documented in detail
2. Made available under GPL/LGPL
3. Provided to users who receive your modified binary

### Q: Do I need to provide FFmpeg source with every download?

**A:** No. You can provide:
- A link to the official FFmpeg source (ffmpeg.org)
- A link to this compliance repository
- A written offer to supply source on request

### Q: What about hardware encoders?

**A:** Hardware encoders (NVENC, AMF, QSV, VideoToolbox) are not GPL. They're proprietary vendor libraries. Only software encoders like libx264 are GPL.

## Enforcement and Violations

### GPL Enforcement

GPL is enforced by:
- Software Freedom Conservancy
- Individual copyright holders
- FFmpeg development team

### Avoiding Violations

Common violations to avoid:
- ❌ Distributing FFmpeg without license notice
- ❌ Claiming proprietary rights over FFmpeg
- ❌ Refusing to provide source code access
- ❌ Adding technical restrictions (DRM) on FFmpeg

### If Notified of Non-Compliance

1. **Stop Distribution** immediately if confirmed non-compliant
2. **Assess the Issue** - what's missing?
3. **Correct the Problem** - add source links, licenses, etc.
4. **Resume Distribution** once compliant

## Updates and Maintenance

### When to Update This Documentation

- FFmpeg version changes in CONV2
- New FFmpeg components added
- Distribution method changes
- License interpretation clarifications

### Monitoring FFmpeg Changes

- Watch FFmpeg release announcements
- Review license changes in new versions
- Update this repository accordingly

## Resources

### Legal Resources

- **GPL 2.0 Text:** https://www.gnu.org/licenses/gpl-2.0.html
- **LGPL 2.1 Text:** https://www.gnu.org/licenses/lgpl-2.1.html
- **GPL FAQ:** https://www.gnu.org/licenses/gpl-faq.html

### FFmpeg Resources

- **FFmpeg Legal:** https://ffmpeg.org/legal.html
- **FFmpeg Licenses:** https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/HEAD:/LICENSE.md
- **FFmpeg Developer Docs:** https://ffmpeg.org/developer.html

### Compliance Tools

- **License Scanner:** https://github.com/fossology/fossology
- **SPDX Tools:** https://spdx.dev/
- **OpenChain:** https://www.openchainproject.org/

## Contact Information

For questions about GPL compliance or this documentation:

- **Email:** code@rosie.run
- **GitHub Issues:** https://github.com/BurntToasters/CONV2/issues
- **FFMPEG-ARCHIVES:** https://github.com/BurntToasters/FFMPEG-ARCHIVES

## Version History

| Date | Version | Changes |
|------|---------|---------|
| 2026-01-07 | 1.0 | Initial compliance documentation |

---

**Disclaimer:** This document provides general guidance on GPL compliance for the CONV2 project. It is not legal advice. Consult with a qualified attorney for legal questions about licensing.
