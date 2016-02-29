imgs = [
	{
		src: "./assets/cabin.jpg"
		title: "Cabin"
		desc: "A dribble shot of wierd cabin"
		tileSize: {
			height: 450
			width: 600
		}
		realSize: {
			height: 600
			width: 800
		}
	}
	{
		src: "./assets/ball.jpg"
		title: "Ball"
		desc: "What the heck is this"
		tileSize: {
			height: 300
			width: 400
		}
		realSize: {
			height: 600
			width: 800
		}
	}
	{
		src: "./assets/pencils.gif"
		title: "pencil"
		desc: "Beautiful!"
		tileSize: {
			height: 300
			width: 400
		}
		realSize: {
			height: 600
			width: 800
		}
	}
	{
		src: "./assets/lion.jpg"
		title: "lion"
		desc: "Bila misar, Khoshgele lion"
		tileSize: {
			height: 300
			width: 400
		}
		realSize: {
			height: 600
			width: 800
		}
	}
	{
		src: "./assets/face.jpg"
		title: "Face"
		desc: "Face off!"
		tileSize: {
			height: 300
			width: 400
		}
		realSize: {
			height: 600
			width: 800
		}
	}
	{
		src: "./assets/seed.gif"
		title: "Earth seed"
		desc: "Come on grow on!"
		tileSize: {
			height: 300
			width: 400
		}
		realSize: {
			height: 600
			width: 800
		}
	}
	{
		src: "./assets/weekend.png"
		title: "weekend"
		desc: "Day n Night!"
		tileSize: {
			height: 450
			width: 600
		}
		realSize: {
			height: 600
			width: 800
		}
	}
	{
		src: "./assets/beach.png"
		title: "tortoise"
		desc: "It's a chelonioidea, not a tortoise..."
		tileSize: {
			height: 300
			width: 400
		}
		realSize: {
			height: 600
			width: 800
		}
	}
	{
		src: "./assets/button.png"
		title: "Save Water"
		desc: "We've all got to do our bit!"
		tileSize: {
			height: 300
			width: 400
		}
		realSize: {
			height: 600
			width: 800
		}
	}
]

class TileManager
	constructor: (@node) ->
		@_tileElementFocus = null
		@_tileInfoFocus = null
		
	addTile: (tileInfo) ->
		tileElement = @_makeTileElement(tileInfo)
		@_setTileEvents(tileElement, tileInfo)
		@node.appendChild(tileElement)

	_makeTileElement: (tileInfo) ->
		tileInnerHTML = """
			<img src="#{tileInfo.src}" alt="#{tileInfo.title}">
			<div class="titleBar">
				<div class="title">#{tileInfo.title.toLowerCase()}</div>
				<div class="desc">#{tileInfo.desc}</div>
			</div>
		"""

		tileContainerElement = document.createElement "div"
		tileContainerElement.classList.add "tileContainer"
		tileContainerElement.classList.add "unFocusTile"
		tileContainerElement.style.width = tileInfo.tileSize.width + "px"
		tileContainerElement.style.height = tileInfo.tileSize.height + "px"
		tileContainerElement.innerHTML = tileInnerHTML
		return tileContainerElement

	_setTileEvents: (tileElement, tileInfo) ->
		classThis = @
		tileElement.addEventListener "click", (event) ->
			# here this (@) means tileElement
			# and I need classThis too

			if classThis._tileElementFocus?
				classThis._tileElementFocus.style.width = classThis._tileInfoFocus.tileSize.width + "px"
				classThis._tileElementFocus.style.height = classThis._tileInfoFocus.tileSize.height + "px"
				classThis._tileElementFocus.classList.remove "focusTile"
				classThis._tileElementFocus.classList.add "unFocusTile"

			if classThis._tileElementFocus is @
				classThis._tileElementFocus = null
				classThis._tileInfoFocus = null
				return
			classThis._tileElementFocus = @
			classThis._tileInfoFocus = tileInfo
			classThis._tileElementFocus.style.width = tileInfo.realSize.width + "px"
			classThis._tileElementFocus.style.height = tileInfo.realSize.height + "px"
			classThis._tileElementFocus.classList.add "focusTile"
			classThis._tileElementFocus.classList.remove "unFocusTile"

tileHolderElement = document.getElementById("tileHolder")
tileManager = new TileManager tileHolderElement
for img, index in imgs
	tileManager.addTile img