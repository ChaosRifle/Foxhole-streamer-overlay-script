; Script created by ChaosRifle
; README --------- set your OBS hotkey to enable and disable overlay to F8 (or press CTRL+H now and replace all instances of "F8" in this script with your desired key)
;                  to start you should ALWAYS have the map-obscuring overlay hidden on OBS.

; known issues:    Pressing escape to exit chat instead of enter to send the message may break the script?? if you do that just press CTRL+numpad_0 to reset the script if it does break stuff.


                          ; this name must match the games window title. EX: creating a new file with Notepad.exe will result in "Untitled - Notepad" as its name. That is what you would put here to update this
                          ; so to update the line below should read: "#IfWinActive Untitled - Notepad" if you wanted it to work for notepad.
#IfWinActive War                       ; all code below this will require that you have the a window by this name as your active window to work, until otherwise specified (ln 63)









; CODE BELOW HERE

;#SingleInstance, Force    ; just to prevent popups and weird double keystrokes if you click yes by mistake and not notice.
isTyping = 0              ; starting state, don't touch.
mapOpen = 0               ; starting state, don't touch.


Enter::                   ; enable/disable the map overlay in the event of user typing in chat
Sendinput {enter}
if ( isTyping = 1 ) {
  isTyping = 0
} else {
  isTyping = 1
}
return


m::                       ; toggle the map overlay with "M"
Sendinput {m}
if ( isTyping = 0 ) {
  if ( mapOpen = 1 ) {
    mapOpen = 0
    Sendinput {F8 down}
    Sleep 100
    Sendinput {F8 up}
  } else {
    mapOpen = 1
    Sendinput {F8 down}
    Sleep 100
    Sendinput {F8 up}
  }
}
return


Esc::                     ; close the map overlay if esc is pressed and the map is already open
Sendinput {esc}
if ( mapOpen = 1 ) {
  mapOpen = 0
  Sendinput {F8 down}
  Sleep 100
  Sendinput {F8 up}
}
return


#IfWinActive              ; setting the active window requirement to none so all code below works for any window being active


^numpad0::                ; keybind is CTRL+numpad 0. for hard-reset if it somehow ever desyncs from the game state and is also useful for editing the script quickly. This reloads the code from the saved .ahk file
reload
return