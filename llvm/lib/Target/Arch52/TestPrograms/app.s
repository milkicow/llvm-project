	.text
	.file	"app.c"
	.globl	app                             ; -- Begin function app
	.type	app,@function
app:                                    ; @app
; %bb.0:                                ; %entry
	MOVli r2 0
	STORE r2 r1 56
	B .LBB0_1
.LBB0_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD r2 r1 56
	MOVli r4 1249
	B.GT r2 r4 .LBB0_4
	B .LBB0_2
.LBB0_2:                                ; %for.body
                                        ;   in Loop: Header=BB0_1 Depth=1
	LOAD r2 r1 56
	SHL r2, r2, 2
	ADD r4 r1 5060
	ADD r2 r4 r2
	MOVli r4 0
	STORE r4 r2 0
	LOAD r2 r1 56
	SHL r2, r2, 2
	ADD r9 r1 60
	ADD r2 r9 r2
	STORE r4 r2 0
	B .LBB0_3
.LBB0_3:                                ; %for.inc
                                        ;   in Loop: Header=BB0_1 Depth=1
	LOAD r2 r1 56
	MOVli r4 1
	ADD r2 r2 r4
	STORE r2 r1 56
	B .LBB0_1
.LBB0_4:                                ; %for.end
	MOVli r2 1
	STORE r2 r1 5268
	STORE r2 r1 5472
	STORE r2 r1 5476
	STORE r2 r1 5668
	STORE r2 r1 5672
	ADD r2 r1 5060
	STORE r2 r1 52
	ADD r2 r1 60
	STORE r2 r1 48
	MOVli r2 0
	STORE r2 r1 44
	B .LBB0_5
.LBB0_5:                                ; %for.cond8
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_7 Depth 2
                                        ;       Child Loop BB0_9 Depth 3
                                        ;     Child Loop BB0_18 Depth 2
                                        ;       Child Loop BB0_20 Depth 3
                                        ;         Child Loop BB0_22 Depth 4
                                        ;           Child Loop BB0_24 Depth 5
	LOAD r2 r1 44
	MOVli r4 999
	B.GT r2 r4 .LBB0_55
	B .LBB0_6
.LBB0_6:                                ; %for.body10
                                        ;   in Loop: Header=BB0_5 Depth=1
	MOVli r2 0
	STORE r2 r1 40
	B .LBB0_7
.LBB0_7:                                ; %for.cond11
                                        ;   Parent Loop BB0_5 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_9 Depth 3
	LOAD r2 r1 40
	MOVli r4 24
	B.GT r2 r4 .LBB0_17
	B .LBB0_8
.LBB0_8:                                ; %for.body13
                                        ;   in Loop: Header=BB0_7 Depth=2
	MOVli r2 0
	STORE r2 r1 36
	B .LBB0_9
.LBB0_9:                                ; %for.cond14
                                        ;   Parent Loop BB0_5 Depth=1
                                        ;     Parent Loop BB0_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD r2 r1 36
	MOVli r4 49
	B.GT r2 r4 .LBB0_15
	B .LBB0_10
.LBB0_10:                               ; %for.body16
                                        ;   in Loop: Header=BB0_9 Depth=3
	LOAD r2 r1 52
	LOAD r4 r1 40
	MOVli r9 50
	MUL r4 r4 r9
	LOAD r9 r1 36
	ADD r4 r4 r9
	SHL r4, r4, 2
	ADD r2 r2 r4
	LOAD r2 r2 0
	MOVli r4 0
	B.EQ r2 r4 .LBB0_12
	B .LBB0_11
.LBB0_11:                               ; %if.then
                                        ;   in Loop: Header=BB0_9 Depth=3
	LOAD r2 r1 36
	LOAD r4 r1 40
	MOVhi r9 65280
	ORi r9 r9 0
	PUTDISPLAYPIXEL r2 r4 r9
	B .LBB0_13
.LBB0_12:                               ; %if.else
                                        ;   in Loop: Header=BB0_9 Depth=3
	LOAD r2 r1 36
	LOAD r4 r1 40
	MOVhi r9 65535
	ORi r9 r9 65535
	PUTDISPLAYPIXEL r2 r4 r9
	B .LBB0_13
.LBB0_13:                               ; %if.end
                                        ;   in Loop: Header=BB0_9 Depth=3
	B .LBB0_14
.LBB0_14:                               ; %for.inc18
                                        ;   in Loop: Header=BB0_9 Depth=3
	LOAD r2 r1 36
	MOVli r4 1
	ADD r2 r2 r4
	STORE r2 r1 36
	B .LBB0_9
.LBB0_15:                               ; %for.end20
                                        ;   in Loop: Header=BB0_7 Depth=2
	B .LBB0_16
.LBB0_16:                               ; %for.inc21
                                        ;   in Loop: Header=BB0_7 Depth=2
	LOAD r2 r1 40
	MOVli r4 1
	ADD r2 r2 r4
	STORE r2 r1 40
	B .LBB0_7
.LBB0_17:                               ; %for.end23
                                        ;   in Loop: Header=BB0_5 Depth=1
	FLUSH
	MOVli r2 0
	STORE r2 r1 32
	B .LBB0_18
.LBB0_18:                               ; %for.cond25
                                        ;   Parent Loop BB0_5 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_20 Depth 3
                                        ;         Child Loop BB0_22 Depth 4
                                        ;           Child Loop BB0_24 Depth 5
	LOAD r2 r1 32
	MOVli r4 24
	B.GT r2 r4 .LBB0_53
	B .LBB0_19
.LBB0_19:                               ; %for.body27
                                        ;   in Loop: Header=BB0_18 Depth=2
	MOVli r2 0
	STORE r2 r1 28
	B .LBB0_20
.LBB0_20:                               ; %for.cond29
                                        ;   Parent Loop BB0_5 Depth=1
                                        ;     Parent Loop BB0_18 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_22 Depth 4
                                        ;           Child Loop BB0_24 Depth 5
	LOAD r2 r1 28
	MOVli r4 49
	B.GT r2 r4 .LBB0_51
	B .LBB0_21
.LBB0_21:                               ; %for.body31
                                        ;   in Loop: Header=BB0_20 Depth=3
	MOVli r2 0
	STORE r2 r1 24
	LOAD r2 r1 32
	MOVhi r4 65535
	ORi r4 r4 65535
	ADD r2 r2 r4
	STORE r2 r1 20
	B .LBB0_22
.LBB0_22:                               ; %for.cond32
                                        ;   Parent Loop BB0_5 Depth=1
                                        ;     Parent Loop BB0_18 Depth=2
                                        ;       Parent Loop BB0_20 Depth=3
                                        ; =>      This Loop Header: Depth=4
                                        ;           Child Loop BB0_24 Depth 5
	LOAD r2 r1 20
	LOAD r4 r1 32
	MOVli r9 1
	ADD r4 r4 r9
	B.GT r2 r4 .LBB0_42
	B .LBB0_23
.LBB0_23:                               ; %for.body35
                                        ;   in Loop: Header=BB0_22 Depth=4
	LOAD r2 r1 28
	MOVhi r4 65535
	ORi r4 r4 65535
	ADD r2 r2 r4
	STORE r2 r1 16
	B .LBB0_24
.LBB0_24:                               ; %for.cond37
                                        ;   Parent Loop BB0_5 Depth=1
                                        ;     Parent Loop BB0_18 Depth=2
                                        ;       Parent Loop BB0_20 Depth=3
                                        ;         Parent Loop BB0_22 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
	LOAD r2 r1 16
	LOAD r4 r1 28
	MOVli r9 1
	ADD r4 r4 r9
	B.GT r2 r4 .LBB0_40
	B .LBB0_25
.LBB0_25:                               ; %for.body40
                                        ;   in Loop: Header=BB0_24 Depth=5
	LOAD r2 r1 16
	LOAD r4 r1 28
	B.NE r2 r4 .LBB0_28
	B .LBB0_26
.LBB0_26:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB0_24 Depth=5
	LOAD r2 r1 20
	LOAD r4 r1 32
	B.NE r2 r4 .LBB0_28
	B .LBB0_27
.LBB0_27:                               ; %if.then43
                                        ;   in Loop: Header=BB0_24 Depth=5
	B .LBB0_39
.LBB0_28:                               ; %if.end44
                                        ;   in Loop: Header=BB0_24 Depth=5
	LOAD r2 r1 16
	STORE r2 r1 12
	LOAD r2 r1 20
	STORE r2 r1 8
	LOAD r2 r1 12
	MOVhi r4 65535
	ORi r4 r4 65535
	B.GT r2 r4 .LBB0_30
	B .LBB0_29
.LBB0_29:                               ; %if.then46
                                        ;   in Loop: Header=BB0_24 Depth=5
	MOVli r2 49
	STORE r2 r1 12
	B .LBB0_33
.LBB0_30:                               ; %if.else47
                                        ;   in Loop: Header=BB0_24 Depth=5
	LOAD r2 r1 12
	MOVli r4 50
	B.GT r4 r2 .LBB0_32
	B .LBB0_31
.LBB0_31:                               ; %if.then49
                                        ;   in Loop: Header=BB0_24 Depth=5
	MOVli r2 0
	STORE r2 r1 12
	B .LBB0_32
.LBB0_32:                               ; %if.end50
                                        ;   in Loop: Header=BB0_24 Depth=5
	B .LBB0_33
.LBB0_33:                               ; %if.end51
                                        ;   in Loop: Header=BB0_24 Depth=5
	LOAD r2 r1 8
	MOVhi r4 65535
	ORi r4 r4 65535
	B.GT r2 r4 .LBB0_35
	B .LBB0_34
.LBB0_34:                               ; %if.then53
                                        ;   in Loop: Header=BB0_24 Depth=5
	MOVli r2 24
	STORE r2 r1 8
	B .LBB0_38
.LBB0_35:                               ; %if.else54
                                        ;   in Loop: Header=BB0_24 Depth=5
	LOAD r2 r1 8
	MOVli r4 25
	B.GT r4 r2 .LBB0_37
	B .LBB0_36
.LBB0_36:                               ; %if.then56
                                        ;   in Loop: Header=BB0_24 Depth=5
	MOVli r2 0
	STORE r2 r1 8
	B .LBB0_37
.LBB0_37:                               ; %if.end57
                                        ;   in Loop: Header=BB0_24 Depth=5
	B .LBB0_38
.LBB0_38:                               ; %if.end58
                                        ;   in Loop: Header=BB0_24 Depth=5
	LOAD r2 r1 52
	LOAD r4 r1 8
	MOVli r9 50
	MUL r4 r4 r9
	LOAD r9 r1 12
	ADD r4 r4 r9
	SHL r4, r4, 2
	ADD r2 r2 r4
	LOAD r2 r2 0
	LOAD r4 r1 24
	ADD r2 r4 r2
	STORE r2 r1 24
	B .LBB0_39
.LBB0_39:                               ; %for.inc63
                                        ;   in Loop: Header=BB0_24 Depth=5
	LOAD r2 r1 16
	MOVli r4 1
	ADD r2 r2 r4
	STORE r2 r1 16
	B .LBB0_24
.LBB0_40:                               ; %for.end65
                                        ;   in Loop: Header=BB0_22 Depth=4
	B .LBB0_41
.LBB0_41:                               ; %for.inc66
                                        ;   in Loop: Header=BB0_22 Depth=4
	LOAD r2 r1 20
	MOVli r4 1
	ADD r2 r2 r4
	STORE r2 r1 20
	B .LBB0_22
.LBB0_42:                               ; %for.end68
                                        ;   in Loop: Header=BB0_20 Depth=3
	LOAD r2 r1 52
	LOAD r4 r1 32
	MOVli r9 50
	MUL r4 r4 r9
	LOAD r9 r1 28
	ADD r4 r4 r9
	SHL r4, r4, 2
	ADD r2 r2 r4
	LOAD r2 r2 0
	STORE r2 r1 4
	LOAD r2 r1 24
	MOVli r4 3
	B.NE r2 r4 .LBB0_44
	B .LBB0_43
.LBB0_43:                               ; %if.then73
                                        ;   in Loop: Header=BB0_20 Depth=3
	LOAD r2 r1 48
	LOAD r4 r1 32
	MOVli r9 50
	MUL r4 r4 r9
	LOAD r9 r1 28
	ADD r4 r4 r9
	SHL r4, r4, 2
	ADD r2 r2 r4
	MOVli r4 1
	STORE r4 r2 0
	B .LBB0_49
.LBB0_44:                               ; %if.else77
                                        ;   in Loop: Header=BB0_20 Depth=3
	LOAD r2 r1 24
	MOVli r4 2
	B.NE r2 r4 .LBB0_47
	B .LBB0_45
.LBB0_45:                               ; %land.lhs.true79
                                        ;   in Loop: Header=BB0_20 Depth=3
	LOAD r2 r1 4
	MOVli r4 0
	B.EQ r2 r4 .LBB0_47
	B .LBB0_46
.LBB0_46:                               ; %if.then81
                                        ;   in Loop: Header=BB0_20 Depth=3
	LOAD r2 r1 48
	LOAD r4 r1 32
	MOVli r9 50
	MUL r4 r4 r9
	LOAD r9 r1 28
	ADD r4 r4 r9
	SHL r4, r4, 2
	ADD r2 r2 r4
	MOVli r4 1
	STORE r4 r2 0
	B .LBB0_48
.LBB0_47:                               ; %if.else85
                                        ;   in Loop: Header=BB0_20 Depth=3
	LOAD r2 r1 48
	LOAD r4 r1 32
	MOVli r9 50
	MUL r4 r4 r9
	LOAD r9 r1 28
	ADD r4 r4 r9
	SHL r4, r4, 2
	ADD r2 r2 r4
	MOVli r4 0
	STORE r4 r2 0
	B .LBB0_48
.LBB0_48:                               ; %if.end89
                                        ;   in Loop: Header=BB0_20 Depth=3
	B .LBB0_49
.LBB0_49:                               ; %if.end90
                                        ;   in Loop: Header=BB0_20 Depth=3
	B .LBB0_50
.LBB0_50:                               ; %for.inc91
                                        ;   in Loop: Header=BB0_20 Depth=3
	LOAD r2 r1 28
	MOVli r4 1
	ADD r2 r2 r4
	STORE r2 r1 28
	B .LBB0_20
.LBB0_51:                               ; %for.end93
                                        ;   in Loop: Header=BB0_18 Depth=2
	B .LBB0_52
.LBB0_52:                               ; %for.inc94
                                        ;   in Loop: Header=BB0_18 Depth=2
	LOAD r2 r1 32
	MOVli r4 1
	ADD r2 r2 r4
	STORE r2 r1 32
	B .LBB0_18
.LBB0_53:                               ; %for.end96
                                        ;   in Loop: Header=BB0_5 Depth=1
	LOAD r2 r1 52
	STORE r2 r1 0
	LOAD r2 r1 48
	STORE r2 r1 52
	LOAD r2 r1 0
	STORE r2 r1 48
	B .LBB0_54
.LBB0_54:                               ; %for.inc97
                                        ;   in Loop: Header=BB0_5 Depth=1
	LOAD r2 r1 44
	MOVli r4 1
	ADD r2 r2 r4
	STORE r2 r1 44
	B .LBB0_5
.LBB0_55:                               ; %for.end99
	BR r0
.Lfunc_end0:
	.size	app, .Lfunc_end0-app
                                        ; -- End function
	.ident	"clang version 19.1.0 (https://github.com/llvm/llvm-project.git 6daae48d3962e0cb1b0c133043fbe86fd629a943)"
	.section	".note.GNU-stack","",@progbits
