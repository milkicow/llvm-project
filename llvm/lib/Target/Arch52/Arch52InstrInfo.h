#ifndef LLVM_LIB_TARGET_ARCH52_ARCH52INSTRINFO_H
#define LLVM_LIB_TARGET_ARCH52_ARCH52INSTRINFO_H

#include "MCTargetDesc/Arch52Info.h"
#include "Arch52RegisterInfo.h"
#include "llvm/CodeGen/TargetInstrInfo.h"

#define GET_INSTRINFO_HEADER
#include "Arch52GenInstrInfo.inc"

namespace llvm {

class Arch52Subtarget;

class Arch52InstrInfo : public Arch52GenInstrInfo {
public:
  Arch52InstrInfo();
};

} // namespace llvm

#endif // LLVM_LIB_TARGET_ARCH52_ARCH52INSTRINFO_H