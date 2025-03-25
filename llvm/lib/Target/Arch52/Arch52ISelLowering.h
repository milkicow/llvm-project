#ifndef LLVM_LIB_TARGET_ARCH52_ARCH52ISELLOWERING_H
#define LLVM_LIB_TARGET_ARCH52_ARCH52ISELLOWERING_H

#include "Arch52.h"
#include "llvm/CodeGen/SelectionDAG.h"
#include "llvm/CodeGen/TargetLowering.h"

namespace llvm {

class Arch52Subtarget;
class Arch52TargetMachine;

namespace Arch52ISD {

enum NodeType : unsigned {
  // Start the numbering where the builtin ops and target ops leave off.
  FIRST_NUMBER = ISD::BUILTIN_OP_END,
  RET,
  CALL,
  BR_CC,
};

} // namespace Arch52ISD

} // namespace llvm

#endif // LLVM_LIB_TARGET_ARCH52_ARCH52ISELLOWERING_H