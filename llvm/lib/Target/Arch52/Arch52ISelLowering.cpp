#include "Arch52ISelLowering.h"
#include "Arch52.h"
#include "Arch52RegisterInfo.h"
#include "Arch52Subtarget.h"
#include "llvm/CodeGen/CallingConvLower.h"
#include "llvm/CodeGen/MachineFunction.h"

#define DEBUG_TYPE "Arch52-lower"

using namespace llvm;

Arch52TargetLowering::Arch52TargetLowering(const TargetMachine &TM,
                                           const Arch52Subtarget &STI)
    : TargetLowering(TM), STI(STI) {
  ARCH52_DUMP_RED
  addRegisterClass(MVT::i32, &Arch52::GPRRegClass);
}

const char *Arch52TargetLowering::getTargetNodeName(unsigned Opcode) const {
  ARCH52_DUMP_RED
  switch (Opcode) {
  case Arch52ISD::CALL:
    return "Arch52ISD::CALL";
  case Arch52ISD::RET:
    return "Arch52ISD::RET";
  }
  return nullptr;
}