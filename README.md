# Demo App for Secondary Display Auto-Layout Bug

This app was built with Xcode 4.6 using the iOS 6.1 SDK.

Auto-layout on retina iPad secondary display window will position controls incorrectly.

# Steps to Reproduce

1. Run the app in the iOS Simulator with the 1x iPad and TV-Out enabled. The display resolution of the TV-Out display doesn't matter.
2. On the main display of the iPad, there is a switch that will modify the view on the secondary display to use either Springs&Struts or Auto-Layout. In either case, there will be labels displayed in each corner of the secondary display, numbered clockwise from top-left. There will also be a label that is centered in the display.
3. If you switch between Auto-Layout and Springs&Struts, the layout of the secondary display should remain consistent.
4. Switch the simulator to Retina iPad, and repeat the same test.
5. Observe that the Springs&Struts display is laid-out correctly, but the Auto-Layout display is not. If you dump out the view hierarchy of the Auto-Layout display, it appears that the views were laid out based on the secondary display being retina when it is not.

The same behaviour should be observable if you use an iPad 2 vs. retina iPad.
