#include "Arch52.h"
#include "TargetInfo/Arch52TargetInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/TargetRegistry.h"

using namespace llvm;

#define GET_REGINFO_MC_DESC
#include "Arch52GenRegisterInfo.inc"

static MCRegisterInfo *createArch52MCRegisterInfo(const Triple &TT) {
    ARCH52_DUMP_MAGENTA
    MCRegisterInfo *X = new MCRegisterInfo();
    InitArch52MCRegisterInfo(X, Arch52::R0);
    return X;
}

// We need to define this function for linking succeed
extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeArch52TargetMC() {
    ARCH52_DUMP_MAGENTA
    Target &TheArch52Target = getTheArch52Target();
    // Register the MC register info
    TargetRegistry::RegisterMCRegInfo(TheArch52Target, createArch52MCRegisterInfo);
}