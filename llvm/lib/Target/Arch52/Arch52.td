include "llvm/Target/Target.td"
include "Arch52RegisterInfo.td"
include "Arch52InstrInfo.td"

def Arch52InstrInfo : InstrInfo;
def Arch52 : Target {
    let InstructionSet = Arch52InstrInfo;
}