## build with different NDK/compiler versions with OpenMP support

| NDK | comp  | ver  | armeabi |arme-v7a | arm64 | x86 | x86_64 | mips | mips64 |
|:    |:      | :   :|:       :|:       :|:     :|:   :|:      :|:    :|:      :|
| 10e | gcc   | 4.9  | +/+     | +/+     | +/+   | +/+ | +/+    | +/+  | +/+    |
| 10e | clang |      | noOMP   | noOMP   | noOMP |noOMP| noOMP  | noOMP| noOMP  |
| 15  | clang | 5.0.3| +/+     | +/+     | +/+   | +/+ | +/+    | bug1 | +/+    |

bug1: MIPS 32-bit architecture does not support 64-bit atomic increment instruction 
 
