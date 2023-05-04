{
  description = "Project template";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ ];

        pkgs = import nixpkgs { inherit system overlays; };
      in
      rec {
        # packages.example = example;
        # defaultPackage = example;

        # apps.example = flake-utils.lib.mkApp {
        #   drv = packages.example;
        # };


        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
          ];
          buildInputs = with pkgs; [
          ] ++ pkgs.lib.optionals (pkgs.stdenv.isDarwin) (with pkgs.darwin.apple_sdk.frameworks; [
          ]);
        };
      });
}
