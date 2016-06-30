' **********Copyright 2016 Roku Corp.  All Rights Reserved. : ANDY YU **********
sub init()
    m.top.SetFocus(true)
    
    m.cube5 = m.top.findNode("Cube5")
    
    m.direction = 1
    
    m.cubeTimer = m.top.findNode("cube5Timer")
    m.cubeTimer.control = "start"
    m.cubeTimer.ObserveField("fire", "wrapper")
    
end sub

sub wrapper()
    rotate()
    translate()
end sub

sub translate()
    m.translate_anim = m.top.findNode("cube5Translate")
    m.translate_interp = m.top.findNode("cube5Interp2")
    if m.cube5.translation[0] > 1700
        m.direction = -1
    else if m.cube5.translation[1] < 200
        m.direction = 1
    end if
    
    dir = m.direction.GetInt()
    
    m.translate_interp.keyValue = [[m.cube5.translation[0], m.cube5.translation[1]], [m.cube5.translation[0]+(dir*1000), m.cube5.translation[1]+(dir*500)]]
    m.translate_anim.control = "start"
end sub

sub rotate()
    m.rotate_anim = m.top.findNode("cube5Anim")
    m.rotate_interp = m.top.findNode("cube5Interp")
    dir = m.direction.GetInt()
    m.rotate_interp.keyValue = [m.cube5.rotation, m.cube5.rotation + (dir*20)]
    m.rotate_anim.control = "start"
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then
        if key = "up" then
            ?"top"
            handled = true
        else if key = "left" then
            handled = true
        else if key = "right" then
            handled = true
        else if key = "down" then
            handled = true
        else
            handle = false
        end if
    end if
end function

