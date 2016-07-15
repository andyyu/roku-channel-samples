'*************************************************************
'** Copyright (c) 2015 Roku, Inc.  All rights reserved.
'** Use of the Roku Platform is subject to the Roku SDK Licence Agreement:
'** https://docs.roku.com/doc/developersdk/en-us
'** Andy Yu
'*************************************************************

function init()
  m.rowList = m.top.findNode("row_list")
  m.label2 = m.top.findNode("label2")
  m.contentNumber = 0
  m.top.setFocus(true)
end function

sub generateContent()
  data = CreateObject("roSGNode", "ContentNode")
  for numRows = 0 to 3
      row = data.CreateChild("ContentNode")
      row.title = "Row " + stri(numRows)
      for i = 0 to m.contentNumber
          item = row.CreateChild("SimpleRowListItemData")
          item.posterUrl = "https://placeholdit.imgix.net/~text?txtsize=33&txt=262x147img" + i.toStr() + "&w=262&h=147"
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
        else
            handled = true
        end if
    end if
end function
