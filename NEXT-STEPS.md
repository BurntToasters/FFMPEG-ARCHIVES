# Next Steps - FFMPEG-ARCHIVES Setup

## Repository is Ready! ✅

Your FFMPEG-ARCHIVES repository is now structured for GPL 2+ compliance. Here's what to do next:

## Immediate Tasks

### 1. Initialize Git Repository (if not done)
```bash
cd /c/Users/burnt/Documents/GitHub/FFMPEG-ARCHIVES
git init
git add .
git commit -m "Initial commit: FFmpeg GPL compliance archive"
```

### 2. Set Up Git LFS
```bash
# Install Git LFS (if not installed)
# Windows: Download from https://git-lfs.github.com/
# macOS: brew install git-lfs
# Linux: apt install git-lfs / dnf install git-lfs

# Initialize Git LFS in this repository
git lfs install
git lfs track "sources/*.tar.xz"
git lfs track "sources/*.tar.gz"

# Commit LFS configuration
git add .gitattributes
git commit -m "Configure Git LFS for FFmpeg archives"
```

### 3. Create GitHub Repository
```bash
# Create repository on GitHub (via web interface):
# https://github.com/new
# Name: FFMPEG-ARCHIVES
# Description: "3-year FFmpeg source archive for GPL 2+ compliance"
# Public repository (for compliance transparency)

# Connect local to GitHub
git remote add origin https://github.com/BurntToasters/FFMPEG-ARCHIVES.git
git branch -M main
git push -u origin main
```

### 4. Download First FFmpeg Archive

For CONV2 v1.0.2 (or current version):

```bash
# Use the helper script
chmod +x download-ffmpeg.sh
./download-ffmpeg.sh 6.1.1 "CONV2 v1.0.2"

# Or manually:
wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz -P sources/
sha256sum sources/ffmpeg-6.1.1.tar.xz >> verification/SHA256SUMS

# Then update ARCHIVE-INDEX.md manually
```

### 5. Update ARCHIVE-INDEX.md

Edit `ARCHIVE-INDEX.md` and replace the template with actual information:

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
- **Build Config:** `configs/conv2-ffmpeg-config.txt` (already created)
```

### 6. Commit the Archive

```bash
git add sources/ verification/ ARCHIVE-INDEX.md
git commit -m "Archive FFmpeg 6.1.1 for CONV2 v1.0.2"
git push
```

## Update CONV2 Repository

### 1. Update CONV2 README.md

Add to the license section:

```markdown
## License

CONV2 is licensed under [Mozilla Public License 2.0](LICENSE).

### FFmpeg (External Dependency)

CONV2 requires FFmpeg to be installed separately. FFmpeg is licensed under 
LGPL 2.1+ / GPL 2+ depending on components used.

- **FFmpeg Source Code:** https://ffmpeg.org
- **GPL Compliance Archive:** https://github.com/BurntToasters/FFMPEG-ARCHIVES

For license information, see Settings → View Credits in the application.
```

### 2. Update licenses.json

If not already included, add FFmpeg entry:

```json
{
  "FFmpeg (System Dependency)": {
    "licenses": "LGPL-2.1-or-later",
    "repository": "https://github.com/FFmpeg/FFmpeg",
    "url": "https://ffmpeg.org",
    "licenseUrl": "https://ffmpeg.org/legal.html",
    "note": "External dependency installed by user. Source code at https://ffmpeg.org and https://github.com/BurntToasters/FFMPEG-ARCHIVES"
  }
}
```

### 3. Update GitHub Release Notes

For future CONV2 releases, include:

```markdown
## Requirements

- **FFmpeg:** Must be installed separately
  - Windows: https://www.gyan.dev/ffmpeg/builds/
  - macOS: `brew install ffmpeg`
  - Linux: `sudo apt install ffmpeg`

## License Compliance

FFmpeg source code is available at:
- Official: https://ffmpeg.org
- Compliance archive: https://github.com/BurntToasters/FFMPEG-ARCHIVES
```

## Verification Checklist

Before going live, verify:

- [ ] Git repository initialized
- [ ] Git LFS configured and working
- [ ] GitHub repository created (public)
- [ ] FFmpeg 6.1.1 source downloaded
- [ ] Checksum generated and verified
- [ ] ARCHIVE-INDEX.md updated with real dates
- [ ] All files committed and pushed
- [ ] CONV2 README updated with archive link
- [ ] CONV2 licenses.json includes FFmpeg
- [ ] Release notes mention FFmpeg licensing

## Ongoing Maintenance

### When Releasing New CONV2 Versions

1. Check if FFmpeg version changed
2. If same version: Update "Last Distribution" in ARCHIVE-INDEX.md
3. If new version: Run `./download-ffmpeg.sh <version> "CONV2 v<version>"`
4. Commit and push changes

### Quarterly Reviews (Every 3 Months)

1. Review ARCHIVE-INDEX.md for expiring archives
2. Check if any compliance requests received
3. Verify Git LFS storage usage
4. Update documentation if needed

### After 3 Years (2029+)

1. Check archives marked for removal
2. Verify no active written offers remain
3. Remove expired source files
4. Update ARCHIVE-INDEX.md (move to removed section)
5. Document removal in commit message

## Helpful Commands

```bash
# Check repository status
git status

# View Git LFS tracked files
git lfs ls-files

# Verify checksums
cd sources && sha256sum -c ../verification/SHA256SUMS

# List all archives
cat ARCHIVE-INDEX.md | grep "### FFmpeg"

# Check Git LFS storage
git lfs ls-files -s

# Update just the index
git add ARCHIVE-INDEX.md
git commit -m "Update distribution dates"
git push
```

## Support Resources

- **Documentation:** All in this repository
- **Quick Start:** `QUICK-START.md`
- **How-To Guide:** `HOWTO-ADD-ARCHIVE.md`
- **Legal Details:** `COMPLIANCE.md`
- **FFmpeg Official:** https://ffmpeg.org
- **Questions:** code@rosie.run

## You're Done!

Once you complete the checklist above, your GPL compliance archive is ready and CONV2 will be fully compliant with FFmpeg's licensing requirements.

Remember: Keep this archive updated when releasing new versions and review quarterly to stay compliant!

---

**Last Updated:** January 7, 2026
