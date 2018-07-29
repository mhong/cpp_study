; ModuleID = 'crtp_asm.cpp'
source_filename = "crtp_asm.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.Base = type { i32 (...)** }
%class.Derived = type { %class.Base }

$_ZN7DerivedC2Ev = comdat any

$_ZN4BaseC2Ev = comdat any

$_ZN7Derived9interfaceEv = comdat any

$_ZN7DerivedD2Ev = comdat any

$_ZN7DerivedD0Ev = comdat any

$_ZN4BaseD2Ev = comdat any

$_ZN4BaseD0Ev = comdat any

$_ZTV7Derived = comdat any

$_ZTS7Derived = comdat any

$_ZTS4Base = comdat any

$_ZTI4Base = comdat any

$_ZTI7Derived = comdat any

$_ZTV4Base = comdat any

@_ZTV7Derived = linkonce_odr unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTI7Derived to i8*), i8* bitcast (i32 (%class.Derived*)* @_ZN7Derived9interfaceEv to i8*), i8* bitcast (void (%class.Derived*)* @_ZN7DerivedD2Ev to i8*), i8* bitcast (void (%class.Derived*)* @_ZN7DerivedD0Ev to i8*)] }, comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTS7Derived = linkonce_odr constant [9 x i8] c"7Derived\00", comdat
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTS4Base = linkonce_odr constant [6 x i8] c"4Base\00", comdat
@_ZTI4Base = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @_ZTS4Base, i32 0, i32 0) }, comdat
@_ZTI7Derived = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @_ZTS7Derived, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTI4Base to i8*) }, comdat
@_ZTV4Base = linkonce_odr unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTI4Base to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void (%class.Base*)* @_ZN4BaseD2Ev to i8*), i8* bitcast (void (%class.Base*)* @_ZN4BaseD0Ev to i8*)] }, comdat, align 8

; Function Attrs: noinline norecurse uwtable
define i32 @main() #0 !dbg !6 {
  %1 = alloca i32, align 4
  %2 = alloca %class.Base*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %class.Base** %2, metadata !10, metadata !24), !dbg !25
  %3 = call i8* @_Znwm(i64 8) #6, !dbg !26
  %4 = bitcast i8* %3 to %class.Derived*, !dbg !26
  %5 = bitcast %class.Derived* %4 to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 8, i32 8, i1 false), !dbg !27
  call void @_ZN7DerivedC2Ev(%class.Derived* %4) #7, !dbg !28
  %6 = bitcast %class.Derived* %4 to %class.Base*, !dbg !26
  store %class.Base* %6, %class.Base** %2, align 8, !dbg !25
  %7 = load %class.Base*, %class.Base** %2, align 8, !dbg !30
  %8 = bitcast %class.Base* %7 to i32 (%class.Base*)***, !dbg !31
  %9 = load i32 (%class.Base*)**, i32 (%class.Base*)*** %8, align 8, !dbg !31
  %10 = getelementptr inbounds i32 (%class.Base*)*, i32 (%class.Base*)** %9, i64 0, !dbg !31
  %11 = load i32 (%class.Base*)*, i32 (%class.Base*)** %10, align 8, !dbg !31
  %12 = call i32 %11(%class.Base* %7), !dbg !31
  %13 = load %class.Base*, %class.Base** %2, align 8, !dbg !32
  %14 = icmp eq %class.Base* %13, null, !dbg !33
  br i1 %14, label %20, label %15, !dbg !33

; <label>:15:                                     ; preds = %0
  %16 = bitcast %class.Base* %13 to void (%class.Base*)***, !dbg !34
  %17 = load void (%class.Base*)**, void (%class.Base*)*** %16, align 8, !dbg !34
  %18 = getelementptr inbounds void (%class.Base*)*, void (%class.Base*)** %17, i64 2, !dbg !34
  %19 = load void (%class.Base*)*, void (%class.Base*)** %18, align 8, !dbg !34
  call void %19(%class.Base* %13) #7, !dbg !34
  br label %20, !dbg !34

; <label>:20:                                     ; preds = %15, %0
  ret i32 0, !dbg !35
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZN7DerivedC2Ev(%class.Derived*) unnamed_addr #4 comdat align 2 !dbg !36 {
  %2 = alloca %class.Derived*, align 8
  store %class.Derived* %0, %class.Derived** %2, align 8
  call void @llvm.dbg.declare(metadata %class.Derived** %2, metadata !47, metadata !24), !dbg !49
  %3 = load %class.Derived*, %class.Derived** %2, align 8
  %4 = bitcast %class.Derived* %3 to %class.Base*, !dbg !50
  call void @_ZN4BaseC2Ev(%class.Base* %4) #7, !dbg !50
  %5 = bitcast %class.Derived* %3 to i32 (...)***, !dbg !50
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTV7Derived, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %5, align 8, !dbg !50
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZN4BaseC2Ev(%class.Base*) unnamed_addr #4 comdat align 2 !dbg !51 {
  %2 = alloca %class.Base*, align 8
  store %class.Base* %0, %class.Base** %2, align 8
  call void @llvm.dbg.declare(metadata %class.Base** %2, metadata !53, metadata !24), !dbg !54
  %3 = load %class.Base*, %class.Base** %2, align 8
  %4 = bitcast %class.Base* %3 to i32 (...)***, !dbg !55
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTV4Base, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %4, align 8, !dbg !55
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr i32 @_ZN7Derived9interfaceEv(%class.Derived*) unnamed_addr #4 comdat align 2 !dbg !56 {
  %2 = alloca %class.Derived*, align 8
  %3 = alloca i32, align 4
  store %class.Derived* %0, %class.Derived** %2, align 8
  call void @llvm.dbg.declare(metadata %class.Derived** %2, metadata !57, metadata !24), !dbg !58
  %4 = load %class.Derived*, %class.Derived** %2, align 8
  call void @llvm.dbg.declare(metadata i32* %3, metadata !59, metadata !24), !dbg !61
  store i32 0, i32* %3, align 4, !dbg !61
  br label %5, !dbg !62

; <label>:5:                                      ; preds = %9, %1
  %6 = load i32, i32* %3, align 4, !dbg !63
  %7 = icmp slt i32 %6, 100, !dbg !66
  br i1 %7, label %8, label %12, !dbg !67

; <label>:8:                                      ; preds = %5
  call void asm sideeffect "", "~{dirflag},~{fpsr},~{flags}"() #7, !dbg !69, !srcloc !72
  br label %9, !dbg !73

; <label>:9:                                      ; preds = %8
  %10 = load i32, i32* %3, align 4, !dbg !74
  %11 = add nsw i32 %10, 1, !dbg !74
  store i32 %11, i32* %3, align 4, !dbg !74
  br label %5, !dbg !76, !llvm.loop !77

; <label>:12:                                     ; preds = %5
  ret i32 0, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZN7DerivedD2Ev(%class.Derived*) unnamed_addr #4 comdat align 2 !dbg !81 {
  %2 = alloca %class.Derived*, align 8
  store %class.Derived* %0, %class.Derived** %2, align 8
  call void @llvm.dbg.declare(metadata %class.Derived** %2, metadata !83, metadata !24), !dbg !84
  %3 = load %class.Derived*, %class.Derived** %2, align 8
  %4 = bitcast %class.Derived* %3 to %class.Base*, !dbg !85
  call void @_ZN4BaseD2Ev(%class.Base* %4) #7, !dbg !85
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZN7DerivedD0Ev(%class.Derived*) unnamed_addr #4 comdat align 2 !dbg !88 {
  %2 = alloca %class.Derived*, align 8
  store %class.Derived* %0, %class.Derived** %2, align 8
  call void @llvm.dbg.declare(metadata %class.Derived** %2, metadata !89, metadata !24), !dbg !90
  %3 = load %class.Derived*, %class.Derived** %2, align 8
  call void @_ZN7DerivedD2Ev(%class.Derived* %3) #7, !dbg !91
  %4 = bitcast %class.Derived* %3 to i8*, !dbg !91
  call void @_ZdlPv(i8* %4) #8, !dbg !92
  ret void, !dbg !91
}

declare void @__cxa_pure_virtual() unnamed_addr

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZN4BaseD2Ev(%class.Base*) unnamed_addr #4 comdat align 2 !dbg !94 {
  %2 = alloca %class.Base*, align 8
  store %class.Base* %0, %class.Base** %2, align 8
  call void @llvm.dbg.declare(metadata %class.Base** %2, metadata !95, metadata !24), !dbg !96
  %3 = load %class.Base*, %class.Base** %2, align 8
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define linkonce_odr void @_ZN4BaseD0Ev(%class.Base*) unnamed_addr #4 comdat align 2 !dbg !98 {
  %2 = alloca %class.Base*, align 8
  store %class.Base* %0, %class.Base** %2, align 8
  call void @llvm.dbg.declare(metadata %class.Base** %2, metadata !99, metadata !24), !dbg !100
  %3 = load %class.Base*, %class.Base** %2, align 8
  call void @_ZN4BaseD2Ev(%class.Base* %3) #7, !dbg !101
  %4 = bitcast %class.Base* %3 to i8*, !dbg !101
  call void @_ZdlPv(i8* %4) #8, !dbg !102
  ret void, !dbg !104
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #5

attributes #0 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { builtin }
attributes #7 = { nounwind }
attributes #8 = { builtin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.1-10 (tags/RELEASE_401/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "crtp_asm.cpp", directory: "/usr/local/google/home/hongm/ssd_part/git/cpp_study")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 4.0.1-10 (tags/RELEASE_401/final)"}
!6 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 29, type: !7, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{!9}
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "obj", scope: !6, file: !1, line: 30, type: !11)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Base", file: !1, line: 14, size: 64, elements: !13, vtableHolder: !12, identifier: "_ZTS4Base")
!13 = !{!14, !17, !21}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$Base", scope: !1, file: !1, baseType: !15, size: 64, flags: DIFlagArtificial)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !7, size: 64)
!17 = !DISubprogram(name: "interface", linkageName: "_ZN4Base9interfaceEv", scope: !12, file: !1, line: 16, type: !18, isLocal: false, isDefinition: false, scopeLine: 16, containingType: !12, virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!18 = !DISubroutineType(types: !19)
!19 = !{!9, !20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!21 = !DISubprogram(name: "~Base", scope: !12, file: !1, line: 18, type: !22, isLocal: false, isDefinition: false, scopeLine: 18, containingType: !12, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !20}
!24 = !DIExpression()
!25 = !DILocation(line: 30, column: 9, scope: !6)
!26 = !DILocation(line: 30, column: 15, scope: !6)
!27 = !DILocation(line: 30, column: 19, scope: !6)
!28 = !DILocation(line: 30, column: 19, scope: !29)
!29 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!30 = !DILocation(line: 31, column: 3, scope: !6)
!31 = !DILocation(line: 31, column: 8, scope: !6)
!32 = !DILocation(line: 32, column: 10, scope: !6)
!33 = !DILocation(line: 32, column: 3, scope: !6)
!34 = !DILocation(line: 32, column: 3, scope: !29)
!35 = !DILocation(line: 33, column: 3, scope: !6)
!36 = distinct !DISubprogram(name: "Derived", linkageName: "_ZN7DerivedC2Ev", scope: !37, file: !1, line: 21, type: !44, isLocal: false, isDefinition: true, scopeLine: 21, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !46, variables: !2)
!37 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Derived", file: !1, line: 21, size: 64, elements: !38, vtableHolder: !12, identifier: "_ZTS7Derived")
!38 = !{!39, !40}
!39 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !37, baseType: !12, flags: DIFlagPublic)
!40 = !DISubprogram(name: "interface", linkageName: "_ZN7Derived9interfaceEv", scope: !37, file: !1, line: 23, type: !41, isLocal: false, isDefinition: false, scopeLine: 23, containingType: !37, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!41 = !DISubroutineType(types: !42)
!42 = !{!9, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!44 = !DISubroutineType(types: !45)
!45 = !{null, !43}
!46 = !DISubprogram(name: "Derived", scope: !37, type: !44, isLocal: false, isDefinition: false, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!47 = !DILocalVariable(name: "this", arg: 1, scope: !36, type: !48, flags: DIFlagArtificial | DIFlagObjectPointer)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!49 = !DILocation(line: 0, scope: !36)
!50 = !DILocation(line: 21, column: 7, scope: !36)
!51 = distinct !DISubprogram(name: "Base", linkageName: "_ZN4BaseC2Ev", scope: !12, file: !1, line: 14, type: !22, isLocal: false, isDefinition: true, scopeLine: 14, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !52, variables: !2)
!52 = !DISubprogram(name: "Base", scope: !12, type: !22, isLocal: false, isDefinition: false, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!53 = !DILocalVariable(name: "this", arg: 1, scope: !51, type: !11, flags: DIFlagArtificial | DIFlagObjectPointer)
!54 = !DILocation(line: 0, scope: !51)
!55 = !DILocation(line: 14, column: 7, scope: !51)
!56 = distinct !DISubprogram(name: "interface", linkageName: "_ZN7Derived9interfaceEv", scope: !37, file: !1, line: 23, type: !41, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !40, variables: !2)
!57 = !DILocalVariable(name: "this", arg: 1, scope: !56, type: !48, flags: DIFlagArtificial | DIFlagObjectPointer)
!58 = !DILocation(line: 0, scope: !56)
!59 = !DILocalVariable(name: "i", scope: !60, file: !1, line: 24, type: !9)
!60 = distinct !DILexicalBlock(scope: !56, file: !1, line: 24, column: 5)
!61 = !DILocation(line: 24, column: 14, scope: !60)
!62 = !DILocation(line: 24, column: 10, scope: !60)
!63 = !DILocation(line: 24, column: 21, scope: !64)
!64 = !DILexicalBlockFile(scope: !65, file: !1, discriminator: 1)
!65 = distinct !DILexicalBlock(scope: !60, file: !1, line: 24, column: 5)
!66 = !DILocation(line: 24, column: 23, scope: !64)
!67 = !DILocation(line: 24, column: 5, scope: !68)
!68 = !DILexicalBlockFile(scope: !60, file: !1, discriminator: 1)
!69 = !DILocation(line: 24, column: 37, scope: !70)
!70 = !DILexicalBlockFile(scope: !71, file: !1, discriminator: 2)
!71 = distinct !DILexicalBlock(scope: !65, file: !1, line: 24, column: 35)
!72 = !{i32 419}
!73 = !DILocation(line: 24, column: 46, scope: !70)
!74 = !DILocation(line: 24, column: 30, scope: !75)
!75 = !DILexicalBlockFile(scope: !65, file: !1, discriminator: 3)
!76 = !DILocation(line: 24, column: 5, scope: !75)
!77 = distinct !{!77, !78, !79}
!78 = !DILocation(line: 24, column: 5, scope: !60)
!79 = !DILocation(line: 24, column: 46, scope: !60)
!80 = !DILocation(line: 25, column: 5, scope: !56)
!81 = distinct !DISubprogram(name: "~Derived", linkageName: "_ZN7DerivedD2Ev", scope: !37, file: !1, line: 21, type: !44, isLocal: false, isDefinition: true, scopeLine: 21, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !82, variables: !2)
!82 = !DISubprogram(name: "~Derived", scope: !37, type: !44, isLocal: false, isDefinition: false, containingType: !37, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!83 = !DILocalVariable(name: "this", arg: 1, scope: !81, type: !48, flags: DIFlagArtificial | DIFlagObjectPointer)
!84 = !DILocation(line: 0, scope: !81)
!85 = !DILocation(line: 21, column: 7, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !1, line: 21, column: 7)
!87 = !DILocation(line: 21, column: 7, scope: !81)
!88 = distinct !DISubprogram(name: "~Derived", linkageName: "_ZN7DerivedD0Ev", scope: !37, file: !1, line: 21, type: !44, isLocal: false, isDefinition: true, scopeLine: 21, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !82, variables: !2)
!89 = !DILocalVariable(name: "this", arg: 1, scope: !88, type: !48, flags: DIFlagArtificial | DIFlagObjectPointer)
!90 = !DILocation(line: 0, scope: !88)
!91 = !DILocation(line: 21, column: 7, scope: !88)
!92 = !DILocation(line: 21, column: 7, scope: !93)
!93 = !DILexicalBlockFile(scope: !88, file: !1, discriminator: 1)
!94 = distinct !DISubprogram(name: "~Base", linkageName: "_ZN4BaseD2Ev", scope: !12, file: !1, line: 18, type: !22, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !21, variables: !2)
!95 = !DILocalVariable(name: "this", arg: 1, scope: !94, type: !11, flags: DIFlagArtificial | DIFlagObjectPointer)
!96 = !DILocation(line: 0, scope: !94)
!97 = !DILocation(line: 18, column: 20, scope: !94)
!98 = distinct !DISubprogram(name: "~Base", linkageName: "_ZN4BaseD0Ev", scope: !12, file: !1, line: 18, type: !22, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !21, variables: !2)
!99 = !DILocalVariable(name: "this", arg: 1, scope: !98, type: !11, flags: DIFlagArtificial | DIFlagObjectPointer)
!100 = !DILocation(line: 0, scope: !98)
!101 = !DILocation(line: 18, column: 19, scope: !98)
!102 = !DILocation(line: 18, column: 19, scope: !103)
!103 = !DILexicalBlockFile(scope: !98, file: !1, discriminator: 1)
!104 = !DILocation(line: 18, column: 20, scope: !98)
