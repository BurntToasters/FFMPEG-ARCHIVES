# Build artifacts and information

This directory stores build-related information for FFmpeg versions used by applications.

## Structure

```
builds/
├── windows/     # Windows-specific builds
├── macos/       # macOS builds (separate for ARM64/Intel if needed)
└── linux/       # Linux builds
```

## What to Store Here

### Optional Information
- Pre-compiled binaries (if distributing)
- Build logs
- Dependency information
- Platform-specific notes

### Not Required for GPL Compliance
If your application doesn't bundle FFmpeg (like CONV2), this directory is optional. The source code in `sources/` is sufficient.

## If You Bundle FFmpeg

If you distribute FFmpeg binaries with your application:

1. **Store the binary or link to where it was obtained**
   ```
   builds/windows/ffmpeg-6.1.1-win64.exe
   builds/windows/SOURCE.txt  # Link to where binary was downloaded
   ```

2. **Document build provenance**
   ```txt
   Binary: ffmpeg-6.1.1-win64.exe
   Source: https://www.gyan.dev/ffmpeg/builds/
   Downloaded: 2026-01-07
   Configuration: Full build with GPL components
   Checksum: [SHA256]
   ```

3. **Reference in ARCHIVE-INDEX.md**

## CONV2 Example

CONV2 doesn't bundle FFmpeg, so this directory is empty for CONV2. Users install their own FFmpeg.

## Storage Note

If storing large binaries, use Git LFS:
```bash
git lfs track "builds/**/*.exe"
git lfs track "builds/**/*.zip"
```
