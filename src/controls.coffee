define [ 'backbone' ], ->
  Backbone.View.extend

    initialize: ->
      @$left_arrow = @$el.find '.left-arrow'
      @$up_arrow = @$el.find '.up-arrow'
      @$right_arrow = @$el.find '.right-arrow'
      @$shoot_bar = @$el.find '.shoot-bar'

      @$shoot_bar.css 'max-width', window.innerWidth - 257

    events:
      'touchstart .left-arrow': 'startLeft'
      'touchend .left-arrow': 'endLeft'

      'touchstart .up-arrow': 'startUp'
      'touchend .up-arrow': 'endUp'

      'touchstart .right-arrow': 'startRight'
      'touchend .right-arrow': 'endRight'

      'touchstart .shoot-bar': 'startShoot'
      'touchend .shoot-bar': 'endShoot'

    startLeft: ->
      @$left_arrow.addClass 'pressed'
      @trigger 'touchStart', 'left'
    startUp: ->
      @$up_arrow.addClass 'pressed'
      @trigger 'touchStart', 'up'
    startRight: ->
      @$right_arrow.addClass 'pressed'
      @trigger 'touchStart', 'right'
    startShoot: ->
      @$shoot_bar.addClass 'pressed'
      @trigger 'touchStart', 'space'

    endLeft: ->
      @$left_arrow.removeClass 'pressed'
      @trigger 'touchEnd', 'left'
    endUp: ->
      @$up_arrow.removeClass 'pressed'
      @trigger 'touchEnd', 'up'
    endRight: ->
      @$right_arrow.removeClass 'pressed'
      @trigger 'touchEnd', 'right'
    endShoot: ->
      @$shoot_bar.removeClass 'pressed'
      @trigger 'touchEnd', 'space'
