var keymirror = require('keymirror');

module.exports = {

  ActionTypes: keymirror({
    SET_LOGGED_IN: null,

    DIALOGS_CHANGED: null,
    SELECT_DIALOG: null,

    SEND_MESSAGE_TEXT: null
  })

};