# Quick Start Guide - FFmpeg Archive

This is a quick reference for using and maintaining this GPL 2+ compliance archive.

## What This Archive Does

This repository maintains FFmpeg source code for **3 years** after distribution to comply with GPL 2.0+ requirements. Applications that use FFmpeg can reference this archive in their "written offer" for source code.

## For Application Distributors

### Adding Your Application's FFmpeg Version

1. **Download FFmpeg source:**
   ```bash
   wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz
   ```

2. **Add to archive:**
   ```bash
   mv ffmpeg-6.1.1.tar.xz sources/
   sha256sum sources/ffmpeg-6.1.1.tar.xz >> verification/SHA256SUMS
   ```

3. **Update tracking:**
   - Edit `ARCHIVE-INDEX.md`
   - Add entry with today's date
   - Calculate removal date (today + 3 years + 6 months)

4. **Reference in your app:**
   Include this in your application's documentation:
   > "FFmpeg source code is available at:
   > https://github.com/BurntToasters/FFMPEG-ARCHIVES"

## For Compliance Requests

If someone requests FFmpeg source code:

1. Direct them to this repository
2. Check `ARCHIVE-INDEX.md` for the specific version
3. Source file is in `sources/` directory
4. Checksums in `verification/SHA256SUMS`

## Archive Maintenance

### Adding a New Version

```bash
# Download source
VERSION="6.1.1"
wget https://ffmpeg.org/releases/ffmpeg-${VERSION}.tar.xz -P sources/

# Generate checksum
sha256sum sources/ffmpeg-${VERSION}.tar.xz >> verification/SHA256SUMS

# Update ARCHIVE-INDEX.md with:
# - Archive date (today)
# - Application using it
# - Expiration date (today + 3 years + 6 months)

# Commit
git add sources/ verification/ ARCHIVE-INDEX.md
git commit -m "Archive FFmpeg ${VERSION} for [App] v[Version]"
```

### Removing Expired Archives

Archives can be removed **3 years** after last distribution:

```bash
# 1. Verify expiration in ARCHIVE-INDEX.md
# 2. Check no active written offers remain
# 3. Remove files
rm sources/ffmpeg-OLD-VERSION.tar.xz

# 4. Update ARCHIVE-INDEX.md (move to "Removed" section)
# 5. Commit with explanation
git commit -m "Remove expired FFmpeg X.Y.Z archive (expired DATE)"
```

## Common Questions

### Q: Why 3 years?
**A:** GPL 2.0+ Section 3(b) requires written offers for source code to be valid for "at least three years."

### Q: Do I need to archive every FFmpeg version?
**A:** Only versions actually used in distributed applications. If you upgrade, you can use the same archive entry (update "Last Distribution" date).

### Q: Can I remove old archives?
**A:** Yes, after 3 years from the last distribution + a safety buffer (we recommend 6 months).

### Q: What if I don't bundle FFmpeg?
**A:** If users install their own FFmpeg, you still need to document where source is available. This archive fulfills that requirement.

### Q: Do I need to use Git LFS?
**A:** Recommended for source tarballs over 100MB. Run `git lfs install` and files will be tracked automatically via `.gitattributes`.

## Quick Links

- **Archive Index:** [ARCHIVE-INDEX.md](ARCHIVE-INDEX.md) - All archived versions
- **How to Add:** [HOWTO-ADD-ARCHIVE.md](HOWTO-ADD-ARCHIVE.md) - Step-by-step guide
- **FFmpeg Official:** https://ffmpeg.org - Original source
- **Compliance Details:** [COMPLIANCE.md](COMPLIANCE.md) - Full legal information

## Written Offer Template

Include this in your application's license documentation:

```
Source Code Availability
========================

This software uses FFmpeg, licensed under LGPL 2.1+ / GPL 2+.

Complete corresponding source code is available at:
https://github.com/BurntToasters/FFMPEG-ARCHIVES

Alternatively, obtain source code from:
https://ffmpeg.org/download.html

This offer is valid for three years from the date you
received this software.

For questions: code@rosie.run
```

## Maintenance Schedule

### Quarterly Review (Every 3 Months)
- Check `ARCHIVE-INDEX.md` for approaching expirations
- Verify no archives expired prematurely
- Update "Last Distribution" dates for active releases
- Review for any compliance requests

### Annual Audit
- Review all archived versions
- Remove expired archives (3+ years old)
- Verify Git LFS is working properly
- Check repository size and storage

## Contact

- **CONV2 Issues:** https://github.com/BurntToasters/CONV2/issues
- **Compliance Questions:** code@rosie.run
- **FFmpeg Questions:** ffmpeg-user@ffmpeg.org

---

**TL;DR for Archive Users:**
1. Download FFmpeg source → add to `sources/`
2. Update `ARCHIVE-INDEX.md` with dates
3. Reference this repo in your app's docs
4. Keep for 3 years after last distribution
5. GPL compliant! ✅

**TL;DR for Compliance Requests:**
1. Check `ARCHIVE-INDEX.md` for version
2. Download from `sources/` directory  
3. Verify with `verification/SHA256SUMS`
4. Build info in `configs/` if needed
