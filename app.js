//console.log(faker.internet.email());

//console.log(faker.date.past());

//function generateAddress(){
	//console.log(faker.address.streetAddress());
	//console.log(faker.address.city());
	//console.log(faker.address.state());
//}

//generateAddress();
//generateAddress();
//generateAddress();

//"Select curdate()"
//"Select 1+4"

var faker = require('faker');

var mysql = require('mysql')

var connection = mysql.createConnection({
	host	: 'localhost',
	user	: 'root',
	database : 'join_us'
});

//var q = 'SELECT CURTIME() as time, CURDATE() as date, NOW() as now';
//connection.query(q, function (error, results, fields) {
  //if (error) throw error;
  //console.log(results[0].time);
  //console.log(results[0].date);
  //console.log(results[0].now);
//});

//---SELECTING DATA---
//var q = 'SELECT * FROM users ';
//connection.query(q, function (error, results, fields) {
  //if (error) throw error;
  //console.log(results);
//});

//var q = 'SELECT COUNT(*) AS total FROM users ';
//connection.query(q, function (error, results, fields) {
  //if (error) throw error;
  //console.log(results[0].total);
//});

//---INSERTING DATA USER pt.1---
//var q = 'INSERT INTO users (email) VALUES ("rusty_the_dog@gmail.com")';
//connection.query(q, function (error, results, fields) {
  //if (error) throw error;
  //console.log(results);
//});

//---INSERTING DATA USERS pt.2---
//var person = {
    //email: faker.internet.email(),
  //  created_at: faker.date.past()
//};
 
//var end_result = connection.query('INSERT INTO users SET ?', person, function(err, result) {
  //if (err) throw err;
  //console.log(result);
//});

//---INSERTING BULK FAKER USERS---
var data = [];
for(var i = 0; i < 500; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ]);
}
 
 
var q = 'INSERT INTO users (email, created_at) VALUES ?';
 
connection.query(q, [data], function(err, result) {
  console.log(err);
  console.log(result);
});


connection.end();




