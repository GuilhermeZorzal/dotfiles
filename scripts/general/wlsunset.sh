# Define the wlsunset parameters
LAT="40.7128"    # Replace with your latitude
LONG="-74.0060"  # Replace with your longitude
DAY_TEMP="6500"  # Daytime color temperature
NIGHT_TEMP="3000" # Nighttime color temperature

# Check if wlsunset is running
if pgrep -x "wlsunset" > /dev/null; then
    echo "wlsunset is running. Terminating..."
    pkill -x "wlsunset"
else
    echo "wlsunset is not running. Starting..."
    wlsunset &
fi
