add_llvm_component_library(LLVMArch52Desc
  Arch52MCTargetDesc.cpp

  LINK_COMPONENTS
  MC
  Support
  Arch52Info

  ADD_TO_COMPONENT
  Arch52
 )