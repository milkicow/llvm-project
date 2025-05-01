#ifndef LLVM_LIB_TARGET_ARCH52_ARCH52INSTRINFO_H
#define LLVM_LIB_TARGET_ARCH52_ARCH52INSTRINFO_H

#include "Arch52RegisterInfo.h"
#include "MCTargetDesc/Arch52Info.h"
#include "llvm/CodeGen/TargetInstrInfo.h"

#define GET_INSTRINFO_HEADER
#include "Arch52GenInstrInfo.inc"

namespace llvm {

class Arch52Subtarget;

class Arch52InstrInfo : public Arch52GenInstrInfo {
public:
  Arch52InstrInfo();

  void copyPhysReg(MachineBasicBlock &MBB, MachineBasicBlock::iterator MBBI,
                   const DebugLoc &DL, MCRegister DestReg, MCRegister SrcReg,
                   bool KillSrc) const override;

};

} // namespace llvm

#endif // LLVM_LIB_TARGET_ARCH52_ARCH52INSTRINFO_H