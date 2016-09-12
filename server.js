/**
 * Created by Administrator on 2016/9/5.
 */
//    nodejs对1337端口的监听和命令的处理
var http=require('http');
var server=http.createServer(function(req,res){
    res.writeHead(200,{'Content-Type':'text/plain'});
    res.end('Hello World!!!\n');
});
server.listen(1337,'127.0.0.1');
console.log('Server running an http:127.0.0.1:1337/');