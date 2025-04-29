#ifndef LLVM_LIB_TARGET_ARCH52_INSTPRINTER_ARCH52INSTPRINTER_H
#define LLVM_LIB_TARGET_ARCH52_INSTPRINTER_ARCH52INSTPRINTER_H

#include "llvm/MC/MCInstPrinter.h"

namespace llvm {

class Arch52InstPrinter : public MCInstPrinter {
public:
  Arch52InstPrinter(const MCAsmInfo &MAI, const MCInstrInfo &MII,
                    const MCRegisterInfo &MRI)
      : MCInstPrinter(MAI, MII, MRI) {}

  std::pair<const char *, uint64_t> getMnemonic(const MCInst *MI) override;
  void printInstruction(const MCInst *MI, uint64_t Address, raw_ostream &O);
  static const char *getRegisterName(MCRegister Reg);

  // Print given operand
  static void printOperand(const MCOperand &MO, raw_ostream &O);

  // Override MCInstPrinter.
  void printRegName(raw_ostream &O, MCRegister Reg) const override;
  void printInst(const MCInst *MI, uint64_t Address, StringRef Annot,
                 const MCSubtargetInfo &STI, raw_ostream &O) override;

  void printOperand(const MCInst *MI, int OpNo, raw_ostream &O);
  void printBranchOperand(const MCInst *MI, uint64_t Address, unsigned OpNo,
                          raw_ostream &O);
};
} // namespace llvm

#endif // LLVM_LIB_TARGET_ARCH52_INSTPRINTER_ARCH52INSTPRINTER_H