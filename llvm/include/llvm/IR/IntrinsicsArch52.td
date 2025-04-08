let TargetPrefix = "arch52" in { // Intrinsic starts with "llvm.arch52."

def int_arch52_putdisplaypixel: ClangBuiltin<"arch52PutDisplayPixel">,
    Intrinsic<[], [llvm_i32_ty, llvm_i32_ty, llvm_i32_ty], [IntrNoMem, IntrHasSideEffects]>;

def int_arch52_flush: ClangBuiltin<"arch52Flush">,
    Intrinsic<[], [], [IntrNoMem, IntrHasSideEffects]>;

// def int_arch52_neighbors: ClangBuiltin<"arch52Neighbors">,
//   Intrinsic<[llvm_i32_ty], [llvm_ptr_ty, llvm_i32_ty], [IntrHasSideEffects]>;

} // TargetPrefix = "arch52"