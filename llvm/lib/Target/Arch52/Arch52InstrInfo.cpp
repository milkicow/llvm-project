#include "Arch52InstrInfo.h"
#include "Arch52.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

#define GET_INSTRINFO_CTOR_DTOR
#include "Arch52GenInstrInfo.inc"

#define DEBUG_TYPE "Arch52-inst-info"

Arch52InstrInfo::Arch52InstrInfo() : Arch52GenInstrInfo() { ARCH52_DUMP_GREEN }

void Arch52InstrInfo::copyPhysReg(MachineBasicBlock &MBB,
                                  MachineBasicBlock::iterator MBBI,
                                  const DebugLoc &DL, MCRegister DstReg,
                                  MCRegister SrcReg, bool KillSrc) const {
  if (Arch52::GPRRegClass.contains(DstReg, SrcReg)) {
    BuildMI(MBB, MBBI, DL, get(Arch52::ORI), DstReg)
        .addReg(SrcReg, getKillRegState(KillSrc))
        .addImm(0);
    return;
  }
  llvm_unreachable("can't copyPhysReg");
}