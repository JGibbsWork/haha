# Home Assistant - Detailed Implementation Plan

## 🎯 Current Focus

### 1. MQTT + Pavlok System ⚡
**Status**: 85% - Foundation complete, needs safety & testing

**Done**:
- [x] Fix MQTT broker connection
- [x] Fix zone detection sensors (couch, bed)
- [x] Add required input_booleans

**To Do**:
- [ ] Add safety limits:
  - Max shocks per hour (suggested: 2)
  - Cooldown period between shocks (suggested: 30min)
  - Hard daily cap (suggested: 5)
- [ ] Add explicit "disable Pavlok" kill-switch to dashboard
- [ ] Test full enforcement cycles end-to-end
- [ ] Add logging for debugging shock triggers

---

### 2. Projector Status Tracking
**Status**: Needs hardware

**Tasks**:
- [ ] Purchase smart plug with power monitoring (Zigbee/WiFi)
- [ ] Create template sensor to infer state from wattage
- [ ] Add projector state to dashboard
- [ ] Add voice query: "Is the projector on?"

---

## 🚀 Priority Queue

### Priority 1: Voice Assistant Improvements 🎤
**Goal**: Make voice control actually useful daily

**Tasks**:
- [ ] Add `description:` fields to all automations (enables voice discovery)
- [ ] Rename unclear entities:
  - "bedbuttonthings" → "Bed Button Control"
  - Others TBD during audit
- [ ] Build compound scripts:
  - [ ] "Close everything" (blinds, lights, projector off)
  - [ ] "Good morning routine" (blinds open, morning briefing, lights on)
  - [ ] "Movie mode" (lights dim, blinds close, projector on)
  - [ ] "Work mode" (bright lights, projector to work profile)
- [ ] Test voice triggers with real phrasing

**Why first**: Quick wins, immediate quality-of-life improvement

---

### Priority 2: LLM Assistant Expansion 🤖
**Goal**: Context-aware assistant for daily management

**Current Foundation**:
- ✅ `good_morning_briefing` script (working!)
- ✅ Extended OpenAI integration
- ✅ Calendar, todo, weather integrations

**Tasks**:
- [ ] Create evening briefing script
- [ ] Add proactive time-based suggestions:
  - "It's 10pm, should I close the blinds?"
  - "You have a meeting in 15 minutes"
- [ ] Meeting-aware lighting (auto-adjust during calendar events)
- [ ] Habit tracking integration (Habitica + Pavlok stats)

---

### Priority 3: AdGuard Home Integration 🛡️
**Goal**: Control DNS filtering from HA

**Done**:
- [x] AdGuard installed on network

**Tasks**:
- [ ] Set up official HA integration
- [ ] Create toggles for filtering profiles:
  - Day mode (normal filtering)
  - Night mode (stricter filtering)
  - Focus mode (tighten filtering)
  - Break mode (relax filtering)
- [ ] Add dashboard controls

---

## 🌱 Future Ideas (Not Prioritized Yet)

### Behavior Nudges
**Concept**: Use presence detection for helpful automation

**Potential Features**:
- Kitchen presence → ambient lighting during cooking hours
- Evening presence in living room → "Want to start your evening routine?"
- Long sitting detection → gentle nudge to move (notification, light cue, Pavlok buzz)

**Notes**: Low priority until core features solid

---

### Additional Cameras
**Status**: Maybe later

**If you add kitchen camera**:
- [ ] Add RTSP entry to frigate.yml
- [ ] Create presence sensor for kitchen zone
- [ ] Add to dashboard
- [ ] Set as "no Pavlok triggers" zone

---

## 🧭 Code Quality & Maintenance

**Ongoing tasks** (do as you go):
- [ ] Add comments to top of each automation
- [ ] Consolidate entity naming (consistent prefixes/suffixes)
- [ ] Document custom scripts in-line
- [ ] Test templates when making changes

---

## 📊 Overall Progress

| Area | Status | What's Left |
|------|--------|-------------|
| Config Structure | ✅ 100% | - |
| Dashboards | ✅ 100% | Add projector when ready |
| MQTT/Frigate | 🟡 90% | Safety testing |
| Pavlok System | 🟡 85% | Safety limits, testing |
| Voice Control | 🔴 30% | Descriptions, compound scripts |
| LLM Assistant | 🟡 40% | Evening briefing, proactive logic |
| AdGuard Integration | 🔴 10% | HA setup + toggles |

**Overall completion: ~65%**

---

## 🛰️ Guiding Principles

1. **Hardware first** → automations next → LLM last
2. **Presence is key** - Cameras and sensors bring reliability
3. **Voice is your multiplier** - Invest here for daily use gains
4. **Safety first** - Especially with Pavlok (always add limits/kill-switches)

---

**Last Updated**: 2025-12-10