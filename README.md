# 🛠️ Comment Installer et Configurer Robot Framework

Ce guide vous explique comment installer Robot Framework, ses bibliothèques clés, et configurer votre environnement de test.

---

## ✨ Étape 1 : Vérifier les versions de Python et Pip

Avant de commencer, assurez-vous que Python et pip sont installés. Exécutez les commandes suivantes :

```bash
python --version
pip --version
```

✅ Assurez-vous que la version de Python est au moins **3.6** et que pip est à jour.

---

## 🐍 Étape 2 : Installer Robot Framework

Installez Robot Framework avec la commande suivante :

```bash
pip install robotframework
```

---

## 🌐 Étape 3 : Installer la bibliothèque Robot Framework Browser

Pour utiliser la bibliothèque Browser, exécutez les commandes suivantes :

1. 📦 Installez le package `robotframework-browser` :

   ```bash
   pip install robotframework-browser
   ```

2. 🚀 Initialisez la bibliothèque Browser avec toutes les dépendances (y compris Chromium) :

   ```bash
   rfbrowser init --with-deps chromium
   ```

---

## 🧹 Étape 4 : Installer Robocop

Pour installer et utiliser **Robocop**, un linter pour Robot Framework, exécutez :

```bash
pip install -U robotframework-robocop
```

---

## 🕷️ Étape 5 : Installer la bibliothèque Selenium

Si vous avez besoin de la bibliothèque Selenium pour l'automatisation web, installez-la avec :

```bash
pip install robotframework-seleniumlibrary
```

---

## 🔍 Étape 6 : Vérifier l'installation

Pour vérifier que toutes les bibliothèques nécessaires sont installées, exécutez :

```bash
pip freeze
```

✅ Vérifiez que les packages requis sont bien listés.

---

## 💻 Étape 7 : Installer l'extension VS Code

Pour éditer et exécuter vos tests Robot Framework, installez l'extension **Robot Code** dans Visual Studio Code :

1. 🖥️ Ouvrez Visual Studio Code.
2. 📂 Allez dans le **Marketplace des extensions** (Ctrl+Shift+X).
3. 🔍 Recherchez `Robot Code (Daniel Biehl)` et cliquez sur **Installer**.

---

## 🛠️ Étape 8 : Configurer ChromeDriver

### Pourquoi avez-vous besoin de ChromeDriver ? 🤔

ChromeDriver est nécessaire pour exécuter des tests dans le navigateur Chrome. Vous devez vous assurer que la version de ChromeDriver correspond à celle de votre navigateur Google Chrome.

1. 🌐 Vérifiez votre version de Chrome :
   - Ouvrez Chrome.
   - Allez dans **Paramètres > À propos de Chrome** pour trouver la version.

2. 📥 Allez sur la page [ChromeDriver Downloads](https://chromedriver.chromium.org/downloads).

3. 🗂️ Utilisez le tableau de compatibilité pour identifier la version correcte de ChromeDriver pour votre version de Chrome.

4. 📦 Téléchargez et extrayez le ChromeDriver correspondant.

5. 🛤️ Ajoutez l'exécutable ChromeDriver au **PATH** de votre système.

---

## 📁 Étape 9 : Structure des dossiers pour Robot Framework

Pour organiser votre projet Robot Framework, utilisez la structure suivante :

```
projet-racine/
│
├── tests/
│   ├── suite_de_tests_1.robot
│   ├── suite_de_tests_2.robot
│
├── ressources/
│   ├── keywords/
│   │   ├── mots_clés_personnalisés.robot
│   │
│   ├── libraries/
│   │   ├── bibliothèque_personnalisée.py
│   │
│   ├── variables/
│       ├── variables.robot
│
├── output/
│   ├── log.html
│   ├── report.html
│   ├── output.xml
│
└── README.md
```

### 🗂️ Description des dossiers

1. **`tests/`** : Contient tous vos cas de test Robot Framework (fichiers `.robot`).
2. **`ressources/`** : Contient des composants réutilisables :
   - **`keywords/`** : Mots-clés personnalisés définis dans des fichiers `.robot`.
   - **`libraries/`** : Bibliothèques Python personnalisées.
   - **`variables/`** : Variables centralisées pour vos tests.
3. **`output/`** : Stocke les résultats d'exécution des tests comme les journaux, rapports et fichiers de sortie.

---

## ✅ Notes finales

Après avoir suivi ces étapes, votre environnement devrait être prêt pour exécuter des tests Robot Framework. 🎉

Pour tester votre configuration, créez un fichier de test simple dans le dossier `tests/` et exécutez-le avec la commande :

```bash
robot tests/suite_de_tests_1.robot
```

🚀 Let's GO! 🎉
