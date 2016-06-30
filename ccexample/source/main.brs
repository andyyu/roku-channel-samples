Library "v30/bslCore.brs"

Function Main() as void
  mode = 1
  fonts = CreateObject("roFontRegistry")
  fonts.Register("pkg:/fonts/vSHandprinted.otf")
  font = fonts.GetFont("vSHandprinted", 28, 500, false)
  screen = CreateObject("roScreen", true)
  port = CreateObject("roMessagePort")
  screen.Clear(&h00)
  screen.SwapBuffers()
  screen.SetMessagePort(port)
  timer = CreateObject("roTimespan")
  screenSize = {}
  screenSize.width = screen.GetWidth()
  screenSize.height = screen.GetHeight()

  player = CreateObject("roVideoPlayer")

  player.SetContentList([
    {
        Stream : { url :"https://devimages.apple.com.edgekey.net/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8" }
        StreamFormat : "hls"
        TrackIDSubtitle: "webvtt/1"
    }
  ])

  captions = player.GetCaptionRenderer()
  if (mode = 1)
    captions.SetScreen(screen)
  endif
  captions.SetMode(mode)
  captions.SetMessagePort(port)
  captions.ShowSubtitle(true)

  player.play()

  while true
    msg = wait(250, port)
    if type(msg) = "roCaptionRendererEvent"
      if msg.isCaptionText()
        print "isCaptionText"
        if msg.GetMessage() <> invalid and msg.GetMessage() <> ""
          DrawCaptionString(screen, screenSize, msg.GetMessage(), font)
          timer.Mark()
        else if timer.TotalSeconds() > 2
          ClearCaptionString(screen)
        endif
      else if msg.isCaptionUpdateRequest()
        print "isCaptionUpdateRequest()"
        UpdateCaptions(screen, captions)
      end if
    endif
  end while
End Function

Function UpdateCaptions(screen as object, captions as object) as Void
  screen.Clear(&h00)
  captions.UpdateCaption()
  screen.SwapBuffers()
End Function

Function DrawCaptionString(screen as object, screenSize as object, caption as String, font as object) as Void
  screen.Clear(&h00)
  textHeight = font.GetOneLineHeight()
  textWidth = font.GetOneLineWidth(caption, screenSize.width)
  x = (screenSize.width - textWidth) / 2
  y = screenSize.height - textHeight
  screen.DrawText(caption, x, y, &hd5d522ff, font)
  screen.SwapBuffers()
End Function

Function ClearCaptionString(screen as object) as void
  screen.Clear(&h00)
  screen.SwapBuffers()
End Function
