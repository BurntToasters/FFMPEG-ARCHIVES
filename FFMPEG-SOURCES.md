# FFmpeg Source Downloads

This document provides links and instructions for downloading FFmpeg source code for GPL 2+ compliance.

## Current Recommended Versions

### Latest Stable Release
- **Version:** 6.1.1
- **Release Date:** November 10, 2023
- **Download:** https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz
- **SHA256:** Not yet available (verify from official site)

### Previous Stable Release (LTS)
- **Version:** 6.0
- **Release Date:** February 27, 2023
- **Download:** https://ffmpeg.org/releases/ffmpeg-6.0.tar.xz

## Download Methods

### Method 1: Direct Download (Recommended)

Download the latest stable release:

```bash
# Download FFmpeg 6.1.1
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz

# Verify the download (optional but recommended)
# Get SHA256 hash from https://ffmpeg.org/download.html
sha256sum ffmpeg-6.1.1.tar.xz

# Extract
tar -xf ffmpeg-6.1.1.tar.xz
cd ffmpeg-6.1.1
```

### Method 2: Git Clone

Clone the entire repository with full history:

```bash
# Clone from official repository
git clone https://git.ffmpeg.org/ffmpeg.git

# Or from GitHub mirror
git clone https://github.com/FFmpeg/FFmpeg.git

# Checkout specific version
cd ffmpeg
git checkout n6.1.1
```

### Method 3: Shallow Clone (Faster)

Get only the latest code without full history:

```bash
# Clone only the latest commit
git clone --depth 1 https://github.com/FFmpeg/FFmpeg.git

# Clone specific branch
git clone --depth 1 --branch n6.1.1 https://github.com/FFmpeg/FFmpeg.git
```

## Official Download Sources

### Primary Sources
1. **Official Website:** https://ffmpeg.org/download.html
2. **Official Git:** git://source.ffmpeg.org/ffmpeg.git
3. **GitHub Mirror:** https://github.com/FFmpeg/FFmpeg

### Package Repositories

#### Windows
- **Gyan.dev Builds:** https://www.gyan.dev/ffmpeg/builds/
- **BtbN Builds:** https://github.com/BtbN/FFmpeg-Builds/releases

#### macOS
- **Homebrew Formula:** https://formulae.brew.sh/formula/ffmpeg
- **Source:** `brew install --build-from-source ffmpeg`

#### Linux
- **Debian/Ubuntu:** `apt-get source ffmpeg`
- **Fedora:** `dnf download --source ffmpeg`
- **Arch:** `abs community/ffmpeg` or use AUR

## Version-Specific Downloads

### FFmpeg 6.1.1 (Latest Stable)
```bash
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz
tar -xf ffmpeg-6.1.1.tar.xz
```

### FFmpeg 6.0 (LTS)
```bash
wget https://ffmpeg.org/releases/ffmpeg-6.0.tar.xz
tar -xf ffmpeg-6.0.tar.xz
```

### FFmpeg 5.1.4 (Legacy Support)
```bash
wget https://ffmpeg.org/releases/ffmpeg-5.1.4.tar.xz
tar -xf ffmpeg-5.1.4.tar.xz
```

## Verifying Downloads

### Check SHA256 Checksum

```bash
# Download the source
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz

# Get checksums from official site
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz.sha256

# Verify
sha256sum -c ffmpeg-6.1.1.tar.xz.sha256
```

### Verify GPG Signature

```bash
# Download source and signature
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz.asc

# Import FFmpeg signing key (if not already imported)
gpg --keyserver keys.gnupg.net --recv-keys FCF986EA15E6E293A5644F10B4322F04D67658D8

# Verify signature
gpg --verify ffmpeg-6.1.1.tar.xz.asc ffmpeg-6.1.1.tar.xz
```

## Source Code Structure

After extraction, you'll find:

```
ffmpeg-6.1.1/
├── Changelog              # Version history
├── configure              # Build configuration script
├── COPYING.GPLv2         # GPL 2.0 license
├── COPYING.GPLv3         # GPL 3.0 license
├── COPYING.LGPLv2.1      # LGPL 2.1 license
├── COPYING.LGPLv3        # LGPL 3.0 license
├── CREDITS               # Contributors
├── INSTALL.md            # Installation instructions
├── LICENSE.md            # Main license file
├── MAINTAINERS           # Component maintainers
├── Makefile              # Build instructions
├── README.md             # Project readme
├── RELEASE               # Release information
├── VERSION               # Version information
├── doc/                  # Documentation
├── fftools/              # CLI tools (ffmpeg, ffprobe, etc.)
├── libavcodec/           # Codec library
├── libavdevice/          # Device handling
├── libavfilter/          # Filtering library
├── libavformat/          # Format handling
├── libavutil/            # Utility functions
├── libpostproc/          # Post-processing
├── libswresample/        # Audio resampling
├── libswscale/           # Video scaling
└── tests/                # Test suite
```

## Storage Recommendations

### For Archive Purposes

```bash
# Create a compressed archive with documentation
mkdir ffmpeg-source-archive
cd ffmpeg-source-archive

# Download source
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz

# Download checksums and signatures
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz.sha256
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz.asc

# Create a README
cat > README.txt << 'EOF'
FFmpeg 6.1.1 Source Code
========================
Official download: https://ffmpeg.org/download.html
License: LGPL 2.1+ / GPL 2+
Documentation: https://ffmpeg.org/documentation.html

Files included:
- ffmpeg-6.1.1.tar.xz (source code)
- ffmpeg-6.1.1.tar.xz.sha256 (checksum)
- ffmpeg-6.1.1.tar.xz.asc (GPG signature)
EOF

# List files
ls -lh
```

### Using Git LFS (Large File Storage)

If storing in a Git repository:

```bash
# Install Git LFS
git lfs install

# Track compressed archives
git lfs track "*.tar.xz"
git lfs track "*.tar.gz"
git lfs track "*.tar.bz2"

# Add to .gitattributes
cat >> .gitattributes << EOF
*.tar.xz filter=lfs diff=lfs merge=lfs -text
*.tar.gz filter=lfs diff=lfs merge=lfs -text
*.tar.bz2 filter=lfs diff=lfs merge=lfs -text
EOF
```

## Additional Resources

### Build Dependencies Source Code

FFmpeg may depend on external libraries. Source code for common dependencies:

#### libx264 (H.264 encoder - GPL)
```bash
git clone https://code.videolan.org/videolan/x264.git
cd x264
git checkout stable
```

#### libx265 (H.265 encoder - GPL)
```bash
git clone https://bitbucket.org/multicoreware/x265_git.git
cd x265_git
git checkout stable
```

#### libvpx (VP8/VP9 encoder - BSD)
```bash
git clone https://chromium.googlesource.com/webm/libvpx
cd libvpx
git checkout main
```

#### SVT-AV1 (AV1 encoder - BSD)
```bash
git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git
cd SVT-AV1
git checkout master
```

### Platform-Specific Source Packages

#### Windows
- **MSYS2:** `pacman -Sw ffmpeg` (downloads to cache)
- **vcpkg:** `vcpkg install ffmpeg --triplet x64-windows`

#### macOS
- **Homebrew:** `brew fetch ffmpeg` (downloads to cache)
- **MacPorts:** `port fetch ffmpeg`

#### Linux
- **Debian/Ubuntu:**
  ```bash
  apt-get source ffmpeg
  # Downloads: ffmpeg_*.orig.tar.xz, ffmpeg_*.debian.tar.xz, ffmpeg_*.dsc
  ```

- **Fedora/RHEL:**
  ```bash
  dnf download --source ffmpeg
  # Downloads: ffmpeg-*.src.rpm
  ```

- **Arch Linux:**
  ```bash
  asp checkout ffmpeg
  # Or from ABS: /var/abs/community/ffmpeg/
  ```

## Automation Scripts

### Automatic Download Script

Create a script to automate source downloads:

```bash
#!/bin/bash
# download-ffmpeg-source.sh

VERSION="6.1.1"
BASE_URL="https://ffmpeg.org/releases"
FILENAME="ffmpeg-${VERSION}.tar.xz"

echo "Downloading FFmpeg ${VERSION} source code..."

# Download source
wget "${BASE_URL}/${FILENAME}"

# Download checksum
wget "${BASE_URL}/${FILENAME}.sha256"

# Download signature
wget "${BASE_URL}/${FILENAME}.asc"

# Verify checksum
echo "Verifying checksum..."
sha256sum -c "${FILENAME}.sha256"

# Extract
echo "Extracting..."
tar -xf "${FILENAME}"

echo "Done! Source code extracted to ffmpeg-${VERSION}/"
```

### Scheduled Updates

To keep your archive current:

```bash
# Add to crontab (check monthly)
0 0 1 * * /path/to/download-ffmpeg-source.sh >> /var/log/ffmpeg-update.log 2>&1
```

## Physical Media Distribution

If you need to provide source code on physical media:

### CD/DVD
```bash
# Create ISO image
genisoimage -o ffmpeg-source.iso \
    -R -J -V "FFmpeg Source" \
    ffmpeg-6.1.1/

# Burn to disc
cdrecord -v dev=/dev/sr0 ffmpeg-source.iso
```

### USB Drive
```bash
# Copy with metadata
cp -a ffmpeg-6.1.1/ /media/usb/ffmpeg-source/

# Create README
cat > /media/usb/README.txt << 'EOF'
FFmpeg Source Code Distribution
================================
This USB drive contains the complete source code for FFmpeg 6.1.1.

To build, see INSTALL.md in the ffmpeg-6.1.1 directory.

Official site: https://ffmpeg.org
License: See COPYING.* files
EOF
```

## Troubleshooting Downloads

### Slow Download Speed
```bash
# Use mirror sites
curl -O https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz

# Or use aria2 for parallel downloads
aria2c -x 16 https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz
```

### Connection Timeouts
```bash
# Use wget with retries
wget --retry-connrefused --waitretry=1 --read-timeout=20 \
     --timeout=15 -t 10 https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz
```

### Verification Failures
```bash
# If checksum fails, re-download
rm ffmpeg-6.1.1.tar.xz
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz
sha256sum -c ffmpeg-6.1.1.tar.xz.sha256
```

## Contact

For questions about obtaining FFmpeg source code:
- **FFmpeg Website:** https://ffmpeg.org
- **FFmpeg Mailing List:** ffmpeg-user@ffmpeg.org
- **This Repository:** https://github.com/BurntToasters/FFMPEG-ARCHIVES

---

*Last Updated: January 7, 2026*
