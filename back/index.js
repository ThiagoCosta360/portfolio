var restify = require('restify');

var server = restify.createServer();
server.get('/api', (req, res, next) => {
  res.send('hello world');
  next();
});

server.listen(2000, function() {
  console.log('%s listening at %s', server.name, server.url);
});