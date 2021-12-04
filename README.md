# FROTZ-UEFI V2.54
An interpreter for all Infocom and other Z-machine games.  
Complies with standard 1.0 of Graham Nelson's specification.  

Originally written by Stefan Jokisch in 1995-1997.  
Ported to Unix by Galen Hazelwood.  
[Reference code and Unix port currently maintained by David Griffith.](https://gitlab.com/DavidGriffith/frotz)   

------

This is how I compiled this, the source was tweaked to get EDK2 to compile it  
Using fresh Ubuntu Desktop 64-bit 20.04 LTS (I spun of a VM in windows and installed it from ISO)

------
All RUN commands are in same terminal window
------  

**RUN**

`sudo apt-get install build-essential git uuid-dev iasl nasm python python3-distutils python3-apt -y`  
`git clone https://github.com/tianocore/edk2.git`  
`git clone https://github.com/tianocore/edk2-libc.git `  
`mv edk2-libc/AppPkg edk2`  
`mv edk2-libc/StdLib edk2`  
`mv edk2-libc/StdLibPrivateInternalFiles edk2`  
`rm edk2-libc -r -f`  
`cd edk2`  
`git submodule update --init `  
`cd BaseTools`  
`make`  
`cd ..`  
`. ./edksetup.sh`  
`cd AppPkg/Applications`  
`git clone https://github.com/go2tom42/Frotz-UEFI`  
`cd ..`  
`cd ..`  

------

**ADD LINE** to `edk2/StdLib/Include/libgen.h`  
`char  *basename(char *);`  

------

**EDIT FILE** `edk2/AppPkg/AppPkg.dsc`  

add "`  AppPkg/Applications/Frotz-UEFI/Frotz.inf`"  
to `[Components]` section  

------

**EDIT FILE** `/edk2/Conf/target.txt`  

Change "`ACTIVE_PLATFORM       = EmulatorPkg/EmulatorPkg.dsc`" to "`ACTIVE_PLATFORM       = AppPkg/AppPkg.dsc`"  
Change "`TARGET_ARCH           = IA32`" to "`TARGET_ARCH           = X64`"  
Change "`TOOL_CHAIN_TAG        = VS2015x86`" to "`TOOL_CHAIN_TAG        = GCC5`"  

------

**RUN**

`build`

**COMPLETE**

The file you want is located at `edk2/Build/AppPkg/DEBUG_GCC5/X64/AppPkg/Applications/Frotz-UEFI/Frotz/OUTPUT/Frotz.efi`
