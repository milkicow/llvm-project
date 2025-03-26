#include "Arch52.h"
#include "Arch52Subtarget.h"
#include "Arch52TargetMachine.h"
#include "MCTargetDesc/Arch52InstPrinter.h"
#include "TargetInfo/Arch52TargetInfo.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/CodeGen/AsmPrinter.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define DEBUG_TYPE "asm-printer"

namespace {

class Arch52AsmPrinter : public AsmPrinter {
  const MCSubtargetInfo *STI;

public:
  explicit Arch52AsmPrinter(TargetMachine &TM,
                            std::unique_ptr<MCStreamer> Streamer)
      : AsmPrinter(TM, std::move(Streamer)), STI(TM.getMCSubtargetInfo()) {
    ARCH52_DUMP_GREEN
  }

  void emitInstruction(const MachineInstr *MI) override;

  StringRef getPassName() const override { return "Arch52 Assembly Printer"; }

  bool lowerPseudoInstExpansion(const MachineInstr *MI, MCInst &Inst);

  bool lowerOperand(const MachineOperand &MO, MCOperand &MCOp) const {
    return LowerArch52MachineOperandToMCOperand(MO, MCOp, *this);
  }

  bool emitPseudoExpansionLowering(MCStreamer &OutStreamer,
                                   const MachineInstr *MI);
};

} // namespace

// Simple pseudo-instructions have their lowering (with expansion to real
// instructions) auto-generated
#include "Arch52GenMCPseudoLowering.inc"

void Arch52AsmPrinter::emitInstruction(const MachineInstr *MI) {
  ARCH52_DUMP_GREEN
  emitPseudoExpansionLowering(*OutStreamer, MI);

  MCInst TmpInst;
  if (!lowerArch52MachineInstrToMCInst(MI, TmpInst, *this)) {
    EmitToStreamer(*OutStreamer, TmpInst);
  }
}

// Force static initialization.
extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeArch52AsmPrinter() {
  RegisterAsmPrinter<Arch52AsmPrinter> X(getTheArch52Target());
}