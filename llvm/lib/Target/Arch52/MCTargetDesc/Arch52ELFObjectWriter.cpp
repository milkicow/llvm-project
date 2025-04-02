#include "Arch52.h"
#include "MCTargetDesc/Arch52MCTargetDesc.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/MC/MCELFObjectWriter.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/MC/MCValue.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

namespace {
class Arch52ELFObjectWriter : public MCELFObjectTargetWriter {
public:
  Arch52ELFObjectWriter(bool Is64Bit, uint8_t OSABI)
      : MCELFObjectTargetWriter(Is64Bit, OSABI, ELF::EM_ARCH52,
                                /*HasRelocationAddend*/ true) {}

  ~Arch52ELFObjectWriter() override = default;

protected:
  unsigned getRelocType(MCContext &Ctx, const MCValue &Target,
                        const MCFixup &Fixup, bool IsPCRel) const override;

  bool needsRelocateWithSymbol(const MCValue &Val, const MCSymbol &Sym,
                               unsigned Type) const override;
};
} // namespace

unsigned Arch52ELFObjectWriter::getRelocType(MCContext &Ctx, const MCValue &Target,
                                          const MCFixup &Fixup,
                                          bool IsPCRel) const {
  MCFixupKind Kind = Fixup.getKind();
  if (Kind >= FirstLiteralRelocationKind)
    return Kind - FirstLiteralRelocationKind;

  llvm_unreachable("Unimplemented fixup -> relocation");
}

bool Arch52ELFObjectWriter::needsRelocateWithSymbol(const MCValue &,
                                                 const MCSymbol &,
                                                 unsigned Type) const {
  return false;
}

std::unique_ptr<MCObjectTargetWriter>
llvm::createArch52ELFObjectWriter(bool Is64Bit, uint8_t OSABI) {
  return std::make_unique<Arch52ELFObjectWriter>(Is64Bit, OSABI);
}