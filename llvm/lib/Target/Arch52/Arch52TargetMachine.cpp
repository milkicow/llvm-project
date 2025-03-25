#include "Arch52TargetMachine.h"
#include "Arch52.h"
#include "TargetInfo/Arch52TargetInfo.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/MC/TargetRegistry.h"
#include <optional>

using namespace llvm;

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeArch52Target() {
  // Register the target.
  ARCH52_DUMP_CYAN
  RegisterTargetMachine<Arch52TargetMachine> A(getTheArch52Target());
}

Arch52TargetMachine::Arch52TargetMachine(const Target &T, const Triple &TT,
                                         StringRef CPU, StringRef FS,
                                         const TargetOptions &Options,
                                         std::optional<Reloc::Model> RM,
                                         std::optional<CodeModel::Model> CM,
                                         CodeGenOptLevel OL, bool JIT)
    : LLVMTargetMachine(T, "e-m:e-p:32:32-i8:8:32-i16:16:32-i64:64-n32", TT,
                        CPU, FS, Options, Reloc::Static,
                        getEffectiveCodeModel(CM, CodeModel::Small), OL) {
  ARCH52_DUMP_CYAN
  initAsmInfo();
}

namespace {

// Arch52 Code Generator Pass Configuration Options
class Arch52PassConfig : public TargetPassConfig {
public:
  Arch52PassConfig(Arch52TargetMachine &TM, PassManagerBase &PM)
      : TargetPassConfig(TM, PM) {}

  Arch52TargetMachine &getArch52TargetMachine() const {
    return getTM<Arch52TargetMachine>();
  }

  bool addInstSelector() override {
    ARCH52_DUMP_CYAN
    addPass(createArch52ISelDag(getArch52TargetMachine(), getOptLevel()));
    return false;
  }
};

} // namespace

TargetPassConfig *Arch52TargetMachine::createPassConfig(PassManagerBase &PM) {
  ARCH52_DUMP_CYAN
  return new Arch52PassConfig(*this, PM);
}