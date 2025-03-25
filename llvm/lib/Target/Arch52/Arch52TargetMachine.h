#ifndef LLVM_LIB_TARGET_ARCH52_ARCH52TARGETMACHINE_H
#define LLVM_LIB_TARGET_ARCH52_ARCH52TARGETMACHINE_H

#include "Arch52Subtarget.h"
#include "llvm/Target/TargetMachine.h"
#include <optional>

namespace llvm {
extern Target TheArch52Target;

class Arch52TargetMachine : public LLVMTargetMachine {
  std::unique_ptr<TargetLoweringObjectFile> TLOF;
  Arch52Subtarget Subtarget;

public:
  Arch52TargetMachine(const Target &T, const Triple &TT, StringRef CPU,
                      StringRef FS, const TargetOptions &Options,
                      std::optional<Reloc::Model> RM,
                      std::optional<CodeModel::Model> CM, CodeGenOptLevel OL,
                      bool JIT);

  const Arch52Subtarget *getSubtargetImpl(const Function &) const override {
    ARCH52_DUMP_CYAN
    return &Subtarget;
  }

  // Pass Pipeline Configuration
  TargetPassConfig *createPassConfig(PassManagerBase &PM) override;
  TargetLoweringObjectFile *getObjFileLowering() const override;
};
} // end namespace llvm

#endif // LLVM_LIB_TARGET_ARCH52_ARCH52TARGETMACHINE_H