# Custom Components & Integrations

This document tracks all custom integrations and components installed on your Home Assistant instance.

**Note**: Custom component files are NOT in git (see `.gitignore`). This doc helps you reinstall them on a new system.

---

## 🎯 Active Custom Components (via HACS)

### **1. HACS (Home Assistant Community Store)**
- **Version**: Latest
- **Purpose**: Manage and install custom components/themes/cards
- **Install URL**: https://hacs.xyz/docs/setup/download
- **Status**: ✅ Core dependency (install this first!)
- **Size**: ~51MB

### **2. Frigate NVR Integration**
- **Purpose**: AI-powered camera system with zone detection
- **Repo**: https://github.com/blakeblackshear/frigate-hass-integration
- **Install**: HACS → Integrations → Search "Frigate"
- **Used For**:
  - Couch zone occupancy detection → Pavlok enforcement
  - Bed zone occupancy detection → Pavlok enforcement
  - MQTT-based presence sensors
- **Config Files**:
  - `packages/frigate.yaml` - Binary sensors
  - `automations/behavioral/pavlok_enforcement.yaml` - Triggers
- **Status**: ✅ Active, ⚠️ MQTT timeout issues
- **Size**: ~292KB

### **3. Govee Integration (HACS)**
- **Purpose**: Cloud API control for Govee smart lights
- **Repo**: https://github.com/LaggAt/hacs-govee
- **Install**: HACS → Integrations → Search "Govee"
- **Used For**:
  - REST API light control (scenes, brightness, colors)
  - Living room, DJ zone, dining strip control
- **Config Files**:
  - `packages/govee_rest_hardcoded.yaml` - Device definitions
  - `packages/govee_rest_strips.yaml` - Strip configs
  - `packages/govee_scenes.yaml` - Scene REST commands
  - `scripts_organized/lighting/lighting.yaml` - Control scripts
- **Status**: ✅ Active, ⚠️ Occasional API timeouts
- **Size**: ~212KB
- **Note**: Also using built-in `govee_light_local` for local BLE control

### **4. Extended OpenAI Conversation**
- **Purpose**: Enhanced AI assistant with OpenAI API integration
- **Repo**: https://github.com/jekalmin/extended_openai_conversation
- **Install**: HACS → Integrations → Search "Extended OpenAI"
- **Used For**:
  - Morning briefing script (weather, calendar, todos → AI summary)
  - Voice commands with context awareness
  - Future: LLM assistant for condo/calendar management
- **Config Files**:
  - `scripts_organized/misc/misc.yaml` - `good_morning_briefing` script
  - Uses `conversation.process` service
- **API Key**: Stored in `secrets.yaml` (likely)
- **Status**: ✅ Active
- **Size**: ~132KB

### **5. Llama Conversation**
- **Purpose**: Local AI conversation using Llama/Ollama models
- **Repo**: https://github.com/acon96/home-llm
- **Install**: HACS → Integrations → Search "Llama Conversation"
- **Used For**:
  - Privacy-focused AI assistant (runs locally)
  - Alternative to OpenAI for offline use
- **Status**: ⚠️ Installed but may not be actively used
- **Size**: ~272KB
- **Note**: Requires Ollama/Llama model running locally

---

## 🏠 Built-In HA Integrations (Not HACS)

These are official Home Assistant integrations, configured in your setup:

### **Govee Light Local**
- **Type**: Built-in HA integration (not HACS)
- **Purpose**: Local Bluetooth control for Govee devices
- **Used For**: H61B9 devices (unsupported model warning in logs)
- **Status**: ⚠️ Limited support, power control only

### **MQTT**
- **Type**: Built-in HA integration
- **Purpose**: Message broker for Frigate sensors
- **Used For**: Frigate zone detection events
- **Status**: ❌ Connection timeout issues (needs debugging)
- **Config**: Likely auto-discovered or in `configuration.yaml`

### **Habitica**
- **Type**: Built-in HA integration
- **Purpose**: Habit tracking gamification
- **Used For**: Negative habit tracking (lounge time)
- **Config**: `packages/habitica.yaml` - REST commands
- **API Keys**: In `secrets.yaml`
- **Status**: ✅ Active

### **Spotify**
- **Type**: Built-in HA integration
- **Purpose**: Music playback control
- **Used For**: Playlist scripts (Bossa Nova, Home playlist)
- **Config**: `scripts_organized/media/media.yaml`
- **Status**: ✅ Active

### **Google Calendar**
- **Type**: Built-in HA integration
- **Purpose**: Calendar events for briefings
- **Used For**: Morning briefing script
- **Status**: ✅ Active

### **Todoist**
- **Type**: Built-in HA integration
- **Purpose**: To-do list management
- **Used For**: Morning briefing to-dos
- **Status**: ⚠️ Occasional API errors

### **Weather (NWS)**
- **Type**: Built-in HA integration (National Weather Service)
- **Purpose**: Weather data for briefings
- **Used For**: Morning briefing, automation conditions
- **Status**: ✅ Active

### **Sonos**
- **Type**: Built-in HA integration
- **Purpose**: Sonos speaker control
- **Used For**: Bedroom speaker (occasional unavailable warnings)
- **Status**: 🟡 Intermittent

---

## 📦 Frontend Cards (HACS)

For future dashboard improvements, consider installing:

### **Recommended for Pretty Dashboards**:
- **Mushroom Cards** - Modern, beautiful card designs
  - Repo: https://github.com/piitaya/lovelace-mushroom
- **Button Card** - Highly customizable button cards
  - Repo: https://github.com/custom-cards/button-card
- **Layout Card** - Grid/masonry layouts
  - Repo: https://github.com/thomasloven/lovelace-layout-card
- **Mini Graph Card** - Compact sensor graphs
  - Repo: https://github.com/kalkih/mini-graph-card

---

## 🔄 Restore on New System

**Step-by-Step:**

1. **Install HACS** (do this first!)
   ```bash
   # Follow official guide
   https://hacs.xyz/docs/setup/download
   ```

2. **Install Custom Components** (via HACS UI)
   - Open HACS → Integrations
   - Search and install:
     - ✅ Frigate NVR Integration
     - ✅ Govee
     - ✅ Extended OpenAI Conversation
     - ✅ Llama Conversation (optional)

3. **Configure Built-In Integrations** (via HA UI)
   - Settings → Devices & Services → Add Integration
   - Add:
     - MQTT (configure broker)
     - Spotify (OAuth login)
     - Google Calendar (OAuth login)
     - Todoist (API token)
     - Habitica (configured via REST commands in packages/)

4. **Create secrets.yaml**
   ```yaml
   # Add your API keys
   pavlok_token: "Bearer YOUR_TOKEN"
   habitica_user_id: "YOUR_USER_ID"
   habitica_api_key: "YOUR_API_KEY"
   # Add others as needed
   ```

5. **Restart Home Assistant**

---

## 📊 Summary

| Type | Count | Total Size |
|------|-------|------------|
| HACS Custom Components | 5 | ~52MB |
| Built-in Integrations | 8+ | N/A |
| Frontend Cards | 0 (add later) | N/A |

**Git Status**:
- ✅ Config files committed (packages/, automations/, scripts/)
- ❌ Component code ignored (too large, reinstallable)
- ✅ This doc committed (restoration guide)

**Total size saved in git**: ~52MB 🎉

---

## 🐛 Known Issues

1. **MQTT Connection Timeout** - Frigate sensors failing to connect
2. **Govee H61B9 Unsupported** - Using local integration, limited to power control
3. **Sonos Intermittent** - Bedroom speaker occasionally unreachable
4. **HACS Archived Repo Warning** - 'TheOneOgre/govee-cloud' should be removed

---

**Last Updated**: 2025-12-08
**Next Review**: After MQTT fix + dashboard card installation
