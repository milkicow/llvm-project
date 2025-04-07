#include "Arch52.h"
#include "clang/Basic/Builtins.h"
#include "clang/Basic/MacroBuilder.h"

using namespace clang;
using namespace clang::targets;

void Arch52TargetInfo::getTargetDefines(const LangOptions &Opts,
                                        MacroBuilder &Builder) const {
  Builder.defineMacro("__arch52__");
}

ArrayRef<Builtin::Info> Arch52TargetInfo::getTargetBuiltins() const {
  return std::nullopt;
}