{
  description = "Your Name — Curriculum Vitae";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};

          texEnv = pkgs.texliveSmall.withPackages (ps: with ps; [
            latexmk
            titlesec
            enumitem
            babel
            ec
            cm-super
            hyperref
            xcolor
            geometry
            parskip
          ]);
        in
        {
          default = pkgs.stdenvNoCC.mkDerivation {
            pname = "your-name-cv";
            version = "1.0.0";

            src = ./src;

            nativeBuildInputs = [
              texEnv
              pkgs.typst
              pkgs.poppler-utils
              pkgs.imagemagick
            ];

            buildPhase = ''
              export TEXMFHOME="$TMPDIR/texmf"

              # Build LaTeX CV
              latexmk -pdf -interaction=nonstopmode cv.tex

              # Build Typst CV
              typst compile main.typ your-name-cv-typst.pdf
            '';

            installPhase = ''
              mkdir -p $out/site

              cp cv.pdf $out/site/your-name-cv.pdf
              cp your-name-cv-typst.pdf $out/site/your-name-cv-typst.pdf
              cp ${./index.html} $out/site/index.html

              # Generate social preview image from the LaTeX CV
              pdftoppm -f 1 -l 1 -r 300 -png cv.pdf preview
              convert preview-1.png -resize 1200x -crop 1200x630+0+0 +repage \
                \( -size 1200x200 gradient:none-white \) \
                -gravity south -composite \
                $out/site/preview.webp
            '';
          };
        }
      );
    };
}
