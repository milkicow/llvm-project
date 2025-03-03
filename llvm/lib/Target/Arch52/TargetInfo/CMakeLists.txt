add_llvm_component_library(LLVMArch52Info
  Arch52TargetInfo.cpp

  LINK_COMPONENTS
  MC
  Support

  ADD_TO_COMPONENT
  Arch52
  )