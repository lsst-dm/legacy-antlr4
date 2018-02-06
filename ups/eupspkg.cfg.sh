TAP_PACKAGE=1

PKGDIR=$PWD
BUILDDIR=$PWD/../antlr4-build

config()
{
    rm -rf ${BUILDDIR}
    mkdir ${BUILDDIR}
    cd ${BUILDDIR}
    cmake ${PKGDIR}/runtime/Cpp/ -DCMAKE_INSTALL_PREFIX=${PREFIX}
}

build()
{
    cd ${BUILDDIR}
    default_build
}

install()
{
    cd ${BUILDDIR}
    make -j$NJOBS install
    cd ${PKGDIR}
    install_ups
}
