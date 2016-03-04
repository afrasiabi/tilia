connection = require './DBConnection'

getTiles = (cb) ->
	connection.query 'SELECT * FROM `tiles`', (err, rows, fields) ->
		if err
			cb {success: false}
			return
		for row in rows
			row.tileSize = 
				height: row.tileHeight
				width: row.tileWidth
			row.realSize = 
				height: row.realHeight
				width: row.realWidth
			row.source = "http://localhost/project1/assets/#{row.source}"	
			row.tileHeight = undefined
			row.tileWidth = undefined
			row.realHeight = undefined
			row.realWidth = undefined
		cb {success: true, tiles: rows}

module.exports = getTiles