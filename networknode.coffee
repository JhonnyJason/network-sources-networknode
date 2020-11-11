network = {}

############################################################
fetch = require("node-fetch").default

############################################################
network.postData = (url, data) ->
    options =
        method: 'POST'
        credentials: 'omit'
        body: JSON.stringify(data)
        headers:
            'Content-Type': 'application/json'

    response = await fetch(url, options)
    if response.status == 403 then throw new Error("Unauthorized!")
    return response.json()

network.getData = (url) ->
    response = await fetch(url)
    if response.status == 403 then throw new Error("Unauthorized!")
    return response.json()


module.exports = network