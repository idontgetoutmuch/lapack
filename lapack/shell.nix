{ pkgs ? import <nixpkgs> {}, doBenchmark ? false }:

let

my-blas-ffi = pkgs.haskellPackages.callPackage ../blas-ffi/default.nix {};
my-lapack   = pkgs.haskellPackages.callPackage ./default.nix { blas-ffi = my-blas-ffi; gfortran = pkgs.gfortran; };

haskellDeps = ps: with ps; [
  my-lapack
];

in

  pkgs.stdenv.mkDerivation {
  name = "env";
  buildInputs = [
    (pkgs.haskellPackages.ghcWithPackages haskellDeps)
  ];
}

