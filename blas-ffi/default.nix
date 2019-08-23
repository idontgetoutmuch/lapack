{ mkDerivation, base, fetchdarcs, openblasCompat, netlib-ffi, stdenv }:
mkDerivation {
  pname = "blas-ffi";
  version = "0.1";
  src = fetchdarcs { url = http://hub.darcs.net/thielema/blas-ffi; sha256 = "0fc95srbpyy7hh3yp5sxgmzbi3da876qcj042crgm6dkr4w11s51"; };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base netlib-ffi ];
  libraryPkgconfigDepends = [ openblasCompat ];
  homepage = "http://hub.darcs.net/thielema/blas-ffi/";
  description = "Auto-generated interface to Fortran BLAS";
  license = stdenv.lib.licenses.bsd3;
}
