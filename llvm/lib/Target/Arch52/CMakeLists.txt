add_llvm_component_group(Arch52)

set(LLVM_TARGET_DEFINITIONS Arch52.td)

tablegen(LLVM Arch52GenRegisterInfo.inc -gen-register-info)
tablegen(LLVM Arch52GenInstrInfo.inc -gen-instr-info)
tablegen(LLVM Arch52GenSubtargetInfo.inc -gen-subtarget)

add_public_tablegen_target(Arch52CommonTabelGen)

add_llvm_target(Arch52CodeGen
  Arch52TargetMachine.cpp
  Arch52RegisterInfo.cpp
  Arch52InstrInfo.cpp
  Arch52Subtarget.cpp

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