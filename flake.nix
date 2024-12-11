{
  description = "Entorno de desarrollo para Python y Jupyter.";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05"; # Usa una versión específica
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            # Agrega tinypkgs como dependencias externas
            (pkgs.fetchFromGitLab {
              owner = "inria";
              repo = "nix-tutorial/packages-repository";
              rev = "8e43243635cd8f28c7213205b08c12f2ca2ac74d";
              sha256 = "09l2w3m1z0308zc476ci0bsz5amm536hj1n9xzpwcjm59jxkqpqa";
            })

            # Python y paquetes
            (pkgs.python3.withPackages (
              ps: with ps; [
                jupyter
                ipython

                # Dependencias
                pandas
                numpy
                matplotlib
                scikit-learn
                joblib
                requests
                beautifulsoup4
                seaborn
                scipy
                joblib
              ]
            ))
          ];

          # Hook para entrar a Jupyter automáticamente
          shellHook = ''
            echo "Bienvenido al entorno de desarrollo."
            echo "Si necesitas iniciar Jupyter Notebook, ejecuta:"
            echo -e "\033[1;32mjupyter notebook --no-browser --ip=0.0.0.0\033[0m"
          '';
        };
      }
    );
}
