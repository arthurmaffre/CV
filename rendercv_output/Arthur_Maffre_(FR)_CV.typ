
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Arthur Maffre (FR)"
#let locale-catalog-page-numbering-style = context { "Arthur Maffre (FR) - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Avr 2025"
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



== Points Forts


#one-col-entry(
  content: [- Conception de systèmes intelligents pour la #strong[tarification dynamique] et la #strong[génération de portefeuilles]],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Recherche financée par #strong[IVADO] à #strong[Mila] \(#strong[20 000 \$\/an]\)],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Finaliste au #strong[Hackathon McGill-FIAM] | 3e place au #strong[Datathon de Polytechnique]],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Pont entre la #strong[théorie de l'IA] et l’impact concret — de #strong[GFlowNet] à la modélisation des dépenses publiques],
)


== À Propos


#one-col-entry(
  content: [Étudiant à la maîtrise à #strong[Mila] \(Université de Montréal\), je conçois des systèmes intelligents qui repoussent les limites de l’optimisation et de la prise de décision. J’explore actuellement des architectures basées sur les #strong[GFlowNets] pour la #strong[tarification dynamique] et la #strong[génération de portefeuilles]. Mon objectif : transformer des idées complexes en modèles concrets, utiles, et performants.]
)


== Formation


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 0.8cm,
  left-content: [#strong[M.Sc.]],
  middle-content: [
    #strong[Université de Montréal – Mila], Informatique
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Directrice de recherche : Prof. Margarida Carvalho])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Recherche sur l’optimisation via #strong[GFlowNet] pour la tarification dynamique et la génération de portefeuilles],[Focalisation sur l’apprentissage par renforcement, l’optimisation combinatoire et la planification en IA],[Financé par une bourse de recherche #strong[IVADO] de #strong[20 000 \$\/an]],)
  ],
  right-content: [
    Montréal, QC, Canada

Sep 2025 – Aoû 2027
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 0.8cm,
  left-content: [#strong[B.Sc.]],
  middle-content: [
    #strong[Université de Montréal], Économie – Programme Honor
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Assistant de recherche sur un projet supervisé par le professeur Arbour],[Collaboration avec la juge en chef de la Cour supérieure du Québec #emph[\(#strong[bourse IQRDJ] de 5 000 \$ pour la modélisation des dépenses publiques\)]],[Auxiliaire d’enseignement pour #emph[Microéconomie I \(ECN-2040\)], cours obligatoire de 2e année],[#strong[Moyenne cumulative :] 3.825\/4.3],)
  ],
  right-content: [
    Montréal, QC, Canada

Sep 2022 – Aoû 2025
  ],
)



== Projets De Recherche



#one-col-entry(
  content: [
    #link("#")[#strong[Meta-FlowNet]]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Projet de maîtrise à Mila \(2025–2027\)])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Conception d’une architecture originale combinant #strong[GFlowNets] et #strong[réseaux neuronaux informés par la physique \(PINNs\)]],[Modélisation de structures de type #strong[CDF] à partir de trajectoires de flux sur des paramètres continus],[Introduction de mécanismes d’échantillonnage adaptatif et d’apprentissage actif pour améliorer la couverture des zones complexes],[Application : #strong[génération de portefeuilles dynamiques], optimisation stochastique],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #link("#")[#strong[Tarification bi-niveau avec GFlowNet]]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Mémoire Honor – Université de Montréal \(2024–2025\)])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Modélisation d’un problème de tarification où les consommateurs résolvent un #strong[sac à dos] pour maximiser leur utilité],[Simulation de la réponse des consommateurs via #strong[GFlowNet avec Critique], pour affiner la stratégie du leader],[Intégration de la programmation mixte en nombres entiers avec une dynamique de flux génératif],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #link("#")[#strong[GFlowNet-Transformer pour l’optimisation séquentielle de portefeuille]]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Finaliste – Hackathon McGill-FIAM 2024])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Développement d’un modèle #strong[Transformer-GFlowNet] générant des séquences d’allocations d’actifs],[Modélisation des #strong[coûts de transaction], contraintes de rotation et optimisation du #strong[Sharpe ratio dynamique]],[Simulation #strong[MCMC] pour interprétation des séquences et évaluation via #strong[XMAP]],)
  ],
)



== Compétitions


#two-col-entry(
  left-content: [
    #link("#")[#strong[Hackathon McGill-FIAM – Finaliste]]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Top 10 sur 66 équipes],[Conception d’un #strong[Portfolio Transformer] générant directement des décisions d’allocation],[Optimisation du #strong[Sharpe ratio] sous contraintes de coût et rotation],[Présentation devant un jury de professeurs en finance et professionnels du secteur],)
  ],
  right-content: [
    Montréal

Novembre 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("#")[#strong[Datathon Polytechnique Montréal – 3e place]]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Développement en 48h d’un système IA générant des #strong[rapports financiers] et commentaires],[Accent mis sur le langage financier, l’analyse de données et la visualisation],[#strong[Prix reçu : 500 \$]],)
  ],
  right-content: [
    Montréal

Décembre 2024
  ],
)



== Expériences Professionnelles


#two-col-entry(
  left-content: [
    #strong[Brasserie Henri – Hôtel Birks], Commis de salle – Gastronomie
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Maintien d’un service client haut de gamme dans un environnement de luxe exigeant],[Développement de compétences en communication, rigueur et travail d’équipe],)
  ],
  right-content: [
    Montréal, QC

Aoû 2023 – Déc 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Restaurant Sabrosa], Commis de salle
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Gestion simultanée de plusieurs tables avec coordination cuisine-salle],[Développement de réflexes en situation de stress et de relation client],)
  ],
  right-content: [
    Montréal, QC

Avr 2023 – Aoû 2023
  ],
)



== Compétences Techniques


#one-col-entry(
  content: [#strong[Langages:] Python \(avancé\), LaTeX, Markdown, Bash, C \(bases\), Rust \(débutant\)]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Cadres ML et Optimisation:] PyTorch, Lightning AI, HuggingFace]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Modèles:] Apprentissage par renforcement \(PPO, A2C\), GFlowNet, PINNs, XGBoost]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Environnement de développement:] Git, Conda, Docker, JupyterLab]
)


== Langues


#one-col-entry(
  content: [#strong[Français:] Langue maternelle]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Anglais:] Courant]
)


== Activités Extra-académiques


#one-col-entry(
  content: [- Passionné de musculation — la discipline forge aussi bien le corps que l’esprit],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Création de projets personnels en IA, optimisation et simulation],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Ambition à long terme : lancer une #strong[startup] à fort impact technologique],
)


