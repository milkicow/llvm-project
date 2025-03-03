add_llvm_component_group(Arch52)

add_llvm_target(Arch52CodeGen
  Arch52TargetMachine.cpp

  LINK_COMPONENTS
  CodeGen
  Core
  Support
  Target
  Arch52Info

  ADD_TO_COMPONENT
  Arch52
  )

add_subdirectory(MCTargetDesc)
add_subdirectory(TargetInfo)