add_llvm_component_library(LLVMArch52Desc
  Arch52MCTargetDesc.cpp
  Arch52MCAsmInfo.cpp
  Arch52InstPrinter.cpp
  Arch52MCCodeEmitter.cpp

  LINK_COMPONENTS
  MC
  Support
  Arch52Info

  ADD_TO_COMPONENT
  Arch52
 )