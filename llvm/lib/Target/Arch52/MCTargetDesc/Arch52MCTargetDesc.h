#ifndef LLVM_LIB_TARGET_ARCH52_NCTARGETDESC_ARCH52MCTARGETDESC_H
#define LLVM_LIB_TARGET_ARCH52_NCTARGETDESC_ARCH52MCTARGETDESC_H

namespace llvm {
class MCCodeEmitter;
class MCContext;
class MCInstrInfo;
class MCAsmBackend;
class MCObjectTargetWriter;
class MCRegisterInfo;
class MCSubtargetInfo;
class MCTargetOptions;
class Target;

MCCodeEmitter *createArch52MCCodeEmitter(const MCInstrInfo &MCII,
                                         MCContext &Ctx);
MCAsmBackend *createArch52AsmBackend(const Target &T,
                                     const MCSubtargetInfo &STI,
                                     const MCRegisterInfo &MRI,
                                     const MCTargetOptions &Options);

} // namespace llvm

// Defines symbolic names for Arch52 registers.  This defines a mapping from
// register name to register number.
//
#define GET_REGINFO_ENUM
#include "Arch52GenRegisterInfo.inc"

// Defines symbolic names for Arch52
#define GET_INSTRINFO_ENUM
#include "Arch52GenInstrInfo.inc"

#endif // LLVM_LIB_TARGET_ARCH52_NCTARGETDESC_ARCH52MCTARGETDESC_H