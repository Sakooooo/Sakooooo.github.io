{ pkgs ? import <nixpkgs> {}
}:
pkgs.mkShell {
  name="dev-env";
  buildInputs = [
    pkgs.nodejs
    pkgs.yarn
  ];
}
