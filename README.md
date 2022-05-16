# FROTZ-UEFI V2.54
An interpreter for all Infocom and other Z-machine games.  
Complies with standard 1.0 of Graham Nelson's specification.  

Originally written by Stefan Jokisch in 1995-1997.  
Ported to Unix by Galen Hazelwood.  
[Reference code and Unix port currently maintained by David Griffith.](https://gitlab.com/DavidGriffith/frotz)   

------

Here is how to compile, using a fresh Ubuntu Desktop 64-bit 22.04 LTS install (I spun of a VM in windows and installed it from ISO)  


------  

**RUN**


`sudo apt-get install build-essential git uuid-dev iasl nasm python3-distutils python3-apt -y`  
`git clone https://github.com/tianocore/edk2.git`  
`cd edk2`  
`git reset --hard 708620d29db89d03e822b8d17dc75fbac865c6dc`  
`cd ..`  
`git clone https://github.com/tianocore/edk2-libc.git`  
`cd edk2-libc`  
`git reset --hard c32222fed9927420fc46da503dea1ebb874698b6`  
`cd ..`  
`mv edk2-libc/AppPkg edk2`  
`mv edk2-libc/StdLib edk2`  
`mv edk2-libc/StdLibPrivateInternalFiles edk2`  
`rm edk2-libc -r -f`  
`cd edk2`  
`git submodule update --init`  
`cd BaseTools`  
`make`  
`cd ..`  
`. ./edksetup.sh`  
`cd AppPkg/Applications`  
`git clone https://gitlab.com/DavidGriffith/frotz`  
`cd frotz`  
`git reset --hard e503bd12fd7500e4ad116b2315fcee33fd2958d7`  
`cd ..`  
`cd ..`  
`cd ..`  
`wget -q https://raw.githubusercontent.com/go2tom42/Frotz-UEFI/v2.0.0-FROTZ-UEFI-V2.54-on-Ubuntu-22.04-LTS/AppPkg.dsc -O AppPkg/AppPkg.dsc`  
`wget -q https://raw.githubusercontent.com/go2tom42/Frotz-UEFI/v2.0.0-FROTZ-UEFI-V2.54-on-Ubuntu-22.04-LTS/defs.h -O AppPkg/Applications/frotz/src/common/defs.h`  
`wget -q https://raw.githubusercontent.com/go2tom42/Frotz-UEFI/v2.0.0-FROTZ-UEFI-V2.54-on-Ubuntu-22.04-LTS/Frotz.inf -O AppPkg/Applications/frotz/Frotz.inf`  
`wget -q https://raw.githubusercontent.com/go2tom42/Frotz-UEFI/v2.0.0-FROTZ-UEFI-V2.54-on-Ubuntu-22.04-LTS/hash.h -O AppPkg/Applications/frotz/src/common/hash.h`  
`wget -q https://raw.githubusercontent.com/go2tom42/Frotz-UEFI/v2.0.0-FROTZ-UEFI-V2.54-on-Ubuntu-22.04-LTS/libgen.h -O StdLib/Include/libgen.h`  
`wget -q https://raw.githubusercontent.com/go2tom42/Frotz-UEFI/v2.0.0-FROTZ-UEFI-V2.54-on-Ubuntu-22.04-LTS/target.txt -O Conf/target.txt`  
`build`  



**COMPLETE**

The file you want is located at `edk2/Build/AppPkg/DEBUG_GCC5/X64/AppPkg/Applications/frotz/Frotz/OUTPUT/Frotz.efi`
