{
  description = "uhh";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      inherit (builtins) attrValues;
      eachSystem = f:
        lib.genAttrs [ "x86_64-linux" ]
        (system: f nixpkgs.legacyPackages.${system});
    in {

      devShells = eachSystem (pkgs: {
        default = pkgs.mkShell {
          packages = attrValues {
            inherit (pkgs) pnpm;
            inherit (pkgs.nodePackages_latest) "@astrojs/language-server";
          };
        };
      });

    };
}

