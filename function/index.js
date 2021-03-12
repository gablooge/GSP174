'use strict';

const {dialogflow} = require('actions-on-google');
const functions = require('firebase-functions');

const app = dialogflow({debug: true});

app.intent('make_name', (conv, {color, number}) => {
  conv.close(`Alright, your silly name is ${color} ${number}! ` +
    `I hope you like it. See you next time.`);
});

exports.sillyNameMaker = functions.https.onRequest(app);