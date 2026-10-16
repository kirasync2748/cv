// cv-template.typ — Original Typst CV layout
// Provides document, category, position, and item helpers
// for a clean two-column curriculum vitae.

#let accent = rgb("#2c5f8a")
#let muted = rgb("#666666")
#let light = rgb("#999999")
#let rule = rgb("#cccccc")

#let document(
  body,
  name: "",
  role: "",
  contact: (),
  sidebar: [],
) = {
  set page(
    paper: "a4",
    margin: (top: 22pt, bottom: 22pt, left: 22pt, right: 22pt),
  )
  set text(font: "New Computer Modern", size: 10pt, lang: "en")
  set par(leading: 0.65em, justify: false)
  set list(
    indent: 8pt,
    body-indent: 5pt,
    spacing: 3pt,
    marker: text(fill: accent)[•],
  )

  // Header
  block(width: 100%)[
    #text(size: 22pt, weight: "bold", tracking: 0.5pt)[#name]
    #v(3pt)
    #text(size: 11pt, fill: accent)[#role]
  ]
  v(4pt)
  line(length: 100%, stroke: 1.2pt + accent)
  v(10pt)

  // Contact line
  if contact.len() > 0 {
    text(size: 9pt, fill: muted)[#contact.join("   |   ")]
    v(10pt)
  }

  // Two-column body: sidebar + main content
  grid(
    columns: (1fr, 2.3fr),
    column-gutter: 18pt,
    sidebar,
    body,
  )
}

#let category(title) = {
  v(2pt)
  text(size: 10.5pt, weight: "bold", tracking: 0.8pt, fill: accent)[
    #upper(title)
  ]
  v(3pt)
  line(length: 100%, stroke: 0.5pt + rule)
  v(5pt)
}

#let position(
  title: "",
  organisation: "",
  dates: "",
  location: "",
  details: none,
) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 6pt,
    {
      text(weight: "bold")[#title]
      if organisation != "" [
        #h(4pt)
        #text(fill: muted)[— #organisation]
      ]
    },
    text(size: 9pt, fill: light)[#dates],
  )
  if location != "" {
    text(size: 9pt, fill: light)[#location]
    v(1pt)
  }
  if details != none {
    v(3pt)
    text(size: 9.5pt)[#details]
  }
  v(8pt)
}

#let simple-entry(
  label: "",
  value: "",
  dates: none,
) = {
  if label != "" {
    text(weight: "bold")[#label]
    if value != "" [#h(4pt)#value]
  } else {
    value
  }
  if dates != none {
    h(1fr)
    text(size: 9pt, fill: light)[#dates]
  }
  v(4pt)
}

#let skill-group(label, items) = {
  text(weight: "bold", size: 9.5pt)[#label]
  h(4pt)
  text(size: 9.5pt, fill: muted)[#items]
  v(5pt)
}
