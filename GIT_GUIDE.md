# Git Repository Guide

## ✅ What SHOULD Be in Git

Your **configuration** - the things you created:
- `configuration.yaml` - Main config
- `automations/` - All automation files
- `scripts_organized/` - All script files
- `packages/` - Integration configs (Pavlok, Pi-hole, Govee, etc.)
- `entities/` - Input booleans, helpers
- `scenes.yaml` - Lighting scenes
- `shell_scripts/` - Bash scripts
- `.gitignore` - This file
- Documentation (`.md` files)

## ❌ What Should NOT Be in Git

### Large Dependencies (~52MB)
- `custom_components/` - Installed via HACS, not your code

### Sensitive Data
- `secrets.yaml` - API keys, passwords
- `pihole_tokens.txt` - Auth tokens
- `.ssh/` - SSH keys

### Runtime/Generated Files
- `*.db` - SQLite databases
- `*.log*` - Log files
- `.storage/` - HA internal state
- `.HA_VERSION` - Version tracking
- `.ha_run.lock` - Lock files

### Reinstallable Resources
- `blueprints/` - Default blueprints from HA
- `themes/` - If you didn't create them
- `www/` - Downloaded resources
- `deps/` - Python dependencies

## 📊 Size Savings

| Item | Size | Reason to Exclude |
|------|------|-------------------|
| custom_components/ | ~52MB | HACS dependencies |
| .storage/ | Varies | Internal HA state |
| *.db files | Large | SQLite databases |
| *.log files | Large | Log history |

**Total saved**: 50-100MB+ not in your repo!

## 🔄 Restore on New System

1. Clone repo: `git clone <your-repo-url> /config`
2. Install HACS: https://hacs.xyz/docs/setup/download
3. Reinstall custom components (see [CUSTOM_COMPONENTS.md](CUSTOM_COMPONENTS.md))
4. Create `secrets.yaml` with your API keys
5. Restart Home Assistant

## 🎯 Quick Commands

**See what's changed**:
```bash
git status
```

**Commit your changes**:
```bash
git add .
git commit -m "Reorganize config into modular structure"
```

**Check repo size**:
```bash
du -sh .git
```

**See what's tracked**:
```bash
git ls-files
```

**See what's ignored**:
```bash
git status --ignored
```

## ⚠️ Important Notes

1. **Never commit secrets.yaml** - It's in .gitignore for a reason
2. **Custom components update frequently** - Let HACS manage them
3. **Backup .HA_VERSION somewhere** - Helps track which HA version your config works with
4. **Document custom integrations** - See CUSTOM_COMPONENTS.md

## 🔐 Security Checklist

Before pushing to GitHub:

- [ ] Check for exposed API keys: `git diff --cached`
- [ ] Verify secrets.yaml is ignored: `git check-ignore secrets.yaml`
- [ ] Ensure pihole_tokens.txt is ignored
- [ ] No Bearer tokens in files
- [ ] No hardcoded passwords

---

**Current Status**: Clean repo at ~19MB (mostly git history), 42 tracked files
