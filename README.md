# 🛸 Autonomous Quadcopter Ecosystem: Hardware Design, Flight Control & Mobile App

An end-to-end, multi-disciplinary robotics project featuring a custom-engineered **quadcopter**. Developed as a team effort, this ecosystem bridges robust mechanical hardware prototyping, low-level real-time embedded flight code, and an intuitive mobile application for seamless wireless control and telemetry monitoring.

---

## 🎯 Project Overview

This repository contains the full production files for our team's quadcopter development, structured into three primary engineering domains:
1. **Mechanical & Hardware Engineering:** 3D-printable optimized drone frames, modular component mounts, and hardware layouts designed for high durability and structural aerodynamic stability.
2. **Firmware & Flight Control Engine:** Real-time sensor fusion (IMU tracking), PID stabilization loops, and wireless communication protocol routing programmed for low-latency hardware synchronization.
3. **Mobile Command Interface:** A custom-built smartphone application providing a graphical user interface (GUI) to handle manual piloting, dynamic calibration, and live telemetry data feeds.

---

## 📂 Repository Structure

The workspace follows a clean, decoupled architecture optimized for collaborative team updates:

├── hardware/                       # Mechanical & Structure Design
│   ├── models/                     # 3D CAD files & OpenSCAD parametric profiles
│   └── schematics/                 # Wiring diagrams & Electronic speed controller (ESC) layouts
├── firmware/                       # Embedded Systems & Flight Controller
│   ├── src/                        # Core flight code, PID logic, and sensor configurations
│   └── include/                    # Peripheral drivers and network communication headers
├── mobile-app/                     # Command & Control Application
│   ├── assets/                     # UI graphics, logos, and icon structures
│   ├── src/                        # Application architecture and connection drivers
│   └── config/                     # Network pairing and telemetry data schemas
└── docs/                           # Technical documentation & Team assembly logs

---

## 🏗️ Technical Modules Breakdown

### 1. Hardware & Structural Engineering
- **Parametric Modeling:** The chassis features optimized structural curves designed to maximize strength-to-weight ratios while effectively isolating motor vibration frequencies.
- **Modular Layout:** Built with localized snap-fit or bolt-locked bays dedicated to protecting core computing blocks, battery distributions, and specialized telemetry arrays.

### 2. Firmware & Control Loop Logic
- **Sensor Fusion Architecture:** Combines high-frequency Gyroscope and Accelerometer readouts to calculate exact pitch, roll, and yaw states.
- **Dual-Loop PID Controller:** Implements precise proportional-integral-derivative algorithms to continuously adjust motor thrust values, counteracting environmental wind disturbances instantaneously.
- **Wireless Interfacing:** Features a lightweight communication layer over Serial/RF/Wi-Fi links to receive incoming pilot vectors and return critical diagnostic metrics.

### 3. Command & Control Mobile App
- **Real-Time Telemetry Interface:** Displays live battery voltages, continuous motor status levels, and orientation grids over an interactive instrument panel.
- **Wireless Control Pipeline:** Bridges secure device-to-drone communication using low-latency network sockets to transmit control commands reliably.
- **Parameter Tuning HUD:** Includes a configuration console allowing developers or advanced users to adjust PID gains dynamically over the air without requiring physical hardware tethers.

---

## 🛠️ Global Tech Stack

- **Mechanical Design:** OpenSCAD / Fusion360 / Parametric 3D Printing Materials (PLA+, PETG)
- **Embedded Electronics:** C++ / Arduino Framework / Real-Time Microcontroller Architectures
- **Mobile Development:** Flutter / React Native / Native Mobile SDKs (iOS & Android)
- **Communications Layer:** Wi-Fi Sockets / Bluetooth Low Energy (BLE) / Custom Packet Serialization

---

## 🚀 Setup & Installation Flow

### 1. Hardware Fabrication
- Slice and export the architectural 3D models located within `/hardware/models/` using standard slicing software.
- Recommended print specs: **Infill:** 40% (Gyroid) | **Perimeters:** 4 to maximize motor arm resilience.

### 2. Firmware Compilation
Navigate to the embedded directory workspace and flash the core firmware compilation layout down to your targeted onboard microcontroller architecture:
```bash
cd firmware
# Use your team's preferred deployment script or IDE toolchain (e.g., PlatformIO / Arduino CLI)
platformio run --target upload
