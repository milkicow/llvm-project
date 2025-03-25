#include "Arch52Subtarget.h"
#include "Arch52.h"
#include "llvm/Target/TargetMachine.h"

#include <string>

using namespace llvm;

#define DEBUG_TYPE "arch52-subtarget"

#define GET_SUBTARGETINFO_TARGET_DESC
#define GET_SUBTARGETINFO_CTOR
#include "Arch52GenSubtargetInfo.inc"

Arch52Subtarget::Arch52Subtarget(const Triple &TT, const std::string &CPU,
                                 const std::string &FS, const TargetMachine &TM)
    : Arch52GenSubtargetInfo(TT, CPU, /*Tune*/CPU, FS), TLInfo(TM, *this) {
  ARCH52_DUMP_CYAN
}