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

makeTileElement = (tileInfo) ->
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

tileElementFocus = null
tileInfoFocus = null
setTileEvents = (tileElement, tileInfo) ->
	tileElement.addEventListener "click", (event) ->
		if tileElementFocus?
			tileElementFocus.style.width = tileInfoFocus.tileSize.width + "px"
			tileElementFocus.style.height = tileInfoFocus.tileSize.height + "px"
			tileElementFocus.classList.remove "focusTile"
			tileElementFocus.classList.add "unFocusTile"

		if tileElementFocus is @
			tileElementFocus = null
			tileInfoFocus = null
			return
		tileElementFocus = @
		tileInfoFocus = tileInfo
		tileElementFocus.style.width = tileInfo.realSize.width + "px"
		tileElementFocus.style.height = tileInfo.realSize.height + "px"
		tileElementFocus.classList.add "focusTile"
		tileElementFocus.classList.remove "unFocusTile"

tileHolderElement = document.getElementById("tileHolder")
for img in imgs
	tileElement = makeTileElement(img) 
	setTileEvents(tileElement, img)
	tileHolderElement.appendChild(tileElement)