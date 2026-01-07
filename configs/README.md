# Build Configurations

This directory stores FFmpeg build configurations used by applications.

## Purpose

Document exact build settings for:
- Reproducibility
- Compliance verification
- Troubleshooting
- Historical reference

## File Naming Convention

```
[application]-ffmpeg-[version]-[platform].txt

Examples:
- conv2-ffmpeg-6.1.1-windows.txt
- conv2-ffmpeg-6.1.1-macos-arm64.txt
- conv2-ffmpeg-6.1.1-linux.txt
```

## Configuration Template

```txt
Application: [App Name] v[Version]
FFmpeg Version: [X.Y.Z]
Platform: [Windows/macOS/Linux] [arch]
Build Date: YYYY-MM-DD
Builder: [System/Person]

Configure Command:
./configure \
    --enable-gpl \
    --enable-version3 \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libvpx \
    --enable-libopus \
    [additional options]

Dependencies:
- libx264 [version]
- libx265 [version]
- [other libraries]

Compiler: [gcc 11.2.0 / clang 14.0 / MSVC 2022]
Build Flags: [any special CFLAGS, LDFLAGS]

Notes:
[Any special build considerations]
```

## Example Configurations

### CONV2 - User System Install

CONV2 doesn't bundle FFmpeg, so configurations here are for reference:

```txt
Application: CONV2 v1.0.2
FFmpeg Version: User-provided (any recent version)
Platform: All (Windows, macOS, Linux)
Build: System package or official builds

Recommended:
- FFmpeg 6.0 or newer
- With libx264, libx265, libvpx support
- Hardware encoder support (optional)

Notes: CONV2 uses system FFmpeg via PATH.
Users install FFmpeg separately.
```

## Usage

When releasing an application:
1. Document the FFmpeg version/build used or recommended
2. Create configuration file in this directory
3. Reference in `../ARCHIVE-INDEX.md`
4. Update if FFmpeg requirements change
