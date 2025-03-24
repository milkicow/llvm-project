#ifndef LLVM_LIB_TARGET_ARCH52_NCTARGETDESC_ARCH52MCTARGETDESC_H
#define LLVM_LIB_TARGET_ARCH52_NCTARGETDESC_ARCH52MCTARGETDESC_H

// Defines symbolic names for Arch52 registers.  This defines a mapping from
// register name to register number.
//
#define GET_REGINFO_ENUM
#include "Arch52GenRegisterInfo.inc"

// Defines symbolic names for Arch52
#define GET_INSTRINFO_ENUM
#include "Arch52GenInstrInfo.inc"

#endif // LLVM_LIB_TARGET_ARCH52_NCTARGETDESC_ARCH52MCTARGETDESC_H