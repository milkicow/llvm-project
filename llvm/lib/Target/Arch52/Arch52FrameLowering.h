#ifndef LLVM_LIB_TARGET_ARCH52_ARCH52FRAMELOWERING_H
#define LLVM_LIB_TARGET_ARCH52_ARCH52FRAMELOWERING_H

#include "Arch52.h"
#include "llvm/CodeGen/TargetFrameLowering.h"

namespace llvm {
class Arch52Subtarget;

class Arch52FrameLowering : public TargetFrameLowering {
public:
  Arch52FrameLowering(const Arch52Subtarget &STI)
      : TargetFrameLowering(TargetFrameLowering::StackGrowsDown, Align(4), 0),
        STI(STI) {
    ARCH52_DUMP_GREEN
  }

  /// emitProlog/emitEpilog - These methods insert prolog and epilog code into
  /// the function.
  void emitPrologue(MachineFunction &MF,
                    MachineBasicBlock &MBB) const override {}
  void emitEpilogue(MachineFunction &MF,
                    MachineBasicBlock &MBB) const override {}

  /// hasFP - Return true if the specified function should have a dedicated
  /// frame pointer register. For most targets this is true only if the function
  /// has variable sized allocas or if frame pointer elimination is disabled.
  bool hasFP(const MachineFunction &MF) const override { return false; };

private:
    const Arch52Subtarget &STI;
};

} // namespace llvm

#endif // LLVM_LIB_TARGET_ARCH52_ARCH52FRAMELOWERING_H