var port = process.env.PORT || 3000
  , app = require('express')()
  , favicon = require('serve-favicon')
  , device = require('express-device')
  , server = require('http').Server(app);


app.use( device.capture() );

server.listen(port);
console.log('\nϟϟϟ Serving on port ' + port + ' ϟϟϟ\n');

app.get('/', function (req, res) {
  if ( req.device.type == 'tablet' || req.device.type == 'phone' ) {
    res.sendfile( 'dist/mobile.html');
  } else {
    res.sendfile('dist/desktop.html');
  }
});

app.get('/*' , function( req, res, next ) {
    var file = req.params[0];
    res.sendfile( __dirname + '/' + file );
});
