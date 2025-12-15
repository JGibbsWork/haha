# Home Assistant Roadmap

## ✅ Completed

- ✅ **Clean config structure** - Organized into automations/, scripts_organized/, packages/
- ✅ **Security basics** - API keys in secrets.yaml (gitignored)
- ✅ **Dashboards** - iPad (restricted) and admin dashboards built
- ✅ **MQTT + Frigate setup** - Config fixed, sensors created
- ✅ **AdGuard installed** - Running on network

---

## 🎯 Current Focus

### **1. MQTT + Pavlok System** ⚡
**Status**: Foundation complete, needs testing & safety

- [x] Fix MQTT broker connection
- [x] Fix zone detection sensors (couch, bed)
- [x] Add missing input_booleans
- [ ] Add safety limits (max shocks per hour, cooldown periods)
- [ ] Test enforcement automations end-to-end
- [ ] Add dashboard toggle controls

### **2. Projector Status Tracking**
**Status**: ✅ Complete

- [x] Buy smart plug with power monitoring (Sonoff - installed)
- [x] Create template sensor based on power draw (`binary_sensor.projector_status`)
- [x] Create turn on/off scripts that check state first
- [x] Add leave home automation to turn off projector

### **3. Kitchen Camera Automation**
**Status**: Needs hardware integration

- [ ] Add kitchen lights to Home Assistant
- [ ] Configure kitchen zone in Frigate (camera already installed)
- [ ] Create MQTT binary sensor for kitchen occupancy (similar to couch/bed)
- [ ] Create automations:
  - Person detected in kitchen → lights on
  - Person leaves kitchen → lights off (with delay)
- [ ] Test and adjust delay timing for natural feel

---

## 🚀 Next Steps (Priority Order)

### **Priority 1: Voice Assistant Improvements** 🎤
**Goal**: Make voice control actually useful

**Tasks**:
- [ ] Add `description:` fields to automations (makes them voice-discoverable)
- [ ] Rename unclear automations ("bedbuttonthings" → "Bed Button Control")
- [ ] Create compound scripts:
  - "Close everything" (blinds, lights, projector)
  - "Good morning routine" (opens blinds, morning briefing)
  - "Movie mode" (dims lights, closes blinds, projector on)
  - "Work mode" (bright lights, projector to work profile)
- [ ] Test voice commands work reliably

---

### **Priority 2: LLM Assistant Expansion** 🤖
**Goal**: Context-aware assistant for daily management

**Current Foundation**:
- ✅ `good_morning_briefing` script (LLM-powered)
- ✅ Extended OpenAI integration
- ✅ Calendar, todo, weather integrations

**Next Steps**:
- [ ] Create evening briefing script
- [ ] Add proactive time-based suggestions ("It's 10pm, should I close blinds?")
- [ ] Calendar integration (auto-adjust lights for meetings)
- [ ] Habit tracking integration (Habitica + Pavlok)

---

### **Priority 3: AdGuard Home Integration** 🛡️
**Goal**: Control network filtering from HA

- [x] AdGuard installed on network
- [ ] Set up HA integration
- [ ] Create toggle automations (day/night filtering)
- [ ] Add dashboard controls

---

## 📊 Overall Status

| Area | Status | What's Left |
|------|--------|-------------|
| **Config Structure** | ✅ Complete | - |
| **Dashboards** | ✅ Complete | - |
| **MQTT/Frigate** | 🟡 90% | Safety limits, testing |
| **Pavlok System** | 🟡 85% | Safety features, end-to-end testing |
| **Voice Control** | 🔴 30% | Add descriptions, create compound scripts |
| **LLM Assistant** | 🟡 40% | Expand beyond morning briefing |
| **AdGuard Integration** | 🔴 10% | HA integration setup |

**You're at approximately 65% completion** on the core features you want.

**Next logical step**: Voice improvements (quick wins that make daily use better)

---

**Last Updated**: 2025-12-10
