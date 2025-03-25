#ifndef LLVM_LIB_TARGET_ARCH52_ARCH52TARGETMACHINE_H
#define LLVM_LIB_TARGET_ARCH52_ARCH52TARGETMACHINE_H

#include "llvm/Target/TargetMachine.h"
#include <optional>

namespace llvm {
extern Target TheArch52Target;

class Arch52TargetMachine : public LLVMTargetMachine {
public:
  Arch52TargetMachine(const Target &T, const Triple &TT, StringRef CPU,
                      StringRef FS, const TargetOptions &Options,
                      std::optional<Reloc::Model> RM,
                      std::optional<CodeModel::Model> CM, CodeGenOptLevel OL,
                      bool JIT);

  // Pass Pipeline Configuration
  TargetPassConfig *createPassConfig(PassManagerBase &PM) override;
};
} // end namespace llvm

#endif // LLVM_LIB_TARGET_ARCH52_ARCH52TARGETMACHINE_H