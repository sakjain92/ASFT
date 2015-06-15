; ModuleID = 'single.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-f128:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.INTC_tag = type { %struct.reg }
%struct.MC_CGM_tag = type { %struct.reg }
%struct.PSEUDO_REG_tag = type { %struct.reg, %struct.reg, %struct.reg, %struct.reg }
%struct.STM_STATE_tag = type { i32 }
%struct.STM_channel_tag = type { %struct.reg, %struct.reg, %struct.reg }
%struct.STM_tag = type { %struct.reg, %struct.reg, [4 x %struct.STM_channel_tag] }
%struct.reg = type { [100 x i8], i32, i32, i32, i32, i32, i32, i32 }

@.str = private constant [14 x i8] c"reg_selection\00", align 1
@.str1 = private constant [9 x i8] c"reg_data\00", align 1
@ALL_REG_COUNT.b = internal unnamed_addr global i1 false
@.str2 = private unnamed_addr constant [100 x i8] c"STM_CR\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\
@STM = internal global %struct.STM_tag zeroinitializer, align 32
@.str13 = private unnamed_addr constant [100 x i8] c"STM_CNT\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0
@.str24 = private unnamed_addr constant [100 x i8] c"STM_CHANNEL0_CCR\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0
@.str3 = private unnamed_addr constant [100 x i8] c"STM_CHANNEL0_CIF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00
@.str4 = private unnamed_addr constant [100 x i8] c"STM_CHANNEL0_CMP\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00
@.str5 = private unnamed_addr constant [100 x i8] c"STM_CHANNEL1_CCR\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00
@.str6 = private unnamed_addr constant [100 x i8] c"STM_CHANNEL1_CIF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00
@.str7 = private unnamed_addr constant [100 x i8] c"STM_CHANNEL1_CMP\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00
@.str8 = private unnamed_addr constant [100 x i8] c"INTC_IACKRO\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0
@INTC = internal global %struct.INTC_tag zeroinitializer, align 32
@.str9 = private unnamed_addr constant [100 x i8] c"MC_CGM_SC_DC2\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00
@MC_CGM = internal global %struct.INTC_tag zeroinitializer, align 32
@.str10 = private unnamed_addr constant [100 x i8] c"PSEUDO_REG_WAIT\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00
@PSEUDO_REG = internal unnamed_addr global %struct.PSEUDO_REG_tag zeroinitializer, align 32
@.str11 = private unnamed_addr constant [100 x i8] c"PSEUDO_REG_POR\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\
@.str12 = private unnamed_addr constant [100 x i8] c"PSEUDO_REG_DEBUG_ON\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0
@.str135 = private unnamed_addr constant [100 x i8] c"PSEUDO_REG_DBUG_OFF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\
@ALL_REG = internal unnamed_addr global [100 x %struct.reg*] zeroinitializer, align 32
@STM_STATE.0.b = internal unnamed_addr global i1 false
@.str14 = private constant [22 x i8] c"klee_div_zero_check.c\00"
@.str115 = private constant [15 x i8] c"divide by zero\00"
@.str216 = private constant [8 x i8] c"div.err\00"
@.str317 = private constant [8 x i8] c"IGNORED\00"
@.str1418 = private constant [16 x i8] c"overshift error\00"
@.str25 = private constant [14 x i8] c"overshift.err\00"
@.str619 = private constant [13 x i8] c"klee_range.c\00"
@.str17 = private constant [14 x i8] c"invalid range\00"
@.str28 = private constant [5 x i8] c"user\00"

define i32 @main() nounwind {
entry:
  %reg_selection = alloca [1 x i32], align 4
  %reg_data = alloca [1 x i32], align 4
  %reg_selection1 = getelementptr inbounds [1 x i32]* %reg_selection, i64 0, i64 0, !dbg !240
  %0 = call i32 (...)* @klee_make_symbolic(i32* %reg_selection1, i64 4, i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !240
  %reg_data2 = getelementptr inbounds [1 x i32]* %reg_data, i64 0, i64 0, !dbg !242
  %1 = call i32 (...)* @klee_make_symbolic(i32* %reg_data2, i64 4, i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !242
  call fastcc void @init_reg_por() nounwind, !dbg !243
  br label %bb3, !dbg !244

bb:                                               ; preds = %bb3
  %2 = sext i32 %storemerge to i64, !dbg !245
  %3 = getelementptr inbounds [1 x i32]* %reg_selection, i64 0, i64 %2, !dbg !245
  %4 = load i32* %3, align 4, !dbg !245
  %.b = load i1* @ALL_REG_COUNT.b, align 1
  %5 = select i1 %.b, i32 20, i32 0
  %6 = icmp ult i32 %4, %5, !dbg !245
  %7 = zext i1 %6 to i32, !dbg !245
  %8 = call i32 (...)* @klee_assume(i32 %7) nounwind, !dbg !245
  %9 = add nsw i32 %storemerge, 1, !dbg !244
  br label %bb3, !dbg !244

bb3:                                              ; preds = %bb, %entry
  %storemerge = phi i32 [ 0, %entry ], [ %9, %bb ]
  %10 = icmp slt i32 %storemerge, 1, !dbg !244
  br i1 %10, label %bb, label %bb4, !dbg !244

bb4:                                              ; preds = %bb3
  call fastcc void @init_reg_por() nounwind, !dbg !246
  br label %bb6, !dbg !247

bb5:                                              ; preds = %bb6
  %11 = sext i32 %storemerge1 to i64, !dbg !248
  %12 = getelementptr inbounds [1 x i32]* %reg_selection, i64 0, i64 %11, !dbg !248
  %13 = load i32* %12, align 4, !dbg !248
  %14 = zext i32 %13 to i64, !dbg !248
  %15 = getelementptr inbounds [100 x %struct.reg*]* @ALL_REG, i64 0, i64 %14, !dbg !248
  %16 = load %struct.reg** %15, align 8, !dbg !248
  %17 = getelementptr inbounds [1 x i32]* %reg_data, i64 0, i64 %11, !dbg !249
  %18 = load i32* %17, align 4, !dbg !249
  %19 = getelementptr inbounds %struct.reg* %16, i64 0, i32 1, !dbg !250
  %20 = load i32* %19, align 4, !dbg !250
  %21 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 0, i32 1), align 4, !dbg !250
  %22 = icmp eq i32 %20, %21, !dbg !250
  br i1 %22, label %bb.i, label %bb1.i, !dbg !250

bb.i:                                             ; preds = %bb5
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !253
  br label %model_write_reg.exit, !dbg !253

bb1.i:                                            ; preds = %bb5
  %23 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 1), align 4, !dbg !254
  %24 = icmp eq i32 %20, %23, !dbg !254
  br i1 %24, label %model_write_reg.exit, label %bb2.i, !dbg !254

bb2.i:                                            ; preds = %bb1.i
  %25 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 0, i32 1), align 4, !dbg !255
  %26 = icmp eq i32 %20, %25, !dbg !255
  br i1 %26, label %bb3.i, label %bb8.i, !dbg !255

bb3.i:                                            ; preds = %bb2.i
  %27 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 0, i32 7), align 4, !dbg !256
  br label %bb3.i.i, !dbg !258

bb.i.i:                                           ; preds = %bb3.i.i
  %int_cast_to_i641 = zext i32 %storemerge.i.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !260
  %28 = shl i32 1, %storemerge.i.i, !dbg !260
  %29 = and i32 %28, %27, !dbg !260
  %30 = icmp eq i32 %29, 0, !dbg !260
  %31 = select i1 %30, i32 0, i32 %28
  %return_val.i.i.1. = or i32 %return_val.i.i.1, %31
  %32 = add nsw i32 %storemerge.i.i, 1, !dbg !258
  br label %bb3.i.i, !dbg !258

bb3.i.i:                                          ; preds = %bb.i.i, %bb3.i
  %return_val.i.i.1 = phi i32 [ 0, %bb3.i ], [ %return_val.i.i.1., %bb.i.i ]
  %storemerge.i.i = phi i32 [ 0, %bb3.i ], [ %32, %bb.i.i ]
  %33 = icmp slt i32 %storemerge.i.i, 1, !dbg !258
  br i1 %33, label %bb.i.i, label %get_bit_val.exit.i, !dbg !258

get_bit_val.exit.i:                               ; preds = %bb3.i.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !261
  %34 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 0, i32 7), align 4, !dbg !262
  br label %bb3.i12.i, !dbg !263

bb.i8.i:                                          ; preds = %bb3.i12.i
  %int_cast_to_i642 = zext i32 %storemerge.i11.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !264
  %35 = shl i32 1, %storemerge.i11.i, !dbg !264
  %36 = and i32 %35, %34, !dbg !264
  %37 = icmp eq i32 %36, 0, !dbg !264
  %38 = select i1 %37, i32 0, i32 %35
  %return_val.i6.i.1. = or i32 %return_val.i6.i.1, %38
  %39 = add nsw i32 %storemerge.i11.i, 1, !dbg !263
  br label %bb3.i12.i, !dbg !263

bb3.i12.i:                                        ; preds = %bb.i8.i, %get_bit_val.exit.i
  %return_val.i6.i.1 = phi i32 [ 0, %get_bit_val.exit.i ], [ %return_val.i6.i.1., %bb.i8.i ]
  %storemerge.i11.i = phi i32 [ 0, %get_bit_val.exit.i ], [ %39, %bb.i8.i ]
  %40 = icmp slt i32 %storemerge.i11.i, 1, !dbg !263
  br i1 %40, label %bb.i8.i, label %get_bit_val.exit14.i, !dbg !263

get_bit_val.exit14.i:                             ; preds = %bb3.i12.i
  %41 = icmp eq i32 %return_val.i.i.1, 0, !dbg !265
  %42 = icmp eq i32 %return_val.i6.i.1, 1, !dbg !265
  %or.cond = and i1 %41, %42
  br i1 %or.cond, label %bb5.i, label %model_write_reg.exit, !dbg !265

bb5.i:                                            ; preds = %get_bit_val.exit14.i
  %43 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 2, i32 7), align 4, !dbg !266
  %44 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 7), align 4, !dbg !268
  %45 = icmp eq i32 %44, %43, !dbg !269
  br i1 %45, label %bb6.i, label %model_write_reg.exit, !dbg !269

bb6.i:                                            ; preds = %bb5.i
  %46 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 7), align 4, !dbg !270
  %47 = call fastcc i32 @change_bit_val(i32 %46, i32 1, i32 31, i32 1) nounwind, !dbg !270
  store i32 %47, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 7), align 4, !dbg !270
  %48 = load i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !273
  %49 = call fastcc i32 @change_bit_val(i32 %48, i32 36, i32 29, i32 10) nounwind, !dbg !273
  store i32 %49, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !273
  br label %model_write_reg.exit, !dbg !272

bb8.i:                                            ; preds = %bb2.i
  %50 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 1), align 4, !dbg !274
  %51 = icmp eq i32 %20, %50, !dbg !274
  br i1 %51, label %bb9.i, label %bb13.i, !dbg !274

bb9.i:                                            ; preds = %bb8.i
  %52 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 7), align 4, !dbg !275
  br label %bb3.i26.i, !dbg !277

bb.i22.i:                                         ; preds = %bb3.i26.i
  %int_cast_to_i643 = zext i32 %storemerge.i25.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i643), !dbg !278
  %53 = shl i32 1, %storemerge.i25.i, !dbg !278
  %54 = and i32 %53, %52, !dbg !278
  %55 = icmp eq i32 %54, 0, !dbg !278
  %56 = select i1 %55, i32 0, i32 %53
  %return_val.i20.i.1. = or i32 %return_val.i20.i.1, %56
  %57 = add nsw i32 %storemerge.i25.i, 1, !dbg !277
  br label %bb3.i26.i, !dbg !277

bb3.i26.i:                                        ; preds = %bb.i22.i, %bb9.i
  %return_val.i20.i.1 = phi i32 [ 0, %bb9.i ], [ %return_val.i20.i.1., %bb.i22.i ]
  %storemerge.i25.i = phi i32 [ 0, %bb9.i ], [ %57, %bb.i22.i ]
  %58 = icmp slt i32 %storemerge.i25.i, 1, !dbg !277
  br i1 %58, label %bb.i22.i, label %get_bit_val.exit28.i, !dbg !277

get_bit_val.exit28.i:                             ; preds = %bb3.i26.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !279
  %59 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 7), align 4, !dbg !280
  br label %bb3.i39.i, !dbg !281

bb.i35.i:                                         ; preds = %bb3.i39.i
  %int_cast_to_i644 = zext i32 %storemerge.i38.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i644), !dbg !282
  %60 = shl i32 1, %storemerge.i38.i, !dbg !282
  %61 = and i32 %60, %59, !dbg !282
  %62 = icmp eq i32 %61, 0, !dbg !282
  %63 = select i1 %62, i32 0, i32 %60
  %return_val.i33.i.1. = or i32 %return_val.i33.i.1, %63
  %64 = add nsw i32 %storemerge.i38.i, 1, !dbg !281
  br label %bb3.i39.i, !dbg !281

bb3.i39.i:                                        ; preds = %bb.i35.i, %get_bit_val.exit28.i
  %return_val.i33.i.1 = phi i32 [ 0, %get_bit_val.exit28.i ], [ %return_val.i33.i.1., %bb.i35.i ]
  %storemerge.i38.i = phi i32 [ 0, %get_bit_val.exit28.i ], [ %64, %bb.i35.i ]
  %65 = icmp slt i32 %storemerge.i38.i, 1, !dbg !281
  br i1 %65, label %bb.i35.i, label %get_bit_val.exit41.i, !dbg !281

get_bit_val.exit41.i:                             ; preds = %bb3.i39.i
  %66 = icmp eq i32 %return_val.i20.i.1, 1, !dbg !283
  %67 = icmp eq i32 %return_val.i33.i.1, 0, !dbg !283
  %or.cond2 = and i1 %66, %67
  br i1 %or.cond2, label %bb11.i, label %model_write_reg.exit, !dbg !283

bb11.i:                                           ; preds = %get_bit_val.exit41.i
  %68 = call fastcc i32 @change_bit_val(i32 %59, i32 0, i32 31, i32 1) nounwind, !dbg !284
  store i32 %68, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 7), align 4, !dbg !284
  %69 = load i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !287
  %70 = call fastcc i32 @change_bit_val(i32 %69, i32 0, i32 29, i32 10) nounwind, !dbg !287
  store i32 %70, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !287
  br label %model_write_reg.exit, !dbg !286

bb13.i:                                           ; preds = %bb8.i
  %71 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 2, i32 1), align 4, !dbg !288
  %72 = icmp eq i32 %20, %71, !dbg !288
  br i1 %72, label %bb14.i, label %bb15.i, !dbg !288

bb14.i:                                           ; preds = %bb13.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !289
  br label %model_write_reg.exit, !dbg !289

bb15.i:                                           ; preds = %bb13.i
  %73 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 0, i32 1), align 4, !dbg !290
  %74 = icmp eq i32 %20, %73, !dbg !290
  br i1 %74, label %bb16.i, label %bb25.i, !dbg !290

bb16.i:                                           ; preds = %bb15.i
  %75 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 0, i32 7), align 4, !dbg !291
  br label %bb3.i52.i, !dbg !293

bb.i48.i:                                         ; preds = %bb3.i52.i
  %int_cast_to_i645 = zext i32 %storemerge.i51.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i645), !dbg !294
  %76 = shl i32 1, %storemerge.i51.i, !dbg !294
  %77 = and i32 %76, %75, !dbg !294
  %78 = icmp eq i32 %77, 0, !dbg !294
  %79 = select i1 %78, i32 0, i32 %76
  %return_val.i46.i.1. = or i32 %return_val.i46.i.1, %79
  %80 = add nsw i32 %storemerge.i51.i, 1, !dbg !293
  br label %bb3.i52.i, !dbg !293

bb3.i52.i:                                        ; preds = %bb.i48.i, %bb16.i
  %return_val.i46.i.1 = phi i32 [ 0, %bb16.i ], [ %return_val.i46.i.1., %bb.i48.i ]
  %storemerge.i51.i = phi i32 [ 0, %bb16.i ], [ %80, %bb.i48.i ]
  %81 = icmp slt i32 %storemerge.i51.i, 1, !dbg !293
  br i1 %81, label %bb.i48.i, label %get_bit_val.exit54.i, !dbg !293

get_bit_val.exit54.i:                             ; preds = %bb3.i52.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !295
  %82 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 0, i32 7), align 4, !dbg !296
  br label %bb3.i65.i, !dbg !297

bb.i61.i:                                         ; preds = %bb3.i65.i
  %int_cast_to_i646 = zext i32 %storemerge.i64.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i646), !dbg !298
  %83 = shl i32 1, %storemerge.i64.i, !dbg !298
  %84 = and i32 %83, %82, !dbg !298
  %85 = icmp eq i32 %84, 0, !dbg !298
  %86 = select i1 %85, i32 0, i32 %83
  %return_val.i59.i.1. = or i32 %return_val.i59.i.1, %86
  %87 = add nsw i32 %storemerge.i64.i, 1, !dbg !297
  br label %bb3.i65.i, !dbg !297

bb3.i65.i:                                        ; preds = %bb.i61.i, %get_bit_val.exit54.i
  %return_val.i59.i.1 = phi i32 [ 0, %get_bit_val.exit54.i ], [ %return_val.i59.i.1., %bb.i61.i ]
  %storemerge.i64.i = phi i32 [ 0, %get_bit_val.exit54.i ], [ %87, %bb.i61.i ]
  %88 = icmp slt i32 %storemerge.i64.i, 1, !dbg !297
  br i1 %88, label %bb.i61.i, label %get_bit_val.exit67.i, !dbg !297

get_bit_val.exit67.i:                             ; preds = %bb3.i65.i
  %89 = icmp eq i32 %return_val.i46.i.1, 0, !dbg !299
  %90 = icmp eq i32 %return_val.i59.i.1, 1, !dbg !299
  %or.cond3 = and i1 %89, %90
  br i1 %or.cond3, label %bb20.i, label %model_write_reg.exit, !dbg !299

bb20.i:                                           ; preds = %get_bit_val.exit67.i
  %91 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 2, i32 7), align 4, !dbg !300
  %92 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 7), align 4, !dbg !302
  %93 = icmp eq i32 %92, %91, !dbg !303
  br i1 %93, label %bb23.i, label %model_write_reg.exit, !dbg !303

bb23.i:                                           ; preds = %bb20.i
  %94 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 7), align 4, !dbg !304
  %95 = call fastcc i32 @change_bit_val(i32 %94, i32 1, i32 31, i32 1) nounwind, !dbg !304
  store i32 %95, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 7), align 4, !dbg !304
  %96 = load i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !306
  %97 = call fastcc i32 @change_bit_val(i32 %96, i32 37, i32 29, i32 10) nounwind, !dbg !306
  store i32 %97, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !306
  br label %model_write_reg.exit, !dbg !305

bb25.i:                                           ; preds = %bb15.i
  %98 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 1), align 4, !dbg !307
  %99 = icmp eq i32 %20, %98, !dbg !307
  br i1 %99, label %bb26.i, label %bb32.i, !dbg !307

bb26.i:                                           ; preds = %bb25.i
  %100 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 7), align 4, !dbg !308
  br label %bb3.i80.i, !dbg !310

bb.i76.i:                                         ; preds = %bb3.i80.i
  %int_cast_to_i647 = zext i32 %storemerge.i79.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i647), !dbg !311
  %101 = shl i32 1, %storemerge.i79.i, !dbg !311
  %102 = and i32 %101, %100, !dbg !311
  %103 = icmp eq i32 %102, 0, !dbg !311
  %104 = select i1 %103, i32 0, i32 %101
  %return_val.i74.i.1. = or i32 %return_val.i74.i.1, %104
  %105 = add nsw i32 %storemerge.i79.i, 1, !dbg !310
  br label %bb3.i80.i, !dbg !310

bb3.i80.i:                                        ; preds = %bb.i76.i, %bb26.i
  %return_val.i74.i.1 = phi i32 [ 0, %bb26.i ], [ %return_val.i74.i.1., %bb.i76.i ]
  %storemerge.i79.i = phi i32 [ 0, %bb26.i ], [ %105, %bb.i76.i ]
  %106 = icmp slt i32 %storemerge.i79.i, 1, !dbg !310
  br i1 %106, label %bb.i76.i, label %get_bit_val.exit82.i, !dbg !310

get_bit_val.exit82.i:                             ; preds = %bb3.i80.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !312
  %107 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 7), align 4, !dbg !313
  br label %bb3.i93.i, !dbg !314

bb.i89.i:                                         ; preds = %bb3.i93.i
  %int_cast_to_i648 = zext i32 %storemerge.i92.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i648), !dbg !315
  %108 = shl i32 1, %storemerge.i92.i, !dbg !315
  %109 = and i32 %108, %107, !dbg !315
  %110 = icmp eq i32 %109, 0, !dbg !315
  %111 = select i1 %110, i32 0, i32 %108
  %return_val.i87.i.1. = or i32 %return_val.i87.i.1, %111
  %112 = add nsw i32 %storemerge.i92.i, 1, !dbg !314
  br label %bb3.i93.i, !dbg !314

bb3.i93.i:                                        ; preds = %bb.i89.i, %get_bit_val.exit82.i
  %return_val.i87.i.1 = phi i32 [ 0, %get_bit_val.exit82.i ], [ %return_val.i87.i.1., %bb.i89.i ]
  %storemerge.i92.i = phi i32 [ 0, %get_bit_val.exit82.i ], [ %112, %bb.i89.i ]
  %113 = icmp slt i32 %storemerge.i92.i, 1, !dbg !314
  br i1 %113, label %bb.i89.i, label %get_bit_val.exit95.i, !dbg !314

get_bit_val.exit95.i:                             ; preds = %bb3.i93.i
  %114 = icmp eq i32 %return_val.i74.i.1, 1, !dbg !316
  %115 = icmp eq i32 %return_val.i87.i.1, 0, !dbg !316
  %or.cond4 = and i1 %114, %115
  br i1 %or.cond4, label %bb30.i, label %model_write_reg.exit, !dbg !316

bb30.i:                                           ; preds = %get_bit_val.exit95.i
  %116 = call fastcc i32 @change_bit_val(i32 %107, i32 0, i32 31, i32 1) nounwind, !dbg !317
  store i32 %116, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 7), align 4, !dbg !317
  %117 = load i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !319
  %118 = call fastcc i32 @change_bit_val(i32 %117, i32 0, i32 29, i32 10) nounwind, !dbg !319
  store i32 %118, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !319
  br label %model_write_reg.exit, !dbg !318

bb32.i:                                           ; preds = %bb25.i
  %119 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 2, i32 1), align 4, !dbg !320
  %120 = icmp eq i32 %20, %119, !dbg !320
  br i1 %120, label %bb33.i, label %bb34.i, !dbg !320

bb33.i:                                           ; preds = %bb32.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !321
  br label %model_write_reg.exit, !dbg !321

bb34.i:                                           ; preds = %bb32.i
  %121 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 0, i32 1), align 4, !dbg !322
  %122 = icmp eq i32 %20, %121, !dbg !322
  br i1 %122, label %bb35.i, label %bb44.i, !dbg !322

bb35.i:                                           ; preds = %bb34.i
  %123 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 0, i32 7), align 4, !dbg !323
  br label %bb3.i106.i, !dbg !325

bb.i102.i:                                        ; preds = %bb3.i106.i
  %int_cast_to_i649 = zext i32 %storemerge.i105.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i649), !dbg !326
  %124 = shl i32 1, %storemerge.i105.i, !dbg !326
  %125 = and i32 %124, %123, !dbg !326
  %126 = icmp eq i32 %125, 0, !dbg !326
  %127 = select i1 %126, i32 0, i32 %124
  %return_val.i100.i.1. = or i32 %return_val.i100.i.1, %127
  %128 = add nsw i32 %storemerge.i105.i, 1, !dbg !325
  br label %bb3.i106.i, !dbg !325

bb3.i106.i:                                       ; preds = %bb.i102.i, %bb35.i
  %return_val.i100.i.1 = phi i32 [ 0, %bb35.i ], [ %return_val.i100.i.1., %bb.i102.i ]
  %storemerge.i105.i = phi i32 [ 0, %bb35.i ], [ %128, %bb.i102.i ]
  %129 = icmp slt i32 %storemerge.i105.i, 1, !dbg !325
  br i1 %129, label %bb.i102.i, label %get_bit_val.exit108.i, !dbg !325

get_bit_val.exit108.i:                            ; preds = %bb3.i106.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !327
  %130 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 0, i32 7), align 4, !dbg !328
  br label %bb3.i119.i, !dbg !329

bb.i115.i:                                        ; preds = %bb3.i119.i
  %int_cast_to_i6410 = zext i32 %storemerge.i118.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6410), !dbg !330
  %131 = shl i32 1, %storemerge.i118.i, !dbg !330
  %132 = and i32 %131, %130, !dbg !330
  %133 = icmp eq i32 %132, 0, !dbg !330
  %134 = select i1 %133, i32 0, i32 %131
  %return_val.i113.i.1. = or i32 %return_val.i113.i.1, %134
  %135 = add nsw i32 %storemerge.i118.i, 1, !dbg !329
  br label %bb3.i119.i, !dbg !329

bb3.i119.i:                                       ; preds = %bb.i115.i, %get_bit_val.exit108.i
  %return_val.i113.i.1 = phi i32 [ 0, %get_bit_val.exit108.i ], [ %return_val.i113.i.1., %bb.i115.i ]
  %storemerge.i118.i = phi i32 [ 0, %get_bit_val.exit108.i ], [ %135, %bb.i115.i ]
  %136 = icmp slt i32 %storemerge.i118.i, 1, !dbg !329
  br i1 %136, label %bb.i115.i, label %get_bit_val.exit121.i, !dbg !329

get_bit_val.exit121.i:                            ; preds = %bb3.i119.i
  %137 = icmp eq i32 %return_val.i100.i.1, 0, !dbg !331
  %138 = icmp eq i32 %return_val.i113.i.1, 1, !dbg !331
  %or.cond5 = and i1 %137, %138
  br i1 %or.cond5, label %bb39.i, label %model_write_reg.exit, !dbg !331

bb39.i:                                           ; preds = %get_bit_val.exit121.i
  %139 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 2, i32 7), align 4, !dbg !332
  %140 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 7), align 4, !dbg !334
  %141 = icmp eq i32 %140, %139, !dbg !335
  br i1 %141, label %bb42.i, label %model_write_reg.exit, !dbg !335

bb42.i:                                           ; preds = %bb39.i
  %142 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 7), align 4, !dbg !336
  %143 = call fastcc i32 @change_bit_val(i32 %142, i32 1, i32 31, i32 1) nounwind, !dbg !336
  store i32 %143, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 7), align 4, !dbg !336
  %144 = load i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !338
  %145 = call fastcc i32 @change_bit_val(i32 %144, i32 38, i32 29, i32 10) nounwind, !dbg !338
  store i32 %145, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !338
  br label %model_write_reg.exit, !dbg !337

bb44.i:                                           ; preds = %bb34.i
  %146 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 1), align 4, !dbg !339
  %147 = icmp eq i32 %20, %146, !dbg !339
  br i1 %147, label %bb45.i, label %bb51.i, !dbg !339

bb45.i:                                           ; preds = %bb44.i
  %148 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 7), align 4, !dbg !340
  br label %bb3.i146.i, !dbg !342

bb.i142.i:                                        ; preds = %bb3.i146.i
  %int_cast_to_i6411 = zext i32 %storemerge.i145.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6411), !dbg !343
  %149 = shl i32 1, %storemerge.i145.i, !dbg !343
  %150 = and i32 %149, %148, !dbg !343
  %151 = icmp eq i32 %150, 0, !dbg !343
  %152 = select i1 %151, i32 0, i32 %149
  %return_val.i140.i.1. = or i32 %return_val.i140.i.1, %152
  %153 = add nsw i32 %storemerge.i145.i, 1, !dbg !342
  br label %bb3.i146.i, !dbg !342

bb3.i146.i:                                       ; preds = %bb.i142.i, %bb45.i
  %return_val.i140.i.1 = phi i32 [ 0, %bb45.i ], [ %return_val.i140.i.1., %bb.i142.i ]
  %storemerge.i145.i = phi i32 [ 0, %bb45.i ], [ %153, %bb.i142.i ]
  %154 = icmp slt i32 %storemerge.i145.i, 1, !dbg !342
  br i1 %154, label %bb.i142.i, label %get_bit_val.exit148.i, !dbg !342

get_bit_val.exit148.i:                            ; preds = %bb3.i146.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !344
  %155 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 7), align 4, !dbg !345
  br label %bb3.i159.i, !dbg !346

bb.i155.i:                                        ; preds = %bb3.i159.i
  %int_cast_to_i6412 = zext i32 %storemerge.i158.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6412), !dbg !347
  %156 = shl i32 1, %storemerge.i158.i, !dbg !347
  %157 = and i32 %156, %155, !dbg !347
  %158 = icmp eq i32 %157, 0, !dbg !347
  %159 = select i1 %158, i32 0, i32 %156
  %return_val.i153.i.1. = or i32 %return_val.i153.i.1, %159
  %160 = add nsw i32 %storemerge.i158.i, 1, !dbg !346
  br label %bb3.i159.i, !dbg !346

bb3.i159.i:                                       ; preds = %bb.i155.i, %get_bit_val.exit148.i
  %return_val.i153.i.1 = phi i32 [ 0, %get_bit_val.exit148.i ], [ %return_val.i153.i.1., %bb.i155.i ]
  %storemerge.i158.i = phi i32 [ 0, %get_bit_val.exit148.i ], [ %160, %bb.i155.i ]
  %161 = icmp slt i32 %storemerge.i158.i, 1, !dbg !346
  br i1 %161, label %bb.i155.i, label %get_bit_val.exit161.i, !dbg !346

get_bit_val.exit161.i:                            ; preds = %bb3.i159.i
  %162 = icmp eq i32 %return_val.i140.i.1, 1, !dbg !348
  %163 = icmp eq i32 %return_val.i153.i.1, 0, !dbg !348
  %or.cond6 = and i1 %162, %163
  br i1 %or.cond6, label %bb49.i, label %model_write_reg.exit, !dbg !348

bb49.i:                                           ; preds = %get_bit_val.exit161.i
  %164 = call fastcc i32 @change_bit_val(i32 %155, i32 0, i32 31, i32 1) nounwind, !dbg !349
  store i32 %164, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 7), align 4, !dbg !349
  %165 = load i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !351
  %166 = call fastcc i32 @change_bit_val(i32 %165, i32 0, i32 29, i32 10) nounwind, !dbg !351
  store i32 %166, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !351
  br label %model_write_reg.exit, !dbg !350

bb51.i:                                           ; preds = %bb44.i
  %167 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 2, i32 1), align 4, !dbg !352
  %168 = icmp eq i32 %20, %167, !dbg !352
  br i1 %168, label %bb52.i, label %bb53.i, !dbg !352

bb52.i:                                           ; preds = %bb51.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !353
  br label %model_write_reg.exit, !dbg !353

bb53.i:                                           ; preds = %bb51.i
  %169 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 0, i32 1), align 4, !dbg !354
  %170 = icmp eq i32 %20, %169, !dbg !354
  br i1 %170, label %bb54.i, label %bb63.i, !dbg !354

bb54.i:                                           ; preds = %bb53.i
  %171 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 0, i32 7), align 4, !dbg !355
  br label %bb3.i237.i, !dbg !357

bb.i233.i:                                        ; preds = %bb3.i237.i
  %int_cast_to_i6413 = zext i32 %storemerge.i236.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6413), !dbg !358
  %172 = shl i32 1, %storemerge.i236.i, !dbg !358
  %173 = and i32 %172, %171, !dbg !358
  %174 = icmp eq i32 %173, 0, !dbg !358
  %175 = select i1 %174, i32 0, i32 %172
  %return_val.i231.i.1. = or i32 %return_val.i231.i.1, %175
  %176 = add nsw i32 %storemerge.i236.i, 1, !dbg !357
  br label %bb3.i237.i, !dbg !357

bb3.i237.i:                                       ; preds = %bb.i233.i, %bb54.i
  %return_val.i231.i.1 = phi i32 [ 0, %bb54.i ], [ %return_val.i231.i.1., %bb.i233.i ]
  %storemerge.i236.i = phi i32 [ 0, %bb54.i ], [ %176, %bb.i233.i ]
  %177 = icmp slt i32 %storemerge.i236.i, 1, !dbg !357
  br i1 %177, label %bb.i233.i, label %get_bit_val.exit239.i, !dbg !357

get_bit_val.exit239.i:                            ; preds = %bb3.i237.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !359
  %178 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 0, i32 7), align 4, !dbg !360
  br label %bb3.i250.i, !dbg !361

bb.i246.i:                                        ; preds = %bb3.i250.i
  %int_cast_to_i6414 = zext i32 %storemerge.i249.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6414), !dbg !362
  %179 = shl i32 1, %storemerge.i249.i, !dbg !362
  %180 = and i32 %179, %178, !dbg !362
  %181 = icmp eq i32 %180, 0, !dbg !362
  %182 = select i1 %181, i32 0, i32 %179
  %return_val.i244.i.1. = or i32 %return_val.i244.i.1, %182
  %183 = add nsw i32 %storemerge.i249.i, 1, !dbg !361
  br label %bb3.i250.i, !dbg !361

bb3.i250.i:                                       ; preds = %bb.i246.i, %get_bit_val.exit239.i
  %return_val.i244.i.1 = phi i32 [ 0, %get_bit_val.exit239.i ], [ %return_val.i244.i.1., %bb.i246.i ]
  %storemerge.i249.i = phi i32 [ 0, %get_bit_val.exit239.i ], [ %183, %bb.i246.i ]
  %184 = icmp slt i32 %storemerge.i249.i, 1, !dbg !361
  br i1 %184, label %bb.i246.i, label %get_bit_val.exit252.i, !dbg !361

get_bit_val.exit252.i:                            ; preds = %bb3.i250.i
  %185 = icmp eq i32 %return_val.i231.i.1, 0, !dbg !363
  %186 = icmp eq i32 %return_val.i244.i.1, 1, !dbg !363
  %or.cond7 = and i1 %185, %186
  br i1 %or.cond7, label %bb58.i, label %model_write_reg.exit, !dbg !363

bb58.i:                                           ; preds = %get_bit_val.exit252.i
  %187 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 2, i32 7), align 4, !dbg !364
  %188 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 7), align 4, !dbg !366
  %189 = icmp eq i32 %188, %187, !dbg !367
  br i1 %189, label %bb61.i, label %model_write_reg.exit, !dbg !367

bb61.i:                                           ; preds = %bb58.i
  %190 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 7), align 4, !dbg !368
  %191 = call fastcc i32 @change_bit_val(i32 %190, i32 1, i32 31, i32 1) nounwind, !dbg !368
  store i32 %191, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 7), align 4, !dbg !368
  %192 = load i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !370
  %193 = call fastcc i32 @change_bit_val(i32 %192, i32 39, i32 29, i32 10) nounwind, !dbg !370
  store i32 %193, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !370
  br label %model_write_reg.exit, !dbg !369

bb63.i:                                           ; preds = %bb53.i
  %194 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 1), align 4, !dbg !371
  %195 = icmp eq i32 %20, %194, !dbg !371
  br i1 %195, label %bb64.i, label %bb70.i, !dbg !371

bb64.i:                                           ; preds = %bb63.i
  %196 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 7), align 4, !dbg !372
  br label %bb3.i264.i, !dbg !374

bb.i260.i:                                        ; preds = %bb3.i264.i
  %int_cast_to_i6415 = zext i32 %storemerge.i263.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6415), !dbg !375
  %197 = shl i32 1, %storemerge.i263.i, !dbg !375
  %198 = and i32 %197, %196, !dbg !375
  %199 = icmp eq i32 %198, 0, !dbg !375
  %200 = select i1 %199, i32 0, i32 %197
  %return_val.i258.i.1. = or i32 %return_val.i258.i.1, %200
  %201 = add nsw i32 %storemerge.i263.i, 1, !dbg !374
  br label %bb3.i264.i, !dbg !374

bb3.i264.i:                                       ; preds = %bb.i260.i, %bb64.i
  %return_val.i258.i.1 = phi i32 [ 0, %bb64.i ], [ %return_val.i258.i.1., %bb.i260.i ]
  %storemerge.i263.i = phi i32 [ 0, %bb64.i ], [ %201, %bb.i260.i ]
  %202 = icmp slt i32 %storemerge.i263.i, 1, !dbg !374
  br i1 %202, label %bb.i260.i, label %get_bit_val.exit266.i, !dbg !374

get_bit_val.exit266.i:                            ; preds = %bb3.i264.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !376
  %203 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 7), align 4, !dbg !377
  br label %bb3.i277.i, !dbg !378

bb.i273.i:                                        ; preds = %bb3.i277.i
  %int_cast_to_i6416 = zext i32 %storemerge.i276.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6416), !dbg !379
  %204 = shl i32 1, %storemerge.i276.i, !dbg !379
  %205 = and i32 %204, %203, !dbg !379
  %206 = icmp eq i32 %205, 0, !dbg !379
  %207 = select i1 %206, i32 0, i32 %204
  %return_val.i271.i.1. = or i32 %return_val.i271.i.1, %207
  %208 = add nsw i32 %storemerge.i276.i, 1, !dbg !378
  br label %bb3.i277.i, !dbg !378

bb3.i277.i:                                       ; preds = %bb.i273.i, %get_bit_val.exit266.i
  %return_val.i271.i.1 = phi i32 [ 0, %get_bit_val.exit266.i ], [ %return_val.i271.i.1., %bb.i273.i ]
  %storemerge.i276.i = phi i32 [ 0, %get_bit_val.exit266.i ], [ %208, %bb.i273.i ]
  %209 = icmp slt i32 %storemerge.i276.i, 1, !dbg !378
  br i1 %209, label %bb.i273.i, label %get_bit_val.exit279.i, !dbg !378

get_bit_val.exit279.i:                            ; preds = %bb3.i277.i
  %210 = icmp eq i32 %return_val.i258.i.1, 1, !dbg !380
  %211 = icmp eq i32 %return_val.i271.i.1, 0, !dbg !380
  %or.cond8 = and i1 %210, %211
  br i1 %or.cond8, label %bb68.i, label %model_write_reg.exit, !dbg !380

bb68.i:                                           ; preds = %get_bit_val.exit279.i
  %212 = call fastcc i32 @change_bit_val(i32 %203, i32 0, i32 31, i32 1) nounwind, !dbg !381
  store i32 %212, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 7), align 4, !dbg !381
  %213 = load i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !383
  %214 = call fastcc i32 @change_bit_val(i32 %213, i32 0, i32 29, i32 10) nounwind, !dbg !383
  store i32 %214, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4, !dbg !383
  br label %model_write_reg.exit, !dbg !382

bb70.i:                                           ; preds = %bb63.i
  %215 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 2, i32 1), align 4, !dbg !384
  %216 = icmp eq i32 %20, %215, !dbg !384
  br i1 %216, label %bb71.i, label %bb72.i, !dbg !384

bb71.i:                                           ; preds = %bb70.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !385
  br label %model_write_reg.exit, !dbg !385

bb72.i:                                           ; preds = %bb70.i
  %217 = load i32* getelementptr inbounds (%struct.INTC_tag* @MC_CGM, i64 0, i32 0, i32 1), align 4, !dbg !386
  %218 = icmp eq i32 %20, %217, !dbg !386
  br i1 %218, label %bb73.i, label %bb74.i, !dbg !386

bb73.i:                                           ; preds = %bb72.i
  call fastcc void @write_reg_with_mask(%struct.reg* %16, i32 %18) nounwind, !dbg !387
  br label %model_write_reg.exit, !dbg !387

bb74.i:                                           ; preds = %bb72.i
  %219 = load i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 0, i32 1), align 4, !dbg !388
  %220 = icmp eq i32 %20, %219, !dbg !388
  br i1 %220, label %bb75.i, label %bb93.i, !dbg !388

bb75.i:                                           ; preds = %bb74.i
  %221 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 0, i32 7), align 4, !dbg !389
  br label %bb3.i224.i, !dbg !391

bb.i220.i:                                        ; preds = %bb3.i224.i
  %222 = add nsw i32 %storemerge.i223.i, 1, !dbg !392
  %int_cast_to_i6417 = zext i32 %222 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6417), !dbg !392
  %223 = shl i32 1, %222, !dbg !392
  %224 = and i32 %223, %221, !dbg !392
  %225 = icmp eq i32 %224, 0, !dbg !392
  br i1 %225, label %bb2.i222.i, label %bb1.i221.i, !dbg !392

bb1.i221.i:                                       ; preds = %bb.i220.i
  %int_cast_to_i6418 = zext i32 %storemerge.i223.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6418), !dbg !393
  %226 = shl i32 1, %storemerge.i223.i, !dbg !393
  %227 = or i32 %226, %return_val.i218.i.1, !dbg !393
  br label %bb2.i222.i, !dbg !393

bb2.i222.i:                                       ; preds = %bb1.i221.i, %bb.i220.i
  %return_val.i218.i.0 = phi i32 [ %return_val.i218.i.1, %bb.i220.i ], [ %227, %bb1.i221.i ]
  %228 = add nsw i32 %storemerge.i223.i, 1, !dbg !391
  br label %bb3.i224.i, !dbg !391

bb3.i224.i:                                       ; preds = %bb2.i222.i, %bb75.i
  %return_val.i218.i.1 = phi i32 [ 0, %bb75.i ], [ %return_val.i218.i.0, %bb2.i222.i ]
  %storemerge.i223.i = phi i32 [ 0, %bb75.i ], [ %228, %bb2.i222.i ]
  %229 = icmp slt i32 %storemerge.i223.i, 1, !dbg !391
  br i1 %229, label %bb.i220.i, label %get_bit_val.exit226.i, !dbg !391

get_bit_val.exit226.i:                            ; preds = %bb3.i224.i
  %.b.i = load i1* @STM_STATE.0.b, align 1
  %230 = icmp eq i32 %return_val.i218.i.1, 1, !dbg !394
  %or.cond9 = and i1 %.b.i, %230
  br i1 %or.cond9, label %model_write_reg.exit, label %bb78.i, !dbg !394

bb78.i:                                           ; preds = %get_bit_val.exit226.i
  %231 = load i32* getelementptr inbounds (%struct.INTC_tag* @MC_CGM, i64 0, i32 0, i32 7), align 4, !dbg !395
  br label %bb3.i211.i, !dbg !397

bb.i207.i:                                        ; preds = %bb3.i211.i
  %232 = add nsw i32 %storemerge.i210.i, 31, !dbg !398
  %int_cast_to_i6419 = zext i32 %232 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6419), !dbg !398
  %233 = shl i32 1, %232, !dbg !398
  %234 = and i32 %233, %231, !dbg !398
  %235 = icmp eq i32 %234, 0, !dbg !398
  br i1 %235, label %bb2.i209.i, label %bb1.i208.i, !dbg !398

bb1.i208.i:                                       ; preds = %bb.i207.i
  %int_cast_to_i6420 = zext i32 %storemerge.i210.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6420), !dbg !399
  %236 = shl i32 1, %storemerge.i210.i, !dbg !399
  %237 = or i32 %236, %return_val.i205.i.1, !dbg !399
  br label %bb2.i209.i, !dbg !399

bb2.i209.i:                                       ; preds = %bb1.i208.i, %bb.i207.i
  %return_val.i205.i.0 = phi i32 [ %return_val.i205.i.1, %bb.i207.i ], [ %237, %bb1.i208.i ]
  %238 = add nsw i32 %storemerge.i210.i, 1, !dbg !397
  br label %bb3.i211.i, !dbg !397

bb3.i211.i:                                       ; preds = %bb2.i209.i, %bb78.i
  %return_val.i205.i.1 = phi i32 [ 0, %bb78.i ], [ %return_val.i205.i.0, %bb2.i209.i ]
  %storemerge.i210.i = phi i32 [ 0, %bb78.i ], [ %238, %bb2.i209.i ]
  %239 = icmp slt i32 %storemerge.i210.i, 1, !dbg !397
  br i1 %239, label %bb.i207.i, label %bb3.i198.i, !dbg !397

bb.i194.i:                                        ; preds = %bb3.i198.i
  %int_cast_to_i6421 = zext i32 %storemerge.i197.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6421), !dbg !400
  %240 = shl i32 1, %storemerge.i197.i, !dbg !400
  %241 = and i32 %240, %221, !dbg !400
  %242 = icmp eq i32 %241, 0, !dbg !400
  %243 = select i1 %242, i32 0, i32 %240
  %return_val.i192.i.1. = or i32 %return_val.i192.i.1, %243
  %244 = add nsw i32 %storemerge.i197.i, 1, !dbg !402
  br label %bb3.i198.i, !dbg !402

bb3.i198.i:                                       ; preds = %bb.i194.i, %bb3.i211.i
  %return_val.i192.i.1 = phi i32 [ %return_val.i192.i.1., %bb.i194.i ], [ 0, %bb3.i211.i ]
  %storemerge.i197.i = phi i32 [ %244, %bb.i194.i ], [ 0, %bb3.i211.i ]
  %245 = icmp slt i32 %storemerge.i197.i, 1, !dbg !402
  br i1 %245, label %bb.i194.i, label %get_bit_val.exit200.i, !dbg !402

get_bit_val.exit200.i:                            ; preds = %bb3.i198.i
  %246 = icmp eq i32 %return_val.i205.i.1, 0, !dbg !403
  %247 = icmp eq i32 %return_val.i192.i.1, 0, !dbg !403
  %or.cond10 = or i1 %246, %247
  br i1 %or.cond10, label %model_write_reg.exit, label %bb80.i, !dbg !403

bb80.i:                                           ; preds = %get_bit_val.exit200.i
  %248 = load i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 7), align 4, !dbg !404
  br label %bb3.i185.i, !dbg !406

bb.i181.i:                                        ; preds = %bb3.i185.i
  %249 = add nsw i32 %storemerge.i184.i, 8, !dbg !408
  %int_cast_to_i6422 = zext i32 %249 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6422), !dbg !408
  %250 = shl i32 1, %249, !dbg !408
  %251 = and i32 %250, %221, !dbg !408
  %252 = icmp eq i32 %251, 0, !dbg !408
  br i1 %252, label %bb2.i183.i, label %bb1.i182.i, !dbg !408

bb1.i182.i:                                       ; preds = %bb.i181.i
  %int_cast_to_i6423 = zext i32 %storemerge.i184.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6423), !dbg !409
  %253 = shl i32 1, %storemerge.i184.i, !dbg !409
  %254 = or i32 %253, %return_val.i179.i.1, !dbg !409
  br label %bb2.i183.i, !dbg !409

bb2.i183.i:                                       ; preds = %bb1.i182.i, %bb.i181.i
  %return_val.i179.i.0 = phi i32 [ %return_val.i179.i.1, %bb.i181.i ], [ %254, %bb1.i182.i ]
  %255 = add nsw i32 %storemerge.i184.i, 1, !dbg !406
  br label %bb3.i185.i, !dbg !406

bb3.i185.i:                                       ; preds = %bb2.i183.i, %bb80.i
  %return_val.i179.i.1 = phi i32 [ 0, %bb80.i ], [ %return_val.i179.i.0, %bb2.i183.i ]
  %storemerge.i184.i = phi i32 [ 0, %bb80.i ], [ %255, %bb2.i183.i ]
  %256 = icmp slt i32 %storemerge.i184.i, 8, !dbg !406
  br i1 %256, label %bb.i181.i, label %bb3.i172.i, !dbg !406

bb.i168.i:                                        ; preds = %bb3.i172.i
  %257 = add nsw i32 %storemerge.i171.i, 16, !dbg !410
  %int_cast_to_i6424 = zext i32 %257 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6424), !dbg !410
  %258 = shl i32 1, %257, !dbg !410
  %259 = and i32 %258, %231, !dbg !410
  %260 = icmp eq i32 %259, 0, !dbg !410
  br i1 %260, label %bb2.i170.i, label %bb1.i169.i, !dbg !410

bb1.i169.i:                                       ; preds = %bb.i168.i
  %int_cast_to_i6425 = zext i32 %storemerge.i171.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6425), !dbg !412
  %261 = shl i32 1, %storemerge.i171.i, !dbg !412
  %262 = or i32 %261, %return_val.i166.i.1, !dbg !412
  br label %bb2.i170.i, !dbg !412

bb2.i170.i:                                       ; preds = %bb1.i169.i, %bb.i168.i
  %return_val.i166.i.0 = phi i32 [ %return_val.i166.i.1, %bb.i168.i ], [ %262, %bb1.i169.i ]
  %263 = add nsw i32 %storemerge.i171.i, 1, !dbg !413
  br label %bb3.i172.i, !dbg !413

bb3.i172.i:                                       ; preds = %bb2.i170.i, %bb3.i185.i
  %return_val.i166.i.1 = phi i32 [ %return_val.i166.i.0, %bb2.i170.i ], [ 0, %bb3.i185.i ]
  %storemerge.i171.i = phi i32 [ %263, %bb2.i170.i ], [ 0, %bb3.i185.i ]
  %264 = icmp slt i32 %storemerge.i171.i, 6, !dbg !413
  br i1 %264, label %bb.i168.i, label %get_bit_val.exit174.i, !dbg !413

get_bit_val.exit174.i:                            ; preds = %bb3.i172.i
  %265 = mul i32 %return_val.i166.i.1, %return_val.i179.i.1, !dbg !414
  %int_cast_to_i64 = zext i32 %265 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !414
  %266 = udiv i32 %18, %265, !dbg !414
  %267 = add i32 %266, %248, !dbg !414
  call fastcc void @write_reg_with_mask(%struct.reg* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1), i32 %267) nounwind, !dbg !415
  %268 = icmp ugt i32 %267, %248, !dbg !416
  %.promoted = load i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4
  br label %bb91.i, !dbg !418

bb81.i:                                           ; preds = %bb91.i
  %269 = sext i32 %storemerge1.i to i64, !dbg !419
  %270 = getelementptr inbounds %struct.STM_tag* @STM, i64 0, i32 2, i64 %269, i32 0, i32 7, !dbg !419
  %271 = load i32* %270, align 4, !dbg !419
  br label %bb3.i132.i, !dbg !420

bb.i128.i:                                        ; preds = %bb3.i132.i
  %int_cast_to_i6426 = zext i32 %storemerge.i131.i to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6426), !dbg !421
  %272 = shl i32 1, %storemerge.i131.i, !dbg !421
  %273 = and i32 %272, %271, !dbg !421
  %274 = icmp eq i32 %273, 0, !dbg !421
  %275 = select i1 %274, i32 0, i32 %272
  %return_val.i126.i.1. = or i32 %return_val.i126.i.1, %275
  %276 = add nsw i32 %storemerge.i131.i, 1, !dbg !420
  br label %bb3.i132.i, !dbg !420

bb3.i132.i:                                       ; preds = %bb.i128.i, %bb81.i
  %return_val.i126.i.1 = phi i32 [ 0, %bb81.i ], [ %return_val.i126.i.1., %bb.i128.i ]
  %storemerge.i131.i = phi i32 [ 0, %bb81.i ], [ %276, %bb.i128.i ]
  %277 = icmp slt i32 %storemerge.i131.i, 1, !dbg !420
  br i1 %277, label %bb.i128.i, label %get_bit_val.exit134.i, !dbg !420

get_bit_val.exit134.i:                            ; preds = %bb3.i132.i
  %278 = icmp eq i32 %return_val.i126.i.1, 0, !dbg !422
  br i1 %278, label %bb90.i, label %bb82.i, !dbg !422

bb82.i:                                           ; preds = %get_bit_val.exit134.i
  %279 = getelementptr inbounds %struct.STM_tag* @STM, i64 0, i32 2, i64 %269, i32 2, i32 7, !dbg !423
  %280 = load i32* %279, align 4, !dbg !423
  %281 = icmp ugt i32 %280, %248, !dbg !424
  %282 = icmp ult i32 %280, %267, !dbg !424
  br i1 %268, label %bb83.i, label %bb87.i, !dbg !416

bb83.i:                                           ; preds = %bb82.i
  %or.cond11 = and i1 %281, %282
  br i1 %or.cond11, label %bb85.i, label %bb90.i, !dbg !424

bb85.i:                                           ; preds = %bb83.i
  %283 = getelementptr inbounds %struct.STM_tag* @STM, i64 0, i32 2, i64 %269, i32 1, i32 7, !dbg !425
  %284 = load i32* %283, align 4, !dbg !425
  %285 = call fastcc i32 @change_bit_val(i32 %284, i32 1, i32 31, i32 1) nounwind, !dbg !425
  store i32 %285, i32* %283, align 4, !dbg !425
  %286 = add nsw i32 %storemerge1.i, 36, !dbg !427
  %287 = call fastcc i32 @change_bit_val(i32 %295, i32 %286, i32 29, i32 10) nounwind, !dbg !427
  br label %bb90.i, !dbg !426

bb87.i:                                           ; preds = %bb82.i
  %or.cond12 = or i1 %281, %282
  br i1 %or.cond12, label %bb89.i, label %bb90.i, !dbg !428

bb89.i:                                           ; preds = %bb87.i
  %288 = getelementptr inbounds %struct.STM_tag* @STM, i64 0, i32 2, i64 %269, i32 1, i32 7, !dbg !429
  %289 = load i32* %288, align 4, !dbg !429
  %290 = call fastcc i32 @change_bit_val(i32 %289, i32 1, i32 31, i32 1) nounwind, !dbg !429
  store i32 %290, i32* %288, align 4, !dbg !429
  %291 = add nsw i32 %storemerge1.i, 36, !dbg !431
  %292 = call fastcc i32 @change_bit_val(i32 %295, i32 %291, i32 29, i32 10) nounwind, !dbg !431
  br label %bb90.i, !dbg !430

bb90.i:                                           ; preds = %bb89.i, %bb87.i, %bb85.i, %bb83.i, %get_bit_val.exit134.i
  %293 = phi i32 [ %295, %bb83.i ], [ %287, %bb85.i ], [ %292, %bb89.i ], [ %295, %get_bit_val.exit134.i ], [ %295, %bb87.i ]
  %294 = add nsw i32 %storemerge1.i, 1, !dbg !418
  br label %bb91.i, !dbg !418

bb91.i:                                           ; preds = %bb90.i, %get_bit_val.exit174.i
  %295 = phi i32 [ %.promoted, %get_bit_val.exit174.i ], [ %293, %bb90.i ]
  %storemerge1.i = phi i32 [ 0, %get_bit_val.exit174.i ], [ %294, %bb90.i ]
  %296 = icmp slt i32 %storemerge1.i, 4, !dbg !418
  br i1 %296, label %bb81.i, label %model_write_reg.exit.loopexit, !dbg !418

bb93.i:                                           ; preds = %bb74.i
  %297 = load i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 2, i32 1), align 4, !dbg !432
  %298 = icmp eq i32 %20, %297, !dbg !432
  br i1 %298, label %bb94.i, label %bb95.i, !dbg !432

bb94.i:                                           ; preds = %bb93.i
  store i1 true, i1* @STM_STATE.0.b, align 1
  br label %model_write_reg.exit, !dbg !433

bb95.i:                                           ; preds = %bb93.i
  %299 = load i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 3, i32 1), align 4, !dbg !434
  %300 = icmp eq i32 %20, %299, !dbg !434
  br i1 %300, label %bb96.i, label %bb97.i, !dbg !434

bb96.i:                                           ; preds = %bb95.i
  store i1 false, i1* @STM_STATE.0.b, align 1
  br label %model_write_reg.exit, !dbg !435

bb97.i:                                           ; preds = %bb95.i
  %301 = load i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 1, i32 1), align 4, !dbg !436
  %302 = icmp eq i32 %20, %301, !dbg !436
  br i1 %302, label %bb98.i, label %model_write_reg.exit, !dbg !436

bb98.i:                                           ; preds = %bb97.i
  call fastcc void @init_reg_por() nounwind, !dbg !437
  br label %model_write_reg.exit, !dbg !437

model_write_reg.exit.loopexit:                    ; preds = %bb91.i
  store i32 %295, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4
  br label %model_write_reg.exit

model_write_reg.exit:                             ; preds = %model_write_reg.exit.loopexit, %bb98.i, %bb97.i, %bb96.i, %bb94.i, %get_bit_val.exit200.i, %get_bit_val.exit226.i, %bb73.i, %bb71.i, %bb68.i, %get_bit_val.exit279.i, %bb61.i, %bb58.i, %get_bit_
  %303 = add nsw i32 %storemerge1, 1, !dbg !247
  br label %bb6, !dbg !247

bb6:                                              ; preds = %model_write_reg.exit, %bb4
  %storemerge1 = phi i32 [ 0, %bb4 ], [ %303, %model_write_reg.exit ]
  %304 = icmp slt i32 %storemerge1, 1, !dbg !247
  br i1 %304, label %bb5, label %return, !dbg !247

return:                                           ; preds = %bb6
  ret i32 0, !dbg !438
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @klee_make_symbolic(...)

declare i32 @klee_assume(...)

define internal fastcc void @write_reg_with_mask(%struct.reg* nocapture %Register, i32 %data) nounwind {
entry:
  %0 = getelementptr inbounds %struct.reg* %Register, i64 0, i32 5, !dbg !439
  %1 = getelementptr inbounds %struct.reg* %Register, i64 0, i32 6, !dbg !441
  %2 = getelementptr inbounds %struct.reg* %Register, i64 0, i32 7, !dbg !442
  br label %bb12, !dbg !443

bb:                                               ; preds = %bb12
  %3 = load i32* %0, align 4, !dbg !439
  %int_cast_to_i64 = zext i32 %storemerge to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !439
  %4 = shl i32 1, %storemerge, !dbg !439
  %5 = and i32 %3, %4, !dbg !439
  %6 = icmp eq i32 %5, 0, !dbg !439
  br i1 %6, label %bb6, label %bb1, !dbg !439

bb1:                                              ; preds = %bb
  %7 = and i32 %4, %data, !dbg !444
  %8 = icmp eq i32 %7, 0, !dbg !444
  %9 = load i32* %2, align 4, !dbg !445
  br i1 %8, label %bb3, label %bb2, !dbg !444

bb2:                                              ; preds = %bb1
  %10 = or i32 %9, %4, !dbg !446
  store i32 %10, i32* %2, align 4, !dbg !446
  br label %bb11, !dbg !446

bb3:                                              ; preds = %bb1
  %not = xor i32 %4, -1, !dbg !445
  %11 = and i32 %9, %not, !dbg !445
  store i32 %11, i32* %2, align 4, !dbg !445
  br label %bb11, !dbg !445

bb6:                                              ; preds = %bb
  %12 = load i32* %1, align 4, !dbg !441
  %13 = and i32 %12, %4, !dbg !441
  %14 = icmp eq i32 %13, 0, !dbg !441
  br i1 %14, label %bb11, label %bb7, !dbg !441

bb7:                                              ; preds = %bb6
  %15 = and i32 %4, %data, !dbg !447
  %16 = icmp eq i32 %15, 0, !dbg !447
  br i1 %16, label %bb11, label %bb8, !dbg !447

bb8:                                              ; preds = %bb7
  %17 = load i32* %2, align 4, !dbg !442
  %not9 = xor i32 %4, -1, !dbg !442
  %18 = and i32 %17, %not9, !dbg !442
  store i32 %18, i32* %2, align 4, !dbg !442
  br label %bb11, !dbg !442

bb11:                                             ; preds = %bb8, %bb7, %bb6, %bb3, %bb2
  %19 = add nsw i32 %storemerge, 1, !dbg !443
  br label %bb12, !dbg !443

bb12:                                             ; preds = %bb11, %entry
  %storemerge = phi i32 [ 0, %entry ], [ %19, %bb11 ]
  %20 = icmp slt i32 %storemerge, 32, !dbg !443
  br i1 %20, label %bb, label %return, !dbg !443

return:                                           ; preds = %bb12
  ret void, !dbg !448
}

define internal fastcc i32 @change_bit_val(i32 %reg_val, i32 %new_val, i32 %bit, i32 %bit_size) nounwind readnone {
entry:
  br label %bb4, !dbg !449

bb:                                               ; preds = %bb4
  %int_cast_to_i64 = zext i32 %storemerge to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !451
  %0 = shl i32 1, %storemerge, !dbg !451
  %1 = and i32 %0, %new_val, !dbg !451
  %2 = icmp eq i32 %1, 0, !dbg !451
  %3 = sub i32 %storemerge, %bit
  %4 = add i32 %3, 31, !dbg !452
  %int_cast_to_i641 = zext i32 %4 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !452
  %5 = shl i32 1, %4, !dbg !452
  br i1 %2, label %bb2, label %bb1, !dbg !451

bb1:                                              ; preds = %bb
  %6 = or i32 %5, %reg_val_addr.0, !dbg !455
  br label %bb3, !dbg !457

bb2:                                              ; preds = %bb
  %not.i = xor i32 %5, -1, !dbg !452
  %7 = and i32 %reg_val_addr.0, %not.i, !dbg !452
  br label %bb3, !dbg !454

bb3:                                              ; preds = %bb2, %bb1
  %storemerge1 = phi i32 [ %7, %bb2 ], [ %6, %bb1 ]
  %8 = add nsw i32 %storemerge, 1, !dbg !449
  br label %bb4, !dbg !449

bb4:                                              ; preds = %bb3, %entry
  %reg_val_addr.0 = phi i32 [ %reg_val, %entry ], [ %storemerge1, %bb3 ]
  %storemerge = phi i32 [ 0, %entry ], [ %8, %bb3 ]
  %9 = icmp slt i32 %storemerge, %bit_size, !dbg !449
  br i1 %9, label %bb, label %return, !dbg !449

return:                                           ; preds = %bb4
  ret i32 %reg_val_addr.0, !dbg !458
}

define internal fastcc void @init_reg_por() nounwind {
entry:
  store i1 true, i1* @ALL_REG_COUNT.b, align 1
  %srcval = load i800* bitcast ([100 x i8]* @.str2 to i800*), align 8
  store i800 %srcval, i800* bitcast (%struct.STM_tag* @STM to i800*), align 32
  store i32 -67796992, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 0, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 0, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 0, i32 3), align 4
  store i32 65283, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 0, i32 4), align 16
  store i32 65283, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 0, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 0, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 0, i32 7), align 4
  %srcval37 = load i800* bitcast ([100 x i8]* @.str13 to i800*), align 8
  store i800 %srcval37, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 0, i64 0) to i800*), align 32
  store i32 -67796988, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 3), align 4
  store i32 -1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 4), align 16
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 1, i32 7), align 4
  %srcval65 = load i800* bitcast ([100 x i8]* @.str24 to i800*), align 8
  store i800 %srcval65, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 0, i32 0, i64 0) to i800*), align 32
  store i32 -67796976, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 0, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 0, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 0, i32 3), align 4
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 0, i32 4), align 16
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 0, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 0, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 0, i32 7), align 4
  %srcval93 = load i800* bitcast ([100 x i8]* @.str3 to i800*), align 8
  store i800 %srcval93, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 0, i64 0) to i800*), align 32
  store i32 -67796972, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 3), align 4
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 4), align 16
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 5), align 4
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 1, i32 7), align 4
  %srcval121 = load i800* bitcast ([100 x i8]* @.str4 to i800*), align 8
  store i800 %srcval121, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 2, i32 0, i64 0) to i800*), align 32
  store i32 -67796968, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 2, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 2, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 2, i32 3), align 4
  store i32 -1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 2, i32 4), align 16
  store i32 -1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 2, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 2, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 0, i32 2, i32 7), align 4
  %srcval149 = load i800* bitcast ([100 x i8]* @.str5 to i800*), align 8
  store i800 %srcval149, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 0, i32 0, i64 0) to i800*), align 32
  store i32 -67796960, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 0, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 0, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 0, i32 3), align 4
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 0, i32 4), align 16
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 0, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 0, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 0, i32 7), align 4
  %srcval177 = load i800* bitcast ([100 x i8]* @.str6 to i800*), align 8
  store i800 %srcval177, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 0, i64 0) to i800*), align 32
  store i32 -67796956, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 3), align 4
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 4), align 16
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 5), align 4
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 1, i32 7), align 4
  %srcval205 = load i800* bitcast ([100 x i8]* @.str7 to i800*), align 8
  store i800 %srcval205, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 2, i32 0, i64 0) to i800*), align 32
  store i32 -67796952, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 2, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 2, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 2, i32 3), align 4
  store i32 -1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 2, i32 4), align 16
  store i32 -1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 2, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 2, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 1, i32 2, i32 7), align 4
  store i800 %srcval149, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 0, i32 0, i64 0) to i800*), align 32
  store i32 -67796944, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 0, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 0, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 0, i32 3), align 4
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 0, i32 4), align 16
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 0, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 0, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 0, i32 7), align 4
  store i800 %srcval177, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 0, i64 0) to i800*), align 32
  store i32 -67796940, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 3), align 4
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 4), align 16
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 5), align 4
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 1, i32 7), align 4
  store i800 %srcval205, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 2, i32 0, i64 0) to i800*), align 32
  store i32 -67796936, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 2, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 2, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 2, i32 3), align 4
  store i32 -1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 2, i32 4), align 16
  store i32 -1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 2, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 2, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 2, i32 2, i32 7), align 4
  store i800 %srcval149, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 0, i32 0, i64 0) to i800*), align 32
  store i32 -67796928, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 0, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 0, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 0, i32 3), align 4
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 0, i32 4), align 16
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 0, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 0, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 0, i32 7), align 4
  store i800 %srcval177, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 0, i64 0) to i800*), align 32
  store i32 -67796924, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 3), align 4
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 4), align 16
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 5), align 4
  store i32 1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 1, i32 7), align 4
  store i800 %srcval205, i800* bitcast (i8* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 2, i32 0, i64 0) to i800*), align 32
  store i32 -67796920, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 2, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 2, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 2, i32 3), align 4
  store i32 -1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 2, i32 4), align 16
  store i32 -1, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 2, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 2, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 2, i64 3, i32 2, i32 7), align 4
  %srcval393 = load i800* bitcast ([100 x i8]* @.str8 to i800*), align 8
  store i800 %srcval393, i800* bitcast (%struct.INTC_tag* @INTC to i800*), align 32
  store i32 -720864, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 3), align 4
  store i32 -2, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 4), align 16
  store i32 -4096, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0, i32 7), align 4
  %srcval413 = load i800* bitcast ([100 x i8]* @.str9 to i800*), align 8
  store i800 %srcval413, i800* bitcast (%struct.INTC_tag* @MC_CGM to i800*), align 32
  store i32 -360208, i32* getelementptr inbounds (%struct.INTC_tag* @MC_CGM, i64 0, i32 0, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.INTC_tag* @MC_CGM, i64 0, i32 0, i32 2), align 8
  store i32 -2147483648, i32* getelementptr inbounds (%struct.INTC_tag* @MC_CGM, i64 0, i32 0, i32 3), align 4
  store i32 -2143354880, i32* getelementptr inbounds (%struct.INTC_tag* @MC_CGM, i64 0, i32 0, i32 4), align 16
  store i32 -2143354880, i32* getelementptr inbounds (%struct.INTC_tag* @MC_CGM, i64 0, i32 0, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.INTC_tag* @MC_CGM, i64 0, i32 0, i32 6), align 8
  store i32 -2147483648, i32* getelementptr inbounds (%struct.INTC_tag* @MC_CGM, i64 0, i32 0, i32 7), align 4
  %srcval433 = load i800* bitcast ([100 x i8]* @.str10 to i800*), align 8
  store i800 %srcval433, i800* bitcast (%struct.PSEUDO_REG_tag* @PSEUDO_REG to i800*), align 32
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 0, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 0, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 0, i32 3), align 4
  store i32 -1, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 0, i32 4), align 16
  store i32 -1, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 0, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 0, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 0, i32 7), align 4
  %srcval461 = load i800* bitcast ([100 x i8]* @.str11 to i800*), align 8
  store i800 %srcval461, i800* bitcast (i8* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 1, i32 0, i64 0) to i800*), align 32
  store i32 4, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 1, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 1, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 1, i32 3), align 4
  store i32 1, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 1, i32 4), align 16
  store i32 1, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 1, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 1, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 1, i32 7), align 4
  %srcval489 = load i800* bitcast ([100 x i8]* @.str12 to i800*), align 8
  store i800 %srcval489, i800* bitcast (i8* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 2, i32 0, i64 0) to i800*), align 32
  store i32 8, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 2, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 2, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 2, i32 3), align 4
  store i32 1, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 2, i32 4), align 16
  store i32 1, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 2, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 2, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 2, i32 7), align 4
  %srcval517 = load i800* bitcast ([100 x i8]* @.str135 to i800*), align 8
  store i800 %srcval517, i800* bitcast (i8* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 3, i32 0, i64 0) to i800*), align 32
  store i32 12, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 3, i32 1), align 4
  store i32 32, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 3, i32 2), align 8
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 3, i32 3), align 4
  store i32 1, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 3, i32 4), align 16
  store i32 1, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 3, i32 5), align 4
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 3, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.PSEUDO_REG_tag* @PSEUDO_REG, i64 0, i32 3, i32 7), align 4
  br label %bb11, !dbg !459

bb:                                               ; preds = %bb11
  %0 = icmp slt i32 %storemerge, 14, !dbg !461
  br i1 %0, label %bb1, label %bb2, !dbg !461

bb1:                                              ; preds = %bb
  %1 = sext i32 %storemerge to i64, !dbg !462
  %2 = getelementptr inbounds %struct.reg* getelementptr inbounds (%struct.STM_tag* @STM, i64 0, i32 0), i64 %1, !dbg !462
  %3 = getelementptr inbounds [100 x %struct.reg*]* @ALL_REG, i64 0, i64 %1, !dbg !462
  store %struct.reg* %2, %struct.reg** %3, align 8, !dbg !462
  br label %bb10, !dbg !462

bb2:                                              ; preds = %bb
  %4 = icmp slt i32 %storemerge, 15, !dbg !463
  br i1 %4, label %bb3, label %bb4, !dbg !463

bb3:                                              ; preds = %bb2
  %5 = add nsw i32 %storemerge, -14, !dbg !464
  %6 = sext i32 %5 to i64, !dbg !465
  %7 = getelementptr inbounds %struct.reg* getelementptr inbounds (%struct.INTC_tag* @INTC, i64 0, i32 0), i64 %6, !dbg !465
  %8 = sext i32 %storemerge to i64, !dbg !465
  %9 = getelementptr inbounds [100 x %struct.reg*]* @ALL_REG, i64 0, i64 %8, !dbg !465
  store %struct.reg* %7, %struct.reg** %9, align 8, !dbg !465
  br label %bb10, !dbg !465

bb4:                                              ; preds = %bb2
  %10 = icmp slt i32 %storemerge, 16, !dbg !466
  br i1 %10, label %bb5, label %bb9, !dbg !466

bb5:                                              ; preds = %bb4
  %11 = add i32 %storemerge, -15, !dbg !467
  %12 = sext i32 %11 to i64, !dbg !468
  %13 = getelementptr inbounds %struct.reg* getelementptr inbounds (%struct.INTC_tag* @MC_CGM, i64 0, i32 0), i64 %12, !dbg !468
  %14 = sext i32 %storemerge to i64, !dbg !468
  %15 = getelementptr inbounds [100 x %struct.reg*]* @ALL_REG, i64 0, i64 %14, !dbg !468
  store %struct.reg* %13, %struct.reg** %15, align 8, !dbg !468
  br label %bb10, !dbg !468

bb9:                                              ; preds = %bb4
  %16 = add i32 %storemerge, -16, !dbg !469
  %17 = sext i32 %16 to i64, !dbg !470
  %18 = getelementptr inbounds %struct.reg* getelementptr inbounds (%struct.INTC_tag* @MC_CGM, i64 0, i32 0), i64 %17, !dbg !470
  %19 = sext i32 %storemerge to i64, !dbg !470
  %20 = getelementptr inbounds [100 x %struct.reg*]* @ALL_REG, i64 0, i64 %19, !dbg !470
  store %struct.reg* %18, %struct.reg** %20, align 8, !dbg !470
  br label %bb10, !dbg !470

bb10:                                             ; preds = %bb9, %bb5, %bb3, %bb1
  %21 = add nsw i32 %storemerge, 1, !dbg !459
  br label %bb11, !dbg !459

bb11:                                             ; preds = %bb10, %entry
  %storemerge = phi i32 [ 0, %entry ], [ %21, %bb10 ]
  %22 = icmp slt i32 %storemerge, 20, !dbg !459
  br i1 %22, label %bb, label %return, !dbg !459

return:                                           ; preds = %bb11
  store i1 false, i1* @STM_STATE.0.b, align 1
  ret void, !dbg !471
}

define void @klee_div_zero_check(i64 %z) nounwind {
entry:
  %cmp = icmp eq i64 %z, 0, !dbg !472
  br i1 %cmp, label %if.then, label %if.end, !dbg !472

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str14, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str115, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str216, i64 0, i64 0)) noreturn nounwind, !
  unreachable, !dbg !474

if.end:                                           ; preds = %entry
  ret void, !dbg !475
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @klee_int(i8* %name) nounwind {
entry:
  %x = alloca i32, align 4
  %0 = bitcast i32* %x to i8*, !dbg !476
  call void bitcast (i32 (...)* @klee_make_symbolic to void (i8*, i64, i8*)*)(i8* %0, i64 4, i8* %name) nounwind, !dbg !476
  %tmp1 = load i32* %x, align 4, !dbg !477, !tbaa !478
  ret i32 %tmp1, !dbg !477
}

define void @klee_overshift_check(i64 %bitWidth, i64 %shift) nounwind {
entry:
  %cmp = icmp ult i64 %shift, %bitWidth, !dbg !481
  br i1 %cmp, label %if.end, label %if.then, !dbg !481

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str317, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str1418, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) noreturn nounwind, !
  unreachable, !dbg !483

if.end:                                           ; preds = %entry
  ret void, !dbg !485
}

define i32 @klee_range(i32 %start, i32 %end, i8* %name) nounwind {
entry:
  %x = alloca i32, align 4
  %cmp = icmp slt i32 %start, %end, !dbg !486
  br i1 %cmp, label %if.end, label %if.then, !dbg !486

if.then:                                          ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str619, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) noreturn nounwind, !dbg !4
  unreachable, !dbg !487

if.end:                                           ; preds = %entry
  %add = add nsw i32 %start, 1, !dbg !488
  %cmp4 = icmp eq i32 %add, %end, !dbg !488
  br i1 %cmp4, label %return, label %if.else, !dbg !488

if.else:                                          ; preds = %if.end
  %0 = bitcast i32* %x to i8*, !dbg !489
  call void bitcast (i32 (...)* @klee_make_symbolic to void (i8*, i64, i8*)*)(i8* %0, i64 4, i8* %name) nounwind, !dbg !489
  %cmp9 = icmp eq i32 %start, 0, !dbg !491
  %tmp11 = load i32* %x, align 4, !dbg !492, !tbaa !478
  br i1 %cmp9, label %if.then10, label %if.else15, !dbg !491

if.then10:                                        ; preds = %if.else
  %cmp13 = icmp ult i32 %tmp11, %end, !dbg !492
  %conv14 = zext i1 %cmp13 to i64, !dbg !492
  call void bitcast (i32 (...)* @klee_assume to void (i64)*)(i64 %conv14) nounwind, !dbg !492
  br label %if.end26, !dbg !494

if.else15:                                        ; preds = %if.else
  %cmp18 = icmp sge i32 %tmp11, %start, !dbg !495
  %conv20 = zext i1 %cmp18 to i64, !dbg !495
  call void bitcast (i32 (...)* @klee_assume to void (i64)*)(i64 %conv20) nounwind, !dbg !495
  %tmp21 = load i32* %x, align 4, !dbg !497, !tbaa !478
  %cmp23 = icmp slt i32 %tmp21, %end, !dbg !497
  %conv25 = zext i1 %cmp23 to i64, !dbg !497
  call void bitcast (i32 (...)* @klee_assume to void (i64)*)(i64 %conv25) nounwind, !dbg !497
  br label %if.end26, !dbg !498

if.end26:                                         ; preds = %if.else15, %if.then10
  %tmp27 = load i32* %x, align 4, !dbg !499, !tbaa !478
  br label %return, !dbg !499

return:                                           ; preds = %if.end26, %if.end
  %retval.0 = phi i32 [ %tmp27, %if.end26 ], [ %start, %if.end ]
  ret i32 %retval.0, !dbg !500
}

define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) nounwind {
entry:
  %cmp9 = icmp eq i64 %len, 0, !dbg !501
  br i1 %cmp9, label %while.end, label %while.body, !dbg !501

while.body:                                       ; preds = %while.body, %entry
  %indvar = phi i64 [ %indvar.next, %while.body ], [ 0, %entry ]
  %dest.011 = getelementptr i8* %destaddr, i64 %indvar
  %src.012 = getelementptr i8* %srcaddr, i64 %indvar
  %tmp5 = load i8* %src.012, align 1, !dbg !502, !tbaa !479
  store i8 %tmp5, i8* %dest.011, align 1, !dbg !502, !tbaa !479
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %len
  br i1 %exitcond1, label %while.cond.while.end_crit_edge, label %while.body, !dbg !501

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %dest.0.lcssa = phi i8* [ %scevgep, %while.cond.while.end_crit_edge ], [ %destaddr, %entry ]
  ret i8* %dest.0.lcssa, !dbg !503
}

!llvm.dbg.sp = !{!0, !6, !32, !35, !38, !39, !42, !45, !50, !54, !55, !76, !80, !86, !90, !96, !102, !108, !114}
!llvm.dbg.gv = !{!120, !122, !123, !124, !125, !142, !147, !152, !160, !162, !163}
!llvm.dbg.lv.klee_div_zero_check = !{!168}
!llvm.dbg.lv.klee_int = !{!170, !174}
!llvm.dbg.lv.klee_overshift_check = !{!176, !178}
!llvm.dbg.lv.klee_range = !{!179, !180, !181, !185}
!llvm.dbg.lv.memcpy = !{!187, !188, !191, !194, !198}
!llvm.dbg.lv.memmove = !{!201, !202, !205, !208, !212}
!llvm.dbg.lv.mempcpy = !{!215, !216, !219, !222, !226}
!llvm.dbg.lv.memset = !{!229, !230, !232, !235}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 12, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"executioner_main.c", metadata !"/home/saksham/work/freescale/validation/modelling/automatic_test_gen/stm/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"executioner_main.c", metadata !"/home/saksham/work/freescale/validation/modelling/automatic_test_gen/stm/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metad
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"write_reg_with_mask", metadata !"write_reg_with_mask", metadata !"write_reg_with_mask", metadata !7, i32 8, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.re
!7 = metadata !{i32 589865, metadata !"common.c", metadata !"/home/saksham/work/freescale/validation/modelling/automatic_test_gen/stm/", metadata !8} ; [ DW_TAG_file_type ]
!8 = metadata !{i32 589841, i32 0, i32 1, metadata !"common.c", metadata !"/home/saksham/work/freescale/validation/modelling/automatic_test_gen/stm/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i
!9 = metadata !{i32 589845, metadata !7, metadata !"", metadata !7, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null} ; [ DW_TAG_subroutine_type ]
!10 = metadata !{null, metadata !11, metadata !22}
!11 = metadata !{i32 589839, metadata !7, metadata !"", metadata !7, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 589846, metadata !13, metadata !"reg", metadata !13, i32 17, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ]
!13 = metadata !{i32 589865, metadata !"common.h", metadata !"/home/saksham/work/freescale/validation/modelling/automatic_test_gen/stm/", metadata !8} ; [ DW_TAG_file_type ]
!14 = metadata !{i32 589843, metadata !7, metadata !"", metadata !13, i32 8, i64 1024, i64 32, i64 0, i32 0, null, metadata !15, i32 0, null} ; [ DW_TAG_structure_type ]
!15 = metadata !{metadata !16, metadata !21, metadata !25, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31}
!16 = metadata !{i32 589837, metadata !14, metadata !"name", metadata !13, i32 9, i64 800, i64 8, i64 0, i32 0, metadata !17} ; [ DW_TAG_member ]
!17 = metadata !{i32 589825, metadata !7, metadata !"", metadata !7, i32 0, i64 800, i64 8, i64 0, i32 0, metadata !18, metadata !19, i32 0, null} ; [ DW_TAG_array_type ]
!18 = metadata !{i32 589860, metadata !7, metadata !"char", metadata !7, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 589857, i64 0, i64 99}       ; [ DW_TAG_subrange_type ]
!21 = metadata !{i32 589837, metadata !14, metadata !"addr", metadata !13, i32 10, i64 32, i64 32, i64 800, i32 0, metadata !22} ; [ DW_TAG_member ]
!22 = metadata !{i32 589846, metadata !23, metadata !"uint32_t", metadata !23, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_typedef ]
!23 = metadata !{i32 589865, metadata !"stdint.h", metadata !"/usr/include", metadata !8} ; [ DW_TAG_file_type ]
!24 = metadata !{i32 589860, metadata !7, metadata !"unsigned int", metadata !7, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!25 = metadata !{i32 589837, metadata !14, metadata !"reg_size", metadata !13, i32 11, i64 32, i64 32, i64 832, i32 0, metadata !26} ; [ DW_TAG_member ]
!26 = metadata !{i32 589860, metadata !7, metadata !"int", metadata !7, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!27 = metadata !{i32 589837, metadata !14, metadata !"def", metadata !13, i32 12, i64 32, i64 32, i64 864, i32 0, metadata !22} ; [ DW_TAG_member ]
!28 = metadata !{i32 589837, metadata !14, metadata !"rmask", metadata !13, i32 13, i64 32, i64 32, i64 896, i32 0, metadata !22} ; [ DW_TAG_member ]
!29 = metadata !{i32 589837, metadata !14, metadata !"wmask", metadata !13, i32 14, i64 32, i64 32, i64 928, i32 0, metadata !22} ; [ DW_TAG_member ]
!30 = metadata !{i32 589837, metadata !14, metadata !"w1c", metadata !13, i32 15, i64 32, i64 32, i64 960, i32 0, metadata !22} ; [ DW_TAG_member ]
!31 = metadata !{i32 589837, metadata !14, metadata !"val", metadata !13, i32 16, i64 32, i64 32, i64 992, i32 0, metadata !22} ; [ DW_TAG_member ]
!32 = metadata !{i32 589870, i32 0, metadata !7, metadata !"int_to_uint", metadata !"int_to_uint", metadata !"int_to_uint", metadata !7, i32 36, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!33 = metadata !{i32 589845, metadata !7, metadata !"", metadata !7, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, null} ; [ DW_TAG_subroutine_type ]
!34 = metadata !{metadata !22, metadata !26}
!35 = metadata !{i32 589870, i32 0, metadata !7, metadata !"set_bit", metadata !"set_bit", metadata !"set_bit", metadata !7, i32 44, metadata !36, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!36 = metadata !{i32 589845, metadata !7, metadata !"", metadata !7, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, null} ; [ DW_TAG_subroutine_type ]
!37 = metadata !{metadata !22, metadata !22, metadata !26}
!38 = metadata !{i32 589870, i32 0, metadata !7, metadata !"clear_bit", metadata !"clear_bit", metadata !"clear_bit", metadata !7, i32 50, metadata !36, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!39 = metadata !{i32 589870, i32 0, metadata !7, metadata !"change_bit_val", metadata !"change_bit_val", metadata !"change_bit_val", metadata !7, i32 57, metadata !40, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32, i32, i32)* @c
!40 = metadata !{i32 589845, metadata !7, metadata !"", metadata !7, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, null} ; [ DW_TAG_subroutine_type ]
!41 = metadata !{metadata !22, metadata !22, metadata !22, metadata !26, metadata !26}
!42 = metadata !{i32 589870, i32 0, metadata !7, metadata !"get_bit_val", metadata !"get_bit_val", metadata !"get_bit_val", metadata !7, i32 72, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!43 = metadata !{i32 589845, metadata !7, metadata !"", metadata !7, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, null} ; [ DW_TAG_subroutine_type ]
!44 = metadata !{metadata !22, metadata !22, metadata !26, metadata !26}
!45 = metadata !{i32 589870, i32 0, metadata !46, metadata !"init_reg_por", metadata !"init_reg_por", metadata !"init_reg_por", metadata !46, i32 29, metadata !48, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @init_reg_por} ; [ DW_T
!46 = metadata !{i32 589865, metadata !"stm_main.c", metadata !"/home/saksham/work/freescale/validation/modelling/automatic_test_gen/stm/", metadata !47} ; [ DW_TAG_file_type ]
!47 = metadata !{i32 589841, i32 0, i32 1, metadata !"stm_main.c", metadata !"/home/saksham/work/freescale/validation/modelling/automatic_test_gen/stm/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !""
!48 = metadata !{i32 589845, metadata !46, metadata !"", metadata !46, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, null} ; [ DW_TAG_subroutine_type ]
!49 = metadata !{null}
!50 = metadata !{i32 589870, i32 0, metadata !46, metadata !"set_interrupt", metadata !"set_interrupt", metadata !"set_interrupt", metadata !46, i32 97, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subprogram ]
!51 = metadata !{i32 589845, metadata !46, metadata !"", metadata !46, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, null} ; [ DW_TAG_subroutine_type ]
!52 = metadata !{null, metadata !53}
!53 = metadata !{i32 589860, metadata !46, metadata !"int", metadata !46, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!54 = metadata !{i32 589870, i32 0, metadata !46, metadata !"clear_interrupt", metadata !"clear_interrupt", metadata !"clear_interrupt", metadata !46, i32 104, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subpr
!55 = metadata !{i32 589870, i32 0, metadata !46, metadata !"model_write_reg", metadata !"model_write_reg", metadata !"model_write_reg", metadata !46, i32 113, metadata !56, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null} ; [ DW_TAG_subpr
!56 = metadata !{i32 589845, metadata !46, metadata !"", metadata !46, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !57, i32 0, null} ; [ DW_TAG_subroutine_type ]
!57 = metadata !{metadata !53, metadata !58, metadata !67}
!58 = metadata !{i32 589839, metadata !46, metadata !"", metadata !46, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !59} ; [ DW_TAG_pointer_type ]
!59 = metadata !{i32 589846, metadata !60, metadata !"reg", metadata !60, i32 17, i64 0, i64 0, i64 0, i32 0, metadata !61} ; [ DW_TAG_typedef ]
!60 = metadata !{i32 589865, metadata !"common.h", metadata !"/home/saksham/work/freescale/validation/modelling/automatic_test_gen/stm/", metadata !47} ; [ DW_TAG_file_type ]
!61 = metadata !{i32 589843, metadata !46, metadata !"", metadata !60, i32 8, i64 1024, i64 32, i64 0, i32 0, null, metadata !62, i32 0, null} ; [ DW_TAG_structure_type ]
!62 = metadata !{metadata !63, metadata !66, metadata !70, metadata !71, metadata !72, metadata !73, metadata !74, metadata !75}
!63 = metadata !{i32 589837, metadata !61, metadata !"name", metadata !60, i32 9, i64 800, i64 8, i64 0, i32 0, metadata !64} ; [ DW_TAG_member ]
!64 = metadata !{i32 589825, metadata !46, metadata !"", metadata !46, i32 0, i64 800, i64 8, i64 0, i32 0, metadata !65, metadata !19, i32 0, null} ; [ DW_TAG_array_type ]
!65 = metadata !{i32 589860, metadata !46, metadata !"char", metadata !46, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!66 = metadata !{i32 589837, metadata !61, metadata !"addr", metadata !60, i32 10, i64 32, i64 32, i64 800, i32 0, metadata !67} ; [ DW_TAG_member ]
!67 = metadata !{i32 589846, metadata !68, metadata !"uint32_t", metadata !68, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !69} ; [ DW_TAG_typedef ]
!68 = metadata !{i32 589865, metadata !"stdint.h", metadata !"/usr/include", metadata !47} ; [ DW_TAG_file_type ]
!69 = metadata !{i32 589860, metadata !46, metadata !"unsigned int", metadata !46, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!70 = metadata !{i32 589837, metadata !61, metadata !"reg_size", metadata !60, i32 11, i64 32, i64 32, i64 832, i32 0, metadata !53} ; [ DW_TAG_member ]
!71 = metadata !{i32 589837, metadata !61, metadata !"def", metadata !60, i32 12, i64 32, i64 32, i64 864, i32 0, metadata !67} ; [ DW_TAG_member ]
!72 = metadata !{i32 589837, metadata !61, metadata !"rmask", metadata !60, i32 13, i64 32, i64 32, i64 896, i32 0, metadata !67} ; [ DW_TAG_member ]
!73 = metadata !{i32 589837, metadata !61, metadata !"wmask", metadata !60, i32 14, i64 32, i64 32, i64 928, i32 0, metadata !67} ; [ DW_TAG_member ]
!74 = metadata !{i32 589837, metadata !61, metadata !"w1c", metadata !60, i32 15, i64 32, i64 32, i64 960, i32 0, metadata !67} ; [ DW_TAG_member ]
!75 = metadata !{i32 589837, metadata !61, metadata !"val", metadata !60, i32 16, i64 32, i64 32, i64 992, i32 0, metadata !67} ; [ DW_TAG_member ]
!76 = metadata !{i32 589870, i32 0, metadata !77, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", metadata !77, i32 12, metadata !79, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, void (i64)* @klee_div_zero_che
!77 = metadata !{i32 589865, metadata !"klee_div_zero_check.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic", metadata !78} ; [ DW_TAG_file_type ]
!78 = metadata !{i32 589841, i32 0, i32 1, metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/kl
!79 = metadata !{i32 589845, metadata !77, metadata !"", metadata !77, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !49, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!80 = metadata !{i32 589870, i32 0, metadata !81, metadata !"klee_int", metadata !"klee_int", metadata !"", metadata !81, i32 13, metadata !83, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i32 (i8*)* @klee_int} ; [ DW_TAG_subprogram ]
!81 = metadata !{i32 589865, metadata !"klee_int.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic", metadata !82} ; [ DW_TAG_file_type ]
!82 = metadata !{i32 589841, i32 0, i32 1, metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic/klee_int.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/
!83 = metadata !{i32 589845, metadata !81, metadata !"", metadata !81, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !84, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!84 = metadata !{metadata !85}
!85 = metadata !{i32 589860, metadata !82, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!86 = metadata !{i32 589870, i32 0, metadata !87, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", metadata !87, i32 20, metadata !89, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, void (i64, i64)* @klee_overs
!87 = metadata !{i32 589865, metadata !"klee_overshift_check.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic", metadata !88} ; [ DW_TAG_file_type ]
!88 = metadata !{i32 589841, i32 0, i32 1, metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/k
!89 = metadata !{i32 589845, metadata !87, metadata !"", metadata !87, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !49, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!90 = metadata !{i32 589870, i32 0, metadata !91, metadata !"klee_range", metadata !"klee_range", metadata !"", metadata !91, i32 13, metadata !93, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range} ; [ DW_TAG_sub
!91 = metadata !{i32 589865, metadata !"klee_range.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic", metadata !92} ; [ DW_TAG_file_type ]
!92 = metadata !{i32 589841, i32 0, i32 1, metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic/klee_range.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtim
!93 = metadata !{i32 589845, metadata !91, metadata !"", metadata !91, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !94, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!94 = metadata !{metadata !95}
!95 = metadata !{i32 589860, metadata !92, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!96 = metadata !{i32 589870, i32 0, metadata !97, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !97, i32 12, metadata !99, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!97 = metadata !{i32 589865, metadata !"memcpy.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic", metadata !98} ; [ DW_TAG_file_type ]
!98 = metadata !{i32 589841, i32 0, i32 1, metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic/memcpy.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/In
!99 = metadata !{i32 589845, metadata !97, metadata !"", metadata !97, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !100, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!100 = metadata !{metadata !101}
!101 = metadata !{i32 589839, metadata !98, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!102 = metadata !{i32 589870, i32 0, metadata !103, metadata !"memmove", metadata !"memmove", metadata !"", metadata !103, i32 12, metadata !105, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!103 = metadata !{i32 589865, metadata !"memmove.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic", metadata !104} ; [ DW_TAG_file_type ]
!104 = metadata !{i32 589841, i32 0, i32 1, metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic/memmove.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/
!105 = metadata !{i32 589845, metadata !103, metadata !"", metadata !103, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !106, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!106 = metadata !{metadata !107}
!107 = metadata !{i32 589839, metadata !104, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!108 = metadata !{i32 589870, i32 0, metadata !109, metadata !"mempcpy", metadata !"mempcpy", metadata !"", metadata !109, i32 11, metadata !111, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy} ; [ DW_TAG_subprogr
!109 = metadata !{i32 589865, metadata !"mempcpy.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic", metadata !110} ; [ DW_TAG_file_type ]
!110 = metadata !{i32 589841, i32 0, i32 1, metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic/mempcpy.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/
!111 = metadata !{i32 589845, metadata !109, metadata !"", metadata !109, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !112, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!112 = metadata !{metadata !113}
!113 = metadata !{i32 589839, metadata !110, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!114 = metadata !{i32 589870, i32 0, metadata !115, metadata !"memset", metadata !"memset", metadata !"", metadata !115, i32 11, metadata !117, i1 false, i1 true, i32 0, i32 0, i32 0, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!115 = metadata !{i32 589865, metadata !"memset.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic", metadata !116} ; [ DW_TAG_file_type ]
!116 = metadata !{i32 589841, i32 0, i32 1, metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/Intrinsic/memset.c", metadata !"/home/saksham/work/freescale/validation/modelling/klee_install_script/klee/runtime/I
!117 = metadata !{i32 589845, metadata !115, metadata !"", metadata !115, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !118, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!118 = metadata !{metadata !119}
!119 = metadata !{i32 589839, metadata !116, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!120 = metadata !{i32 589876, i32 0, metadata !46, metadata !"STM_REG_COUNT", metadata !"STM_REG_COUNT", metadata !"", metadata !46, i32 5, metadata !121, i1 false, i1 true, null} ; [ DW_TAG_variable ]
!121 = metadata !{i32 589862, metadata !46, metadata !"", metadata !46, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !53} ; [ DW_TAG_const_type ]
!122 = metadata !{i32 589876, i32 0, metadata !46, metadata !"INTC_REG_COUNT", metadata !"INTC_REG_COUNT", metadata !"", metadata !46, i32 9, metadata !121, i1 false, i1 true, null} ; [ DW_TAG_variable ]
!123 = metadata !{i32 589876, i32 0, metadata !46, metadata !"MC_CGM_REG_COUNT", metadata !"MC_CGM_REG_COUNT", metadata !"", metadata !46, i32 13, metadata !121, i1 false, i1 true, null} ; [ DW_TAG_variable ]
!124 = metadata !{i32 589876, i32 0, metadata !46, metadata !"PSEUDO_REG_COUNT", metadata !"PSEUDO_REG_COUNT", metadata !"", metadata !46, i32 17, metadata !121, i1 false, i1 true, null} ; [ DW_TAG_variable ]
!125 = metadata !{i32 589876, i32 0, metadata !46, metadata !"STM", metadata !"STM", metadata !"", metadata !46, i32 4, metadata !126, i1 false, i1 true, %struct.STM_tag* @STM} ; [ DW_TAG_variable ]
!126 = metadata !{i32 589846, metadata !127, metadata !"STM_tag", metadata !127, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !128} ; [ DW_TAG_typedef ]
!127 = metadata !{i32 589865, metadata !"stm_main.h", metadata !"/home/saksham/work/freescale/validation/modelling/automatic_test_gen/stm/", metadata !47} ; [ DW_TAG_file_type ]
!128 = metadata !{i32 589843, metadata !46, metadata !"", metadata !127, i32 39, i64 14336, i64 32, i64 0, i32 0, null, metadata !129, i32 0, null} ; [ DW_TAG_structure_type ]
!129 = metadata !{metadata !130, metadata !131, metadata !132}
!130 = metadata !{i32 589837, metadata !128, metadata !"CR", metadata !127, i32 40, i64 1024, i64 32, i64 0, i32 0, metadata !59} ; [ DW_TAG_member ]
!131 = metadata !{i32 589837, metadata !128, metadata !"CNT", metadata !127, i32 41, i64 1024, i64 32, i64 1024, i32 0, metadata !59} ; [ DW_TAG_member ]
!132 = metadata !{i32 589837, metadata !128, metadata !"CHANNEL", metadata !127, i32 42, i64 12288, i64 32, i64 2048, i32 0, metadata !133} ; [ DW_TAG_member ]
!133 = metadata !{i32 589825, metadata !46, metadata !"", metadata !46, i32 0, i64 12288, i64 32, i64 0, i32 0, metadata !134, metadata !140, i32 0, null} ; [ DW_TAG_array_type ]
!134 = metadata !{i32 589846, metadata !127, metadata !"STM_channel_tag", metadata !127, i32 39, i64 0, i64 0, i64 0, i32 0, metadata !135} ; [ DW_TAG_typedef ]
!135 = metadata !{i32 589843, metadata !46, metadata !"", metadata !127, i32 32, i64 3072, i64 32, i64 0, i32 0, null, metadata !136, i32 0, null} ; [ DW_TAG_structure_type ]
!136 = metadata !{metadata !137, metadata !138, metadata !139}
!137 = metadata !{i32 589837, metadata !135, metadata !"CCR", metadata !127, i32 33, i64 1024, i64 32, i64 0, i32 0, metadata !59} ; [ DW_TAG_member ]
!138 = metadata !{i32 589837, metadata !135, metadata !"CIF", metadata !127, i32 34, i64 1024, i64 32, i64 1024, i32 0, metadata !59} ; [ DW_TAG_member ]
!139 = metadata !{i32 589837, metadata !135, metadata !"CMP", metadata !127, i32 35, i64 1024, i64 32, i64 2048, i32 0, metadata !59} ; [ DW_TAG_member ]
!140 = metadata !{metadata !141}
!141 = metadata !{i32 589857, i64 0, i64 3}       ; [ DW_TAG_subrange_type ]
!142 = metadata !{i32 589876, i32 0, metadata !46, metadata !"INTC", metadata !"INTC", metadata !"", metadata !46, i32 8, metadata !143, i1 false, i1 true, %struct.INTC_tag* @INTC} ; [ DW_TAG_variable ]
!143 = metadata !{i32 589846, metadata !127, metadata !"INTC_tag", metadata !127, i32 52, i64 0, i64 0, i64 0, i32 0, metadata !144} ; [ DW_TAG_typedef ]
!144 = metadata !{i32 589843, metadata !46, metadata !"", metadata !127, i32 46, i64 1024, i64 32, i64 0, i32 0, null, metadata !145, i32 0, null} ; [ DW_TAG_structure_type ]
!145 = metadata !{metadata !146}
!146 = metadata !{i32 589837, metadata !144, metadata !"IACKR0", metadata !127, i32 47, i64 1024, i64 32, i64 0, i32 0, metadata !59} ; [ DW_TAG_member ]
!147 = metadata !{i32 589876, i32 0, metadata !46, metadata !"MC_CGM", metadata !"MC_CGM", metadata !"", metadata !46, i32 12, metadata !148, i1 false, i1 true, %struct.INTC_tag* @MC_CGM} ; [ DW_TAG_variable ]
!148 = metadata !{i32 589846, metadata !127, metadata !"MC_CGM_tag", metadata !127, i32 58, i64 0, i64 0, i64 0, i32 0, metadata !149} ; [ DW_TAG_typedef ]
!149 = metadata !{i32 589843, metadata !46, metadata !"", metadata !127, i32 52, i64 1024, i64 32, i64 0, i32 0, null, metadata !150, i32 0, null} ; [ DW_TAG_structure_type ]
!150 = metadata !{metadata !151}
!151 = metadata !{i32 589837, metadata !149, metadata !"SC_DC2", metadata !127, i32 53, i64 1024, i64 32, i64 0, i32 0, metadata !59} ; [ DW_TAG_member ]
!152 = metadata !{i32 589876, i32 0, metadata !46, metadata !"PSEUDO_REG", metadata !"PSEUDO_REG", metadata !"", metadata !46, i32 16, metadata !153, i1 false, i1 true, %struct.PSEUDO_REG_tag* @PSEUDO_REG} ; [ DW_TAG_variable ]
!153 = metadata !{i32 589846, metadata !127, metadata !"PSEUDO_REG_tag", metadata !127, i32 67, i64 0, i64 0, i64 0, i32 0, metadata !154} ; [ DW_TAG_typedef ]
!154 = metadata !{i32 589843, metadata !46, metadata !"", metadata !127, i32 58, i64 4096, i64 32, i64 0, i32 0, null, metadata !155, i32 0, null} ; [ DW_TAG_structure_type ]
!155 = metadata !{metadata !156, metadata !157, metadata !158, metadata !159}
!156 = metadata !{i32 589837, metadata !154, metadata !"WAIT", metadata !127, i32 59, i64 1024, i64 32, i64 0, i32 0, metadata !59} ; [ DW_TAG_member ]
!157 = metadata !{i32 589837, metadata !154, metadata !"POR", metadata !127, i32 60, i64 1024, i64 32, i64 1024, i32 0, metadata !59} ; [ DW_TAG_member ]
!158 = metadata !{i32 589837, metadata !154, metadata !"DEBUG_ON", metadata !127, i32 61, i64 1024, i64 32, i64 2048, i32 0, metadata !59} ; [ DW_TAG_member ]
!159 = metadata !{i32 589837, metadata !154, metadata !"DEBUG_OFF", metadata !127, i32 62, i64 1024, i64 32, i64 3072, i32 0, metadata !59} ; [ DW_TAG_member ]
!160 = metadata !{i32 589876, i32 0, metadata !46, metadata !"ALL_REG", metadata !"ALL_REG", metadata !"", metadata !46, i32 20, metadata !161, i1 false, i1 true, [100 x %struct.reg*]* @ALL_REG} ; [ DW_TAG_variable ]
!161 = metadata !{i32 589825, metadata !46, metadata !"", metadata !46, i32 0, i64 6400, i64 64, i64 0, i32 0, metadata !58, metadata !19, i32 0, null} ; [ DW_TAG_array_type ]
!162 = metadata !{i32 589876, i32 0, metadata !46, metadata !"ALL_REG_COUNT", metadata !"ALL_REG_COUNT", metadata !"", metadata !46, i32 21, metadata !53, i1 false, i1 true, null} ; [ DW_TAG_variable ]
!163 = metadata !{i32 589876, i32 0, metadata !46, metadata !"STM_STATE", metadata !"STM_STATE", metadata !"", metadata !46, i32 24, metadata !164, i1 false, i1 true, null} ; [ DW_TAG_variable ]
!164 = metadata !{i32 589846, metadata !127, metadata !"STM_STATE_tag", metadata !127, i32 69, i64 0, i64 0, i64 0, i32 0, metadata !165} ; [ DW_TAG_typedef ]
!165 = metadata !{i32 589843, metadata !46, metadata !"", metadata !127, i32 67, i64 32, i64 32, i64 0, i32 0, null, metadata !166, i32 0, null} ; [ DW_TAG_structure_type ]
!166 = metadata !{metadata !167}
!167 = metadata !{i32 589837, metadata !165, metadata !"DEBUG_MODE", metadata !127, i32 68, i64 32, i64 32, i64 0, i32 0, metadata !53} ; [ DW_TAG_member ]
!168 = metadata !{i32 590081, metadata !76, metadata !"z", metadata !77, i32 16777228, metadata !169, i32 0} ; [ DW_TAG_arg_variable ]
!169 = metadata !{i32 589860, metadata !78, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!170 = metadata !{i32 590081, metadata !80, metadata !"name", metadata !81, i32 16777229, metadata !171, i32 0} ; [ DW_TAG_arg_variable ]
!171 = metadata !{i32 589839, metadata !82, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !172} ; [ DW_TAG_pointer_type ]
!172 = metadata !{i32 589862, metadata !82, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !173} ; [ DW_TAG_const_type ]
!173 = metadata !{i32 589860, metadata !82, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!174 = metadata !{i32 590080, metadata !175, metadata !"x", metadata !81, i32 14, metadata !85, i32 0} ; [ DW_TAG_auto_variable ]
!175 = metadata !{i32 589835, metadata !80, i32 13, i32 32, metadata !81, i32 0} ; [ DW_TAG_lexical_block ]
!176 = metadata !{i32 590081, metadata !86, metadata !"bitWidth", metadata !87, i32 16777236, metadata !177, i32 0} ; [ DW_TAG_arg_variable ]
!177 = metadata !{i32 589860, metadata !88, metadata !"long long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!178 = metadata !{i32 590081, metadata !86, metadata !"shift", metadata !87, i32 33554452, metadata !177, i32 0} ; [ DW_TAG_arg_variable ]
!179 = metadata !{i32 590081, metadata !90, metadata !"start", metadata !91, i32 16777229, metadata !95, i32 0} ; [ DW_TAG_arg_variable ]
!180 = metadata !{i32 590081, metadata !90, metadata !"end", metadata !91, i32 33554445, metadata !95, i32 0} ; [ DW_TAG_arg_variable ]
!181 = metadata !{i32 590081, metadata !90, metadata !"name", metadata !91, i32 50331661, metadata !182, i32 0} ; [ DW_TAG_arg_variable ]
!182 = metadata !{i32 589839, metadata !92, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !183} ; [ DW_TAG_pointer_type ]
!183 = metadata !{i32 589862, metadata !92, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !184} ; [ DW_TAG_const_type ]
!184 = metadata !{i32 589860, metadata !92, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!185 = metadata !{i32 590080, metadata !186, metadata !"x", metadata !91, i32 14, metadata !95, i32 0} ; [ DW_TAG_auto_variable ]
!186 = metadata !{i32 589835, metadata !90, i32 13, i32 54, metadata !91, i32 0} ; [ DW_TAG_lexical_block ]
!187 = metadata !{i32 590081, metadata !96, metadata !"destaddr", metadata !97, i32 16777228, metadata !101, i32 0} ; [ DW_TAG_arg_variable ]
!188 = metadata !{i32 590081, metadata !96, metadata !"srcaddr", metadata !97, i32 33554444, metadata !189, i32 0} ; [ DW_TAG_arg_variable ]
!189 = metadata !{i32 589839, metadata !98, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !190} ; [ DW_TAG_pointer_type ]
!190 = metadata !{i32 589862, metadata !98, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ]
!191 = metadata !{i32 590081, metadata !96, metadata !"len", metadata !97, i32 50331660, metadata !192, i32 0} ; [ DW_TAG_arg_variable ]
!192 = metadata !{i32 589846, metadata !98, metadata !"size_t", metadata !97, i32 32, i64 0, i64 0, i64 0, i32 0, metadata !193} ; [ DW_TAG_typedef ]
!193 = metadata !{i32 589860, metadata !98, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!194 = metadata !{i32 590080, metadata !195, metadata !"dest", metadata !97, i32 13, metadata !196, i32 0} ; [ DW_TAG_auto_variable ]
!195 = metadata !{i32 589835, metadata !96, i32 12, i32 85, metadata !97, i32 0} ; [ DW_TAG_lexical_block ]
!196 = metadata !{i32 589839, metadata !98, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !197} ; [ DW_TAG_pointer_type ]
!197 = metadata !{i32 589860, metadata !98, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!198 = metadata !{i32 590080, metadata !195, metadata !"src", metadata !97, i32 14, metadata !199, i32 0} ; [ DW_TAG_auto_variable ]
!199 = metadata !{i32 589839, metadata !98, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !200} ; [ DW_TAG_pointer_type ]
!200 = metadata !{i32 589862, metadata !98, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !197} ; [ DW_TAG_const_type ]
!201 = metadata !{i32 590081, metadata !102, metadata !"dst", metadata !103, i32 16777228, metadata !107, i32 0} ; [ DW_TAG_arg_variable ]
!202 = metadata !{i32 590081, metadata !102, metadata !"src", metadata !103, i32 33554444, metadata !203, i32 0} ; [ DW_TAG_arg_variable ]
!203 = metadata !{i32 589839, metadata !104, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !204} ; [ DW_TAG_pointer_type ]
!204 = metadata !{i32 589862, metadata !104, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ]
!205 = metadata !{i32 590081, metadata !102, metadata !"count", metadata !103, i32 50331660, metadata !206, i32 0} ; [ DW_TAG_arg_variable ]
!206 = metadata !{i32 589846, metadata !104, metadata !"size_t", metadata !103, i32 32, i64 0, i64 0, i64 0, i32 0, metadata !207} ; [ DW_TAG_typedef ]
!207 = metadata !{i32 589860, metadata !104, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!208 = metadata !{i32 590080, metadata !209, metadata !"a", metadata !103, i32 13, metadata !210, i32 0} ; [ DW_TAG_auto_variable ]
!209 = metadata !{i32 589835, metadata !102, i32 12, i32 79, metadata !103, i32 0} ; [ DW_TAG_lexical_block ]
!210 = metadata !{i32 589839, metadata !104, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !211} ; [ DW_TAG_pointer_type ]
!211 = metadata !{i32 589860, metadata !104, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!212 = metadata !{i32 590080, metadata !209, metadata !"b", metadata !103, i32 14, metadata !213, i32 0} ; [ DW_TAG_auto_variable ]
!213 = metadata !{i32 589839, metadata !104, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !214} ; [ DW_TAG_pointer_type ]
!214 = metadata !{i32 589862, metadata !104, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !211} ; [ DW_TAG_const_type ]
!215 = metadata !{i32 590081, metadata !108, metadata !"destaddr", metadata !109, i32 16777227, metadata !113, i32 0} ; [ DW_TAG_arg_variable ]
!216 = metadata !{i32 590081, metadata !108, metadata !"srcaddr", metadata !109, i32 33554443, metadata !217, i32 0} ; [ DW_TAG_arg_variable ]
!217 = metadata !{i32 589839, metadata !110, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !218} ; [ DW_TAG_pointer_type ]
!218 = metadata !{i32 589862, metadata !110, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ]
!219 = metadata !{i32 590081, metadata !108, metadata !"len", metadata !109, i32 50331659, metadata !220, i32 0} ; [ DW_TAG_arg_variable ]
!220 = metadata !{i32 589846, metadata !110, metadata !"size_t", metadata !109, i32 32, i64 0, i64 0, i64 0, i32 0, metadata !221} ; [ DW_TAG_typedef ]
!221 = metadata !{i32 589860, metadata !110, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!222 = metadata !{i32 590080, metadata !223, metadata !"dest", metadata !109, i32 12, metadata !224, i32 0} ; [ DW_TAG_auto_variable ]
!223 = metadata !{i32 589835, metadata !108, i32 11, i32 86, metadata !109, i32 0} ; [ DW_TAG_lexical_block ]
!224 = metadata !{i32 589839, metadata !110, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !225} ; [ DW_TAG_pointer_type ]
!225 = metadata !{i32 589860, metadata !110, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!226 = metadata !{i32 590080, metadata !223, metadata !"src", metadata !109, i32 13, metadata !227, i32 0} ; [ DW_TAG_auto_variable ]
!227 = metadata !{i32 589839, metadata !110, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !228} ; [ DW_TAG_pointer_type ]
!228 = metadata !{i32 589862, metadata !110, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !225} ; [ DW_TAG_const_type ]
!229 = metadata !{i32 590081, metadata !114, metadata !"dst", metadata !115, i32 16777227, metadata !119, i32 0} ; [ DW_TAG_arg_variable ]
!230 = metadata !{i32 590081, metadata !114, metadata !"s", metadata !115, i32 33554443, metadata !231, i32 0} ; [ DW_TAG_arg_variable ]
!231 = metadata !{i32 589860, metadata !116, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!232 = metadata !{i32 590081, metadata !114, metadata !"count", metadata !115, i32 50331659, metadata !233, i32 0} ; [ DW_TAG_arg_variable ]
!233 = metadata !{i32 589846, metadata !116, metadata !"size_t", metadata !115, i32 32, i64 0, i64 0, i64 0, i32 0, metadata !234} ; [ DW_TAG_typedef ]
!234 = metadata !{i32 589860, metadata !116, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!235 = metadata !{i32 590080, metadata !236, metadata !"a", metadata !115, i32 12, metadata !237, i32 0} ; [ DW_TAG_auto_variable ]
!236 = metadata !{i32 589835, metadata !114, i32 11, i32 70, metadata !115, i32 0} ; [ DW_TAG_lexical_block ]
!237 = metadata !{i32 589839, metadata !116, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !238} ; [ DW_TAG_pointer_type ]
!238 = metadata !{i32 589877, metadata !116, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !239} ; [ DW_TAG_volatile_type ]
!239 = metadata !{i32 589860, metadata !116, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!240 = metadata !{i32 17, i32 0, metadata !241, null}
!241 = metadata !{i32 589835, metadata !0, i32 12, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!242 = metadata !{i32 18, i32 0, metadata !241, null}
!243 = metadata !{i32 20, i32 0, metadata !241, null}
!244 = metadata !{i32 22, i32 0, metadata !241, null}
!245 = metadata !{i32 23, i32 0, metadata !241, null}
!246 = metadata !{i32 28, i32 0, metadata !241, null}
!247 = metadata !{i32 29, i32 0, metadata !241, null}
!248 = metadata !{i32 30, i32 0, metadata !241, null}
!249 = metadata !{i32 31, i32 0, metadata !241, null}
!250 = metadata !{i32 114, i32 0, metadata !251, metadata !252}
!251 = metadata !{i32 589835, metadata !55, i32 113, i32 0, metadata !46, i32 3} ; [ DW_TAG_lexical_block ]
!252 = metadata !{i32 32, i32 0, metadata !241, null}
!253 = metadata !{i32 116, i32 0, metadata !251, metadata !252}
!254 = metadata !{i32 119, i32 0, metadata !251, metadata !252}
!255 = metadata !{i32 125, i32 0, metadata !251, metadata !252}
!256 = metadata !{i32 127, i32 0, metadata !257, metadata !252}
!257 = metadata !{i32 589835, metadata !251, i32 113, i32 0, metadata !46, i32 4} ; [ DW_TAG_lexical_block ]
!258 = metadata !{i32 75, i32 0, metadata !259, metadata !256}
!259 = metadata !{i32 589835, metadata !42, i32 72, i32 0, metadata !7, i32 5} ; [ DW_TAG_lexical_block ]
!260 = metadata !{i32 77, i32 0, metadata !259, metadata !256}
!261 = metadata !{i32 128, i32 0, metadata !257, metadata !252}
!262 = metadata !{i32 129, i32 0, metadata !257, metadata !252}
!263 = metadata !{i32 75, i32 0, metadata !259, metadata !262}
!264 = metadata !{i32 77, i32 0, metadata !259, metadata !262}
!265 = metadata !{i32 143, i32 0, metadata !257, metadata !252}
!266 = metadata !{i32 144, i32 0, metadata !267, metadata !252}
!267 = metadata !{i32 589835, metadata !257, i32 144, i32 0, metadata !46, i32 5} ; [ DW_TAG_lexical_block ]
!268 = metadata !{i32 145, i32 0, metadata !267, metadata !252}
!269 = metadata !{i32 146, i32 0, metadata !267, metadata !252}
!270 = metadata !{i32 99, i32 0, metadata !271, metadata !272}
!271 = metadata !{i32 589835, metadata !50, i32 97, i32 0, metadata !46, i32 1} ; [ DW_TAG_lexical_block ]
!272 = metadata !{i32 147, i32 0, metadata !267, metadata !252}
!273 = metadata !{i32 101, i32 0, metadata !271, metadata !272}
!274 = metadata !{i32 152, i32 0, metadata !251, metadata !252}
!275 = metadata !{i32 153, i32 0, metadata !276, metadata !252}
!276 = metadata !{i32 589835, metadata !251, i32 153, i32 0, metadata !46, i32 6} ; [ DW_TAG_lexical_block ]
!277 = metadata !{i32 75, i32 0, metadata !259, metadata !275}
!278 = metadata !{i32 77, i32 0, metadata !259, metadata !275}
!279 = metadata !{i32 155, i32 0, metadata !276, metadata !252}
!280 = metadata !{i32 156, i32 0, metadata !276, metadata !252}
!281 = metadata !{i32 75, i32 0, metadata !259, metadata !280}
!282 = metadata !{i32 77, i32 0, metadata !259, metadata !280}
!283 = metadata !{i32 158, i32 0, metadata !276, metadata !252}
!284 = metadata !{i32 107, i32 0, metadata !285, metadata !286}
!285 = metadata !{i32 589835, metadata !54, i32 104, i32 0, metadata !46, i32 2} ; [ DW_TAG_lexical_block ]
!286 = metadata !{i32 159, i32 0, metadata !276, metadata !252}
!287 = metadata !{i32 110, i32 0, metadata !285, metadata !286}
!288 = metadata !{i32 163, i32 0, metadata !251, metadata !252}
!289 = metadata !{i32 165, i32 0, metadata !251, metadata !252}
!290 = metadata !{i32 178, i32 0, metadata !251, metadata !252}
!291 = metadata !{i32 179, i32 0, metadata !292, metadata !252}
!292 = metadata !{i32 589835, metadata !251, i32 179, i32 0, metadata !46, i32 7} ; [ DW_TAG_lexical_block ]
!293 = metadata !{i32 75, i32 0, metadata !259, metadata !291}
!294 = metadata !{i32 77, i32 0, metadata !259, metadata !291}
!295 = metadata !{i32 180, i32 0, metadata !292, metadata !252}
!296 = metadata !{i32 181, i32 0, metadata !292, metadata !252}
!297 = metadata !{i32 75, i32 0, metadata !259, metadata !296}
!298 = metadata !{i32 77, i32 0, metadata !259, metadata !296}
!299 = metadata !{i32 195, i32 0, metadata !292, metadata !252}
!300 = metadata !{i32 196, i32 0, metadata !301, metadata !252}
!301 = metadata !{i32 589835, metadata !292, i32 196, i32 0, metadata !46, i32 8} ; [ DW_TAG_lexical_block ]
!302 = metadata !{i32 197, i32 0, metadata !301, metadata !252}
!303 = metadata !{i32 198, i32 0, metadata !301, metadata !252}
!304 = metadata !{i32 99, i32 0, metadata !271, metadata !305}
!305 = metadata !{i32 199, i32 0, metadata !301, metadata !252}
!306 = metadata !{i32 101, i32 0, metadata !271, metadata !305}
!307 = metadata !{i32 205, i32 0, metadata !251, metadata !252}
!308 = metadata !{i32 206, i32 0, metadata !309, metadata !252}
!309 = metadata !{i32 589835, metadata !251, i32 206, i32 0, metadata !46, i32 9} ; [ DW_TAG_lexical_block ]
!310 = metadata !{i32 75, i32 0, metadata !259, metadata !308}
!311 = metadata !{i32 77, i32 0, metadata !259, metadata !308}
!312 = metadata !{i32 208, i32 0, metadata !309, metadata !252}
!313 = metadata !{i32 209, i32 0, metadata !309, metadata !252}
!314 = metadata !{i32 75, i32 0, metadata !259, metadata !313}
!315 = metadata !{i32 77, i32 0, metadata !259, metadata !313}
!316 = metadata !{i32 211, i32 0, metadata !309, metadata !252}
!317 = metadata !{i32 107, i32 0, metadata !285, metadata !318}
!318 = metadata !{i32 212, i32 0, metadata !309, metadata !252}
!319 = metadata !{i32 110, i32 0, metadata !285, metadata !318}
!320 = metadata !{i32 216, i32 0, metadata !251, metadata !252}
!321 = metadata !{i32 218, i32 0, metadata !251, metadata !252}
!322 = metadata !{i32 231, i32 0, metadata !251, metadata !252}
!323 = metadata !{i32 232, i32 0, metadata !324, metadata !252}
!324 = metadata !{i32 589835, metadata !251, i32 232, i32 0, metadata !46, i32 10} ; [ DW_TAG_lexical_block ]
!325 = metadata !{i32 75, i32 0, metadata !259, metadata !323}
!326 = metadata !{i32 77, i32 0, metadata !259, metadata !323}
!327 = metadata !{i32 233, i32 0, metadata !324, metadata !252}
!328 = metadata !{i32 234, i32 0, metadata !324, metadata !252}
!329 = metadata !{i32 75, i32 0, metadata !259, metadata !328}
!330 = metadata !{i32 77, i32 0, metadata !259, metadata !328}
!331 = metadata !{i32 248, i32 0, metadata !324, metadata !252}
!332 = metadata !{i32 249, i32 0, metadata !333, metadata !252}
!333 = metadata !{i32 589835, metadata !324, i32 249, i32 0, metadata !46, i32 11} ; [ DW_TAG_lexical_block ]
!334 = metadata !{i32 250, i32 0, metadata !333, metadata !252}
!335 = metadata !{i32 251, i32 0, metadata !333, metadata !252}
!336 = metadata !{i32 99, i32 0, metadata !271, metadata !337}
!337 = metadata !{i32 252, i32 0, metadata !333, metadata !252}
!338 = metadata !{i32 101, i32 0, metadata !271, metadata !337}
!339 = metadata !{i32 258, i32 0, metadata !251, metadata !252}
!340 = metadata !{i32 259, i32 0, metadata !341, metadata !252}
!341 = metadata !{i32 589835, metadata !251, i32 259, i32 0, metadata !46, i32 12} ; [ DW_TAG_lexical_block ]
!342 = metadata !{i32 75, i32 0, metadata !259, metadata !340}
!343 = metadata !{i32 77, i32 0, metadata !259, metadata !340}
!344 = metadata !{i32 261, i32 0, metadata !341, metadata !252}
!345 = metadata !{i32 262, i32 0, metadata !341, metadata !252}
!346 = metadata !{i32 75, i32 0, metadata !259, metadata !345}
!347 = metadata !{i32 77, i32 0, metadata !259, metadata !345}
!348 = metadata !{i32 264, i32 0, metadata !341, metadata !252}
!349 = metadata !{i32 107, i32 0, metadata !285, metadata !350}
!350 = metadata !{i32 265, i32 0, metadata !341, metadata !252}
!351 = metadata !{i32 110, i32 0, metadata !285, metadata !350}
!352 = metadata !{i32 269, i32 0, metadata !251, metadata !252}
!353 = metadata !{i32 271, i32 0, metadata !251, metadata !252}
!354 = metadata !{i32 284, i32 0, metadata !251, metadata !252}
!355 = metadata !{i32 285, i32 0, metadata !356, metadata !252}
!356 = metadata !{i32 589835, metadata !251, i32 285, i32 0, metadata !46, i32 13} ; [ DW_TAG_lexical_block ]
!357 = metadata !{i32 75, i32 0, metadata !259, metadata !355}
!358 = metadata !{i32 77, i32 0, metadata !259, metadata !355}
!359 = metadata !{i32 286, i32 0, metadata !356, metadata !252}
!360 = metadata !{i32 287, i32 0, metadata !356, metadata !252}
!361 = metadata !{i32 75, i32 0, metadata !259, metadata !360}
!362 = metadata !{i32 77, i32 0, metadata !259, metadata !360}
!363 = metadata !{i32 301, i32 0, metadata !356, metadata !252}
!364 = metadata !{i32 302, i32 0, metadata !365, metadata !252}
!365 = metadata !{i32 589835, metadata !356, i32 302, i32 0, metadata !46, i32 14} ; [ DW_TAG_lexical_block ]
!366 = metadata !{i32 303, i32 0, metadata !365, metadata !252}
!367 = metadata !{i32 304, i32 0, metadata !365, metadata !252}
!368 = metadata !{i32 99, i32 0, metadata !271, metadata !369}
!369 = metadata !{i32 305, i32 0, metadata !365, metadata !252}
!370 = metadata !{i32 101, i32 0, metadata !271, metadata !369}
!371 = metadata !{i32 311, i32 0, metadata !251, metadata !252}
!372 = metadata !{i32 312, i32 0, metadata !373, metadata !252}
!373 = metadata !{i32 589835, metadata !251, i32 312, i32 0, metadata !46, i32 15} ; [ DW_TAG_lexical_block ]
!374 = metadata !{i32 75, i32 0, metadata !259, metadata !372}
!375 = metadata !{i32 77, i32 0, metadata !259, metadata !372}
!376 = metadata !{i32 314, i32 0, metadata !373, metadata !252}
!377 = metadata !{i32 315, i32 0, metadata !373, metadata !252}
!378 = metadata !{i32 75, i32 0, metadata !259, metadata !377}
!379 = metadata !{i32 77, i32 0, metadata !259, metadata !377}
!380 = metadata !{i32 317, i32 0, metadata !373, metadata !252}
!381 = metadata !{i32 107, i32 0, metadata !285, metadata !382}
!382 = metadata !{i32 318, i32 0, metadata !373, metadata !252}
!383 = metadata !{i32 110, i32 0, metadata !285, metadata !382}
!384 = metadata !{i32 322, i32 0, metadata !251, metadata !252}
!385 = metadata !{i32 324, i32 0, metadata !251, metadata !252}
!386 = metadata !{i32 338, i32 0, metadata !251, metadata !252}
!387 = metadata !{i32 341, i32 0, metadata !251, metadata !252}
!388 = metadata !{i32 345, i32 0, metadata !251, metadata !252}
!389 = metadata !{i32 347, i32 0, metadata !390, metadata !252}
!390 = metadata !{i32 589835, metadata !251, i32 347, i32 0, metadata !46, i32 16} ; [ DW_TAG_lexical_block ]
!391 = metadata !{i32 75, i32 0, metadata !259, metadata !389}
!392 = metadata !{i32 77, i32 0, metadata !259, metadata !389}
!393 = metadata !{i32 78, i32 0, metadata !259, metadata !389}
!394 = metadata !{i32 349, i32 0, metadata !390, metadata !252}
!395 = metadata !{i32 355, i32 0, metadata !396, metadata !252}
!396 = metadata !{i32 589835, metadata !390, i32 355, i32 0, metadata !46, i32 17} ; [ DW_TAG_lexical_block ]
!397 = metadata !{i32 75, i32 0, metadata !259, metadata !395}
!398 = metadata !{i32 77, i32 0, metadata !259, metadata !395}
!399 = metadata !{i32 78, i32 0, metadata !259, metadata !395}
!400 = metadata !{i32 77, i32 0, metadata !259, metadata !401}
!401 = metadata !{i32 356, i32 0, metadata !396, metadata !252}
!402 = metadata !{i32 75, i32 0, metadata !259, metadata !401}
!403 = metadata !{i32 357, i32 0, metadata !396, metadata !252}
!404 = metadata !{i32 362, i32 0, metadata !405, metadata !252}
!405 = metadata !{i32 589835, metadata !396, i32 362, i32 0, metadata !46, i32 18} ; [ DW_TAG_lexical_block ]
!406 = metadata !{i32 75, i32 0, metadata !259, metadata !407}
!407 = metadata !{i32 363, i32 0, metadata !405, metadata !252}
!408 = metadata !{i32 77, i32 0, metadata !259, metadata !407}
!409 = metadata !{i32 78, i32 0, metadata !259, metadata !407}
!410 = metadata !{i32 77, i32 0, metadata !259, metadata !411}
!411 = metadata !{i32 364, i32 0, metadata !405, metadata !252}
!412 = metadata !{i32 78, i32 0, metadata !259, metadata !411}
!413 = metadata !{i32 75, i32 0, metadata !259, metadata !411}
!414 = metadata !{i32 366, i32 0, metadata !405, metadata !252}
!415 = metadata !{i32 367, i32 0, metadata !405, metadata !252}
!416 = metadata !{i32 380, i32 0, metadata !417, metadata !252}
!417 = metadata !{i32 589835, metadata !405, i32 372, i32 0, metadata !46, i32 19} ; [ DW_TAG_lexical_block ]
!418 = metadata !{i32 370, i32 0, metadata !405, metadata !252}
!419 = metadata !{i32 372, i32 0, metadata !417, metadata !252}
!420 = metadata !{i32 75, i32 0, metadata !259, metadata !419}
!421 = metadata !{i32 77, i32 0, metadata !259, metadata !419}
!422 = metadata !{i32 373, i32 0, metadata !417, metadata !252}
!423 = metadata !{i32 377, i32 0, metadata !417, metadata !252}
!424 = metadata !{i32 382, i32 0, metadata !417, metadata !252}
!425 = metadata !{i32 99, i32 0, metadata !271, metadata !426}
!426 = metadata !{i32 384, i32 0, metadata !417, metadata !252}
!427 = metadata !{i32 101, i32 0, metadata !271, metadata !426}
!428 = metadata !{i32 389, i32 0, metadata !417, metadata !252}
!429 = metadata !{i32 99, i32 0, metadata !271, metadata !430}
!430 = metadata !{i32 391, i32 0, metadata !417, metadata !252}
!431 = metadata !{i32 101, i32 0, metadata !271, metadata !430}
!432 = metadata !{i32 401, i32 0, metadata !251, metadata !252}
!433 = metadata !{i32 402, i32 0, metadata !251, metadata !252}
!434 = metadata !{i32 405, i32 0, metadata !251, metadata !252}
!435 = metadata !{i32 406, i32 0, metadata !251, metadata !252}
!436 = metadata !{i32 408, i32 0, metadata !251, metadata !252}
!437 = metadata !{i32 409, i32 0, metadata !251, metadata !252}
!438 = metadata !{i32 34, i32 0, metadata !241, null}
!439 = metadata !{i32 13, i32 0, metadata !440, null}
!440 = metadata !{i32 589835, metadata !6, i32 8, i32 0, metadata !7, i32 0} ; [ DW_TAG_lexical_block ]
!441 = metadata !{i32 24, i32 0, metadata !440, null}
!442 = metadata !{i32 28, i32 0, metadata !440, null}
!443 = metadata !{i32 11, i32 0, metadata !440, null}
!444 = metadata !{i32 15, i32 0, metadata !440, null}
!445 = metadata !{i32 21, i32 0, metadata !440, null}
!446 = metadata !{i32 17, i32 0, metadata !440, null}
!447 = metadata !{i32 26, i32 0, metadata !440, null}
!448 = metadata !{i32 32, i32 0, metadata !440, null}
!449 = metadata !{i32 59, i32 0, metadata !450, null}
!450 = metadata !{i32 589835, metadata !39, i32 57, i32 0, metadata !7, i32 4} ; [ DW_TAG_lexical_block ]
!451 = metadata !{i32 61, i32 0, metadata !450, null}
!452 = metadata !{i32 51, i32 0, metadata !453, metadata !454}
!453 = metadata !{i32 589835, metadata !38, i32 50, i32 0, metadata !7, i32 3} ; [ DW_TAG_lexical_block ]
!454 = metadata !{i32 64, i32 0, metadata !450, null}
!455 = metadata !{i32 45, i32 0, metadata !456, metadata !457}
!456 = metadata !{i32 589835, metadata !35, i32 44, i32 0, metadata !7, i32 2} ; [ DW_TAG_lexical_block ]
!457 = metadata !{i32 62, i32 0, metadata !450, null}
!458 = metadata !{i32 66, i32 0, metadata !450, null}
!459 = metadata !{i32 65, i32 0, metadata !460, null}
!460 = metadata !{i32 589835, metadata !45, i32 29, i32 0, metadata !46, i32 0} ; [ DW_TAG_lexical_block ]
!461 = metadata !{i32 66, i32 0, metadata !460, null}
!462 = metadata !{i32 69, i32 0, metadata !460, null}
!463 = metadata !{i32 71, i32 0, metadata !460, null}
!464 = metadata !{i32 73, i32 0, metadata !460, null}
!465 = metadata !{i32 74, i32 0, metadata !460, null}
!466 = metadata !{i32 76, i32 0, metadata !460, null}
!467 = metadata !{i32 78, i32 0, metadata !460, null}
!468 = metadata !{i32 79, i32 0, metadata !460, null}
!469 = metadata !{i32 88, i32 0, metadata !460, null}
!470 = metadata !{i32 89, i32 0, metadata !460, null}
!471 = metadata !{i32 95, i32 0, metadata !460, null}
!472 = metadata !{i32 13, i32 3, metadata !473, null}
!473 = metadata !{i32 589835, metadata !76, i32 12, i32 39, metadata !77, i32 0} ; [ DW_TAG_lexical_block ]
!474 = metadata !{i32 14, i32 5, metadata !473, null}
!475 = metadata !{i32 15, i32 1, metadata !473, null}
!476 = metadata !{i32 15, i32 3, metadata !175, null}
!477 = metadata !{i32 16, i32 3, metadata !175, null}
!478 = metadata !{metadata !"int", metadata !479}
!479 = metadata !{metadata !"omnipotent char", metadata !480}
!480 = metadata !{metadata !"Simple C/C++ TBAA", null}
!481 = metadata !{i32 21, i32 3, metadata !482, null}
!482 = metadata !{i32 589835, metadata !86, i32 20, i32 82, metadata !87, i32 0} ; [ DW_TAG_lexical_block ]
!483 = metadata !{i32 27, i32 5, metadata !484, null}
!484 = metadata !{i32 589835, metadata !482, i32 21, i32 26, metadata !87, i32 1} ; [ DW_TAG_lexical_block ]
!485 = metadata !{i32 29, i32 1, metadata !482, null}
!486 = metadata !{i32 16, i32 3, metadata !186, null}
!487 = metadata !{i32 17, i32 5, metadata !186, null}
!488 = metadata !{i32 19, i32 3, metadata !186, null}
!489 = metadata !{i32 22, i32 5, metadata !490, null}
!490 = metadata !{i32 589835, metadata !186, i32 21, i32 10, metadata !91, i32 2} ; [ DW_TAG_lexical_block ]
!491 = metadata !{i32 25, i32 5, metadata !490, null}
!492 = metadata !{i32 26, i32 7, metadata !493, null}
!493 = metadata !{i32 589835, metadata !490, i32 25, i32 19, metadata !91, i32 3} ; [ DW_TAG_lexical_block ]
!494 = metadata !{i32 27, i32 5, metadata !493, null}
!495 = metadata !{i32 28, i32 7, metadata !496, null}
!496 = metadata !{i32 589835, metadata !490, i32 27, i32 12, metadata !91, i32 4} ; [ DW_TAG_lexical_block ]
!497 = metadata !{i32 29, i32 7, metadata !496, null}
!498 = metadata !{i32 30, i32 5, metadata !496, null}
!499 = metadata !{i32 32, i32 5, metadata !490, null}
!500 = metadata !{i32 34, i32 1, metadata !186, null}
!501 = metadata !{i32 15, i32 3, metadata !223, null}
!502 = metadata !{i32 16, i32 5, metadata !223, null}
!503 = metadata !{i32 17, i32 3, metadata !223, null}
