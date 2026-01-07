#!/bin/bash
# Quick script to download and archive FFmpeg source

set -e

echo "FFmpeg Archive Helper"
echo "===================="
echo ""

# Check if version provided
if [ -z "$1" ]; then
    echo "Usage: ./download-ffmpeg.sh <version> [application-name]"
    echo "Example: ./download-ffmpeg.sh 6.1.1 'CONV2 v1.0.2'"
    exit 1
fi

VERSION=$1
APP=${2:-"Unknown Application"}
TODAY=$(date +%Y-%m-%d)
EXPIRE_DATE=$(date -d "+3 years +6 months" +%Y-%m-%d 2>/dev/null || date -v +3y -v +6m +%Y-%m-%d)

TARBALL="ffmpeg-${VERSION}.tar.xz"
URL="https://ffmpeg.org/releases/${TARBALL}"

echo "Downloading FFmpeg ${VERSION}..."
echo "Application: ${APP}"
echo "Archive date: ${TODAY}"
echo "Can remove after: ${EXPIRE_DATE}"
echo ""

# Download
if [ ! -f "sources/${TARBALL}" ]; then
    echo "Downloading from ${URL}..."
    wget -P sources/ "${URL}"
    
    # Try to get signature too
    wget -P sources/ "${URL}.asc" 2>/dev/null || echo "  (signature not found, skipping)"
else
    echo "✓ Source already exists: sources/${TARBALL}"
fi

# Generate checksum
echo ""
echo "Generating checksum..."
cd sources/
sha256sum "${TARBALL}" >> ../verification/SHA256SUMS
cd ..
echo "✓ Checksum added to verification/SHA256SUMS"

# Show update instructions
echo ""
echo "===================="
echo "Next steps:"
echo "===================="
echo ""
echo "1. Update ARCHIVE-INDEX.md with:"
echo ""
cat << EOF
### FFmpeg ${VERSION}
- **Archive Date:** ${TODAY}
- **Source File:** \`sources/${TARBALL}\`
- **Used By:** ${APP}
- **First Distribution:** ${TODAY}
- **Last Distribution:** ${TODAY}
- **Earliest Removal:** ${EXPIRE_DATE}
- **Status:** ✅ Active
- **Checksum:** See \`verification/SHA256SUMS\`
- **Build Config:** \`configs/[app]-ffmpeg-${VERSION}-config.txt\`
EOF
echo ""
echo "2. Create build config in configs/ directory (if applicable)"
echo ""
echo "3. Commit changes:"
echo "   git add sources/ verification/ ARCHIVE-INDEX.md"
echo "   git commit -m 'Archive FFmpeg ${VERSION} for ${APP}'"
echo "   git push"
echo ""
echo "Done!"
