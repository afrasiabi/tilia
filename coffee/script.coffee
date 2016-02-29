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

makeTileHTML = (tileInfo) ->
	tileHTML = """
		<div class="tileContainer">
			<img src="#{tileInfo.src}" alt="#{tileInfo.title}">
			<div class="titleBar">
				<div class="title">#{tileInfo.title.toLowerCase()}</div>
				<div class="desc">#{tileInfo.desc}</div>
			</div>
		</div>
	"""

tileHolderElement = document.getElementById("tileHolder")

tileHolderInnerHTML = ""
for img in imgs
	tileHolderInnerHTML += makeTileHTML(img)

tileHolderElement.innerHTML = tileHolderInnerHTML