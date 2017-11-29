# KeyboardRadarRepro
A small bug-reproducing project that shows an inconsistency with the UIKeyboardWillChangeFrameNotification notification in iOS 11

## To reproduce:
### Prerequisites:
* iOS 11
* **No** hardware keyboard attached
* Emoji Keyboard Enabled
* Latin-alphabet keyboard (e.g. German, French, English) enabled and with Predictive disabled

### Repro Steps:
1. Launch the app
2. Click the text box, keyboard should appear in human language, notification clock should start
3. Change keyboard to Emoji. **Bug:** notification clock will not restart, even though keyboard changed frame!
4. Change keyboard back to human language. Notification clock will restart. This is correct.
