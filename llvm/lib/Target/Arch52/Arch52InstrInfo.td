//===----------------------------------------------------------------------===//
// Arch52 profiles and nodes
//===----------------------------------------------------------------------===//

def arch52_ret      : SDNode<"Arch52ISD::RET", SDTNone,
                            [SDNPHasChain, SDNPOptInGlue, SDNPVariadic]>;

//===----------------------------------------------------------------------===//
// Instruction format superclass
//===----------------------------------------------------------------------===//

include "Arch52InstrFormats.td"

//===----------------------------------------------------------------------===//
// Arch52 Operand, Complex Patterns and Transformations Definitions.
//===----------------------------------------------------------------------===//

class SImmAsmOperand<int width> : AsmOperandClass {
  let Name = "SImm" # width;
  let RenderMethod = "addImmOperands";
  let DiagnosticType = !strconcat("Invalid", Name);
}

def simm16 : Operand<i32>, ImmLeaf<i32, [{return isInt<16>(Imm);}]> {
  let ParserMatchClass = SImmAsmOperand<16>;
  let EncoderMethod = "getSImm16OpValue";
  let DecoderMethod = "decodeSImmOperand<16>";
  let MCOperandPredicate = [{
    int64_t Imm;
    if (MCOp.evaluateAsConstantImm(Imm))
      return isInt<16>(Imm);
    return MCOp.isBareSymbolRef();
  }];
  let OperandType = "OPERAND_SIMM16";
  let OperandNamespace = "Arch52Op";
}

//===----------------------------------------------------------------------===//
// Arch52 Instructions
//===----------------------------------------------------------------------===//

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCall = 1, isBranch = 1, isTerminator = 1, r2 = 0, r3_imm = 0 in
def BR : Arch52Inst<0x52, (outs), (ins GPR:$r1), "BR $r1",
                [(brind GPR:$r1)]>;

let isBarrier = 1, isReturn = 1, isTerminator = 1 in
def PseudoRET : Arch52PseudoInst<(outs), (ins), "# PseudoRET",
                [(arch52_ret)]>,
                PseudoInstExpansion<(BR R0)>;

// movli
let isAsCheapAsAMove = 1, isCodeGenOnly = 1, isReMaterializable = 1, r2 = 0 in
def MOVLI : Arch52Inst<0xAC, (outs GPR:$r1), (ins simm16:$r3_imm),
                    "MOVli $r1 $r3_imm",
                    [(set GPR:$r1, simm16:$r3_imm)]>;

// putdisplaypixel
def PUTDISPLAYPIXEL : Arch52Inst<0xBB, (outs), (ins GPR:$r1, GPR:$r2, GPR:$r3_imm),
                                "PUTDISPLAYPIXEL $r1 $r2 $r3_imm", [(int_arch52_putdisplaypixel GPR:$r1, GPR:$r2, GPR:$r3_imm)]>;

// flush
let r1 = 0, r2 = 0, r3_imm = 0 in
def FLUSH : Arch52Inst<0xAA, (outs), (ins), "FLUSH", [(int_arch52_flush)]>;

// neighbors
// def NEIGHBORS : Arch52Inst<0xCC, (outs GPR:$r1), (ins GPR:$r2, GPR:$r3_imm),
//                              "NEIGHBORS $r1 $r2 $r3_imm", [(set GPR:$r1, (int_arch52_neighbors GPR:$r2, GPR:$r3_imm))]>;