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

def simm16 : Operand<i32>, ImmLeaf<i32, [{return isUInt<16>(Imm);}]> {
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

def btarget16 : Operand<OtherVT> {
  let ParserMatchClass = SImmAsmOperand<16>;
  let PrintMethod = "printBranchOperand";
  let EncoderMethod = "getBranchTarget16OpValue";
  let DecoderMethod = "decodeSImmOperand<16>";
  let MCOperandPredicate = [{
    int64_t Imm;
    if (MCOp.evaluateAsConstantImm(Imm))
      return isInt<16>(Imm);
    return MCOp.isBareSymbolRef();
  }];
  let OperandType = "OPERAND_PCREL";
}

def LI16 : SDNodeXForm<imm, [{
  return CurDAG->getTargetConstant((uint64_t)N->getZExtValue() & 0xffff,
                                  SDLoc(N), MVT::i32);
}]>;

def HI16 : SDNodeXForm<imm, [{
  return CurDAG->getTargetConstant((uint64_t)N->getZExtValue() >> 16, SDLoc(N),
                                  MVT::i32);
}]>;



def SDT_Arch52BrCC : SDTypeProfile<0, 4, [ SDTCisSameAs<0, 1>,
                                           SDTCisVT<2, OtherVT>,
                                           SDTCisVT<3, OtherVT>]>;

def arch52_brcc     : SDNode<"Arch52ISD::BR_CC", SDT_Arch52BrCC,
                            [SDNPHasChain]>;


//===----------------------------------------------------------------------===//
// Arch52 Instructions
//===----------------------------------------------------------------------===//

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isBarrier = 1, isBranch = 1, isTerminator = 1, r1 = 0, r2 = 0 in
def B : Arch52Inst<0x51, (outs), (ins btarget16:$r3_imm), "B $r3_imm",
                [(br bb:$r3_imm)]>;

let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isCall = 1, isBranch = 1, isTerminator = 1, r2 = 0, r3_imm = 0 in
def BR : Arch52Inst<0x52, (outs), (ins GPR:$r1), "BR $r1",
                [(brind GPR:$r1)]>;

let isBarrier = 1, isReturn = 1, isTerminator = 1 in
def PseudoRET : Arch52PseudoInst<(outs), (ins), "# PseudoRET",
                [(arch52_ret)]>,
                PseudoInstExpansion<(BR R0)>;

def IsOrAdd: PatFrag<(ops node:$A, node:$B), (or node:$A, node:$B), [{
  return isOrEquivalentToAdd(N);
}]>;

// movli
let isAsCheapAsAMove = 1, isCodeGenOnly = 1, isReMaterializable = 1, r2 = 0 in
def MOVLI : Arch52Inst<0xAC, (outs GPR:$r1), (ins simm16:$r3_imm),
                    "MOVli $r1 $r3_imm",
                    [(set GPR:$r1, simm16:$r3_imm)]>;

// movhi
let isAsCheapAsAMove = 1, isCodeGenOnly = 1, isReMaterializable = 1, r2 = 0  in
def MOVHI : Arch52Inst<0xAF, (outs GPR:$r1), (ins simm16:$r3_imm),
                    "MOVhi $r1 $r3_imm", []>;

// add
let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in
def ADD : Arch52Inst<0x30, (outs GPR:$r1), (ins GPR:$r2, GPR:$r3_imm),
              "ADD $r1 $r2 $r3_imm", [(set GPR:$r1, (add GPR:$r2, GPR:$r3_imm))]>;

// sub
let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in
def SUB : Arch52Inst<0x31, (outs GPR:$r1), (ins GPR:$r2, GPR:$r3_imm),
              "SUB $r1 $r2 $r3_imm", [(set GPR:$r1, (sub GPR:$r2, GPR:$r3_imm))]>;

// mul
let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in
def MUL : Arch52Inst<0x32, (outs GPR:$r1), (ins GPR:$r2, GPR:$r3_imm),
              "MUL $r1 $r2 $r3_imm", [(set GPR:$r1, (mul GPR:$r2, GPR:$r3_imm))]>;

def BaseAddr : ComplexPattern<iPTR, 1, "SelectBaseAddr">;
def AddrFI : ComplexPattern<iPTR, 1, "SelectAddrFI", [frameindex], []>;

class PatBcc<CondCode Cond, Arch52Inst Inst>
    : Pat<(arch52_brcc GPR:$r1, GPR:$r2, Cond, bb:$r3_imm),
          (Inst GPR:$r1, GPR:$r2, btarget16:$r3_imm)>;

// store
let hasSideEffects = 0, mayLoad = 0, mayStore = 1 in
def STORE: Arch52Inst<0x32, (outs), (ins GPR:$r1, GPR:$r2, simm16:$r3_imm),
              "STORE $r1 ${r2} ${r3_imm}",
              []>;
def : Pat<(store (i32 GPR:$r1), BaseAddr:$r2),
        (STORE GPR:$r1, BaseAddr:$r2, 0)>;
def : Pat<(store (i32 GPR:$r1), (add BaseAddr:$r2, simm16:$r3_imm)),
        (STORE GPR:$r1, BaseAddr:$r2, simm16:$r3_imm)>;
def : Pat<(store (i32 GPR:$r1), (IsOrAdd AddrFI:$r2, simm16:$r3_imm)),
         (STORE GPR:$r1, AddrFI:$r2, simm16:$r3_imm)>;

// load
let hasSideEffects = 0, mayLoad = 1, mayStore = 0 in
def LOAD: Arch52Inst<0x33, (outs GPR:$r1), (ins GPR:$r2, simm16:$r3_imm),
              "LOAD $r1 ${r2} ${r3_imm}",
              []>;
def : Pat<(i32 (load BaseAddr:$r2)), (LOAD BaseAddr:$r2, 0)>;
def : Pat<(i32 (load (add BaseAddr:$r2, simm16:$r3_imm))),
          (LOAD BaseAddr:$r2, simm16:$r3_imm)>;
def : Pat<(i32 (load (IsOrAdd AddrFI:$r2, simm16:$r3_imm))),
           (LOAD AddrFI:$r2, simm16:$r3_imm)>;


// ORI
let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in
def ORI : Arch52Inst<0x44, (outs GPR:$r1), (ins GPR:$r2, simm16:$r3_imm),
                  "ORi $r1 $r2 $r3_imm", [(set GPR:$r1, (or GPR:$r2, simm16:$r3_imm))]>;



let hasSideEffects = 0, mayLoad = 0, mayStore = 0, isBranch = 1, isTerminator = 1 in
class BranchCC<bits<8> op, string opcodestr>
    : Arch52Inst<op, (outs), (ins GPR:$r1, GPR:$r2, btarget16:$r3_imm),
              !strconcat(opcodestr, " $r1 $r2 $r3_imm"), []>;

def BEQ  : BranchCC<0x70, "B.EQ">;
def BNE  : BranchCC<0x71, "B.NE">;
def BLE  : BranchCC<0x72, "B.LE">;
def BGT  : BranchCC<0x73, "B.GT">;
def BLEU  : BranchCC<0x74, "B.LEU">;
def BGTU  : BranchCC<0x75, "B.GTU">;

def : PatBcc<SETEQ, BEQ>;
def : PatBcc<SETNE, BNE>;
def : PatBcc<SETLE, BLE>;
def : PatBcc<SETGT, BGT>;
def : PatBcc<SETULE, BLEU>;
def : PatBcc<SETUGT, BGTU>;

let hasSideEffects = false, mayLoad = false, mayStore = false in
class Shifts<bits<8> op, SDPatternOperator OpNode, string opcodestr>
    : Arch52Inst<op, (outs GPR:$r1), (ins GPR:$r2, simm16:$r3_imm),
                !strconcat(opcodestr, " $r1, $r2, $r3_imm"),
                [(set GPR:$r1, (OpNode GPR:$r2, simm16:$r3_imm))]>;


def SRL : Shifts<0x81, srl, "SRL">;
def SRA : Shifts<0x82, sra, "SRA">;
def SHL : Shifts<0x83, shl, "SHL">;


// putdisplaypixel
def PUTDISPLAYPIXEL : Arch52Inst<0xBB, (outs), (ins GPR:$r1, GPR:$r2, GPR:$r3_imm),
                                "PUTDISPLAYPIXEL $r1 $r2 $r3_imm", [(int_arch52_putdisplaypixel GPR:$r1, GPR:$r2, GPR:$r3_imm)]>;

// flush
let r1 = 0, r2 = 0, r3_imm = 0 in
def FLUSH : Arch52Inst<0xAA, (outs), (ins), "FLUSH", [(int_arch52_flush)]>;

// neighbors
// def NEIGHBORS : Arch52Inst<0xCC, (outs GPR:$r1), (ins GPR:$r2, GPR:$r3_imm),
//                              "NEIGHBORS $r1 $r2 $r3_imm", [(set GPR:$r1, (int_arch52_neighbors GPR:$r2, GPR:$r3_imm))]>;

//===----------------------------------------------------------------------===//
// Arch52 Other patterns
//===----------------------------------------------------------------------===//

// i32 imm
def : Pat<(i32 imm:$r3_imm), (ORI (MOVHI (HI16 imm:$r3_imm)), (LI16 imm:$r3_imm))>;