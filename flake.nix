{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    cells-lab.url = "github:GTrunSec/cells-lab";

    yants.follows = "cells-lab/yants";

    std.url = "github:divnix/std";
    data-merge.follows = "cells-lab/data-merge";
  };

  inputs = {
    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";

    crane.url = "github:ipetkov/crane";
    crane.inputs.nixpkgs.follows = "nixpkgs";

    nix-filter.url = "github:/numtide/nix-filter";
    nix-filter.inputs.nixpkgs.follows = "nixpkgs";

    julia2nix.url = "github:JuliaCN/julia2nix";
  };

  outputs = {std, ...} @ inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./cells;
      organelles = [
        (std.installables "packages")

        (std.functions "devshellProfiles")
        (std.devshells "devshells")

        (std.runnables "entrypoints")

        (std.functions "library")

        (std.functions "packages")

        (std.functions "overlays")
      ];
    } {
      devShells = inputs.std.harvest inputs.self ["main" "devshells"];
    };
}
