
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Arthur Maffre"
#let locale-catalog-page-numbering-style = context { "Arthur Maffre - Page " + str(here().page()) + " sur " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Dernière mise à jour en juill. 2026"
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

= Arthur Maffre

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Montréal, QC],
  [#box(original-link("mailto:maffrearthur@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)maffrearthur\@gmail.com])],
  [#box(original-link("tel:+1-514-501-7206")[#fa-icon("phone", size: 0.9em) #h(0.05cm)\(514\) 501-7206])],
  [#box(original-link("https://linkedin.com/in/arthur-maffre")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)arthur-maffre])],
  [#box(original-link("https://github.com/arthurmaffre")[#fa-icon("github", size: 0.9em) #h(0.05cm)arthurmaffre])],
)
#connections(connections-list)



== Points Forts


#one-col-entry(
  content: [- Conception de systèmes intelligents à impact concret],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Finaliste au #strong[Hackathon McGill-FIAM] | 3e place au #strong[Datathon de Polytechnique]],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Faire le pont entre la #strong[théorie de l'IA] et les applications concrètes],
)


== À Propos De Moi


#one-col-entry(
  content: [Étudiant à la maîtrise à #strong[Mila] \(Université de Montréal\), je conçois des systèmes intelligents qui repoussent les #strong[frontières de l'optimisation] et de la prise de décision. J'explore actuellement des architectures fondées sur les #strong[GFlowNet].]
)


== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 0.8cm,
  left-content: [#strong[M.Sc.]],
  middle-content: [
    #strong[Université de Montréal - Mila], Informatique
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Recherche sur les #strong[GFlowNet]],[Axée sur l'apprentissage par renforcement, l'#strong[optimisation combinatoire] et la planification en IA],)
  ],
  right-content: [
    Montréal, QC, CA

sept. 2025 – août 2027
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 0.8cm,
  left-content: [#strong[B.Sc.]],
  middle-content: [
    #strong[Université de Montréal], Sciences économiques - Programme Honours
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Assistant de recherche sur un projet supervisé par le Prof. Arbour],[Travail en collaboration avec la juge en chef de la Cour supérieure du Québec #emph[\(#strong[bourse de recherche IQRDJ de 5 000 \$]\) sur la modélisation des #strong[dépenses des institutions publiques]]],[Auxiliaire d'enseignement pour #emph[ #strong[Microéconomie I] \(ECN-2040\)], un cours #strong[fondamental] de 2e année au premier cycle#sym.ast.basic#h(0pt, weak: true) ],[#strong[Moyenne :] 3,825\/4,3],)
  ],
  right-content: [
    Montréal, QC, CA

sept. 2022 – août 2025
  ],
)



== Projets De Recherche


#two-col-entry(
  left-content: [
    #link("https://www.researchgate.net/publication/392064095_ECN_6338_Knapsack_GFlowNet")[#strong[Tarification bilatérale avec GFlowNet]]
  ],
  right-content: [
    mars 2025 – sept. 2025
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Mémoire Honours – Université de Montréal \(2024–2025\)])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Formulation d'un modèle de tarification bilatérale où les consommateurs résolvent un problème de sac à dos pour maximiser leur utilité],[Utilisation de GFlowNets avec #strong[Critic] pour simuler la réponse des consommateurs et améliorer la stratégie de tarification du meneur],[Intégration de la programmation en nombres entiers mixtes avec la dynamique des flux génératifs],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://github.com/arthurmaffre/RMBP_finance")[#strong[Transformer-GFlowNet pour l'optimisation séquentielle de portefeuille]]
  ],
  right-content: [
    juin 2024 – présent
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Finaliste – Hackathon McGill-FIAM 2024])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Développement d'un modèle fondé sur les #strong[Transformers] pour générer des vecteurs d'allocation d'actifs],[Modélisation des coûts de transaction, des contraintes de rotation et de l'optimisation du #strong[ratio de Sharpe dynamique]],)
  ],
)



== Compétences Techniques


#one-col-entry(
  content: [#strong[Langages:] Python \(avancé\), LaTeX, Markdown, Bash, C \(notions\), Rust \(débutant\)]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Cadres d'apprentissage automatique et d'optimisation:] PyTorch, Lightning AI, HuggingFace]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Modèles:] Apprentissage par renforcement \(PPO, A2C\), GFlowNet, PINNs, XGBoost]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Outils et environnement de développement:] Git, Conda, Docker, JupyterLab]
)


== Concours


#two-col-entry(
  left-content: [
    #link("#")[#strong[Hackathon de gestion d'actifs McGill-FIAM - Finaliste]]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Top 10 sur 66 équipes],[Conception d'un modèle #strong[Portfolio Transformer] qui produit directement des actions d'allocation plutôt que des prédictions],[La fonction objectif était le #strong[ratio de Sharpe], optimisé dynamiquement sous contraintes de coûts de transaction],[Présentation devant un jury de professeurs de finance et de professionnels de l'industrie],)
  ],
  right-content: [
    Montréal

nov. 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("#")[#strong[Datathon de Polytechnique Montréal - 3e place]]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Conception d'un système d'IA pour générer des #strong[rapports financiers] et des commentaires à partir de données brutes],[Axé sur la génération de langage financier, l'analytique et la présentation visuelle des résultats],[Prix de #strong[500 \$] remporté],)
  ],
  right-content: [
    Montréal

déc. 2024
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Brasserie Henri - Hôtel Birks], Aide-serveur – Gastronomie
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Service haut de gamme dans un environnement de restaurant de luxe au rythme soutenu])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Maintien d'une satisfaction client exceptionnelle lors de services sous pression],[Développement du souci du détail, de la #strong[communication] et de l'esprit d'équipe],)
  ],
  right-content: [
    Montréal, QC

août 2023 – déc. 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Restaurant Sabrosa], Aide-serveur
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Soutien au service en salle dans un cadre de restauration décontractée])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Gestion de plusieurs tables et coordination avec le personnel de cuisine sous pression],[Développement de compétences interpersonnelles et de #strong[polyvalence] applicables aux rôles en contact avec la clientèle],)
  ],
  right-content: [
    Montréal, QC

avr. 2023 – août 2023
  ],
)



== Langues


#one-col-entry(
  content: [#strong[Français:] Langue maternelle]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Anglais:] Courant]
)


== Activites Parascolaires


#one-col-entry(
  content: [- Passionné de musculation et de #strong[discipline] en salle — la constance construit le corps et l'état d'esprit],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- J'aime travailler sur des projets techniques personnels, en particulier autour de l'IA, de l'optimisation et de la simulation],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Passionné par l'interaction humaine, j'accorde de l'importance à l'écoute active et à la construction de relations solides au travail.],
)


