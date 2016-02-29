imgs = [
	{
		src: "./assets/cabin.jpg"
		title: "Cabin"
		desc: "A dribble shot of wierd cabin"
	}
	{
		src: "./assets/ball.jpg"
		title: "Ball"
		desc: "What the heck is this"
	}
	{
		src: "./assets/cabin.jpg"
		title: "COPY"
		desc: "what n what"
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
	tileContainerElement.innerHTML = tileInnerHTML
	return tileContainerElement

tileHolderElement = document.getElementById("tileHolder")

for img in imgs
	tileElement = makeTileElement(img)
	tileHolderElement.appendChild(tileElement)