# sources/ Directory

This directory contains official FFmpeg source tarballs.

## Usage

Store complete, unmodified FFmpeg source archives here:
- Download from https://ffmpeg.org/releases/
- Use `.tar.xz` format (recommended) or `.tar.gz`
- Include signature files (`.asc`) when available

## Git LFS Configuration

Large files should be tracked with Git LFS:

```bash
git lfs install
git lfs track "sources/*.tar.xz"
git lfs track "sources/*.tar.gz"
git add .gitattributes
```

## Downloading FFmpeg Sources

```bash
# Example: FFmpeg 6.1.1
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz.asc

# Verify signature (optional)
gpg --verify ffmpeg-6.1.1.tar.xz.asc

# Add to archive
mv ffmpeg-6.1.1.tar.xz sources/

# Generate checksum
sha256sum sources/ffmpeg-6.1.1.tar.xz >> verification/SHA256SUMS
```

## File Naming

Use official FFmpeg naming:
- ✅ `ffmpeg-6.1.1.tar.xz`
- ✅ `ffmpeg-6.0.tar.gz`
- ❌ `ffmpeg-6.1.1-custom.tar.xz`
- ❌ `ffmpeg-modified.tar.xz`

## Storage Notes

- **Do not commit binaries** (sources only)
- **Use Git LFS** for files > 100MB
- **Verify checksums** before archiving
- **Keep signatures** when available (`.asc` files)

## Currently Archived

See `../ARCHIVE-INDEX.md` for the complete list.
