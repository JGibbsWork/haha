# Home Assistant Roadmap

## ✅ Completed

- ✅ **Clean config structure** - Organized into automations/, scripts_organized/, packages/
- ✅ **Security basics** - API keys in secrets.yaml (gitignored)
- ✅ **Dashboards** - iPad (restricted) and admin dashboards built
- ✅ **MQTT + Frigate setup** - Zone tracking for couch, bed, kitchen working
- ✅ **Pavlok System** - Enforcement automations operational
- ✅ **Projector tracking** - Power-based state detection + smart scripts
- ✅ **Kitchen zone detection** - Frigate tracking in place

---

## 🎯 Active Priorities

### **1. Voice Assistant Improvements** 🎤
**Goal**: Make voice control feel natural and powerful

**Tasks**:
- [ ] Add `description:` fields to automations (enables voice discovery)
- [ ] Rename unclear automations for better voice recognition
- [ ] Create compound scripts:
  - [ ] "Close everything" - blinds, lights, projector off
  - [ ] "Good morning routine" - opens blinds, morning briefing, lights
  - [ ] "Movie mode" - dims lights, closes blinds, projector on
  - [ ] "Work mode" - bright lights, projector to work profile
  - [ ] "Sleep mode" - close everything, dim lights, bed routine
- [ ] Test voice commands with natural phrasing

---

### **2. LLM Assistant Expansion** 🤖
**Goal**: Context-aware daily assistant

**Current**:
- ✅ Morning briefing (LLM-powered)
- ✅ OpenAI integration
- ✅ Calendar, todo, weather feeds

**Next Steps**:
- [ ] Evening briefing script (day recap + tomorrow preview)
- [ ] Proactive suggestions:
  - "It's 10pm, want me to close blinds?"
  - "Meeting in 15 minutes"
  - "You've been on the couch for 2 hours, time to move?"
- [ ] Calendar-aware automations (auto-adjust during meetings)
- [ ] Habit tracking integration (Habitica stats)

---

## 💡 Fun Add-On Ideas

### **Smart Arrival Experience** 🚗
- Detect when you're 5 minutes from home (iOS location)
- Pre-warm/cool the space
- Queue up your preferred lighting scene
- Start music playlist based on time of day
- Show "welcome home" message on TV/projector

### **Focus Mode** 🧠
- Voice command: "Focus time" or "Deep work"
- Closes blinds for fewer distractions
- Sets bright task lighting
- Enables stricter phone/app blocking (if you revisit AdGuard)
- Mutes non-critical notifications
- Auto-announces break time after 90 minutes

### **Ambient Presence Lighting** 💡
- Kitchen occupied → warm ambient lighting during evening
- Long desk session → periodic color shifts to reduce eye strain
- Movie detected on projector → bias lighting behind screen
- Late night movement → gentle path lighting (avoid full brightness)

### **Weather-Responsive Automations** ⛈️
- Rainy day → cozy warm lighting automatically
- Hot sunny day → close shades proactively, suggest AC
- Storm incoming → close all blinds, secure outdoor items reminder
- Beautiful weather → morning announcement to open windows

### **Social Proofing / Accountability** 📊
- Daily/weekly reports on habits:
  - "You hit the gym 4/5 days this week!"
  - Couch time tracked vs. goals
  - Sleep schedule consistency
- Share to Habitica automatically
- Pavlok stats dashboard

### **Guest Mode** 👥
- Voice command: "Guest mode on"
- Disables behavioral enforcement (Pavlok)
- Unlocks restricted zones
- Changes dashboard to guest-friendly view
- Auto-expires after X hours

### **Seasonal Automations** 🍂
- Adjust wake-up routine based on sunrise (summer vs winter)
- Holiday lighting scenes (auto-activate Dec 1-25)
- Spring cleaning reminders (filters, windows, etc.)

### **Music Context Awareness** 🎵
- "Play focus music" → instrumental playlists
- "Play workout music" → high-energy when gym mode active
- Auto-pause music when voice commands detected
- Room-based music routing (kitchen vs living room)

### **Energy Monitoring** ⚡
- Track projector usage hours
- "Always-on" device detection
- Monthly usage reports
- Cost estimates (if utility API available)

---

## 📊 Overall Status

| Area | Status |
|------|--------|
| **Core Infrastructure** | ✅ 100% |
| **Zone Detection** | ✅ 100% |
| **Projector Automation** | ✅ 100% |
| **Pavlok System** | ✅ 100% |
| **Voice Control** | 🔴 30% |
| **LLM Assistant** | 🟡 50% |

**Overall: ~75% complete** on foundational features

**Recommended next**: Voice improvements (quick wins, daily impact)

---

**Last Updated**: 2025-12-15
