// Conversation and message
var conversation_title = 'Friend Name or Group Title';
var message = 'This is a message sent via an AppleScript ;P';

// Elements
var conversation = document.querySelector('[title="' + conversation_title + '"]');
var textInput = document.querySelector('div.input');
var sendButton = document.querySelector('button.send-container');

// Helpers
var dispatch = function(target, eventType, char) {
    var evt = document.createEvent('TextEvent');
    evt.initTextEvent (eventType, true, true, window, char, 0, 'en-US');
    target.focus();
    target.dispatchEvent(evt);
};

// Workflow
conversation.click();
dispatch(textInput, 'textInput', message);
sendButton.click();
