#ifndef LLVM_LIB_TARGET_ARCH52_MCTARGETDESC_ARCH52MCASMINFO_H
#define LLVM_LIB_TARGET_ARCH52_MCTARGETDESC_ARCH52MCASMINFO_H

#include "llvm/MC/MCAsmInfoELF.h"

namespace llvm {

class Triple;

class Arch52ELFMCAsmInfo : public MCAsmInfoELF {
public:
  explicit Arch52ELFMCAsmInfo(const Triple &TheTriple);
};

} // namespace llvm

#endif // LLVM_LIB_TARGET_ARCH52_MCTARGETDESC_ARCH52MCASMINFO_H