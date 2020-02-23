breed [ wolves wolf ]
breed [mprey prey]

wolves-own[message?]
mprey-own[message?]
to setup
  clear-all
  reset-ticks
  create-wolves 10
  [setxy random-xcor random-ycor
  set message? false]
  ask wolves ;the characteristics of the wolf and prey breeds are defined
  [
    set color white
    set size 3
    set shape "wolf"
  ]
  create-mprey 10
  [setxy random-xcor random-ycor
  set message? false]
  ask mprey
  [
    set color red
    set size 1
    set shape "sheep"
  ]
  ask one-of wolves [set message? true]
  ask one-of mprey [set message? true]
end

to go
  ask wolves
  [
    ifelse move? [right random 60] [left random 60] ;function for movement
    forward random 5
    if any? other mprey-here with [message?]
    [set message? true]
    if message? [set color green]
  ]
  ask mprey
  [
    ifelse move? [right random 90] [left random 90] ;function for movement
    forward random 3
    if any? other wolves-here with [message?]
    [set message? true]
    if message? [set color yellow]
  ]
  tick;
end

to-report move?
  report random 2 = 0 ;true is outputted if the number generated is a zero
end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
647
448
-1
-1
13.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

BUTTON
12
10
75
43
NIL
setup\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
13
56
76
89
NIL
go\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
14
99
106
132
go-forever
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
13
155
167
200
Message Wolves Counter
count wolves with [color = green]
17
1
11

PLOT
8
293
208
443
Diffusion Curve
Time
Wolves
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot count wolves with [color = green]"

MONITOR
13
208
152
253
Message Prey Counter
count wolves with [color = green]
17
1
11

