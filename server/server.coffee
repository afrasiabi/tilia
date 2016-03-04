express = require "express"
cors = require 'express-cors'
getTiles = require "./getTiles"

port = 3000
app = express()
app.use cors {allowedOrigins: ['localhost']}
app.get '/getTiles', (req, res) ->
	getTiles (result) ->
		res.json(result)

app.listen port, ->
	console.log "server is ready on port #{port}"

# fs = require "fs"
# fs.readFile "./data.json", (err, data) ->
# 	images = JSON.parse data
# 	query = "INSERT INTO `tiles` (`title`,`description`,`source`,`tileHeight`,`tileWidth`,`realHeight`,`realWidth`) VALUES "
# 	for image in images
# 		query += "('#{image.title}','#{image.desc}','#{image.src}','#{image.tileSize.height}','#{image.tileSize.width}','#{image.realSize.height}','#{image.realSize.width}'), "
# 	console.log query
# connection.end()