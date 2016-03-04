imgs = []

makeTileElement = (tileInfo) ->
	tileInnerHTML = """
		<img src="#{tileInfo.source}" alt="#{tileInfo.title}">
		<div class="titleBar">
			<div class="title">#{tileInfo.title.toLowerCase()}</div>
			<div class="desc">#{tileInfo.description}</div>
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
			console.log tileInfoFocus

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

makeRequest = (url, cbFunc) ->

	alertContents = ->
		if httpRequest.readyState == XMLHttpRequest.DONE
			if httpRequest.status == 200
				cbFunc httpRequest.responseText
			else
				alert 'There was a problem with the request.'
		return

	httpRequest = new XMLHttpRequest
	if !httpRequest
		alert 'Giving up :( Cannot create an XMLHTTP instance'
		return false
	httpRequest.onreadystatechange = alertContents
	httpRequest.open 'GET', url
	httpRequest.send()
	return

# loadButton = document.getElementById "load"
tileHolderElement = document.getElementById "tileHolder"
# loadButton.addEventListener "click", (event) ->
# 	makeRequest "http://localhost/project1/server/data.json", (res) ->
# 		imagesInfo = JSON.parse(res)
# 		for img in imagesInfo
# 			tileElement = makeTileElement(img)
# 			setTileEvents(tileElement, img)
# 			tileHolderElement.appendChild(tileElement)

makeRequest "http://localhost:3000/getTiles", (res) ->
	resObject = JSON.parse(res)
	if resObject.success
		for img in resObject.tiles
			tileElement = makeTileElement(img)
			setTileEvents(tileElement, img)
			tileHolderElement.appendChild(tileElement)
	else
		alert "There was a error when loading tiles"