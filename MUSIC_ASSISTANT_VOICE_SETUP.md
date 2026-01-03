# Music Assistant Voice Control Setup Guide

## ✅ Prerequisites
- [x] Music Assistant add-on installed
- [ ] Music Assistant voice blueprint imported
- [ ] Automation created from blueprint
- [ ] Spotify connected to Music Assistant

---

## 📦 Step 1: Import Blueprint

**Quick Import (Recommended):**
1. Click this link: https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https%3A%2F%2Fgithub.com%2Fmusic-assistant%2Fvoice-support%2Fblob%2Fmain%2Fblueprints%2Fautomation%2Fmusic_assistant%2Fplay_media_with_assist.yaml
2. Click "Preview" → "Import Blueprint"

**Manual Import:**
1. Settings → Automations & Scenes → Blueprints tab
2. Click "Import Blueprint" (bottom right)
3. Paste URL: `https://github.com/music-assistant/voice-support/blob/main/blueprints/automation/music_assistant/play_media_with_assist.yaml`
4. Click "Preview" → "Import"

---

## ⚙️ Step 2: Create Automation

1. After importing, click "Create Automation"
2. Select "Music Assistant - Play Media with Assist"
3. Configure:
   - **Default Media Player**: `media_player.living_room`
   - **Conversation Agent**: (leave default)
   - **Response Language**: English
4. Click "Save"
5. Name: `Music Assistant Voice Control`

---

## 🎵 Step 3: Connect Spotify (if not already done)

1. Settings → Devices & Services
2. Click "Music Assistant"
3. Add Spotify as music provider
4. Log in with Spotify credentials
5. Verify `media_player.living_room` appears as available player

---

## 🎤 Voice Commands You Can Use

### Play Artists
- *"Play artist Radiohead"*
- *"Shuffle songs by Kendrick Lamar"*
- *"Play band Pink Floyd in the living room"*

### Play Songs/Tracks
- *"Play track Bohemian Rhapsody"*
- *"Play song New Years Day by U2"*

### Play Albums
- *"Listen to album Dark Side of the Moon"*
- *"Play album Rumours by Fleetwood Mac"*

### Play Playlists
- *"Play playlist Bossa Nova"*
- *"Shuffle playlist Chill Vibes"*

### Radio Mode (Similar Music)
- *"Play artist Bon Iver using radio mode"*
- *"Shuffle artist The National using radio mode"*

### Fun Natural Language
- *"Play the album with the baby swimming towards a bank note"* (Nirvana - Nevermind)

---

## 🔧 Troubleshooting

### Commands not working?

**1. Check automation is enabled:**
- Settings → Automations & Scenes
- Find "Music Assistant Voice Control"
- Toggle should be ON

**2. Test Music Assistant manually:**
- Developer Tools → Services
- Service: `media_player.play_media`
- Target: `media_player.living_room`
- Service data:
  ```yaml
  media_content_type: music
  media_content_id: spotify:artist:4Z8W4fKeB5YxbusRsdQVPb
  ```

**3. Check Music Assistant logs:**
- Settings → System → Logs
- Filter: "music_assistant"
- Look for errors

**4. Verify Spotify connection:**
- Open Music Assistant UI (sidebar or http://homeassistant.local:8095)
- Check Spotify shows as connected

**5. Check voice assistant:**
- Settings → Voice Assistants
- Ensure at least one assistant is configured
- Test basic commands like "Turn on lights"

---

## 📝 Notes

- **Default speaker**: All commands without room specification play on `media_player.living_room`
- **Room targeting**: Use "in the [room name]" to specify different speakers
- **Command patterns**: Must start with "Play", "Listen to", or "Shuffle"
- **Search accuracy**: Works best with exact artist/album/song names
- **Languages supported**: English, Dutch, German, Portuguese, Spanish, Italian, Slovak

---

## 🆚 Music Assistant vs Your Current Spotify Scripts

| Feature | Current Scripts | Music Assistant Voice |
|---------|----------------|----------------------|
| Hardcoded playlists | ✅ 2 playlists | ✅ All your playlists |
| Dynamic artist search | ❌ | ✅ Any artist on Spotify |
| Dynamic song search | ❌ | ✅ Any song on Spotify |
| Album search | ❌ | ✅ Any album on Spotify |
| Natural language | ❌ | ⚠️ Limited but decent |
| Setup time | 0 min | ~30 min one-time |

**Recommendation**: Keep your existing playlist scripts exposed to voice AND use Music Assistant for dynamic searches!

---

## 🎯 Next Steps After Setup

1. ✅ Test basic commands with artists you know
2. ✅ Try playlist searches
3. ✅ Experiment with radio mode
4. ✅ Add more speakers/rooms if desired
5. ✅ Keep existing `script.play_bossa_nova_living_room_playlist_shuffle` exposed for quick access

---

## 📚 Resources

- [Music Assistant Voice Documentation](https://www.music-assistant.io/integration/voice/)
- [GitHub Voice Support Repo](https://github.com/music-assistant/voice-support)
- [Home Assistant Voice Assistants](https://www.home-assistant.io/voice_control/)
