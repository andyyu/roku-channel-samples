'*************************************************************
'** Copyright (c) 2015 Roku, Inc.  All rights reserved.
'** Use of the Roku Platform is subject to the Roku SDK Licence Agreement:
'** https://docs.roku.com/doc/developersdk/en-us
'** Andy Yu
'*************************************************************

sub init()
  print "init"
  m.numIterations = 0
  m.top.functionName = "generateContent"
end sub

sub generateContent()
  for k = 0 to m.top.numIterations
    url = "https://placeholdit.imgix.net/~text?txtsize=33&txt=Placeholder" + stri(0) + "&w=262&h=147"
    urlstring = "http://roku.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/decbe34b64ea4ca281dc09997d0f23fd/aac0cfc54ae74fdfbb3ba9a2ef4c7080/117_segment_2_twitch__nw_060515.mp4"
    newItem = {
      url: url
      Title: "Item" + stri(0)
      Description: "Description: " + stri(0)
      ReleaseDate: "Release Date: " + stri(0)
      HDPosterUrl: url
      hdBackgroundImageUrl: url
    }
  end for
end sub
