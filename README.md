# fan-toggle

A simple Bash script to toggle a Linux system fan between **automatic control** and **manual (full RPM)** modes via `hwmon`.

---

## What this does

`fan-toggle` reads the current value of `pwm1_enable` and switches between:

- `2` → **Automatic fan control (BIOS / kernel managed)**
- `1` → **Manual fan control (full RPM)**

Each run toggles the mode.

This is useful for:
- Temporarily forcing maximum cooling
- Debugging thermal behavior
- Quick manual fan overrides without installing heavy fan-control tools

---

## Requirements

- Linux system with `hwmon` support
- A controllable PWM fan exposed under `/sys/class/hwmon`
- Root access (required to write to sysfs)

---

## Installation

Clone the repository:

```bash
git clone https://github.com/harshivchandra/fan-toggle.git
cd fan-toggle

```

Make the script executable:
```bash
chmod +x fan-toggle.sh
```

Run the script using sudo:
```bash
sudo ./fan-toggle.sh
```


## Disclaimer

Running fans at full RPM continuously may increase wear and noise

This script assumes:
```bash

hwmon5/pwm1_enable
```

exists on your system — adjust if needed

This is not laptop-vendor-specific and may not work on all systems

Use at your own risk


## Future 

systemd service integration

Debian/Ubuntu package

polkit support for non-root usage

automatic hwmon detection

I will be working on ways to improve on this script to add RPM control, and build a GUI based utility.
