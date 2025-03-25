#ifndef LLVM_LIB_TARGET_ARCH52_INSTPRINTER_ARCH52INSTPRINTER_H
#define LLVM_LIB_TARGET_ARCH52_INSTPRINTER_ARCH52INSTPRINTER_H

#include "llvm/MC/MCInstPrinter.h"
#include "llvm/MC/MCRegister.h"

namespace llvm {

class Arch52InstPrinter : public MCInstPrinter {
public:
  Arch52InstPrinter(const MCAsmInfo &MAI, const MCInstrInfo &MII,
                    const MCRegisterInfo &MRI)
      : MCInstPrinter(MAI, MII, MRI) {}

  std::pair<const char *, uint64_t> getMnemonic(const MCInst *MI) override {
    return std::pair<const char *, uint64_t>{};
  }

  // Override MCInstPrinter.
  void printRegName(raw_ostream &O, MCRegister Reg) const override {}
  void printInst(const MCInst *MI, uint64_t Address, StringRef Annot,
                 const MCSubtargetInfo &STI, raw_ostream &O) override {}
};
} // namespace llvm

#endif // LLVM_LIB_TARGET_ARCH52_INSTPRINTER_ARCH52INSTPRINTER_H