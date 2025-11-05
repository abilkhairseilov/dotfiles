#!/usr/bin/env sh
# Ensure virtual sink exists
pactl list sinks short | grep -q OBS_sink || \
  pactl load-module module-null-sink sink_name=OBS_sink sink_properties=device.description=OBS_sink
# Loop it to your default output so you can hear
pactl load-module module-loopback source=OBS_sink.monitor sink=@DEFAULT_SINK@ latency_msec=50
# Launch OBS
obs
