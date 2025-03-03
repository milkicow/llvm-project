#include "TargetInfo/Arch52TargetInfo.h"
#include "Arch52.h"
#include "llvm/MC/TargetRegistry.h"

using namespace llvm;

Target &llvm::getTheArch52Target() {
  ARCH52_DUMP_YELLOW
  static Target TheArch52Target;
  return TheArch52Target;
}

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeArch52TargetInfo() {
  ARCH52_DUMP_YELLOW
  RegisterTarget<Triple::arch52> X(getTheArch52Target(), "arch52",
                                "52 BackEnd Architecture", "ARCH52");
}