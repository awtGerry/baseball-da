# Alternativa para no activar flakes

{
  pkgs ? import <nixpkgs> { },
  tinypkgs ? import (fetchTarball {
    url = "https://gitlab.inria.fr/nix-tutorial/packages-repository/-/archive/master/packages-repository-8e43243635cd8f28c7213205b08c12f2ca2ac74d.tar.gz";
    sha256 = "sha256:09l2w3m1z0308zc476ci0bsz5amm536hj1n9xzpwcjm59jxkqpqa";
  }) { },
}:

with tinypkgs;
with pkgs;

mkShell {
  buildInputs = [
    glow # Para rapido syntax highlight en la terminal con archivos md
    chord

    # Define python y agrega paquetes
    (python3.withPackages (
      ps:
      with ps;
      with python3Packages;
      [
        jupyter
        ipython

        # Dependencias
        pandas
        numpy
        matplotlib
        scikit-learn
        joblib
      ]
    ))
  ];

  # Entrar a jupyter notebook automaticamente.
  shellHook = ''
    ;
        echo -e "\033[1;33mESP32 Development Environment\033[0m"
        echo -e "\033[1;31mImportante:\033[0m Programas tanto para los documentos como para jupyternb:"
        echo -e "\033[1;31mPara correr archivos markdown:\033[0m"
        echo -e "\033[1;32mglow <file.md>\033[0m"

        echo -e "\033[1;31mPara abrir notebook:\033[0m"
        echo -e "\033[1;32mjupyter notebook\033[0m"
  '';
}
