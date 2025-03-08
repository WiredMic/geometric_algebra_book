{
  description = "Flake to compile latex documents";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # LaTeX
            texlive.combined.scheme-full

            # LaTeX LSP and formatter
            texlab
            # digestif
            tex-fmt

            # PDF reader
            okular

            # Make
            gnumake

            # Code Presentaion with Minted
            (pkgs.python3.withPackages (python-pkgs:
              with python-pkgs;
              [
                # select Python packages here
                pygments
              ]))
          ];

          # to get the time correct
          SOURCE_DATE_EPOCH = self.sourceInfo.lastModified;
          shellHook = "";
        };

      });
}

# https://docs.platformio.org/en/latest/integration/ide/emacs.html
