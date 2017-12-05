function simulateMouseEvents(element, eventName) {
    var mouseEvent= document.createEvent('MouseEvents');
    mouseEvent.initEvent(eventName, true, true);
    element.dispatchEvent(mouseEvent);
}

var selectConversation = function() {
  return new Promise(function(resolve, reject) {
    if ( conversation_title == '/' || conversation_title == '' ) {
      resolve();
    }
    else {
      // also checking .ellipsify as Group Members will also be shown with title attribute
      var $conversation = jQuery('.ellipsify[title^="' + conversation_title + '"]');
      // fallback to "any substring" if a conversation starting with the arg is not found
      var conversation = $conversation.length ? $conversation[0] : jQuery('.ellipsify[title*="' + conversation_title + '"]')[0];
      conversation.click();
      simulateMouseEvents( conversation , 'mousedown');
      resolve();
    }
  });
};

var insertMessage = function() {
  return new Promise(function(resolve, reject) {
    var $element = jQuery("div.pluggable-input-body").text(message);
    const event = new Event('input', { bubbles: true })
    $element[0].dispatchEvent(event)
    resolve();
  });
};

var sendMessage = function() {
  return new Promise(function(resolve, reject) {
    var sendButton = document.querySelector('button.compose-btn-send');
    sendButton.click();
    resolve();
  });
};

selectConversation().then(function() {
  insertMessage().then(function() {
    sendMessage().then(function() {});
  });
});
