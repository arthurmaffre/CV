## 📄 Aperçu du CV

[![Voir le CV](rendercv_output/Arthur_Maffre_CV_1.png)](rendercv_output/Arthur_Maffre_CV.pdf)

[![Voir le CV](rendercv_output/Arthur_Maffre_CV_2.png)](rendercv_output/Arthur_Maffre_CV.pdf)

# ⚙️ CV Management

🚀 Voir le CV en PDF :
- 🇬🇧 [Télécharger le CV (anglais)](rendercv_output/Arthur_Maffre_CV.pdf)
- 🇫🇷 [Télécharger le CV (français)](rendercv_output/Arthur_Maffre_FR_CV.pdf)

---

Ce dépôt contient les fichiers YAML permettant de générer automatiquement mes CV (versions **française** et **anglaise**) avec le moteur typographique **RenderCV**.

---

## 🐍 Charger l’environnement Conda

Avant toute commande, active l’environnement :

```bash
conda activate CV
```

Sinon, tu peux le créer avec :

```bash
conda env create -f environnement.yaml
conda activate CV
```

---

## 🔍 Prévisualiser un CV

Pour générer une version PDF de ton CV :

```bash
rendercv render "Arthur_Maffre_CV.yaml"
```

Cela créera un dossier `rendercv_output/` contenant :

- `Arthur_Maffre_CV.pdf` – CV en format PDF
- `Arthur_Maffre_CV.typ` – code source Typst
- `Arthur_Maffre_CV.md` – version Markdown
- `Arthur_Maffre_CV.html` – version HTML (compatible Grammarly)
- `Arthur_Maffre_CV_1.png`, etc. – pages du CV en images PNG

---

## ✏️ Modifier le contenu

1. Ouvre `Arthur_Maffre_CV.yaml` ou `Arthur_Maffre_FR_CV.yaml` avec ton éditeur (ex. VS Code).
2. Modifie les sections YAML (`Points forts`, `Formation`, `Projets de recherche`, etc.).
3. Sauvegarde le fichier.

---

## 🚀 Rendu automatique (mode live)

Utilise l’option `--watch` pour que `RenderCV` régénère ton CV à chaque modification :

```bash
rendercv render --watch "Arthur_Maffre_CV.yaml"
```

Ou :

```bash
rendercv render --watch "Arthur_Maffre_FR_CV.yaml"
```

---

## 📂 Structure recommandée du projet

```
CV/
├── classic/
├── markdown/
├── rendercv_output/
│   ├── Arthur_Maffre_CV.pdf
│   ├── Arthur_Maffre_(FR)_CV.pdf
│   └── ...
├── Arthur_Maffre_CV.yaml
├── Arthur_Maffre_FR_CV.yaml
├── environnement.yaml
└── README.md
```

---

**🧠 Astuce :** Tu peux utiliser la version HTML (`.html`) pour relire ton CV
