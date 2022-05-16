sudo apt-get install build-essential git uuid-dev iasl nasm python python3-distutils python3-apt -y
git clone https://github.com/tianocore/edk2.git
cd edk2
git reset --hard dfafa8e45382939fb5dc78e9d37b97b500a43613
cd ..
git clone https://github.com/tianocore/edk2-libc.git
cd edk2-libc
git reset --hard 0fdfe2175459ace25e5bcfe5acedd2dd54ebfe05
cd ..
mv edk2-libc/AppPkg edk2
mv edk2-libc/StdLib edk2
mv edk2-libc/StdLibPrivateInternalFiles edk2
rm edk2-libc -r -f
cd edk2
git submodule update --init
cd BaseTools
make
cd ..
. ./edksetup.sh
cd AppPkg/Applications
git clone https://gitlab.com/DavidGriffith/frotz
cd frotz
git reset --hard 5d91b3c0d06092cc86e598fc7dec718a84e4e3e7
cd ..
cd ..
cd ..
wget -q https://raw.githubusercontent.com/go2tom42/Frotz-UEFI/v1.0.0-FROTZ-UEFI-V2.54-on-Ubuntu-20.04-LTS/AppPkg.dsc -O AppPkg/AppPkg.dsc
wget -q https://raw.githubusercontent.com/go2tom42/Frotz-UEFI/v1.0.0-FROTZ-UEFI-V2.54-on-Ubuntu-20.04-LTS/defs.h -O AppPkg/Applications/frotz/src/common/defs.h
wget -q https://raw.githubusercontent.com/go2tom42/Frotz-UEFI/v1.0.0-FROTZ-UEFI-V2.54-on-Ubuntu-20.04-LTS/Frotz.inf -O AppPkg/Applications/frotz/Frotz.inf
wget -q https://raw.githubusercontent.com/go2tom42/Frotz-UEFI/v1.0.0-FROTZ-UEFI-V2.54-on-Ubuntu-20.04-LTS/hash.h -O AppPkg/Applications/frotz/src/common/hash.h
wget -q https://raw.githubusercontent.com/go2tom42/Frotz-UEFI/v1.0.0-FROTZ-UEFI-V2.54-on-Ubuntu-20.04-LTS/libgen.h -O StdLib/Include/libgen.h
wget -q https://raw.githubusercontent.com/go2tom42/Frotz-UEFI/v1.0.0-FROTZ-UEFI-V2.54-on-Ubuntu-20.04-LTS/target.txt -O Conf/target.txt
build