
#!/bin/bash

# Check if playerctl is available
if ! command -v playerctl &> /dev/null; then
    echo '{"text":"", "tooltip":"playerctl not found", "class":"stopped"}'
    exit 1
fi

# Check if a player is active
if ! playerctl --list-all &> /dev/null; then
    echo '{"text":"", "tooltip":"No active media players", "class":"stopped"}'
    exit 1
fi

# Fetch information
PLAYER=$(playerctl --list-all | head -n 1) # Use the first active player
STATUS=$(playerctl --player="$PLAYER" status 2>/dev/null || echo "Stopped")
TITLE=$(playerctl --player="$PLAYER" metadata xesam:title 2>/dev/null || echo "Unknown Title")
ARTIST=$(playerctl --player="$PLAYER" metadata xesam:artist 2>/dev/null || echo "Unknown Artist")
ALBUM=$(playerctl --player="$PLAYER" metadata xesam:album 2>/dev/null || echo "Unknown Album")
POSITION=$(playerctl --player="$PLAYER" position 2>/dev/null || echo "0")
LENGTH=$(playerctl --player="$PLAYER" metadata mpris:length 2>/dev/null || echo "0")
ART_URL=$(playerctl --player="$PLAYER" metadata mpris:artUrl 2>/dev/null || echo "")

CROP_TITLE=$TITLE
# Ensure POSITION and LENGTH are numeric (they can be empty or invalid)
POSITION=$(echo "$POSITION" | grep -oE '^[0-9]+(\.[0-9]+)?$' || echo "0")
LENGTH=$(echo "$LENGTH" | grep -oE '^[0-9]+(\.[0-9]+)?$' || echo "0")
if [ ${#TITLE} -gt 50 ]; then
    CROP_TITLE="${TITLE:0:40}..."
fi
# Convert position and length from seconds to minutes:seconds format
POSITION_MIN=$(echo "$POSITION / 60" | bc)
POSITION_SEC=$(echo "$POSITION % 60" | bc)

# Ensure that POSITION_SEC is an integer, by rounding the floating-point part
POSITION_SEC_INT=$(echo "scale=0; $POSITION_SEC / 1" | bc)
POSITION_FORMATTED=$(printf "%02d:%02d" $POSITION_MIN $POSITION_SEC_INT)

# Convert length from microseconds to seconds
LENGTH_SEC=$(echo "$LENGTH / 1000000" | bc)

# Convert length into minutes:seconds format
LENGTH_MIN=$(echo "$LENGTH_SEC / 60" | bc)
LENGTH_SEC_REMAINING=$(echo "$LENGTH_SEC % 60" | bc)

# Ensure that LENGTH_SEC_REMAINING is an integer, by rounding the floating-point part
LENGTH_SEC_INT=$(echo "scale=0; $LENGTH_SEC_REMAINING / 1" | bc)
LENGTH_FORMATTED=$(printf "%02d:%02d" $LENGTH_MIN $LENGTH_SEC_INT)

# Based on the status, set the appropriate text and tooltip
if [ "$STATUS" == "Playing" ]; then
    printf '{"text":"  %s", "class":"playing", "tooltip":"Title: %s\\nArtist: %s\\nLength: %s"}\n' \
        "$CROP_TITLE" "$TITLE" "$ARTIST" "$LENGTH_FORMATTED"
elif [ "$STATUS" == "Paused" ]; then
    printf '{"text":"󰏤 %s", "class":"paused", "tooltip":"Title: %s\\nArtist: %s\\nLength: %s"}\n' \
        "$CROP_TITLE" "$TITLE" "$ARTIST" "$LENGTH_FORMATTED"
else
    printf '{"text":"󰨜", "tooltip":"Stopped", "class":"stopped"}\n'
fi
