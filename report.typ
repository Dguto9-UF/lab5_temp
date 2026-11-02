// #import "@preview/k-mapper:1.4.0": *
// #import "@preview/karnaugh-express:0.1.1": *
#import "utils.typ": *

#set enum(numbering: "a.")

#let headrow(a, b, c, a_s: 10pt, b_s: 10pt, c_s: 10pt) = {
  v(-0.65em)
  grid(columns: (1fr, auto, 1fr), align: (left, center, right), text(size: a_s)[#a], text(size: b_s)[#b], text(size: c_s)[#c])
}

#let pgcount = context [Page #counter(page).get().first()/#counter(page).final().first()]

#set page(
  paper: "us-letter",
  margin: (top: 1.8in, left: 0.5in, right: 0.5in),
  header: [
    #headrow([University of Florida], [*EEL 3701C: Digital Logic & Computer Systems*], [Gutowski, Dillon], b_s: 12pt)
    #headrow([Department of Electrical & Computer Engineering], [Revision #text(fill: rgb(115, 70, 160))[*0*]], [Class \#: 10704], a_s: 8pt, b_s: 11pt)
    #headrow([#pgcount], [Lab 5 Report: *State Machines*], [Belilty, Jacobo], b_s: 14pt)
    #v(-0.7em)
    #h(1fr) #text(size: 10pt)[November 1, 2026]
  ],
  header-ascent: 0.7em
)

#set text(
  font: "Times New Roman",
  size: 12pt,
)

#show heading.where(level: 1): it => [
  #align(center)[
    #it.body
  ]
  #v(0.5em)
]

#show heading.where(level: 2): it => [
  #line(length: 100%, stroke: 1.3pt)
  #v(-0.24em)
  #strong(upper(text(size: 16pt, [#it.body])))
  #v(-0.75em)
  #line(length: 100%, stroke: 1.3pt)
]

== Requirements Not Met
N/A

== Problems Encountered

== Future Work/Applications

#pagebreak()

== Pre-Lab Questions Or Exercises
N/A
#pagebreak()

== Pre-Lab Requirements
=== Part 1: ASM Diagram
#fletcher.diagram(
  ..state((0,0), `S0`, [``], <st:s0>, [0000]),
  ..state((1,0), `S1`, [``], <st:s1>, [0001]),
  ..state((2,0), `S2`, [``], <st:s2>, [0010]),
  ..state((3,0), `S3`, [``], <st:s3>, [0011]),
  ..state((4,0), `S4`, [``], <st:s4>, [0100]),
  branch((0,1), `EV`, <br:s0>),
  branch((1,1), `EV`, <br:s1>),
  branch((2,1), `EV`, <br:s2>),
  branch((3,1), `EV`, <br:s3>),
  branch((4,1), `EV`, <br:s4>),
  branch((5,0), `CW`, <br:s5>),
  arrow(<st:s0>,<br:s0>),
  arrow(<st:s1>,<br:s1>),
  arrow(<st:s2>,<br:s2>),
  arrow(<st:s3>,<br:s3>),
  arrow(<st:s4>,<br:s4>),
  output((0.5,0.5), `GREEN`, <out:s0>),
  output((1.5,0.5), `GREEN`, <out:s1>),
  output((2.5,0.5), `GREEN`, <out:s2>),
  output((3.5,0.5), `GREEN`, <out:s3>),
  output((4.5,0.5), `GREEN`, <out:s5>),
  arrow(<br:s0>,<out:s0>,0),
  arrow(<br:s1>,<out:s1>,0),
  arrow(<br:s2>,<out:s2>,0),
  arrow(<br:s3>,<out:s3>,0),
  arrow(<out:s0>,<st:s1>),
  arrow(<out:s1>,<st:s2>),
  arrow(<out:s2>,<st:s3>),
  arrow(<out:s3>,<st:s4>),
  arrow(<br:s4>,<out:s5>,0),
  arrow(<out:s5>,<br:s5>,0),
  arrow(<br:s5>,(5,-0.7),(0,-0.7), <st:s0>,0,label-pos:30%),
  output((0,2), `YELLOW`, <out:s4>),
  arrow(<br:s0>,<out:s4>,1),
  arrow(<br:s1>,(0,1.5),1,label-pos:30%,corner:right),
  arrow(<br:s2>,(0,1.5),1,label-pos:30%,corner:right),
  arrow(<br:s3>,(0,1.5),1,label-pos:30%,corner:right),
  arrow(<br:s4>,(0,1.5),1,label-pos:30%,corner:right),
  ..state((2,2), `S5`, [`YELLOW`], <st:s5>, [1000]),
  ..state((1,2), `S6`, [`YELLOW`], <st:s6>, [1001]),
  arrow(<out:s4>,<st:s6>),
  arrow(<st:s5>,<st:s6>),
  arrow(<br:s5>,<st:s5>,1,label-pos:10%,corner:right),
  ..state((0,3), `S7`, [`RED`], <st:s7>, [1100]),
  ..state((1,3), `S8`, [`RED`], <st:s8>, [1101]),
  ..state((2,3), `S9`, [`RED`], <st:s9>, [1110]),
  branch((3,3), `EV`, <br:s6>),
  arrow(<st:s6>,(1,2.5),(0,2.5),<st:s7>),
  arrow(<st:s7>,<st:s8>),
  arrow(<st:s8>,<st:s9>),
  arrow(<st:s9>,<br:s6>),
  arrow(<br:s6>,(3,2.5),(2,2.5),<st:s9>,1,label-pos:10%),
  arrow(<br:s6>,(3,3.5),(-0.7,3.5),(-0.7,0),<st:s0>,0,label-pos:10%),
)
#pagebreak()
=== Part 2: Truth Table
#sch_nstt(
  ("Q3","Q2","Q1","Q0","EV","CW"),("Q3+","Q2+","Q1+","Q0+","GREEN","YELLOW","RED"),
  0,0,0,0,0,"-"    ,  0,0,0,1,1,0,0,
  0,0,0,0,1,"-"    ,  1,0,0,1,0,1,0,
  0,0,0,1,0,"-"    ,  0,0,1,0,1,0,0,
  0,0,0,1,1,"-"    ,  1,0,0,1,0,1,0,
  0,0,1,0,0,"-"    ,  0,0,1,1,1,0,0,
  0,0,1,0,1,"-"    ,  1,0,0,1,0,1,0,
  0,0,1,1,0,"-"    ,  0,1,0,0,1,0,0,
  0,0,1,1,1,"-"    ,  1,0,0,1,0,1,0,
  0,1,0,0,0,0      ,  0,0,0,0,1,0,0,
  0,1,0,0,0,1      ,  1,0,0,0,1,0,0,
  0,1,0,0,1,"-"    ,  1,0,0,1,0,1,0,
  0,1,0,1,"-","-"  ,  "X","X","X","X","X","X","X",
  0,1,1,"-","-","-",  "X","X","X","X","X","X","X",
  1,0,0,0,"-","-"  ,  1,0,0,1,0,1,0,
  1,0,0,1,"-","-"  ,  1,1,0,0,0,1,0,
  1,0,1,"-","-","-",  "X","X","X","X","X","X","X",
  1,1,0,0,"-","-"  ,  1,1,0,1,0,0,1,
  1,1,0,1,"-","-"  ,  1,1,1,0,0,0,1,
  1,1,1,0,0,"-"    ,  0,0,0,0,0,0,1,
  1,1,1,0,1,"-"    ,  1,1,1,0,0,0,1,
  1,1,1,1,"-","-"  , "X","X","X","X","X","X","X",
)
#pagebreak()
Resulting MSOP expressions in VHDL:
```vhdl
Q3+    <=   ((not Q3) and (not Q2)                           and EV                   )
      	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and (not EV) and CW      )
      	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and EV                   )
      	 or (Q3       and (not Q2) and (not Q1) and (not Q0)                          )
      	 or (Q3       and (not Q2) and (not Q1) and Q0                                )
      	 or (Q3       and Q2       and (not Q1) and (not Q0)                          )
      	 or (Q3       and Q2       and (not Q1) and Q0                                )
      	 or (Q3       and Q2       and Q1       and (not Q0) and EV                   );
Q2+    <=   ((not Q3) and (not Q2) and Q1       and Q0       and (not EV)             )
      	 or (Q3       and (not Q2) and (not Q1) and Q0                                )
      	 or (Q3       and Q2       and (not Q1) and (not Q0)                          )
      	 or (Q3       and Q2       and (not Q1) and Q0                                )
      	 or (Q3       and Q2       and Q1       and (not Q0) and EV                   );
Q1+    <=   ((not Q3) and (not Q2) and (not Q1) and Q0       and (not EV)             )
      	 or ((not Q3) and (not Q2) and Q1       and (not Q0) and (not EV)             )
      	 or (Q3       and Q2       and (not Q1) and Q0                                )
      	 or (Q3       and Q2       and Q1       and (not Q0) and EV                   );
Q0+    <=   ((not Q3) and (not Q2) and (not Q1) and (not Q0) and (not EV)             )
      	 or ((not Q3) and (not Q2) and Q1       and (not Q0) and (not EV)             )
      	 or ((not Q3) and (not Q2)                           and EV                   )
      	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and (not EV) and CW      )
      	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and EV                   )
      	 or (Q3       and (not Q2) and (not Q1) and (not Q0)                          )
      	 or (Q3       and Q2       and (not Q1) and (not Q0)                          );
GREEN  <=   ((not Q3) and (not Q2) and (not Q1) and (not Q0) and (not EV)             )
      	 or ((not Q3) and (not Q2) and (not Q1) and Q0       and (not EV)             )
      	 or ((not Q3) and (not Q2) and Q1       and (not Q0) and (not EV)             )
      	 or ((not Q3) and (not Q2) and Q1       and Q0       and (not EV)             )
      	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and (not EV) and (not CW))
      	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and (not EV) and CW      );
YELLOW <=   ((not Q3) and (not Q2)                           and EV                   )
      	 or ((not Q3) and Q2       and (not Q1) and (not Q0) and EV                   )
      	 or (Q3       and (not Q2) and (not Q1) and (not Q0)                          )
      	 or (Q3       and (not Q2) and (not Q1) and Q0                                );
RED    <=   (Q3       and Q2       and (not Q1) and (not Q0)                          )
      	 or (Q3       and Q2       and (not Q1) and Q0                                )
      	 or (Q3       and Q2       and Q1       and (not Q0) and (not EV)             )
      	 or (Q3       and Q2       and Q1       and (not Q0) and EV                   );
```
