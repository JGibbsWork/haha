# Git Repository Guide for Home Assistant

## ✅ What SHOULD Be in Git

Your **configuration** - the things you created:
- `configuration.yaml` (or `configuration_new.yaml`)
- `automations/` - All your automation files
- `scripts_organized/` - All your script files
- `packages/` - Your integration configs (Pavlok, Pi-hole, Govee, etc.)
- `entities/` - Input booleans, counters, helpers
- `scenes.yaml` - Your lighting scenes
- `shell_scripts/` - Your bash scripts
- `.gitignore` - This file itself
- Documentation files (`.md`)

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

## 🔄 How to Restore on New System

1. **Clone your repo**:
   ```bash
   git clone <your-repo-url> /config
   ```

2. **Install HACS**: https://hacs.xyz/docs/setup/download

3. **Reinstall custom components via HACS**:
   - See [CUSTOM_COMPONENTS.md](CUSTOM_COMPONENTS.md) for list

4. **Create secrets.yaml**:
   ```yaml
   # Add your API keys here
   govee_api_key: "..."
   pavlok_bearer_token: "..."
   habitica_user: "..."
   habitica_api_key: "..."
   ```

5. **Restart Home Assistant**

## 📝 Current Status

After the reorganization cleanup:

### Removed from Git (Now Ignored)
- ✅ 2,339 custom component files removed
- ✅ Log files ignored
- ✅ Database files ignored
- ✅ Secrets ignored

### Still Tracked
- ✅ All your automations (organized)
- ✅ All your scripts (organized)
- ✅ All your packages
- ✅ Configuration files
- ✅ Documentation

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

## 📤 Pushing to GitHub

If your repo is too large for GitHub (>100MB warning), you may need to clean history:

```bash
# Check repo size
du -sh .git

# If it's huge, you may need to rewrite history (DESTRUCTIVE!)
# Only do this if absolutely necessary
git filter-branch --tree-filter 'rm -rf custom_components' HEAD
```

---

**Bottom line**: Your git repo should be ~5-10MB of YAML configs, not 50MB+ of dependencies!
