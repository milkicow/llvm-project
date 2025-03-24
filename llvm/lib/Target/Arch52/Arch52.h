#ifndef LLVM_LIB_TARGET_Arch52_Arch52_H
#define LLVM_LIB_TARGET_Arch52_Arch52_H

#include "MCTargetDesc/Arch52MCTargetDesc.h"
#include "llvm/Support/raw_ostream.h"

#define ARCH52_DUMP(Color)                                                     \
  {                                                                            \
    llvm::errs().changeColor(Color)                                            \
        << __func__ << "\n\t\t" << __FILE__ << ":" << __LINE__ << "\n";        \
    llvm::errs().changeColor(llvm::raw_ostream::WHITE);                        \
  }

#define ARCH52_DUMP_RED ARCH52_DUMP(llvm::raw_ostream::RED)
#define ARCH52_DUMP_GREEN ARCH52_DUMP(llvm::raw_ostream::GREEN)
#define ARCH52_DUMP_YELLOW ARCH52_DUMP(llvm::raw_ostream::YELLOW)
#define ARCH52_DUMP_CYAN ARCH52_DUMP(llvm::raw_ostream::CYAN)
#define ARCH52_DUMP_MAGENTA ARCH52_DUMP(llvm::raw_ostream::MAGENTA)
#define ARCH52_DUMP_WHITE ARCH52_DUMP(llvm::raw_ostream::WHITE)

#endif // LLVM_LIB_TARGET_Arch52_Arch52_H
