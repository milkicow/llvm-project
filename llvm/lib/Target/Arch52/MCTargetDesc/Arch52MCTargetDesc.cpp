#include "../Arch52.h"
#include "llvm/Support/raw_ostream.h"

// We need to define this function for linking succeed
extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeArch52TargetMC() { ARCH52_DUMP_MAGENTA }