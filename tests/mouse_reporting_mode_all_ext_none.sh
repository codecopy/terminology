#!/bin/sh

# char width: 7
# char height: 15

# resize window
#resize window to 180-chars width
printf '\033[8;;180;t'
# force render
printf '\033}tr\0'
sleep 0.2

# fill space with E
printf '\033#8'

# set color
printf '\033[46;31;3m'

# positions used are;
# - 200;130 -> 9;29
# - 480;130 -> 9;69
# - 1230;130 -> 9;176
# indicate the positions to help testing
printf '\033[9;29H#'
printf '\033[9;69H#'
printf '\033[9;95H@' # after that one, MOUSE_X10 is not working
printf '\033[9;176H#'

# set mouse mode - all reported - normal reporting
printf '\033[?1006l'
printf '\033[?1015l'
printf '\033[?1005l'
printf '\033[?1003h'
printf '\033[H'

## LEFT CLICK
# should print ^[[M =)^[[M@Q)^[[M@e)^[[M#e)
# move cursor
printf '\033[1H'
# mouse down
printf '\033}td;200;130;1;0;0\0'
# mouse move
printf '\033}tm;340;130;0\0'
printf '\033}tm;480;130;0\0'
# mouse up
printf '\033}tu;480;130;1;0;0\0'
# mouse move back ^[[M?Q)^[[M?=)
printf '\033}tm;340;130;0\0'
printf '\033}tm;200;130;0\0'

# mouse click -> ^[[M e)
printf '\033}td;480;130;1;0;0\0'
# mouse move -> ^[[M@~)
printf '\033}tm;657;130;0\0'
# mouse move at x:94 -> ^[[M@^?)
printf '\033}tm;664;130;0\0'
# mouse move at x:95 -> ^[[M@ )
printf '\033}tm;671;130;0\0'
# mouse move at x:174 -> ^[[M@ )
printf '\033}tm;1230;130;0\0'
# mouse up at x:174: -> ^[[M# )
printf '\033}tu;1230;130;1;0;0\0'
#not pressed
# mouse click at x:95 -> ^[[M? )
printf '\033}tm;671;130;0\0'
# mouse click at x:94 -> ^[[M?^?)
printf '\033}tm;664;130;0\0'
# mouse click at x:93 -> ^[[M?~)
printf '\033}tm;657;130;0\0'
# force render
printf '\033}tr\0'
sleep 0.2

## RIGHT CLICK
# should print ^[[M"=)^[[MBQ)^[[MBe)^[[M#e)
# move cursor
printf '\033[2H'
# mouse down
printf '\033}td;200;130;3;0;0\0'
# mouse move
printf '\033}tm;340;130;0\0'
printf '\033}tm;480;130;0\0'
# mouse up
printf '\033}tu;480;130;3;0;0\0'
# mouse move back ^[[M?Q)^[[M?=)
printf '\033}tm;340;130;0\0'
printf '\033}tm;200;130;0\0'
# force render
printf '\033}tr\0'
sleep 0.2

## MIDDLE CLICK
# should print ^[[M!=)^[[MAe)^[[M#e)
# move cursor
printf '\033[3H'
# mouse down
printf '\033}td;200;130;2;0;0\0'
# mouse move
printf '\033}tm;480;130;0\0'
# mouse up
printf '\033}tu;480;130;2;0;0\0'
# mouse move back ^[[M?Q)^[[M?=)
printf '\033}tm;340;130;0\0'
printf '\033}tm;200;130;0\0'
# force render
printf '\033}tr\0'
sleep 0.2

## WHEEL
# prints ^[[M`=)^[[Ma=)^[[M`e)^[[Mae)
# move cursor
printf '\033[4H'
# wheel up/down
printf '\033}tw;200;130;1;1;0\0'
printf '\033}tw;200;130;0;1;0\0'
printf '\033}tw;480;130;1;1;0\0'
printf '\033}tw;480;130;0;1;0\0'
# force render
printf '\033}tr\0'
sleep 0.2


##
# Same with Alt
##
printf '\033[6HWith Alt:'

## LEFT CLICK
# should print ^[[M(=)^[[M@e^[[M+e)
# move cursor
printf '\033[7H'
# mouse down
printf '\033}td;200;130;1;1;0\0'
# mouse move
printf '\033}tm;480;130;1\0'
# mouse up
printf '\033}tu;480;130;1;1;0\0'
# mouse move back ^[[M?Q)^[[M?=)
printf '\033}tm;340;130;1\0'
printf '\033}tm;200;130;1\0'
# force render
printf '\033}tr\0'
sleep 0.2


## RIGHT CLICK
# should print ^[[M*=)^[[MBe)^[[M+e)
# move cursor
printf '\033[8H'
# mouse down
printf '\033}td;200;130;3;1;0\0'
# mouse move
printf '\033}tm;480;130;1\0'
# mouse up
printf '\033}tu;480;130;3;1;0\0'
# mouse move back ^[[M?Q)^[[M?=)
printf '\033}tm;340;130;1\0'
printf '\033}tm;200;130;1\0'
# force render
printf '\033}tr\0'
sleep 0.2


## MIDDLE CLICK
# should print ^[[M)=)^[[MAe^[[M+e
# move cursor
printf '\033[9H'
# mouse down
printf '\033}td;200;130;2;1;0\0'
# mouse move
printf '\033}tm;480;130;1\0'
# mouse up
printf '\033}tu;480;130;2;1;0\0'
# mouse move back ^[[M?Q)^[[M?=)
printf '\033}tm;340;130;1\0'
printf '\033}tm;200;130;1\0'
# force render
printf '\033}tr\0'
sleep 0.2

## WHEEL
# prints ^[[M`=)^[[Ma=)^[[M`e)^[[Mae)
# move cursor
printf '\033[10H'
# wheel up/down
printf '\033}tw;200;130;1;1;1\0'
printf '\033}tw;200;130;0;1;1\0'
printf '\033}tw;480;130;1;1;1\0'
printf '\033}tw;480;130;0;1;1\0'
# force render
printf '\033}tr\0'
sleep 0.2
printf '\033[14H'
