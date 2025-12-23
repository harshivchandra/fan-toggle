
FANS="/sys/class/hwmon/hwmon5/pwm1_enable"

if [[ ! -r "$FANS" ]]; then
    echo "Cannot access fans, please try again later!"
    exit 1
fi

num=$(cat "$FANS")

if (( num == 2 )); then
    echo "Switching on fans!"
    echo 1 |  tee "$FANS"
    echo "Fans powered on!"

else
    echo "Powering down fans"
    echo 2 |  tee "$FANS"
    echo "Fans shut down!"
fi

