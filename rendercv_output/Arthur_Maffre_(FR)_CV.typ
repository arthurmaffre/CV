
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Arthur Maffre (FR)"
#let locale-catalog-page-numbering-style = context { "Arthur Maffre (FR) - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Apr 2025"
#let locale-catalog-language = "fr"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 1pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.7em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 31pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.82cm
#let design-header-vertical-space-between-connections-and-first-section = 0.82cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.45cm
#let design-header-separator-between-connections = "|"
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.3cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.5cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 0.8cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Arthur Maffre \(FR\)

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Montreal, QC],
  [#box(original-link("mailto:maffrearthur@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)maffrearthur\@gmail.com])],
  [#box(original-link("tel:+1-514-501-7206")[#fa-icon("phone", size: 0.9em) #h(0.05cm)\(514\) 501-7206])],
  [#box(original-link("https://linkedin.com/in/arthur-maffre")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)arthur-maffre])],
  [#box(original-link("https://github.com/arthurmaffre")[#fa-icon("github", size: 0.9em) #h(0.05cm)arthurmaffre])],
)
#connections(connections-list)



== Highlights


#one-col-entry(
  content: [- Designing intelligent systems for #strong[dynamic pricing] and #strong[portfolio] generation],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Research funded by #strong[IVADO] at #strong[Mila] \(20k\/year\)],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Finalist at #strong[McGill-FIAM Hackathon] | 3rd place at #strong[Polytechnique Datathon]],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Bridging #strong[AI theory] and real-world impact — from #strong[GFlowNet] to public spending],
)


== About Me


#one-col-entry(
  content: [Graduate student at #strong[Mila] \(Université de Montréal\), building intelligent systems that push the #strong[boundaries of optimization] and decision-making. Currently exploring #strong[GFlowNet]-based architectures for #strong[pricing] and #strong[portfolio generation]. I strive to turn complex ideas into actionable models — always aiming higher.]
)


== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 0.8cm,
  left-content: [#strong[MSC]],
  middle-content: [
    #strong[Université de Montréal - Mila], Computer Science
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Supervisor : Prof. Margarida Carvalho])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Research on #strong[GFlowNet-based] for dynamic pricing and portfolio generation],[Focus on reinforcement learning, #strong[combinatorial optimization], and AI planning],[Funded by a \$20,000\/year #strong[IVADO research scholarship]],)
  ],
  right-content: [
    Montreal, QC, CA

Sept 2025 – Aug 2027
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 0.8cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[Université de Montréal], Economics - Honours Program
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Research assistant on a project supervised by Prof. Arbour],[Worked in collaboration with the Chief Justice of the Quebec Superior Court #emph[\(#strong[\$5,000 IQRDJ] research grant\) on #strong[public institution spending] modeling]],[Teaching assistant for #emph[ #strong[Microeconomics I] \(ECN-2040\)], a #strong[core] 2nd-year under-graduate course],[#strong[GPA:] 3.825\/4.3],)
  ],
  right-content: [
    Montreal, QC, CA

Sept 2022 – Aug 2025
  ],
)



== Research Projects


#two-col-entry(
  left-content: [
    #link("#")[#strong[Meta-FlowNet]]
  ],
  right-content: [
    Mar 2025 – present
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Mila – Master's Research Project \(2025–2027\)])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Designed a #strong[novel] architecture combining #strong[GFlowNets] with Physics-Informed Neural Networks \(#strong[PINNs]\)],[Modeled the generation of CDF-like #strong[structures] from reward-flow #strong[trajectories] over continuous parameters],[Introduced adaptive sampling and active learning mechanisms to boost #strong[efficiency] in hard regions],[Application: #strong[dynamic portfolio] sequencing, stochastic optimization],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("#")[#strong[Bilevel Pricing with GFlowNet]]
  ],
  right-content: [
    Mar 2025 – present
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Honours Thesis – Université de Montréal \(2024–2025\)])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Using a formulated a bilevel pricing model where consumers solve a knapsack problem to maximize utility],[Used GFlowNets with #strong[Critic] to simulate consumer response and improve leader pricing strategy],[Integrated mixed-integer programming with generative flow dynamics],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("#")[#strong[Transformer-GFlowNet for Sequential Portfolio Optimization]]
  ],
  right-content: [
    June 2024 – present
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Finalist – McGill-FIAM Hackathon 2024])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed a #strong[Transformer-based] model to generate vectors of asset allocations],[Modeled transaction costs, turnover constraints, and #strong[dynamic Sharpe] ratio optimization],[Used #strong[MCMC]-based simulation for sequence interpretability and #strong[XMAP] evaluation],)
  ],
)



== Technical Skills


#one-col-entry(
  content: [#strong[Languages:] Python \(advanced\), LaTeX, Markdown, Bash, C \(basic\), Rust \(beginner\)]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Machine Learning & Optimization Framework:] PyTorch, Lightning AI, HuggingFace]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Models:] Reinforcement Learning \(PPO, A2C\), GFlowNet, PINNs, XGBoost]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Tools & Dev environment:] Git, Conda, Docker, JupyterLab]
)


== Competitions


#two-col-entry(
  left-content: [
    #link("#")[#strong[McGill-FIAM Asset Management Hackathon - Finalist]]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Top 10 out of 66 teams],[Built a #strong[Portfolio Transformer] model that directly outputs allocation actions rather than predictions],[The objective function was the #strong[Sharpe ratio], optimized dynamically with transaction cost constraints],[Presented to a jury of finance professors and industry professionals],)
  ],
  right-content: [
    Montreal

Nov 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("#")[#strong[Polytechnique Montreal Datathon - 3rd Place]]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Designed an AI system to generate #strong[financial reports] and commentary from raw data in 48 hours],[Focused on financial language generation, analytics, and visual presentation of results],[Awarded a #strong[\$500] prize],)
  ],
  right-content: [
    Montreal

Dec 2025
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Brasserie Henri - Birks Hotel], Busboy – Fine Dining
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Delivered high-end service in a fast-paced luxury restaurant environment])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Maintained exceptional client satisfaction during high-pressure shifts],[Developed attention to detail, #strong[communication], and teamwork skills],)
  ],
  right-content: [
    Montreal, QC

Aug 2023 – Dec 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Sabrosa Restaurant], Busboy
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Assisted with front-of-house service in a casual dining setting])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Managed multiple tables and coordinated with kitchen staff under pressure],[Built interpersonal and #strong[multitasking] skills applicable to client-facing roles],)
  ],
  right-content: [
    Montreal, QC

Apr 2023 – Aug 2023
  ],
)



== Languages


#one-col-entry(
  content: [#strong[French:] Native]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[English:] Fluent]
)


== Extracurricular Activities


#one-col-entry(
  content: [- Enjoy strength training and gym #strong[discipline] — consistency builds both body and mindset],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Love working on personal tech projects, especially around AI, optimization, and simulation],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Driven by a long-term goal of launching a #strong[startup] that transforms ideas into real-world impact],
)


