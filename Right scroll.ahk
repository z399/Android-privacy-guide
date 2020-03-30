$~*RButton Up::SetTimer, WatchTheMouse, off

$RButton::
MouseGetPos, ox, oy
SetTimer, WatchTheMouse, 5

WatchTheMouse:
MouseGetPos, nx, ny
if ((dx := nx-ox)**2 > 8 )
{
    times := Abs(dy) / 4
    ControlGetFocus, control, A 

    Loop, %times%
    {
            if (dx > 0)
                    SendMessage, 0x114, 1, 0, %control%, A  ;
            Else    
                    SendMessage, 0x114, 0, 0, %control%, A  ;

    }
}
if ((dy := ny-oy)**2 > 8 )
{
        times := Abs(dy) / 4

        Loop, %times%
        {
                 if (dy > 0)
                         Click WheelDown
                 Else     
                         Click WheelUp
    }
}
MouseMove ox, oy
return