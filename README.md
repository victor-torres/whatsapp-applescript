# whatsapp-applescript

Send messages to WhatsApp via an AppleScript

## How to use

Make sure you have a Google Chrome's tab opened at https://web.whatsapp.com/ and it's properly logged in.

Then, inside the repository directory, run the AppleScript as following:

```
osascript whatsapp.scpt
```

## Technologies

- Google Chrome
- WhatsApp Web
- AppleScript
- JavaScript

## Project structure

### whatsapp.js

The JavaScript file responsible for selecting the conversation, writing the message and sending it through WhatsApp Web.

### whatsapp.scpt

The AppleScript which loads the JavaScript and runs it on the correct Google Chrome's tab.

## TO-DO

- Check if tab is open; if not then open it.
- Implement delays and timeouts.

## Author

Victor Torres <vpaivatorres@gmail.com>
