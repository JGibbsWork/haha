# Voice Assistant Exposure Guide

## 🎯 **HIGH PRIORITY - Expose These**

### **Blinds & Shades** (Most useful for voice)
- ✅ `script.open_blinds` → *"Open the blinds"*
- ✅ `script.close_blinds` → *"Close the blinds"*
- ✅ `script.open_shades` → *"Open the shades"*
- ✅ `script.close_shades` → *"Close the shades"*

### **Lighting Scenes** (Time-based + Moods)
- ✅ `script.morning_lights` → *"Turn on morning lights"*
- ✅ `script.daytime_lights` → *"Turn on daytime lights"*
- ✅ `script.evening_lights` → *"Turn on evening lights"*
- ✅ `script.chill_lights` → *"Turn on chill lights"*
- ✅ `script.movie_mode_dim_couch_off_fronts` → *"Turn on movie mode"*
- ✅ `script.lights_off` → *"Turn off all lights"*

### **Lighting - White Temperatures**
- ✅ `script.govee_all_lights_white_warm` → *"Warm white lights"*
- ✅ `script.govee_all_lights_white_neutral` → *"Neutral white lights"*
- ✅ `script.govee_all_lights_white_cool` → *"Cool white lights"*
- ✅ `script.govee_all_lights_off` → *"Turn off Govee lights"*

### **Projector/Media**
- ✅ `script.projector_turn_on` → *"Turn on the projector"*
- ✅ `script.projector_turn_off` → *"Turn off the projector"*
- ✅ `script.play_bossa_nova_living_room_playlist_shuffle` → *"Play bossa nova"*
- ✅ `script.play_home_playlist_living_room_playlist_shuffle` → *"Play my home playlist"*

### **Routines**
- ✅ `script.goodnight` → *"Good night"* / *"Bedtime"*
- ✅ `script.good_morning_briefing` → *"Good morning"*

---

## ⚠️ **MEDIUM PRIORITY - Maybe Expose**

### **Lighting - Party Scenes**
- `script.govee_party` → *"Party lights"*
- `script.govee_dance_party` → *"Dance party"*
- `script.govee_maillard` / `govee_passion` / `govee_radiance` / `govee_rococo` → Named color scenes

### **Toggle Scripts** (Less intuitive for voice)
- `script.toggle_lights` → Voice should use "turn on/off" instead

### **Kitchen Lights** (Individual entities)
- `light.kitchen_track_1`
- `light.track_2`
- *Consider exposing if you want: "Turn on kitchen lights"*

---

## 🚫 **DO NOT EXPOSE**

### **Behavioral/Pavlok Scripts** (You don't want to trigger these by accident!)
- ❌ `script.morning_shock_loop`
- ❌ `script.couch_shock_loop`
- ❌ `script.bed_shock_loop`

### **Input Booleans** (Backend automation controls - not user-facing)
- ❌ `input_boolean.shocked`
- ❌ `input_boolean.couch_restricted`
- ❌ `input_boolean.bed_restricted`
- ❌ `input_boolean.couch_occupied` (Frigate manages this)
- ❌ `input_boolean.kitchen_occupied`
- ❌ `input_boolean.bed_occupied`

### **Internal/Technical Scripts**
- ❌ `script.lighting_route_by_time_now` (Called by other automations)
- ❌ `script.projectorprofileflow` (Internal flow)
- ❌ `script.tv_open_kiosk_browser` / `script.kiosk_launch` (Technical)
- ❌ `script.tv_blind_up` (Too specific, use generic blind controls)

---

## 📋 **Summary Count**
- **Expose: 22 scripts** (blinds, lights, media, routines)
- **Maybe: 6 scripts** (party scenes, toggles)
- **Don't expose: 17 entities** (shocks, booleans, internal)

---

## 🔧 **How to Expose**

1. Go to **Settings → Voice Assistants → Expose tab**
2. Search for each script name (e.g., "open_blinds")
3. Check the box next to it
4. Done! No additional voice automations needed

Voice commands are automatically generated from the script's `alias` or `friendly_name`.
