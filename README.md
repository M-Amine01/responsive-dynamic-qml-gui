# responsive-dynamic-qml-gui

Dynamic GUI (Single File QML)

A fully dynamic and responsive GUI written entirely in Qt Quick (QML).

This project demonstrates how to build a window whose components automatically adapt to resizing while keeping the code simple and easy to understand.

Unlike many examples that split the interface into dozens of files, this version is intentionally contained in a single QML file to make it easier to study, copy, and experiment with.

A modular version of the same project will be released separately.

Features
✅ Pure QML (Qt Quick Controls)
✅ Responsive layout
✅ Dynamic resizing
✅ Percentage-based sizing
✅ Easy to read
✅ Beginner friendly
✅ Single-file implementation
✅ No external dependencies
Why this project?

Many QML examples online are either:

too small to be useful,
or too large and split into many files.

This repository provides a complete GUI example in one file, making it ideal for learning how dynamic interfaces work before moving to larger projects.

# Repository Structure
----Dynamique_GUI.qml

----README.md

Only one QML file is required.

# Requirements
Qt 6 (recommended)
Qt Quick
Qt Quick Controls
Running the project
Linux

# Install Qt (if not already installed):

sudo apt update
sudo apt install qt6-base-dev qt6-declarative-dev qml6-module-qtquick qml6-module-qtquick-controls

# Run the application:

qml6 Dynamic_GUI.qml

# or

qmlscene Dynamic_GUI.qml

# or

qml Dynamic_GUI.qml

Depending on your Qt installation, one of the two commands may be available.

# Windows , Open the Qt Command Prompt and run:

qml Dynamique_GUI.qml

# or

qmlscene Dynamique_GUI.qml

# Goals
This project was created to demonstrate:

Dynamic user interfaces
Responsive QML design
Percentage-based layouts
Simple architecture
Easy learning material
Future

A second repository will contain the same GUI divided into reusable QML components, following a cleaner and more scalable architecture.

This repository intentionally keeps everything in one file for educational purposes.

# License
Feel free to use, modify, and learn from this project.
If this repository helped you, consider giving it a ⭐.
