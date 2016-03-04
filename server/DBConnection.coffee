mysql = require 'mysql'
connection = mysql.createConnection({
	host: 'localhost'
	user: 'root'
	password: ''
	database: 'tilia'
})
connection.connect()

module.exports = connection