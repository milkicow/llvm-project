#include "Arch52.h"
#include "MCTargetDesc/Arch52Info.h"
#include "TargetInfo/Arch52TargetInfo.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/TargetRegistry.h"

using namespace llvm;

#define GET_REGINFO_MC_DESC
#include "Arch52GenRegisterInfo.inc"

#define GET_INSTRINFO_MC_DESC
#include "Arch52GenInstrInfo.inc"

#define GET_SUBTARGETINFO_MC_DESC
#include "Arch52GenSubtargetInfo.inc"

static MCRegisterInfo *createArch52MCRegisterInfo(const Triple &TT) {
  ARCH52_DUMP_MAGENTA
  MCRegisterInfo *X = new MCRegisterInfo();
  InitArch52MCRegisterInfo(X, Arch52::R0);
  return X;
}

static MCInstrInfo *createArch52MCInstrInfo() {
  ARCH52_DUMP_MAGENTA
  MCInstrInfo *X = new MCInstrInfo();
  InitArch52MCInstrInfo(X);
  return X;
}

static MCSubtargetInfo *
createArch52MCSubtargetInfo(const Triple &TT, StringRef CPU, StringRef FS) {
  ARCH52_DUMP_MAGENTA
  return createArch52MCSubtargetInfoImpl(TT, CPU, /*Tune*/ CPU, FS);
}

// We need to define this function for linking succeed
extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeArch52TargetMC() {
  ARCH52_DUMP_MAGENTA
  Target &TheArch52Target = getTheArch52Target();
  // Register the MC register info
  TargetRegistry::RegisterMCRegInfo(TheArch52Target,
                                    createArch52MCRegisterInfo);
  // Register the MC instruction info
  TargetRegistry::RegisterMCInstrInfo(TheArch52Target, createArch52MCInstrInfo);
  // Register the MC subtarget info
  TargetRegistry::RegisterMCSubtargetInfo(TheArch52Target,
                                          createArch52MCSubtargetInfo);
}