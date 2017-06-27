var http = require('http');
var util = require('util');
var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');
var mysql = require('mysql');
var getIP = require('ipware')().get_ip;

var entityMap = {
  '&': '&amp;',
  '<': '&lt;',
  '>': '&gt;',
  '"': '&quot;',
  "'": '&#39;',
  '/': '&#x2F;',
  '`': '&#x60;',
  '=': '&#x3D;'
};

function escapeHtml (string) {
  return String(string).replace(/[&<>"'`=\/]/g, function (s) {
    return entityMap[s];
  });
}

/*-----EXPRESS PART-----*/
var app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static('public'));

app.get('/team', function(req, res) {
	console.log('Server: main page loaded');
});

app.get('/game', function(req, res) {
	 console.log('Server: got GET /game');
});

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/index.html'));
	console.log('Server: got GET /');
});

app.get('/task', function(req, res){
  console.log('Server: got GET /task');
});
/*-----EXPRESS PART-----*/

/*-----DATA BASE PART-----*/
var con = mysql.createConnection({
	host: "172.20.44.225",
	user: "duser",
	password: "ruslanchik"
})  

con.connect(function(err) {
  if (err) throw err;
  console.log("MySQL: connected");
});

con.query("USE nl", function (err, result) {
    if (err) throw err;
    console.log("MySQL: nl database is being used");
  });
/*-----DATA BASE PART-----*/

app.listen(8000);

/*-----QUEREIS-----*/
var q_getTask = "select * from tbTask;";
var q_getGame = "select * from tbGame;";