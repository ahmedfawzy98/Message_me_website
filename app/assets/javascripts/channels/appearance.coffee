App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data.x
      $('#online-users').append("<a class='item' id='#{data.username}'>#{data.username}</a>")
    else
      $("##{data.username}").remove()
    end