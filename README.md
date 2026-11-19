# dissertum

`dissertum.cls` est une classe LaTeX pour les mémoires et les thèses de l'Université de Montréal. Elle s'appuie sur le [Guide des mémoires et des thèses](https://esp.umontreal.ca/fileadmin/esp/documents/Cheminement/GuidePresentationMemoiresTheses.pdf).

## Démarrer

1. Téléchargez `dissertum.cls`, `exemple.tex`, `biblio.bib` et `acl-qc.bst` dans un même dossier.
2. Modifiez les renseignements personnels et le contenu de `exemple.tex`.
3. Compilez le fichier d'exemple avec une installation LaTeX qui comprend notamment `babel` (français et anglais), `natbib`, `setspace`, `fancyhdr`, `geometry`, `booktabs`, `placeins`, `acronym`, `listings` et `lipsum`:

```sh
pdflatex exemple.tex
bibtex exemple
pdflatex exemple.tex
pdflatex exemple.tex
```

Le résultat est `exemple.pdf`. Les passes LaTeX supplémentaires mettent à jour les citations et les numéros de page de la table des matières.

## Adapter le modèle

Choisissez `\documentclass[ma]{dissertum}` pour un mémoire ou `\documentclass[phd]{dissertum}` pour une thèse. L'option `ma` est utilisée par défaut.

Les commandes `\titre`, `\auteur`, `\date`, `\faculte`, `\departement` et `\programme` définissent la page de titre. Ajoutez ensuite les membres du jury avec les commandes illustrées dans `exemple.tex`. `\pagetitre` et `\pagejury` produisent les pages liminaires; `\matieres` produit la table des matières et les listes. L'exemple montre aussi les résumés, les chapitres, la bibliographie et les annexes.

Pour employer `apalike-qc.bst`, placez également ce fichier dans le dossier et remplacez `\bibliographystyle{acl-qc}` par `\bibliographystyle{apalike-qc}`.

Le Département de mathématiques et de statistique a également créé un gabarit, disponible [ici](https://dms.umontreal.ca/wiki/index.php/LaTeX#M.C3.A9moires.2C_th.C3.A8ses_et_travaux), mais il n'est pas tout à fait adapté aux sciences humaines.
