This is a CLI tool that assists a developer or an analyst communicate with an Android device. This device can be an emulator or an actual device. The ADB is broken down into three main components:
1. The client: This is where the commands are executed aka the developer's terminal.
2. The daemon: This is responsible for running the commands on a device.
3. A sever: Manages communication between the server and the daemon and runs as a background process on the developer machine.
### Workings of the ADB.
When the ADB is started it checks on whether an ADB server has been set up already by checking what is running on port 5037, if it is not set up, the server binds itself to that port and starts listening to commands from adb clients.
ADB then checks for devices or emulators set up by sending a requests to servers between odd numbers 5555 to 5585 to get the first 16 emulators.
### Interacting with a physical device over adb
To do this one needs to enable USB debugging, to perform this one needs to turn on Developer settings on their mobile phone by clicking on the Build number seven times to get access to Developer options and navigating to it and turning on USB debugging.
### ADB commands
`adb devices`: Lists all devices connected via adb
`adb install <apk_file>`: Installs an APK to the emulator or device.
`adb shell`: Get a shell session on device.
`adb start-server`: Starts the ADB server.
`adb kill-server`: Kills the ADB server.
``