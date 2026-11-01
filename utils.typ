#import "@preview/digidraw:0.9.3"
#import "@preview/fletcher:0.5.8"

#let node = fletcher.node.with(stroke: 1pt)
#let state(coord, state-name, outputs, label, bin) = (
  node(coord, outputs, name: label, shape: rect, width: 50pt, height: 30pt),
  node(
    (rel: (5pt, 23pt), to: str(label) + ".west"),
    state-name,
    stroke: none,
  ),
  node(
    (rel: (-10pt, 23pt), to: str(label) + ".east"),
    bin,
    stroke: none,
  ),
)
#let output(coord, name, label) = node(coord, name, shape: "rect", corner-radius: 10pt, name: label)
#let branch(coord, name, label) = node(coord, name, shape: fletcher.shapes.diamond, name: label)
#let arrow = fletcher.edge.with(marks: "-|>")

#let nt(con) = $overline(#con) #h(0.1em)$

#let truth_table(incolumns, outcolumns, ..cells) = {
  let table_cells = incolumns + (table.vline(stroke: 3pt + gray),) + outcolumns + cells.pos().map(val => {
    if val == 0 {
      table.cell(fill: black, align(center)[#text(fill:white)[0]])
    } else if val == 1 {
      table.cell(fill: white, align(center)[1])
    } else if val == "X" {
      table.cell(fill: gray, align(center)[X])
    }
    else {
      val
    }
  })
  text(font: "JetBrainsMono NF", table(columns: incolumns.len() + outcolumns.len(), ..table_cells))
}

#let nstt(incolumns, outcolumns, ..cells) = {
  let table_cells = incolumns + (table.vline(stroke: 3pt + gray),) + outcolumns + cells.pos().map(val => table.cell(align: center)[#val])

  text(font: "JetBrainsMono NF", table(
    columns: incolumns.len() + outcolumns.len(),
    fill: (_, y) => if calc.odd(y) { luma(180) } else { white },
    ..table_cells,
  ))
}

#let sch_nstt(incolumns, outcolumns, ..cells) = {
  // 4 shades, white first. Adjust to taste.
  let shades = (white, luma(235), luma(210), luma(185))
  let header-fill = rgb("#dde6f0") // pale blue-grey, distinct from the grey loop

  text(font: "JetBrainsMono NF", table(
    columns: incolumns.len() + outcolumns.len(),
    align: center,
    fill: (_, y) => if y == 0 {
      header-fill
    } else {
      // y - 1 so the first body row starts the loop; shade changes every 4 rows, repeats every 16
      shades.at(calc.rem(calc.quo(y - 1, 4), 4))
    },
    table.header(
      ..incolumns.map(val => strong[#val]),
      table.vline(stroke: 3pt + black),
      ..outcolumns.map(val => strong[#val]),
    ), table.hline(stroke: 3pt + black),
    ..cells.pos().map(val => [#val]),
  ))
}
