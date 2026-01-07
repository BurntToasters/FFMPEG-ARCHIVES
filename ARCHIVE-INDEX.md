# FFmpeg Archive Index

This file tracks all FFmpeg source archives maintained in this repository for GPL 2+ compliance.

## Archive Retention Policy

**Minimum Retention:** 3 years from last distribution date  
**Safety Buffer:** +6 months recommended  
**Review Schedule:** Quarterly

## Active Archives

### FFmpeg 6.1.1
- **Archive Date:** 2026-01-07
- **Source File:** `sources/ffmpeg-6.1.1.tar.xz`
- **Used By:** CONV2 v1.0.2+
- **First Distribution:** 2026-01-07
- **Last Distribution:** 2026-01-07 (current)
- **Earliest Removal:** 2029-07-07 (3 years + 6 months)
- **Status:** ✅ Active
- **Notes:** Latest stable release, recommended for all new deployments
- **Checksum:** See `verification/SHA256SUMS`
- **Build Config:** `configs/conv2-ffmpeg-6.1.1-config.txt`

---

## Archive Entry Template

When adding a new archive, copy this template:

```markdown
### FFmpeg X.Y.Z
- **Archive Date:** YYYY-MM-DD
- **Source File:** `sources/ffmpeg-X.Y.Z.tar.xz`
- **Used By:** [Application Name] vX.Y.Z
- **First Distribution:** YYYY-MM-DD
- **Last Distribution:** YYYY-MM-DD
- **Earliest Removal:** YYYY-MM-DD (calculate: last distribution + 3 years + 6 months)
- **Status:** ✅ Active | ⏳ Pending Removal | ❌ Removed
- **Notes:** Any relevant information
- **Checksum:** See `verification/SHA256SUMS`
- **Build Config:** `configs/[app]-ffmpeg-X.Y.Z-config.txt`
```

---

## Removed Archives

Archives removed after expiration are documented here for historical reference.

### Template for Removed Entries
```markdown
### FFmpeg X.Y.Z [REMOVED YYYY-MM-DD]
- **Archived:** YYYY-MM-DD to YYYY-MM-DD
- **Reason:** Expired (no distribution since YYYY-MM-DD)
- **Removal Authorization:** [Name/Process]
```

---

## Expiration Schedule

Quick reference for upcoming archive expirations:

| Version | Last Distribution | Can Remove After | Status |
|---------|------------------|------------------|---------|
| 6.1.1 | 2026-01-07 | 2029-07-07 | Active |

---

## Compliance Notes

### Written Offer Wording

For applications distributed with reference to this archive:

> "The complete corresponding source code for FFmpeg is available at:
> https://github.com/BurntToasters/FFMPEG-ARCHIVES
>
> This offer is valid for three years from the date of distribution."

### Updating This Index

**When releasing a new application version:**
1. Add new archive entry if FFmpeg version changed
2. Update "Last Distribution" date for existing archives
3. Recalculate "Earliest Removal" date
4. Commit changes with release version in message

**Quarterly review (every 3 months):**
1. Check for archives approaching expiration
2. Verify written offers are still within 3-year window
3. Update status for any expired archives
4. Document any removals

---

*Index Last Updated: January 7, 2026*
