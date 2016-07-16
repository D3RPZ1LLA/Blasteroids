define [ 'backbone' ], ->
  Backbone.View.extend
    events:
      'click .exit': 'closeMenu'

    closeMenu: ->
      @trigger 'closeMenu'
      @close( )

    open: ->
      @$el.removeClass 'closed'
    close: ->
      @$el.addClass 'closed'
