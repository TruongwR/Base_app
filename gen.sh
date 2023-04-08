#!/bin/bash
set -e

#fvm flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter pub get
flutter pub run flutter_launcher_icons:main


echo "Build Data Done !!!"