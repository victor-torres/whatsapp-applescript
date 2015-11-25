var conversation_title = 'Friend Name or Group Title';
var message = 'This is a message sent via an AppleScript ;P';

var dispatch = function(target, eventType, char) {
    var evt = document.createEvent('TextEvent');
    evt.initTextEvent (eventType, true, true, window, char, 0, 'en-US');
    target.focus();
    target.dispatchEvent(evt);
};

var selectConversation = function() {
  return new Promise(function() {
    var conversation = document.querySelector('[title="' + conversation_title + '"]');
    conversation.click();
  });
};

var insertMessage = function() {
  return new Promise(function() {
    var textInput = document.querySelector('div.input');
    dispatch(textInput, 'textInput', message);
  });
};

var sendMessage = function() {
  return new Promise(function() {
    var sendButton = document.querySelector('button.send-container');
    sendButton.click();
  });
};

selectConversation().then(function() {
  insertMessage().then(function() {
    sendMessage().then(function() {});
  });
});
