# FFMPEG-ARCHIVES Repository Summary

## Repository Purpose

This is a **GPL 2+ compliance archive** that maintains FFmpeg source code for applications that use FFmpeg. It fulfills the "written offer" requirement under GPL 2.0+ Section 3(b) by providing access to complete source code for at least 3 years.

## Current Status

- **Established:** January 7, 2026
- **Primary Application:** CONV2 (https://github.com/BurntToasters/CONV2)
- **Retention Policy:** 3 years + 6 months safety buffer
- **Current Archives:** See [ARCHIVE-INDEX.md](ARCHIVE-INDEX.md)

## Repository Structure

```
FFMPEG-ARCHIVES/
├── README.md                    # Main documentation
├── ARCHIVE-INDEX.md             # Master list of all archived versions
├── QUICK-START.md               # Quick reference guide
├── HOWTO-ADD-ARCHIVE.md         # Step-by-step archive process
├── COMPLIANCE.md                # Detailed GPL compliance info
├── FFMPEG-SOURCES.md            # Source download instructions
├── CONV2-INTEGRATION.md         # CONV2-specific integration guide
├── .gitattributes               # Git LFS configuration
├── download-ffmpeg.sh           # Helper script to download sources
│
├── sources/                     # FFmpeg source tarballs (Git LFS)
│   ├── README.md
│   └── ffmpeg-X.Y.Z.tar.xz
│
├── builds/                      # Build artifacts (optional)
│   ├── windows/
│   ├── macos/
│   └── linux/
│
├── configs/                     # Build configurations
│   ├── README.md
│   └── [app]-ffmpeg-[ver]-config.txt
│
└── verification/                # Checksums and signatures
    └── SHA256SUMS
```

## Key Features

### 1. Rolling 3-Year Archive
- Archives maintained for 3 years minimum after last distribution
- Automated tracking via ARCHIVE-INDEX.md
- Safety buffer (6 months) recommended before removal

### 2. Git LFS Integration
- Large source tarballs tracked with Git LFS
- Keeps repository size manageable
- Configured via `.gitattributes`

### 3. Complete Documentation
- **README.md** - Overview and usage
- **ARCHIVE-INDEX.md** - Tracking all versions
- **QUICK-START.md** - Quick reference
- **HOWTO-ADD-ARCHIVE.md** - Step-by-step guide
- **COMPLIANCE.md** - Legal details

### 4. Verification System
- SHA256 checksums for all archives
- GPG signatures where available
- Reproducible build information

## Usage Scenarios

### For Developers (Adding Archives)

1. Download FFmpeg source from https://ffmpeg.org
2. Add to `sources/` directory
3. Generate checksum
4. Update `ARCHIVE-INDEX.md`
5. Commit and push

**Quick command:**
```bash
./download-ffmpeg.sh 6.1.1 "MyApp v1.0"
```

### For Compliance Officers (Requesting Source)

1. Check `ARCHIVE-INDEX.md` for version
2. Download from `sources/` directory
3. Verify checksum in `verification/SHA256SUMS`
4. Review build config in `configs/` if needed

### For End Users (Understanding Licensing)

FFmpeg is LGPL 2.1+ / GPL 2+ licensed. Applications using FFmpeg must:
- Provide access to FFmpeg source code ✓ (this archive)
- Include license notices ✓
- Not impose additional restrictions ✓

## Applications Using This Archive

### CONV2 v1.0.2+
- **Type:** Video converter GUI
- **FFmpeg Usage:** External system dependency
- **License:** MPL 2.0 (CONV2) + LGPL/GPL (FFmpeg)
- **Repository:** https://github.com/BurntToasters/CONV2

*Additional applications can be added as needed*

## Maintenance Tasks

### Regular (Per Release)
- Add FFmpeg source when distributing new application version
- Update "Last Distribution" date in ARCHIVE-INDEX.md
- Verify checksums match

### Quarterly Review
- Check for expiring archives (approaching 3 years)
- Verify no compliance requests pending
- Update status in ARCHIVE-INDEX.md

### Annual Audit
- Remove expired archives (3+ years since last distribution)
- Review Git LFS storage usage
- Verify all documentation is current

## Legal Compliance

### GPL 2.0+ Section 3(b) Requirement

When distributing object code, you must:

> "Accompany it with a written offer, valid for at least three years, to give any third party, for a charge no more than your cost of physically performing source distribution, a complete machine-readable copy of the corresponding source code."

**This archive fulfills that requirement by:**
- Maintaining source code for 3+ years ✓
- Making it publicly accessible ✓
- Including complete source ✓
- Providing build information ✓

### Written Offer Template

Applications using this archive should include:

```
Source Code Availability
========================
This software uses FFmpeg (LGPL 2.1+ / GPL 2+).
Complete source code: https://github.com/BurntToasters/FFMPEG-ARCHIVES
Alternative source: https://ffmpeg.org
Valid for 3 years from distribution date.
Contact: code@rosie.run
```

## Technical Details

### Git LFS Configuration

Automatic tracking for:
- `sources/*.tar.xz`
- `sources/*.tar.gz`
- `sources/*.tar.bz2`

Setup: `git lfs install` (one-time)

### File Naming Convention

**Sources:** `ffmpeg-X.Y.Z.tar.xz` (official naming)  
**Configs:** `[app]-ffmpeg-[version]-[platform].txt`  
**Checksums:** One `SHA256SUMS` file for all

### Storage Recommendations

- Use Git LFS for files >100MB
- Keep original official tarballs (no modifications)
- Store signatures (.asc) when available
- Document any custom builds separately

## Quick Reference Commands

### Add new archive:
```bash
./download-ffmpeg.sh 6.1.1 "AppName v1.0"
```

### Verify checksum:
```bash
cd sources && sha256sum -c ../verification/SHA256SUMS
```

### Check archive status:
```bash
cat ARCHIVE-INDEX.md
```

### Remove expired archive:
```bash
rm sources/ffmpeg-OLD-VERSION.tar.xz
# Update ARCHIVE-INDEX.md
git commit -m "Remove expired archive"
```

## Important Notes

1. **Never modify archived sources** - Store originals only
2. **Calculate expiration carefully** - 3 years from LAST distribution
3. **Update index religiously** - ARCHIVE-INDEX.md is the source of truth
4. **Use Git LFS** - Prevents repository bloat
5. **Safety buffer** - 6 months extra retention recommended

## Contact & Support

- **Maintainer:** BurntToasters
- **Email:** code@rosie.run
- **Issues:** https://github.com/BurntToasters/FFMPEG-ARCHIVES/issues
- **CONV2:** https://github.com/BurntToasters/CONV2

## External Resources

- **FFmpeg Official:** https://ffmpeg.org
- **FFmpeg Downloads:** https://ffmpeg.org/download.html
- **FFmpeg Legal:** https://ffmpeg.org/legal.html
- **GPL 2.0 License:** https://www.gnu.org/licenses/gpl-2.0.html
- **LGPL 2.1 License:** https://www.gnu.org/licenses/lgpl-2.1.html

---

**Archive Status:** Active  
**Next Review:** April 2026 (quarterly)  
**Last Updated:** January 7, 2026
