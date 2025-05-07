#ifndef LLVM_LIB_TARGET_ARCH52_MCTARGETDESC_ARCH52INFO_H
#define LLVM_LIB_TARGET_ARCH52_MCTARGETDESC_ARCH52INFO_H

#include "llvm/MC/MCInstrDesc.h"

namespace llvm {

namespace Arch52CC {
enum CondCode {
  EQ,
  NE,
  LE,
  GT,
  LEU,
  GTU,
  INVALID,
};
}

namespace Arch52Op {
enum OperandType : unsigned {
  OPERAND_SIMM16 = MCOI::OPERAND_FIRST_TARGET,
};
} // namespace Arch52Op

} // namespace llvm

#endif // LLVM_LIB_TARGET_ARCH52_MCTARGETDESC_ARCH52INFO_H