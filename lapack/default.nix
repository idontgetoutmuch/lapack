{ mkDerivation, base, blas-ffi, blaze-html, boxes, ChasingBottoms
, comfort-array, data-ref, deepseq, fetchdarcs, fixed-length
, guarded-allocation, gfortran, hyper, lapack-ffi, lazyio, libiconv, liblapack, monoid-transformer
, netlib-ffi, non-empty, QuickCheck, quickcheck-transformer, random
, semigroups, stdenv, text, tfp, transformers, unique-logic-tf
, utility-ht
}:
mkDerivation {
  pname = "lapack";
  version = "0.3.1";
  src = fetchdarcs{ url = http://hub.darcs.net/thielema/lapack/; sha256 = "0i24b1mis2czcyklkw08zb1kk72dp7bkicynql8icf19dzwz0mq1"; };
  # src = ./.;
  libraryHaskellDepends = [
    base blas-ffi blaze-html boxes comfort-array deepseq fixed-length
    guarded-allocation hyper lapack-ffi lazyio netlib-ffi non-empty
    semigroups text tfp transformers utility-ht
  ];
  librarySystemDepends = [ libiconv liblapack gfortran  ];
  libraryPkgconfigDepends = [ libiconv liblapack gfortran  ];
  testPkgconfigDepends = [ libiconv liblapack gfortran  ];
  executablePkgconfigDepends = [ libiconv liblapack gfortran  ];
  testHaskellDepends = [
    base ChasingBottoms comfort-array data-ref monoid-transformer
    netlib-ffi non-empty QuickCheck quickcheck-transformer random
    semigroups tfp transformers unique-logic-tf utility-ht
  ];
  testSystemDepends = [ libiconv liblapack gfortran  ];
  homepage = "http://hub.darcs.net/thielema/lapack/";
  description = "Numerical Linear Algebra using LAPACK";
  license = stdenv.lib.licenses.bsd3;
}
