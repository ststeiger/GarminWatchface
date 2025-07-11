
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;

// using Toybox.WatchUi;
// using Toybox.Graphics;
using Toybox.Graphics as Gfx;


// https://developer.garmin.com/connect-iq/api-docs/Toybox/Graphics.html
// https://developer.garmin.com/connect-iq/api-docs/Toybox/Time.html

// https://github.com/dennybiasiolli/garmin-connect-iq/blob/main/KeepCalmAndRun/source/KeepCalmAndRunView.mc
// https://gist.github.com/jonathan-beebe/512b01bbcb6cd8f50a02e12cb74972f8

class Battery extends Toybox.WatchUi.Drawable
{
    hidden var batteryLevel;

    // pass location as locX, locY params
    function initialize(options) 
    {
        Drawable.initialize(options);
    }

    function setLevel(percentage) 
    {
        batteryLevel = percentage;
    }

    function draw(dc as Dc) 
    {
        dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_LT_GRAY);
        dc.drawRectangle(locX, locY, width, height);

        var color;
        if (batteryLevel < 0.25) {
        color = Gfx.COLOR_RED;
        }
        else {
        color = Gfx.COLOR_GREEN;
        }

        dc.setColor(color, color);
        dc.fillRectangle(locX + 2, locY + 2, (width - 4) * batteryLevel, height - 4);
    }
}