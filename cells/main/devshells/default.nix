{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs std;
in
  l.mapAttrs (_: std.std.lib.mkShell) {
    default = {lib, ...}: {
      name = "jlrs Playrground";

      std.docs.enable = lib.mkForce true;

      imports = [
        inputs.cells-lab.main.devshellProfiles.default
      ];
    };
  }
