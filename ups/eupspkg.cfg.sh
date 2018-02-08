TAP_PACKAGE=1

PKGDIR=$PWD
BUILDDIR=$PWD/runtime/Cpp/build

prep()
{
    default_prep
    mkdir -p ./share/java
    mv ./*.jar ./share/java
    mkdir -p ./bin
    mv antlr4 ./bin
}

config()
{
    rm -rf ${BUILDDIR}
    mkdir ${BUILDDIR}
    cd ${BUILDDIR}
    cmake .. -DCMAKE_INSTALL_PREFIX=${PREFIX}
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
    mkdir -p "$PREFIX/share/java"
    cp -f -a ./share/java/* "$PREFIX/share/java"
    mkdir -p "$PREFIX/bin"
    cp -f -a ./bin/* "$PREFIX/bin"
    install_ups
}
