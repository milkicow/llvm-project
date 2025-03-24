#ifndef LLVM_LIB_TARGET_ARCH52_ARCH52REGISTERINFO_H
#define LLVM_LIB_TARGET_ARCH52_ARCH52REGISTERINFO_H

#define GET_REGINFO_HEADER
#include "Arch52GenRegisterInfo.inc"

namespace llvm {

struct Arch52RegisterInfo : public Arch52GenRegisterInfo {
public:
  Arch52RegisterInfo();
};

} // namespace llvm

#endif // LLVM_LIB_TARGET_ARCH52_ARCH52REGISTERINFO_H