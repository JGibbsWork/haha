# Home Assistant Configuration Repository

This is James's Home Assistant configuration for a single-person residence in Chicago. The system emphasizes behavioral modification, occupancy-based automation, and advanced media/lighting control.

## Directory Structure

```
/automations/        # Organized by domain: behavioral, climate, lighting, media, pihole, presence
/packages/           # Integration configs: Govee, Frigate, Pavlok, weather, transit, projector
/scripts_organized/  # Scripts by function: behavioral, blinds, lighting, media, misc
/dashboards/         # Lovelace configs (main_dashboard.yaml is primary)
/blueprints/         # Reusable automation templates
/entities/           # Helper definitions (input_booleans, input_text)
/themes/             # Custom UI themes
/lights/             # Govee device configurations
```

## Key Integrations

- **Lighting**: Philips Hue groups (bedroom, office, kitchen, living room), Govee LED strips (REST API)
- **Infrastructure**: ZHA (Zigbee), Broadlink IR blaster, Google TV, PS5 detection
- **Environmental**: Local weather API (sentinel.local:3002), Frigate cameras with zone detection
- **Transit**: Chicago Bus 77 and Red Line CTA tracking
- **Behavioral**: Pavlok wearable (shock/vibration via REST API)
- **Media**: Spotify, Music Assistant, projector control via Sonoff plug
- **Services**: Printer service (sentinel.local:3003), playlister (sentinel.local:8888)

## Behavioral Enforcement System

The most sophisticated subsystem - uses Pavlok for compliance enforcement:

1. **Couch Restrictions** (11pm-11am weekdays): Shock if on couch during restricted hours, 30-min time limits
2. **Bed Restrictions** (7am-7pm weekdays): Shock if in bed >10 min during restricted hours
3. **Morning Routine**: Bed exit triggers LLM-powered briefing (weather, calendar, todos)
4. **Wind-Down** (after 9:30pm): Bed occupancy dims lights, closes blinds, stops music

## State Tracking (Input Booleans)

Key helpers that track state:
- `shocked`, `couch_restricted`, `bed_restricted`
- `bed_occupied`, `couch_occupied`, `kitchen_occupied`
- `couch_time_limit_enabled`, `couch_cooldown`
- `kitchen_manual_override`
- `briefing_printed_today`, `wind_down_complete`

## External Services

All on `sentinel.local`:
- `:3002` - Weather API, Transit API
- `:3003` - Printer service (briefings, poems)
- `:8888` - Playlister service

## Common Tasks

When making changes:
- Automations go in `/automations/{domain}/`
- Scripts go in `/scripts_organized/{category}/`
- New integrations as packages in `/packages/`
- Dashboard edits in `/dashboards/main_dashboard.yaml`

## Technical Notes

- Govee devices use hardcoded MAC addresses in REST payloads
- Frigate zone detection currently DISABLED (uses input_booleans instead)
- Projector profiles: "morning" (5am-9am), "work" (9am-5pm), "default" (evening)
- Heavy use of `!include_dir_merge_list` and `!include_dir_merge_named` in configuration.yaml

## Quirks

- Multiple dashboard versions exist (ongoing iteration)
- Frigate automations reference MQTT topics that may not be active
- Time-of-day awareness is central to most automations
