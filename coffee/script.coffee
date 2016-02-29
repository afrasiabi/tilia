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
	tileContainerElement.classList.add "unFocusTile"
	tileContainerElement.innerHTML = tileInnerHTML
	return tileContainerElement

tileHolderElement = document.getElementById("tileHolder")
tileElementFocus = null
for img in imgs
	tileElement = makeTileElement(img)

	tileElement.addEventListener "click", (event) ->
		if tileElementFocus?
			tileElementFocus.classList.remove "focusTile"
			tileElementFocus.classList.add "unFocusTile"

		if tileElementFocus is @
			tileElementFocus = null
			return
		tileElementFocus = @
		tileElementFocus.classList.add "focusTile"
		tileElementFocus.classList.remove "unFocusTile"


		




	tileHolderElement.appendChild(tileElement)