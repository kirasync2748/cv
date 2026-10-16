# Curriculum Vitae

A personal CV built with **Typst and LaTeX**, packaged with **Nix**, and deployed to **GitHub Pages**.

## Getting Started

Clone this repository and create your own GitHub repository to host your personalized CV.

```
git clone https://github.com/kirasync2748/cv.git
cd cv
```

## Customize Your CV

Replace the sample information with your own details, including your name, contact information, education, work experience, projects, and skills.

Customize the Typst and LaTeX templates as needed to make the CV your own.

## Build

Build the project using Nix:

```
nix build
```

The generated files will appear in `result/site/`, containing:

- `index.html` — landing page
- `your-name-cv.pdf` — LaTeX version
- `your-name-cv-typst.pdf` — Typst version
- `preview.webp` — social preview image

## Create Your Own Repository

Create a new, empty repository on your GitHub account. Then, update the Git remote to point to your new repository:

```
git remote remove origin
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
```

Replace `YOUR-USERNAME` with your GitHub username and `YOUR-REPO` with your new repository name.

## Push Your Changes

Commit your customized CV and push it to your GitHub repository:

```
git add .
git commit -m "Add my personal CV"
git branch -M main
git push -u origin main
```

## Deploy to GitHub Pages

To publish your CV online, configure GitHub Pages for your repository and set up the deployment workflow if one is not already provided. Follow the repository's deployment configuration and GitHub Pages settings to publish your landing page and make your CV available online.

Once deployed, you can share your CV website and PDF versions with anyone.

## Requirements

- [Nix](<https://nixos.org/download/>) to build the project
- [Git](<https://git-scm.com/>) to clone the repository and push your changes
- A [GitHub](<https://github.com/>) account to host your repository and deploy your CV