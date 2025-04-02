add_llvm_component_library(LLVMArch52Desc
  Arch52MCTargetDesc.cpp
  Arch52MCAsmInfo.cpp
  Arch52InstPrinter.cpp
  Arch52MCCodeEmitter.cpp
  Arch52AsmBackend.cpp
  Arch52ELFObjectWriter.cpp

  LINK_COMPONENTS
  MC
  Support
  Arch52Info

  ADD_TO_COMPONENT
  Arch52
 )