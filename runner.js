var fs = require('fs');
var settings = require('./settings.js');

Object.keys(process.env).forEach(function(key) {
  settings[key] = process.env[key];
});

fs.writeFileSync('./settings.json', JSON.stringify(settings));

require('ep_etherpad-lite/node/server.js');
