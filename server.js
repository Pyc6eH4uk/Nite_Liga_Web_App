/* 
* COPYRIGHT (C) 2017 Zorin Alexei zetx43@gmail.com
*
* NL
*/
/*-----VARIABLES-----*/
var userIP = [];
/*-----VARIABLES-----*/
var http = require('http');
var util = require('util');
var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');
var mysql = require('mysql');

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

app.get('/get_task', function(req, res)   {
   var ip = req.headers['x-real-ip'] || req.connection.remoteAddress;
	 console.log('Server: got GET /task IP: '+ip);

   	con.query(q_getTask, function (err, result) {
		  if (err) throw err;
      res.json(result);
    });
});

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/main.html'));
	console.log('Server: got GET /');
});

app.get('/task', function(req, res){
  res.sendFile(path.join(__dirname + '/main.html'));
  console.log('Server: got GET /task');
});
/*-----EXPRESS PART-----*/

/*-----DATA BASE PART-----*/
var con = mysql.createConnection({
    host: 'localhost',
    user: "root",
    password: "leiSh2ow",
    database: "nl"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("MySQL: connected");
});


/*-----DATA BASE PART-----*/

app.listen(8888);


/*-----QUEREIS-----*/
var q_getTask = "select * from tbtask;";
var q_getGame = "select * from tbGame;";
/*-----QUEREIS-----*/