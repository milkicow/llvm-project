#include "Arch52Subtarget.h"
#include "Arch52.h"
#include "llvm/Target/TargetMachine.h"

using namespace llvm;

#define DEBUG_TYPE "arch52-subtarget"

#define GET_SUBTARGETINFO_TARGET_DESC
#define GET_SUBTARGETINFO_CTOR
#include "Arch52GenSubtargetInfo.inc"

Arch52Subtarget::Arch52Subtarget(const StringRef &CPU, const StringRef &TuneCPU,
                                 const StringRef &FS, const TargetMachine &TM)
    : Arch52GenSubtargetInfo(TM.getTargetTriple(), CPU, TuneCPU, FS) {
  ARCH52_DUMP_CYAN
}