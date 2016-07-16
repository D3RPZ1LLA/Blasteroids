define [ 'backbone' ], ->
  Backbone.View.extend
    initialize: ->
      @$menuIcon = $ '.menu-icon'

    events:
      'click .menu-icon': 'openMenu'

    openMenu: ->
      @trigger 'openMenu'
      @hideMenuIcon( )

    hideMenuIcon: ->
      @$menuIcon.addClass 'hidden'
    showMenuIcon: ->
      @$menuIcon.removeClass 'hidden'
