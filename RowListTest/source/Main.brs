'*************************************************************
'** Copyright (c) 2015 Roku, Inc.  All rights reserved.
'** Use of the Roku Platform is subject to the Roku SDK Licence Agreement:
'** https://docs.roku.com/doc/developersdk/en-us
'** Andy Yu
'*************************************************************

sub Main()
  print "in showChannelSGScreen"
  screen = CreateObject("roSGScreen")
  m.port = CreateObject("roMessagePort")
  screen.setMessagePort(m.port)
  scene = screen.CreateScene("TestScene")
  screen.show()

  while(true)
    msg = wait(0, m.port)
    msgType = type(msg)
    if msgType = "roSGScreenEvent"
        if msg.isScreenClosed() then return
    end if
  end while
end sub
