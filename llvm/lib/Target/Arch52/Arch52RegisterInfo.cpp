#include "Arch52RegisterInfo.h"
#include "Arch52.h"
#include "Arch52FrameLowering.h"
#include "llvm/CodeGen/TargetInstrInfo.h"

using namespace llvm;

#define GET_REGINFO_TARGET_DESC
#include "Arch52GenRegisterInfo.inc"

Arch52RegisterInfo::Arch52RegisterInfo() : Arch52GenRegisterInfo(Arch52::R0) {
    ARCH52_DUMP_GREEN
}

const MCPhysReg *
Arch52RegisterInfo::getCalleeSavedRegs(const MachineFunction *MF) const {
  ARCH52_DUMP_GREEN
  return CSR_Arch52_SaveList;
}

BitVector Arch52RegisterInfo::getReservedRegs(const MachineFunction &MF) const {
  ARCH52_DUMP_GREEN
  Arch52FrameLowering const *TFI = getFrameLowering(MF);

  BitVector Reserved(getNumRegs());
  Reserved.set(Arch52::R1);

  if (TFI->hasFP(MF)) {
    Reserved.set(Arch52::R2);
  }
  return Reserved;
}

bool Arch52RegisterInfo::requiresRegisterScavenging(
    const MachineFunction &MF) const {
  return false;
}

bool Arch52RegisterInfo::eliminateFrameIndex(MachineBasicBlock::iterator II,
                                          int SPAdj, unsigned FIOperandNum,
                                          RegScavenger *RS) const {
  ARCH52_DUMP_GREEN
  assert(SPAdj == 0 && "Unexpected non-zero SPAdj value");

  MachineInstr &MI = *II;
  MachineFunction &MF = *MI.getParent()->getParent();
  DebugLoc DL = MI.getDebugLoc();

  int FrameIndex = MI.getOperand(FIOperandNum).getIndex();
  Register FrameReg;
  int Offset = getFrameLowering(MF)
                   ->getFrameIndexReference(MF, FrameIndex, FrameReg)
                   .getFixed();
  Offset += MI.getOperand(FIOperandNum + 1).getImm();

  if (!isInt<16>(Offset)) {
    llvm_unreachable("");
  }

  MI.getOperand(FIOperandNum).ChangeToRegister(FrameReg, false, false, false);
  MI.getOperand(FIOperandNum + 1).ChangeToImmediate(Offset);
  return false;
}

Register Arch52RegisterInfo::getFrameRegister(const MachineFunction &MF) const {
  ARCH52_DUMP_GREEN
  const TargetFrameLowering *TFI = getFrameLowering(MF);
  return TFI->hasFP(MF) ? Arch52::R2 : Arch52::R1;
}

const uint32_t *
Arch52RegisterInfo::getCallPreservedMask(const MachineFunction &MF,
                                      CallingConv::ID CC) const {
  ARCH52_DUMP_GREEN
  return CSR_Arch52_RegMask;
}