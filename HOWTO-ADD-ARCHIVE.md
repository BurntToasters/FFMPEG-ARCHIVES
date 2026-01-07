# Quick Start: Adding FFmpeg to Archive

## Step-by-Step Process

### 1. Download FFmpeg Source

```bash
# Check latest version at https://ffmpeg.org/download.html
VERSION="6.1.1"

# Download source tarball
wget https://ffmpeg.org/releases/ffmpeg-${VERSION}.tar.xz

# Optional: Download signature for verification
wget https://ffmpeg.org/releases/ffmpeg-${VERSION}.tar.xz.asc

# Optional: Verify GPG signature
gpg --verify ffmpeg-${VERSION}.tar.xz.asc
```

### 2. Add to Archive

```bash
# Move to sources directory
mv ffmpeg-${VERSION}.tar.xz sources/

# Generate checksum
cd sources/
sha256sum ffmpeg-${VERSION}.tar.xz >> ../verification/SHA256SUMS
cd ..
```

### 3. Update Archive Index

Edit `ARCHIVE-INDEX.md` and add:

```markdown
### FFmpeg 6.1.1
- **Archive Date:** 2026-01-07
- **Source File:** `sources/ffmpeg-6.1.1.tar.xz`
- **Used By:** CONV2 v1.0.2
- **First Distribution:** 2026-01-07
- **Last Distribution:** 2026-01-07
- **Earliest Removal:** 2029-07-07
- **Status:** ✅ Active
- **Checksum:** See `verification/SHA256SUMS`
```

### 4. Document Build Configuration

Create `configs/[app]-ffmpeg-[version]-config.txt` with build details.

### 5. Commit to Repository

```bash
# If using Git LFS for large files
git lfs track "sources/*.tar.xz"

# Stage changes
git add sources/ verification/ configs/ ARCHIVE-INDEX.md

# Commit
git commit -m "Archive FFmpeg 6.1.1 for CONV2 v1.0.2"

# Push
git push
```

## Git LFS Setup (Recommended)

For source tarballs over 100MB:

```bash
# Install Git LFS
git lfs install

# Track FFmpeg archives
git lfs track "sources/*.tar.xz"
git lfs track "sources/*.tar.gz"

# Commit tracking configuration
git add .gitattributes
git commit -m "Configure Git LFS for FFmpeg archives"
```

## Directory Structure After Adding

```
FFMPEG-ARCHIVES/
├── ARCHIVE-INDEX.md          (updated with new entry)
├── sources/
│   └── ffmpeg-6.1.1.tar.xz  (new source tarball)
├── configs/
│   └── conv2-ffmpeg-6.1.1-config.txt  (build info)
└── verification/
    └── SHA256SUMS            (updated with checksum)
```

## Automated Script

Save this as `add-ffmpeg-archive.sh`:

```bash
#!/bin/bash
set -e

if [ $# -lt 2 ]; then
    echo "Usage: $0 <ffmpeg-version> <app-name-version>"
    echo "Example: $0 6.1.1 'CONV2 v1.0.2'"
    exit 1
fi

VERSION=$1
APP=$2
TODAY=$(date +%Y-%m-%d)
EXPIRE=$(date -d "+3 years +6 months" +%Y-%m-%d)

echo "Downloading FFmpeg ${VERSION}..."
wget -P sources/ https://ffmpeg.org/releases/ffmpeg-${VERSION}.tar.xz

echo "Generating checksum..."
sha256sum sources/ffmpeg-${VERSION}.tar.xz >> verification/SHA256SUMS

echo "Update ARCHIVE-INDEX.md with:"
echo ""
echo "### FFmpeg ${VERSION}"
echo "- **Archive Date:** ${TODAY}"
echo "- **Source File:** \`sources/ffmpeg-${VERSION}.tar.xz\`"
echo "- **Used By:** ${APP}"
echo "- **First Distribution:** ${TODAY}"
echo "- **Last Distribution:** ${TODAY}"
echo "- **Earliest Removal:** ${EXPIRE}"
echo "- **Status:** ✅ Active"
echo ""
echo "Done! Remember to:"
echo "1. Update ARCHIVE-INDEX.md manually"
echo "2. Create config file in configs/"
echo "3. Commit and push changes"
```

## Reference Application Written Offer

When distributing your application, include:

> **Source Code Availability**
>
> This application uses FFmpeg, which is licensed under LGPL 2.1+ / GPL 2+.
> Complete source code for FFmpeg is available at:
>
> https://github.com/BurntToasters/FFMPEG-ARCHIVES
>
> This offer is valid for three years from the date you received this software.
> For more information, contact: code@rosie.run

---

That's it! Your FFmpeg archive is now GPL compliant.
