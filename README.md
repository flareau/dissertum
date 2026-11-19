# dissertum

`dissertum.cls` est une classe LaTeX pour les mémoires et les thèses de l'Université de Montréal. Elle s'appuie sur le [Guide des mémoires et des thèses](https://esp.umontreal.ca/fileadmin/esp/documents/Cheminement/GuidePresentationMemoiresTheses.pdf) et respecte les exigences de forme de l'annexe C, résumées dans `exigences.md`.

## Démarrer

1. Téléchargez `dissertum.cls`, `exemple.tex` et `biblio.bib` dans un même dossier.
2. Modifiez les métadonnées et le contenu de `exemple.tex`.
3. Compilez le fichier d'exemple avec une installation LaTeX qui comprend notamment `babel` (français et anglais), `biblatex`, `biblatex-apa`, `biber`, `csquotes`, `setspace`, `parskip`, `etoolbox`, `xcolor`, `fancyhdr`, `geometry`, `booktabs`, `placeins`, `acronym`, `listings` et `lipsum`:

```sh
pdflatex exemple.tex
biber exemple
pdflatex exemple.tex
pdflatex exemple.tex
```

Le résultat est `exemple.pdf`. Les passes LaTeX supplémentaires mettent à jour les citations et les numéros de page de la table des matières.

## Adapter le modèle

Choisissez `\documentclass[ma]{dissertum}` pour un mémoire ou `\documentclass[phd]{dissertum}` pour une thèse. L'option `ma` est utilisée par défaut.

Les commandes `\titre`, `\auteur`, `\date`, `\faculte`, `\departement` et `\programme` définissent la page de titre et sont toutes obligatoires. Lors de la création de `\pagetitre`, la classe signale dans le journal de compilation tout renseignement manquant. Si `\date` est omise, le mois et l'année de compilation sont utilisés comme valeurs de secours. Ajoutez ensuite les membres du jury avec les commandes correspondant à leur rôle:

| Commande | Rôle affiché | Mémoire | Thèse |
| --- | --- | --- | --- |
| `\president{Nom}` ou `\presidente{Nom}` | Président-rapporteur ou Présidente-rapporteuse | Obligatoire | Obligatoire |
| `\directeur{Nom}` ou `\directrice{Nom}` | Directeur ou Directrice de recherche | Obligatoire | Obligatoire |
| `\codirecteur{Nom}` ou `\codirectrice{Nom}` | Codirecteur ou Codirectrice de recherche | Facultatif | Facultatif |
| `\codirecteurdeux{Nom}` ou `\codirectricedeux{Nom}` | Codirecteur ou Codirectrice de recherche (deuxième emplacement) | Facultatif | Facultatif |
| `\membre{Nom}` | Membre du jury | Obligatoire | Obligatoire |
| `\membredeux{Nom}` | Membre du jury (deuxième emplacement) | Facultatif | Facultatif |
| `\examinateur{Nom}` ou `\examinatrice{Nom}` | Examinateur ou Examinatrice externe | Interdit | Obligatoire |

Seules les personnes déclarées sont affichées sur la page du jury. Lors de la création de `\pagejury`, la classe signale dans le journal de compilation tout rôle obligatoire manquant ou tout rôle interdit déclaré.

`\pagetitre` et `\pagejury` produisent les pages liminaires; `\matieres` produit la table des matières et les listes. L'exemple montre aussi les résumés, les chapitres, la bibliographie et les annexes.

## Citations et bibliographie

La classe utilise le style APA 7 fourni par `biblatex-apa`. Déclarez le fichier bibliographique dans le préambule avec `\addbibresource{biblio.bib}`, utilisez `\parencite` pour une citation entre parenthèses et `\textcite` pour une citation intégrée à la phrase, puis insérez la bibliographie avec `\printbibliography[heading=bibintoc]`.

Pour conserver les anciennes commandes `\citep` et `\citet` d'un document fondé sur `natbib`, remplacez la ligne 73 de `dissertum.cls`:

```latex
\RequirePackage[backend=biber,style=apa]{biblatex}
```

par la commande commentée à la ligne 76:

```latex
\RequirePackage[backend=biber,style=apa,natbib=true]{biblatex}
```

Il n'est pas nécessaire de charger séparément le paquet `natbib`.

## Alternatives

Le Département de mathématiques et de statistique a également créé un gabarit, disponible [ici](https://dms.umontreal.ca/wiki/index.php/LaTeX#M.C3.A9moires.2C_th.C3.A8ses_et_travaux), mais il n'est pas tout à fait adapté aux sciences humaines.

Il existe également un modèle Word officiel, disponible [ici](https://boite-outils.bib.umontreal.ca/ld.php?content_id=36097979).
