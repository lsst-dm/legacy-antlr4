TAP_PACKAGE=1


build()
{
    cd runtime/Cpp && mkdir build && mkdir run && cd build
    cmake ..
    make
}

install()
{
    default_install

    cd runtime/Cpp/build
    DESTDIR=$PREFIX make install
    msg "Moving $PREFIX/usr/local/* to $PREFIX/ and deleting $PREFIX/usr"
    mv $PREFIX/usr/local/* $PREFIX/
    rm -r $PREFIX/usr
}
