let
  sources = import ./nix/sources.nix { };
  pkgs = import sources.nixpkgs { };
in

pkgs.testers.runNixOSTest ./test.nix
