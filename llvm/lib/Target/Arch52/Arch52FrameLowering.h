#ifndef LLVM_LIB_TARGET_ARCH52_ARCH52FRAMELOWERING_H
#define LLVM_LIB_TARGET_ARCH52_ARCH52FRAMELOWERING_H

#include "Arch52.h"
#include "llvm/CodeGen/TargetFrameLowering.h"

namespace llvm {

class Arch52FrameLowering : public TargetFrameLowering {
public:
  explicit Arch52FrameLowering()
      : TargetFrameLowering(TargetFrameLowering::StackGrowsDown, Align(4), 0) {
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
  virtual bool hasFPImpl(const MachineFunction &MF) const = 0;
};

} // namespace llvm

#endif // LLVM_LIB_TARGET_ARCH52_ARCH52FRAMELOWERING_H