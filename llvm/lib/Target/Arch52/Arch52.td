include "llvm/Target/Target.td"
include "Arch52RegisterInfo.td"
include "Arch52InstrInfo.td"

class Proc<string Name, list<SubtargetFeature> Features>
    : Processor<Name, NoItineraries, Features>;

def : Proc<"generic", []>;

def Arch52InstrInfo : InstrInfo;
def Arch52 : Target {
    let InstructionSet = Arch52InstrInfo;
}