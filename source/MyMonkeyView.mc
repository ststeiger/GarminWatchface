import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;

// https://github.com/AndrewKhassapov/connect-iq
// https://developer.garmin.com/connect-iq/reference-guides/monkey-c-reference/
// https://medium.com/@earel329/building-a-watch-face-with-garmin-monkey-c-6030a86a4595
// https://github.com/douglasr/connectiq-samples
// https://developer.garmin.com/connect-iq/overview/
// https://forums.garmin.com/


// cd /d "D:\<username>\Downloads\connectiq-sdk-manager-windows\face"
// cd /d D:\Programme\LessPortableApps\vsCode
// set PATH=%PATH%;C:\Users\<username>\AppData\Roaming\Garmin\ConnectIQ\Sdks\connectiq-sdk-win-8.2.1-2025-06-19-f69b94140\bin;D:\<username>\Programme\LessPortableApps\jdk-22\bin
// monkeyc --version 
// monkeyc -o output.prg -f monkey.jungle -d fr955

// 1. install Garmin Developer Tools
//    https://developer.garmin.com/connect-iq/sdk/
//    installs SDK to %APPDATA%\Garmin\ConnectIQ\Sdks
//    - Each SDK folder contains a samples folder.
// 2. install monkey C extension (Visual Studio Code)


// Run (without debugging)

// In Explorer > Open your 'build' folder > Locate the .prg file. eg. myWatchface.prg
// 6.5. With your Garmin watch > Connect to your device via USB
// 6.6. Copy your .prg watch-face to your Garmin device > 'GARMIN/Apps' folder
// 6.7. Disconnect your Garmin watch > On your Garmin watch > Select your watch-face

class MyMonkeyView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void 
    {
        // Get and show the current time
        var clockTime = System.getClockTime();
        // var dateTime = Time.now();

        var todayMedium = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var todayShort = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var weekdayNumber = todayShort.day_of_week;
        var monthNumber = todayShort.month;
  
        var weekdayNames = ["So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"];
        var weekdayStr = weekdayNames[weekdayNumber -1]; // Subtract 1 for 0-based array

        var monthNames = ["Jan", "Feb", "Mär", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        var mnthStr = monthNames[monthNumber -1]; // Subtract 1 for 0-based array


        var dateString = Lang.format(
            "$1$, $2$. $3$ $4$",
            [
                //today.day_of_week,
                weekdayStr,
                todayMedium.day,
                mnthStr,
                todayMedium.year
            ]
        );


        var dateStringNum = Lang.format(
            "$1$.$2$.$3$",
            [
                todayMedium.day.format("%02d"),
                monthNumber.format("%02d"),
                todayMedium.year
            ]
        );



        var timeString = Lang.format(
            "$1$:$2$:$3$",
            [
                clockTime.hour.format("%02d"),
                clockTime.min.format("%02d"),
                clockTime.sec.format("%02d")
            ]);

            /*
            var dateString = Lang.format("$1$ $2$.$3$.$4$", [
                weekdayStr,
                Time.Gregorian.Info.day.format("%02d"),
                Time.Gregorian.Info.month.format("%02d"),
                Time.Gregorian.Info.year.format("%02d")
            ]);
            */

        var stats = System.getSystemStats();
        var battery = stats.battery; //Get battery percentage 0-100

        // Check if charging
        var isCharging = stats.charging;
        // isCharging= true;
        

        var batteryString = Lang.format("$1$%$2$", [battery.format("%d"), isCharging ? " (Charging)": ""] );

       var batteryView = View.findDrawableById("BatteryLabel") as Text;
        batteryView.setText(batteryString);


        var batteryIcon = View.findDrawableById("Battery") as Battery;
        batteryIcon.setLevel(battery/100.0);
        

        var numericDateView = View.findDrawableById("DateLabelNumeric") as Text;
        numericDateView.setText(dateStringNum);


        var dateView = View.findDrawableById("DateLabel") as Text;
        dateView.setText(dateString);

        var view = View.findDrawableById("TimeLabel") as Text;
        view.setText(timeString);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
