@Grab('com.github.nao20010128nao:HttpServerJava:3962b51')
@GrabResolver(name='jitpack',root='https://jitpack.io')
import net.freeutils.httpserver.HTTPServer

HTTPServer.statuses[0]='Syamu Game'

def server=new HTTPServer(80)

server.getVirtualHost(null).with {
  addContext('/'){req,resp->
    println 'Requested'
    resp.sendHeaders(0)
    0
  }
}

server.start()

println 'Ready'
