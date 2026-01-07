# FFMPEG-ARCHIVES

A 3-year rolling archive of FFmpeg source code and builds to comply with GPL 2.0+ licensing requirements.

## Purpose

This repository serves as a **GPL 2+ compliance archive** maintaining:
- FFmpeg source code for versions used in production applications
- Build artifacts and configuration information
- 3-year retention period as required by GPL 2.0+

### Applications Using This Archive
- **CONV2** - Cross-platform FFmpeg GUI (https://github.com/BurntToasters/CONV2)
- Future applications as needed

## Archive Policy

FFmpeg is licensed under LGPL 2.1+ or GPL 2+ (depending on build configuration). When distributing applications that use FFmpeg, you must:

1. **Provide access to FFmpeg source code** - This repository serves that purpose
2. **Include license notices** - FFmpeg's license must be included with your application
3. **Document the FFmpeg version used** - Track which version your application uses
4. **Provide build instructions** - Document how FFmpeg was built (if using custom builds)

## How to Use This Archive

### For Compliance Officers

If requesting source code for a distributed application:

1. Check [ARCHIVE-INDEX.md](ARCHIVE-INDEX.md) for the version used
2. Download source from `sources/` directory
3. Review build configuration in `configs/`
4. Verify checksums in `verification/`

### For Developers

When releasing a new version of your application:

1. Document which FFmpeg version you're using
2. Add source tarball to `sources/` (if not already archived)
3. Update `ARCHIVE-INDEX.md` with release date and expiration
4. Store build configuration in `configs/`
5. Generate checksums for verification

## Current Archive Contents

See [ARCHIVE-INDEX.md](ARCHIVE-INDEX.md) for the complete list of archived FFmpeg versions.

### Latest Additions
- Check `ARCHIVE-INDEX.md` for most recent entries
- FFmpeg sources stored in `sources/` directory
- Build information in `builds/` and `configs/` directories

## Archive Retention Schedule

### Automatic Cleanup Policy

Archives are retained for **3 years + 6 months** (safety buffer) from last distribution:

| Archive Date | Expiration | Status | Can Remove After |
|--------------|-----------|--------|------------------|
| See ARCHIVE-INDEX.md for current schedule |

### Manual Review

Before removing any archive:
1. Verify 3+ years have passed since last distribution
2. Confirm no active written offers reference this version
3. Check for any pending compliance requests
4. Document removal in git history

## Adding New Archives

### When to Archive

Archive a new FFmpeg version when:
- Releasing a production version of an application
- Distributing binaries that use FFmpeg
- Starting a new project that will use FFmpeg

### How to Archive

```bash
# Download FFmpeg source
wget https://ffmpeg.org/releases/ffmpeg-VERSION.tar.xz
wget https://ffmpeg.org/releases/ffmpeg-VERSION.tar.xz.asc

# Verify signature (optional but recommended)
gpg --verify ffmpeg-VERSION.tar.xz.asc

# Add to archive
mv ffmpeg-VERSION.tar.xz sources/

# Generate checksum
cd sources/
sha256sum ffmpeg-VERSION.tar.xz >> ../verification/SHA256SUMS

# Update index
# Edit ARCHIVE-INDEX.md with:
# - Version number
# - Archive date
# - Application/release it's for
# - Expiration date (3 years from now)
```

## Build Information

Build configurations and instructions are stored in:
- `builds/windows/` - Windows build artifacts and notes
- `builds/macos/` - macOS builds (ARM64 and Intel)
- `builds/linux/` - Linux build information
- `configs/` - Configure scripts and options used

### Storing Build Info

When archiving, document:
```bash
# Example: configs/conv2-v1.0.2-ffmpeg-config.txt
FFmpeg Version: 6.1.1
Application: CONV2 v1.0.2
Build Date: 2026-01-07
Configure Options: --enable-gpl --enable-libx264 --enable-libx265
Platform: Windows x64
```

## License Information

### This Archive
- **Archive Repository:** Public Domain / CC0 (for organizational content)
- **FFmpeg Source Code:** Retains original LGPL 2.1+ / GPL 2+ licenses
- **Purpose:** GPL compliance - making source code available

### FFmpeg Licensing
- **LGPL 2.1+** - Core libraries (default)
- **GPL 2+** - When using libx264, libx265, and other GPL components
- **License Files:** Included in each source tarball

## Archive Maintenance Checklist

### Adding New Archive
- [ ] Download official FFmpeg source tarball
- [ ] Verify checksum/signature
- [ ] Add to `sources/` directory
- [ ] Update `ARCHIVE-INDEX.md`
- [ ] Store build configuration in `configs/`
- [ ] Generate SHA256 checksum
- [ ] Set expiration date (3 years from release)
- [ ] Commit with descriptive message

### Quarterly Review
- [ ] Check expiration dates in `ARCHIVE-INDEX.md`
- [ ] Verify no archives expired prematurely
- [ ] Confirm active written offers are covered
- [ ] Update documentation if needed

### Removing Expired Archives
- [ ] Verify expiration date has passed
- [ ] Check no active written offers remain
- [ ] Document removal reason
- [ ] Remove files from archive
- [ ] Update `ARCHIVE-INDEX.md`
- [ ] Commit with explanation

## Archive Guidelines

### What to Archive
✅ **DO Archive:**
- Official FFmpeg source tarballs (.tar.xz, .tar.gz)
- Build configuration files used
- Version information and release notes
- Checksums for verification

❌ **DON'T Archive:**
- Compiled binaries (too large, use Git LFS if needed)
- Intermediate build files
- Personal development builds
- Unverified or modified sources (document modifications separately)

### Git LFS Recommendation

For source tarballs over 100MB, use Git Large File Storage:
```bash
git lfs install
git lfs track "sources/*.tar.xz"
git lfs track "sources/*.tar.gz"
```

## Related Resources

- **FFmpeg Official:** https://ffmpeg.org
- **FFmpeg Legal:** https://ffmpeg.org/legal.html
- **GPL 2.0 Text:** https://www.gnu.org/licenses/gpl-2.0.html
- **LGPL 2.1 Text:** https://www.gnu.org/licenses/lgpl-2.1.html

## Contact & Questions

- **Archive Maintainer:** BurntToasters (code@rosie.run)
- **Compliance Questions:** code@rosie.run
- **CONV2 Issues:** https://github.com/BurntToasters/CONV2/issues

## Legal Notice

**Purpose:** This repository exists solely for GPL 2+ compliance, providing access to FFmpeg source code for applications that use it.

**Affiliation:** This archive is maintained independently. FFmpeg is developed by the FFmpeg team and is not affiliated with this repository.

**Source Code:** All archived FFmpeg source code retains its original licenses (LGPL 2.1+ / GPL 2+).

**Written Offer:** This archive fulfills the "written offer" requirement under GPL 2.0+ Section 3(b) for any applications documented in ARCHIVE-INDEX.md.

---

*Archive Established: January 7, 2026*  
*Last Updated: January 7, 2026*
