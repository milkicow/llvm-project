#include "Arch52RegisterInfo.h"
#include "Arch52.h"
#include "Arch52FrameLowering.h"
#include "llvm/CodeGen/TargetInstrInfo.h"

using namespace llvm;

#define GET_REGINFO_TARGET_DESC
#include "Arch52GenRegisterInfo.inc"

Arch52RegisterInfo::Arch52RegisterInfo() : Arch52GenRegisterInfo(Arch52::R0) {
    ARCH52_DUMP_GREEN
}