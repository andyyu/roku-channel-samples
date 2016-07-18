'*************************************************************
'** Copyright (c) 2015 Roku, Inc.  All rights reserved.
'** Use of the Roku Platform is subject to the Roku SDK Licence Agreement:
'** https://docs.roku.com/doc/developersdk/en-us
'** Andy Yu
'*************************************************************

function init()
  m.rowList = m.top.findNode("row_list")
  m.label2 = m.top.findNode("label2")
  setVideo()
  m.contentNumber = 0
  m.top.setFocus(true)
end function

sub setVideo()
  m.bgVideo = m.top.findNode("bgvideo")
  videoContent = createObject("RoSGNode", "ContentNode")
  videoContent.url = "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8"
  videoContent.title = "Test Video"
  videoContent.streamformat = "hls"

  m.bgVideo.content = videoContent
  m.bgVideo.control = "play"
end sub

sub generateContent()
  data = CreateObject("roSGNode", "ContentNode")
  for numRows = 0 to 3
      row = data.CreateChild("ContentNode")
      row.title = "Row " + stri(numRows)
      for i = 0 to m.contentNumber
          item = row.CreateChild("SimpleRowListItemData")
          item.posterUrl = "https://placeholdit.imgix.net/~text?txtsize=33&txt=500x500img" + i.toStr() + "&w=500&h=500"
          item.labelText = "This is item" + stri(numRows*3 + i)
      end for
  end for
  m.rowList.content = data
end sub


function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then
        if key = "up" then
            m.contentNumber += 10
            m.label2.text = "Test " + m.contentNumber.toStr() + " items per row. Press OK to add."
            handled = true
        else if key = "down" then
            if m.contentNumber > 0 then
              m.contentNumber -= 10
              m.label2.text = "Test " + m.contentNumber.toStr() + " items per row. Press OK to add."
            end if
            handled = true
        else if key = "OK" then
            generateContent()
            m.rowList.setFocus(true)
        else if key = "options" then
            if m.bgVideo.control = "play" then
              m.bgVideo.control = "pause"
            else if m.bgVideo.control = "pause" then
              m.bgVideo.control = "play"
            end if
        else
            handled = true
        end if
    end if
end function
