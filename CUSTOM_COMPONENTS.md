# Custom Components

This file tracks which custom components are installed via HACS.
The actual component files are NOT committed to git (they're in .gitignore).

## Installed Custom Components

### HACS (Home Assistant Community Store)
- **Size**: ~51MB
- **Purpose**: Custom component store/manager
- **Install**: https://hacs.xyz/docs/setup/download

### Frigate
- **Size**: ~292KB
- **Purpose**: NVR integration with AI object detection
- **Repo**: https://github.com/blakeblackshear/frigate-hass-integration
- **Config**: Used for couch/bed zone detection

### Govee
- **Size**: ~212KB
- **Purpose**: Govee smart light control via API
- **Repo**: https://github.com/LaggAt/hacs-govee (or similar)
- **Config**: See packages/govee_*.yaml

### Extended OpenAI Conversation
- **Size**: ~132KB
- **Purpose**: Enhanced AI conversation with OpenAI API
- **Repo**: https://github.com/jekalmin/extended_openai_conversation
- **Config**: Used for morning briefing and voice commands

### Llama Conversation
- **Size**: ~272KB
- **Purpose**: Local AI conversation using Llama models
- **Repo**: https://github.com/acon96/home-llm (or similar)
- **Config**: Alternative to OpenAI for privacy

## Why Not in Git?

Custom components are **dependencies**, like `node_modules` in JavaScript projects:
- 🔴 **52MB+ total** - too large for git
- 🔴 **Not your code** - maintained by other developers
- 🔴 **Reinstallable** - HACS can reinstall them anytime
- 🔴 **Auto-updated** - HACS updates them, would create constant git conflicts

## How to Restore on New System

1. Install HACS first: https://hacs.xyz/docs/setup/download
2. Open HACS in Home Assistant UI
3. Install these integrations:
   - Frigate
   - Govee
   - Extended OpenAI Conversation
   - Llama Conversation
4. Restart Home Assistant

## Git Status

✅ **Configuration files**: Committed (packages/, automations/, etc.)
❌ **Custom component code**: Ignored (.gitignore)
✅ **This documentation**: Committed (so you know what to reinstall)

---

**Total size saved**: ~52MB not in your repo! 🎉
