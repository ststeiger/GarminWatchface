# Simple Garmin Watchface for Forerunner 955

This is a simple custom watch face designed for the Garmin Forerunner 955 using Garmin's Monkey C SDK.

---

## Useful Links

- [Connect IQ GitHub Repository](https://github.com/AndrewKhassapov/connect-iq)  
- [Monkey C Reference Guide](https://developer.garmin.com/connect-iq/reference-guides/monkey-c-reference/)  
- [Building a Watch Face with Garmin Monkey C (Medium Article)](https://medium.com/@earel329/building-a-watch-face-with-garmin-monkey-c-6030a86a4595)  
- [Connect IQ Samples on GitHub](https://github.com/douglasr/connectiq-samples)  
- [Garmin Connect IQ Overview](https://developer.garmin.com/connect-iq/overview/)  
- [Garmin Developer Forums](https://forums.garmin.com/)  

---

## Setup and Build Instructions

1. Install Garmin Developer Tools SDK:  
   Download and install from [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/).  
   The SDK will be installed to `%APPDATA%\Garmin\ConnectIQ\Sdks`.  
   Each SDK folder contains sample projects for reference.

2. Install the Monkey C extension for Visual Studio Code to get syntax highlighting and build support.

3. Configure your environment variables (example for Windows command prompt):

    ```cmd
    cd /d "D:\<username>\Downloads\connectiq-sdk-manager-windows\face"
    cd /d D:\Programme\LessPortableApps\vsCode
    set PATH=%PATH%;C:\Users\<username>\AppData\Roaming\Garmin\ConnectIQ\Sdks\connectiq-sdk-win-8.2.1-2025-06-19-f69b94140\bin;D:\<username>\Programme\LessPortableApps\jdk-22\bin
    ```

4. Verify Monkey C compiler version:

    ```cmd
    monkeyc --version
    ```

5. Compile your watch face:

    ```cmd
    monkeyc -o output.prg -f monkey.jungle -d fr955
    ```

---

## Deployment Instructions

1. Connect your Garmin Forerunner 955 watch to your PC via USB.

2. Locate the compiled `.prg` file (e.g., `output.prg`) in your project’s build folder.

3. Copy the `.prg` file to your watch’s `GARMIN/Apps` folder.

4. Safely disconnect your watch.

5. On your Garmin watch, go to the watch face selection menu and select your custom watch face.

---

Enjoy customizing your Garmin watch face!

---

*This README is based on resources from the Garmin Developer documentation and community examples.*
