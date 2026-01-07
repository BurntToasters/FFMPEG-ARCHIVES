# Integrating FFmpeg License Information into CONV2

This document provides instructions for properly integrating FFmpeg license information into the CONV2 application.

## Current Implementation Status

Based on the CONV2 source code analysis, the application already includes:
- ✅ License viewing functionality in Settings → View Credits
- ✅ `licenses.json` file generated via `npm run licenses`
- ✅ Attribution system for dependencies

## Adding FFmpeg License Information

### Step 1: Update licenses.json

The `licenses.json` file should include FFmpeg information. Since FFmpeg is a system dependency (not an npm package), it needs to be added manually.

Create or update `licenses.json` in the CONV2 root directory:

```json
{
  "ffmpeg": {
    "name": "FFmpeg",
    "version": "User-provided (system installation)",
    "license": "LGPL-2.1-or-later",
    "licenses": ["LGPL-2.1-or-later", "GPL-2.0-or-later"],
    "repository": "https://github.com/FFmpeg/FFmpeg",
    "licenseUrl": "https://ffmpeg.org/legal.html",
    "url": "https://ffmpeg.org",
    "description": "A complete, cross-platform solution to record, convert and stream audio and video.",
    "copyright": "FFmpeg developers",
    "note": "FFmpeg is licensed under LGPL 2.1+ by default. When using certain components (libx264, libx265), it becomes GPL 2+. This application uses FFmpeg as an external dependency installed by the user."
  }
}
```

### Step 2: Update Renderer to Show FFmpeg License

The current CONV2 code already supports license display. Ensure FFmpeg is included in the credits modal.

Update `src/renderer/renderer.ts` to handle special FFmpeg entry:

```typescript
// In the loadCredits function, add special handling for FFmpeg
const loadCredits = async (): Promise<void> => {
  try {
    const licenses = await window.electronAPI.getLicenses();
    if (!licenses || Object.keys(licenses).length === 0) {
      const warning = document.createElement('div');
      warning.className = 'license-item license-warning';
      warning.textContent = 'licenses.json is missing or empty.';
      elements.licensesList.appendChild(warning);
      return;
    }

    // Add FFmpeg special entry first
    const ffmpegEntry: LicenseDisplayEntry = {
      name: 'FFmpeg',
      license: 'LGPL 2.1+ / GPL 2+',
      link: 'https://ffmpeg.org',
      note: 'External dependency - User-installed system binary. Source code available at ffmpeg.org.',
      isSpecial: true
    };
    
    const ffmpegDiv = document.createElement('div');
    ffmpegDiv.className = 'license-item special-license';
    ffmpegDiv.innerHTML = `
      <div class="license-header">
        <strong>${ffmpegEntry.name}</strong>
        <span class="license-type">${ffmpegEntry.license}</span>
      </div>
      ${ffmpegEntry.link ? `<a href="${ffmpegEntry.link}" class="license-link">Project Website</a>` : ''}
      ${ffmpegEntry.note ? `<div class="license-note">${ffmpegEntry.note}</div>` : ''}
    `;
    elements.licensesList.appendChild(ffmpegDiv);

    // Continue with regular licenses...
    // (existing code)
  } catch {
    elements.licensesList.innerHTML =
      '<div class="license-item license-error">Unable to load licenses.</div>';
  }
};
```

### Step 3: Add FFmpeg-Specific CSS Styles

Update `src/renderer/main.css` to style the special FFmpeg license entry:

```css
/* Add to existing CSS */

.special-license {
  background: linear-gradient(135deg, rgba(99, 102, 241, 0.1), rgba(139, 92, 246, 0.1));
  border-left: 3px solid var(--primary);
}

.license-note {
  margin-top: 8px;
  padding: 8px 12px;
  background: var(--bg-tertiary);
  border-radius: 4px;
  font-size: 12px;
  color: var(--text-secondary);
  line-height: 1.5;
}
```

### Step 4: Add README Notice

Update CONV2's `README.md` to mention FFmpeg licensing:

```markdown
## License

CONV2 is licensed under the [Mozilla Public License 2.0](LICENSE).

### Third-Party Software

CONV2 uses FFmpeg as an external dependency:
- **FFmpeg**: Licensed under LGPL 2.1+ (or GPL 2+ when using certain components)
- **Source Code**: Available at https://ffmpeg.org
- **This Repository**: https://github.com/BurntToasters/FFMPEG-ARCHIVES

For complete license information, see Settings → View Credits in the application.
```

### Step 5: Update Application Help Text

Add FFmpeg license information to the application's help or about section. Update `src/renderer/index.html`:

```html
<!-- Add to settings modal or create an About section -->
<div class="setting-section">
  <h3>About FFmpeg</h3>
  <p>
    CONV2 uses FFmpeg for video conversion. FFmpeg is licensed under 
    LGPL 2.1+ (or GPL 2+ depending on components).
  </p>
  <p>
    <a href="#" id="ffmpegSourceLink">View FFmpeg Source Code Information</a>
  </p>
</div>
```

And add the handler in `src/renderer/renderer.ts`:

```typescript
// Add to event listeners
const setupFFmpegSourceLink = () => {
  const ffmpegSourceLink = document.getElementById('ffmpegSourceLink');
  if (ffmpegSourceLink) {
    ffmpegSourceLink.addEventListener('click', async (e) => {
      e.preventDefault();
      await window.electronAPI.openExternal('https://github.com/BurntToasters/FFMPEG-ARCHIVES');
    });
  }
};

// Call in init()
setupFFmpegSourceLink();
```

## Implementation Checklist

To ensure proper FFmpeg license integration in CONV2:

### Code Changes
- [ ] Add FFmpeg entry to `licenses.json`
- [ ] Update `src/renderer/renderer.ts` to display FFmpeg license
- [ ] Add CSS styles for special license entries
- [ ] Add FFmpeg source link to settings/help
- [ ] Update `README.md` with license information

### Documentation
- [ ] Create this integration guide
- [ ] Update CONV2 documentation to mention FFmpeg licensing
- [ ] Link to FFMPEG-ARCHIVES repository

### Testing
- [ ] Verify FFmpeg shows in credits modal
- [ ] Test "View FFmpeg Source" link opens correctly
- [ ] Confirm license text is clear and accurate
- [ ] Check all platforms (Windows, macOS, Linux)

### Distribution
- [ ] Include license information in all release packages
- [ ] Add FFmpeg requirement to installation instructions
- [ ] Update GitHub release notes to mention GPL compliance

## Build-Time Integration

### Update package.json Scripts

Add a script to verify license information:

```json
{
  "scripts": {
    "licenses": "npm run licenses:prod && node build/add-ffmpeg-license.js",
    "licenses:prod": "npx npm-license-crawler --production --json licenses.json"
  }
}
```

### Create build/add-ffmpeg-license.js

```javascript
const fs = require('fs');
const path = require('path');

const licensesPath = path.join(__dirname, '..', 'licenses.json');

// Read existing licenses
let licenses = {};
if (fs.existsSync(licensesPath)) {
  licenses = JSON.parse(fs.readFileSync(licensesPath, 'utf-8'));
}

// Add FFmpeg entry
licenses['FFmpeg (System Dependency)'] = {
  licenses: 'LGPL-2.1-or-later',
  repository: 'https://github.com/FFmpeg/FFmpeg',
  url: 'https://ffmpeg.org',
  licenseUrl: 'https://ffmpeg.org/legal.html',
  note: 'FFmpeg is used as an external system dependency. Users must install FFmpeg separately. Source code available at ffmpeg.org. When using GPL components (libx264, libx265), FFmpeg is licensed under GPL 2.0+.',
  version: 'User-provided',
  copyright: 'FFmpeg developers',
  sourceCode: 'https://github.com/BurntToasters/FFMPEG-ARCHIVES'
};

// Write back
fs.writeFileSync(licensesPath, JSON.stringify(licenses, null, 2));
console.log('✓ Added FFmpeg license information to licenses.json');
```

### Update electron-builder Configuration

Ensure `licenses.json` is included in the build. In `package.json`:

```json
{
  "build": {
    "files": [
      "dist/**/*",
      "assets/**/*",
      "licenses.json"
    ]
  }
}
```

## Runtime Detection

### Detect FFmpeg Version

Add code to detect and display the installed FFmpeg version:

```typescript
// In src/main/ffmpeg.ts
export const getFFmpegVersion = async (): Promise<string> => {
  return new Promise((resolve) => {
    const process = spawn('ffmpeg', ['-version']);
    let output = '';

    process.stdout?.on('data', (data) => {
      output += data.toString();
    });

    process.on('close', () => {
      const match = output.match(/ffmpeg version ([^\s]+)/);
      resolve(match ? match[1] : 'Unknown');
    });

    process.on('error', () => {
      resolve('Not installed');
    });
  });
};
```

```typescript
// In src/main/main.ts
ipcMain.handle('get-ffmpeg-version', async () => {
  return await getFFmpegVersion();
});
```

```typescript
// In src/renderer/renderer.ts
const displayFFmpegInfo = async () => {
  const version = await window.electronAPI.getFFmpegVersion();
  console.log(`FFmpeg version: ${version}`);
  // Display in UI if desired
};
```

## Distribution Packages

### Windows Installer (NSIS)

Add license information to the installer. Create `build/license.txt`:

```
CONV2 - Video Converter
=======================

License: Mozilla Public License 2.0

Third-Party Software:
---------------------

FFmpeg
License: LGPL 2.1+ / GPL 2+ (depending on components)
Website: https://ffmpeg.org
Source Code: https://github.com/BurntToasters/FFMPEG-ARCHIVES

FFmpeg must be installed separately by the user.
Instructions: https://github.com/BurntToasters/CONV2#readme
```

Update `package.json` build config:

```json
{
  "build": {
    "nsis": {
      "license": "build/license.txt"
    }
  }
}
```

### macOS DMG

Include a README in the DMG. Create `build/dmg-readme.txt`:

```
CONV2 requires FFmpeg to be installed.

To install FFmpeg on macOS:
  brew install ffmpeg

License Information:
  CONV2: Mozilla Public License 2.0
  FFmpeg: LGPL 2.1+ / GPL 2+

FFmpeg source code: https://ffmpeg.org
Compliance documentation: https://github.com/BurntToasters/FFMPEG-ARCHIVES
```

### Linux Packages

For DEB/RPM packages, list FFmpeg as a dependency:

```json
{
  "build": {
    "linux": {
      "depends": ["ffmpeg"],
      "description": "Cross-platform video converter using FFmpeg.\nRequires FFmpeg to be installed.\nFFmpeg is licensed under LGPL 2.1+ / GPL 2+.\nSource: https://ffmpeg.org"
    }
  }
}
```

## Automated Compliance Checks

### Pre-Release Checklist Script

Create `build/check-compliance.js`:

```javascript
#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

console.log('Checking GPL Compliance...\n');

const checks = [
  {
    name: 'licenses.json exists',
    check: () => fs.existsSync('licenses.json'),
  },
  {
    name: 'licenses.json includes FFmpeg',
    check: () => {
      const licenses = JSON.parse(fs.readFileSync('licenses.json', 'utf-8'));
      return Object.keys(licenses).some(k => k.toLowerCase().includes('ffmpeg'));
    },
  },
  {
    name: 'README mentions FFmpeg licensing',
    check: () => {
      const readme = fs.readFileSync('README.md', 'utf-8');
      return readme.includes('FFmpeg') && readme.includes('license');
    },
  },
  {
    name: 'FFMPEG-ARCHIVES link included',
    check: () => {
      const readme = fs.readFileSync('README.md', 'utf-8');
      return readme.includes('FFMPEG-ARCHIVES') || readme.includes('ffmpeg.org');
    },
  },
];

let passed = 0;
let failed = 0;

checks.forEach(({ name, check }) => {
  try {
    if (check()) {
      console.log(`✓ ${name}`);
      passed++;
    } else {
      console.log(`✗ ${name}`);
      failed++;
    }
  } catch (error) {
    console.log(`✗ ${name} (error: ${error.message})`);
    failed++;
  }
});

console.log(`\nResults: ${passed} passed, ${failed} failed`);

if (failed > 0) {
  console.log('\n⚠️  Some compliance checks failed. Please review before release.');
  process.exit(1);
} else {
  console.log('\n✓ All compliance checks passed!');
}
```

Add to `package.json`:

```json
{
  "scripts": {
    "prerelease": "node build/check-compliance.js",
    "release:win": "npm run prerelease && ..."
  }
}
```

## User Communication

### Installation Instructions

Update CONV2's installation guide:

```markdown
## Installation

### 1. Install FFmpeg (Required)

CONV2 requires FFmpeg to be installed on your system:

**Windows:**
- Download from https://www.gyan.dev/ffmpeg/builds/
- Or use Chocolatey: `choco install ffmpeg`

**macOS:**
```bash
brew install ffmpeg
```

**Linux:**
```bash
sudo apt install ffmpeg  # Debian/Ubuntu
sudo dnf install ffmpeg  # Fedora
```

### 2. Install CONV2

Download the latest release for your platform from [Releases](https://github.com/BurntToasters/CONV2/releases).

### License Information

CONV2 is licensed under MPL 2.0. FFmpeg (required dependency) is licensed 
under LGPL 2.1+ / GPL 2+. For complete licensing information and FFmpeg 
source code, visit:

- FFmpeg: https://ffmpeg.org
- Compliance Documentation: https://github.com/BurntToasters/FFMPEG-ARCHIVES
```

## Maintenance

### Regular Updates

1. **Monitor FFmpeg releases**: Check https://ffmpeg.org/download.html quarterly
2. **Update documentation**: Keep version information current
3. **Test compatibility**: Verify CONV2 works with latest FFmpeg
4. **Update source links**: Ensure all download links are valid

### Issue Templates

Create `.github/ISSUE_TEMPLATE/ffmpeg-issue.md`:

```markdown
---
name: FFmpeg-related issue
about: Report issues related to FFmpeg installation or licensing
---

**FFmpeg Version**
Run `ffmpeg -version` and paste the output here.

**Issue Description**
Describe the issue...

**License Question**
If this is about licensing, please specify...

**Additional Context**
FFmpeg source code and compliance information: https://github.com/BurntToasters/FFMPEG-ARCHIVES
```

## Summary

To fully integrate FFmpeg license compliance into CONV2:

1. ✅ Add FFmpeg to `licenses.json`
2. ✅ Display FFmpeg license in credits modal
3. ✅ Link to FFMPEG-ARCHIVES repository
4. ✅ Update README with license information
5. ✅ Include compliance checks in build process
6. ✅ Document FFmpeg requirements clearly

This ensures users are informed about FFmpeg's licensing and have easy access to source code information.

---

For questions or issues, please file an issue at:
- CONV2: https://github.com/BurntToasters/CONV2/issues
- FFmpeg Archives: https://github.com/BurntToasters/FFMPEG-ARCHIVES/issues
