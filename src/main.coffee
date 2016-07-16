require.config
  paths:
    images: '../../assets/images',
    text: '../../vendor/text',
    backbone: '../../node_modules/backbone/backbone',
    underscore: '../../node_modules/underscore/underscore',
    jquery: '../../node_modules/jquery/dist/jquery.min'

  shim:
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    underscore:
      exports: '_'
    jquery:
      exports: '$'

define [ 'header', 'menu', 'controls', 'backbone' ], ( HeaderView, MenuView, ControlsView ) ->
  header = new HeaderView { el: $( 'header' )[0] }
  menu = new MenuView { el: $( '.menu' )[0] }
  header.on 'openMenu', ->
    menu.open( )
  menu.on 'closeMenu', ->
    header.showMenuIcon( )

  $canvas = $ '#canvas'
  $canvas.attr( 'width', window.innerWidth )
  $canvas.attr( 'height', (window.innerHeight - 146) )

  game = new window.Asteroids.Game( $canvas[0].getContext("2d"), window.innerWidth, (window.innerHeight - 146) )
  game.start( window )

  controls = new ControlsView { el: $( '.controls' )[0] }

  controls.on 'touchStart', ( key ) ->
    game.pressKey key
  controls.on 'touchEnd', ( key ) ->
    game.stopPressKey key
