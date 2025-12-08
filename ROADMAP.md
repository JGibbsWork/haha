# Home Assistant Roadmap & Goals

## ✅ Current Status: CLEAN & ORGANIZED

Your configuration is now:
- 🗂️ **Modular** - Organized into logical folders (automations/, scripts_organized/, packages/)
- 🔐 **Secure** - API keys in secrets.yaml (gitignored)
- 📊 **Lean** - Removed 14 files, 13K+ lines of bloat
- 🎯 **Maintainable** - Easy to find and modify specific features

---

## 🎯 Short-Term Goals (Next Steps)


### 2. **Projector Status Tracking**
- [ ] Buy smart plug with power monitoring (Zigbee/WiFi)
- [ ] Create template sensor: `input_boolean.projector_on` based on power draw
- [ ] Test: Voice commands report accurate state

### 3. **MQTT + Frigate Presence** 🔧 IN PROGRESS
**Status**: Config fixed, waiting on MQTT connection
- [x] Fix MQTT topic mismatches (couch/bed sensors)
- [x] Add missing input_booleans (shocked, bed_restricted, couch_restricted)
- [ ] Debug MQTT timeout errors
- [ ] Test Pavlok enforcement automations

### 4. **Voice Assistant Improvements**
- [ ] Add `description:` fields to all automations (voice discoverability)
- [ ] Rename unclear automations ("bedbuttonthings" → "Bed Button Control")
- [ ] Test new commands: "close everything", "goodnight routine"
- [ ] Add area tags for room-specific commands

---

## 🚀 Long-Term Vision

### **Priority 1: Beautiful Dashboards** 🎨
**Goal**: Create custom, pretty dashboards for daily use

**iPad Dashboard (Guest/Restricted User)**
- [ ] Research custom dashboard frameworks (Mushroom cards, Grid layout)
- [ ] Design layout: quick controls, status at-a-glance
- [ ] Implement user restrictions (hide sensitive controls)
- [ ] Test on iPad: touch-friendly, fast loading

**Main Dashboard (Admin)**
- [ ] Full control panel
- [ ] Status monitors (MQTT, integrations, errors)
- [ ] Quick scenes and automation toggles

**Resources**:
- [Mushroom Cards](https://github.com/piitaya/lovelace-mushroom)
- [Button Card](https://github.com/custom-cards/button-card)
- [Layout Card](https://github.com/thomasloven/lovelace-layout-card)

---

### **Priority 2: MQTT + Pavlok System** ⚡
**Goal**: Reliable presence detection → behavioral enforcement

- [ ] Fix MQTT broker connection (diagnose timeout)
- [ ] Test Frigate zone detection (couch, bed)
- [ ] Verify Pavlok API calls work
- [ ] Add safety limits (max shocks per hour)
- [ ] Create dashboard controls (enable/disable enforcement)

---

### **Priority 3: Enhanced Voice Control** 🎤
**Goal**: "Alexa, but actually helpful"

**Commands to Add**:
- "Close everything for the night" (blinds, lights, projector)
- "Good morning routine" (opens blinds, morning briefing, lights)
- "Movie mode" (dims lights, closes blinds, projector on)
- "Work mode" (bright lights, projector to work profile)

**Implementation**:
- [ ] Create compound scripts for each routine
- [ ] Add conversation triggers to automations
- [ ] Test with voice assistant

---

### **Priority 4: LLM Assistant / AI Manager** 🤖
**Goal**: Context-aware assistant that manages condo, calendar, and habits

**Features**:
- **Morning Briefing**: Weather, calendar, to-dos, commute time
- **Proactive Suggestions**: "It's 10pm, should I close the blinds?"
- **Calendar Integration**: Auto-adjust lights for meetings
- **Habit Tracking**: Integration with Habitica + Pavlok
- **Context Awareness**: Time of day, occupancy, recent activity

**Tech Stack**:
- Use existing `conversation.process` with extended_openai_conversation
- Create custom prompts for different scenarios
- Store context in input_text helpers
- Schedule automations to trigger briefings

**Current Foundation**:
- ✅ You already have `good_morning_briefing` script (LLM-powered!)
- ✅ Extended OpenAI integration installed
- ✅ Calendar, todo, weather integrations ready

**Next Steps**:
- [ ] Design prompt templates for different contexts
- [ ] Create evening briefing script
- [ ] Add proactive notifications (time-based suggestions)
- [ ] Build context memory (last command, time patterns)

---

### **Priority 5: TV/Dashboard Flow** 📺
**Goal**: Seamless dashboard display on TV (ditch Android box)

**Current**: Android TV box → Fully Kiosk Browser → Dashboard
**Proposed**: Built-in TV → Fully Kiosk or Cast → Dashboard

- [ ] Research: Does your TV support Fully Kiosk or casting?
- [ ] Test: Cast Home Assistant dashboard to TV
- [ ] Migrate kiosk scripts from Android box to TV
- [ ] Optimize dashboard for TV (large text, simple controls)

---

### **Priority 6: AdGuard Home** 🛡️
**Goal**: Network-wide ad blocking with HA control

**Why AdGuard > Pi-hole**:
- Better dashboard
- Native HA integration
- DNS-over-HTTPS support
- Profile-based filtering

**Implementation**:
- [ ] Install AdGuard Home on network
- [ ] Set up HA integration
- [ ] Create toggle automations (day/night filtering)
- [ ] Migrate from Pi-hole shell scripts
- [ ] Add dashboard controls

---

### **Priority 7: Plex Server** 🎬
**Goal**: Local media server integrated with HA

**Use Cases**:
- Auto-dim lights when movie starts
- Voice: "Play [movie name]"
- Dashboard: Recently added media

**Setup**:
- [ ] Decide on Plex server hardware (Mac Mini?)
- [ ] Install Plex
- [ ] Add Plex HA integration
- [ ] Create media automations
- [ ] Add Plex card to dashboard

---

## 📋 Documentation Status

### Keep These Docs:
- ✅ **GIT_GUIDE.md** - Reference for git best practices
- ✅ **CUSTOM_COMPONENTS.md** - Tracks installed integrations
- ✅ **ROADMAP.md** (this file) - Goals and progress

### Removed (Outdated):
- ❌ REORGANIZATION_GUIDE.md - Migration complete
- ❌ ADDITIONAL_RECOMMENDATIONS.md - Merged into ROADMAP

---

## 🎓 Learning Resources

**Home Assistant**:
- [Dashboard Design Guide](https://www.home-assistant.io/dashboards/)
- [Voice Assistant Setup](https://www.home-assistant.io/voice_control/)
- [Advanced Templates](https://www.home-assistant.io/docs/configuration/templating/)

**LLM Integration**:
- [Extended OpenAI Conversation](https://github.com/jekalmin/extended_openai_conversation)
- [Llama Conversation](https://github.com/acon96/home-llm)

**Dashboards**:
- [r/homeassistant](https://www.reddit.com/r/homeassistant/) - Dashboard inspiration
- [HACS Frontend](https://hacs.xyz/docs/categories/frontend) - Custom cards

---

## 📊 Progress Tracker

| Feature | Status | Priority |
|---------|--------|----------|
| Clean config structure | ✅ Done | - |
| Security (secrets.yaml) | 🟡 Partial | HIGH |
| MQTT/Frigate | 🟡 Config done | HIGH |
| Projector tracking | ⏳ Waiting on hardware | MEDIUM |
| Voice improvements | ⏳ Planning | HIGH |
| Pretty dashboards | ⏳ Not started | HIGH |
| LLM assistant | 🟡 Foundation ready | MEDIUM |
| TV/dashboard flow | ⏳ Research needed | LOW |
| AdGuard setup | ⏳ Not started | LOW |
| Plex server | ⏳ Not started | LOW |

---

**Last Updated**: 2025-12-08
**Next Review**: After security cleanup + MQTT fix
