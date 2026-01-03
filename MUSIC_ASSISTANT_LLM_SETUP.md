# Music Assistant LLM Voice Control Setup

## ✅ Current Status
- [x] Music Assistant add-on installed
- [x] LLM voice blueprint imported to Home Assistant
- [x] Script created: `scripts_organized/media/music_assistant_llm.yaml`
- [x] LLM conversation agent configured (OpenAI Extended Conversations)
- [x] Spotify connected to Music Assistant
- [x] Voice assistant configured to use LLM
- [x] Default player set to `media_player.living_room_speaker`

---

## 🎯 What This Gives You

**Natural Language Music Control** - Unlike the basic approach, the LLM understands context:

✅ *"Play some chill music"* → LLM picks chill artists/playlists
✅ *"I want to listen to jazz"* → LLM searches for jazz
✅ *"Put on something relaxing"* → LLM interprets mood
✅ *"Play music from the 80s"* → LLM finds 80s music
✅ *"Play Radiohead"* → Direct artist request

This is **much closer to Alexa** than the basic pattern-matching approach!

---

## 🔧 Setup Steps

### Step 1: Verify Script is Loaded

1. Restart Home Assistant (to load the new script file)
2. Go to Developer Tools → Services
3. Search for: `script.llm_script_for_music_assistant_voice_requests`
4. If you see it ✅, script is loaded correctly

---

### Step 2: Choose and Configure an LLM

You need a conversation agent (AI) to understand natural language. Pick one:

#### **Option A: OpenAI ChatGPT** (Recommended - Easiest)

**Cost:** ~$0.01 per music request (~$1-2/month for normal use)

**Setup:**
1. Get API key from https://platform.openai.com/api-keys
2. Settings → Devices & Services → Add Integration
3. Search "OpenAI Conversation"
4. Enter API key
5. Configure:
   - Model: `gpt-4o-mini` (cheapest, fast enough)
   - Temperature: 0.5
   - Max tokens: 150

#### **Option B: Google Generative AI** (Free Tier Available)

**Cost:** Free for limited use (60 requests/minute)

**Setup:**
1. Get API key from https://aistudio.google.com/app/apikey
2. Settings → Devices & Services → Add Integration
3. Search "Google Generative AI Conversation"
4. Enter API key
5. Configure:
   - Model: `gemini-1.5-flash` (free tier)

#### **Option C: Local LLM** (Free, More Complex)

**Cost:** Free, but requires more powerful hardware

**Setup:**
1. Install Ollama add-on or LocalAI
2. Download a model (e.g., `llama3:8b`)
3. Configure as conversation agent
4. Note: Response times may be slower

---

### Step 3: Configure Voice Assistant

1. Settings → Voice Assistants
2. Select your voice assistant (or create new)
3. **Conversation agent**: Select your LLM (OpenAI/Google/Local)
4. **Speech-to-text**: Choose your STT engine
5. **Text-to-speech**: Choose your TTS engine
6. Save

**Important:** Make sure the voice assistant has permission to run scripts!

---

### Step 4: Connect Spotify (if not done)

1. Open Music Assistant UI (sidebar or http://homeassistant.local:8095)
2. Settings → Music Providers
3. Add Spotify
4. Log in with Spotify credentials
5. Verify `media_player.living_room` appears

---

### Step 5: Test Commands!

Try these natural language requests:

**Vague/Natural:**
- *"Play some relaxing music"*
- *"I want to hear something upbeat"*
- *"Put on jazz"*
- *"Play 90s alternative rock"*

**Specific:**
- *"Play Radiohead"*
- *"Play the album OK Computer"*
- *"Play my Bossa Nova playlist"*
- *"Shuffle songs by Kendrick Lamar"*

**With context:**
- *"Play something similar to Bon Iver"*
- *"I'm working, play focus music"*

---

## 🆚 LLM vs Basic Approach

| Feature | Basic (Option 1) | LLM (Option 3) |
|---------|------------------|----------------|
| **Command flexibility** | "Play artist X" only | Any natural phrasing |
| **Intelligence** | Pattern matching | AI understanding |
| **Vague requests** | ❌ | ✅ "Play chill music" |
| **Context/mood** | ❌ | ✅ "Something relaxing" |
| **Cost** | Free | ~$0.01-0.02/request |
| **Privacy** | 100% local | Sent to LLM provider |
| **Latency** | Instant | 1-3 seconds |
| **Accuracy** | 100% if exact | 90-95% |

---

## 🐛 Troubleshooting

### "Script not found"
- Restart Home Assistant to load the new script file
- Check `scripts_organized/media/music_assistant_llm.yaml` exists

### "LLM not responding"
- Verify conversation agent is configured in Settings → Voice Assistants
- Check API key is valid
- Look at Settings → System → Logs for errors

### "Music doesn't play"
- Test Music Assistant manually:
  - Developer Tools → Services
  - Service: `media_player.play_media`
  - Target: `media_player.living_room`
  - Data: `media_content_type: music` and `media_content_id: spotify:artist:XXX`
- Verify Spotify is connected in Music Assistant

### "LLM doesn't understand music requests"
- Make sure script is exposed to LLM (should happen automatically)
- Try being more explicit: *"Use Music Assistant to play jazz"*
- Check script execution in Developer Tools → Traces

---

## 💡 Pro Tips

1. **Default player**: Set in the script as `media_player.living_room`
2. **Room targeting**: Say *"in the kitchen"* to override default
3. **Keep existing scripts**: Your hardcoded playlist scripts still work! Expose both for quick access
4. **Monitor costs**: OpenAI usage at https://platform.openai.com/usage
5. **Privacy**: If concerned, use Google's free tier or local LLM

---

## 📊 Cost Estimate (OpenAI)

- **gpt-4o-mini**: ~$0.01 per music request
- **Average use**: 50-100 requests/month = **$0.50-$1.00/month**
- **Heavy use**: 200+ requests/month = **~$2-4/month**

Much cheaper than a Spotify subscription! 😄

---

## 🎵 What Happens Behind the Scenes

1. You say: *"Play some jazz"*
2. Voice assistant → Speech to text
3. Text → LLM (ChatGPT/Gemini)
4. LLM thinks: "User wants jazz music, I should call the Music Assistant script"
5. LLM calls: `script.llm_script_for_music_assistant_voice_requests` with parameters
6. Script → Music Assistant → Searches Spotify for jazz
7. Music plays on `media_player.living_room`
8. TTS response: *"Playing jazz music"*

---

## ✅ Final Checklist

Before testing, make sure:
- [ ] Home Assistant restarted (script loaded)
- [ ] LLM conversation agent configured (OpenAI/Google/Local)
- [ ] Voice assistant uses LLM as conversation agent
- [ ] Spotify connected in Music Assistant
- [ ] `media_player.living_room` exists and works
- [ ] Script appears in Developer Tools → Services

Then try: *"Play some music I'd like"* and see what happens! 🎉

---

## 📚 Resources

- [Music Assistant Voice Support Repo](https://github.com/music-assistant/voice-support)
- [OpenAI API Keys](https://platform.openai.com/api-keys)
- [Google AI Studio](https://aistudio.google.com/app/apikey)
- [Home Assistant Voice Documentation](https://www.home-assistant.io/voice_control/)
