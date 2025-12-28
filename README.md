# Interpreteur_Calculs_OCaml

[![OCaml](
https://img.shields.io/badge/OCaml-EC6813?style=for-the-badge&logo=ocaml&logoColor=white)](#)

Ce projet est une calculatrice interactive écrite en OCaml. Elle permet d'interpréter des expressions mathématiques (tokenization + parsing), puis de les évaluer.

La saisie utilisateur est convertie en liste de tokens par le lexeur, les tokens sont convertis dans un langage formel et un arbre syntaxique, et l'arbre est évalué pour afficher le résultat.

Projet d'apprentissage et d'expérimentation avec OCaml.

<img src="illustration.png" width=500>

## Features 

- Opérations standards `+`, `-`, `*`, `/`.
- Priorité des opérations.
- Parenthèses `(`, `)` et multiplication implicite.

## Lancer le programme

Utiliser le build `dune`.

```sh 
dune build
dune exec ./bin/main.exe
```

Ou bien utiliser le script qui build et clean.
```sh
./compile.sh
```

# Note de développement 

Quelques ressources utiles : 
- https://craftinginterpreters.com 
- https://pages.cs.wisc.edu/~fischer/cs536.s06/course.hold/html/NOTES/4.SYNTAX-DIRECTED-TRANSLATION.html 