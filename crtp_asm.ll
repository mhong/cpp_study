; ModuleID = 'crtp_asm.cpp'
source_filename = "crtp_asm.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.Base = type { i32 (...)** }
%class.Derived = type { %class.Base }

$_ZN7Derived9interfaceEv = comdat any

$_ZN7DerivedD0Ev = comdat any

$_ZN4BaseD2Ev = comdat any

$_ZTV7Derived = comdat any

$_ZTS7Derived = comdat any

$_ZTS4Base = comdat any

$_ZTI4Base = comdat any

$_ZTI7Derived = comdat any

@_ZTV7Derived = linkonce_odr unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTI7Derived to i8*), i8* bitcast (i32 (%class.Derived*)* @_ZN7Derived9interfaceEv to i8*), i8* bitcast (void (%class.Base*)* @_ZN4BaseD2Ev to i8*), i8* bitcast (void (%class.Derived*)* @_ZN7DerivedD0Ev to i8*)] }, comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTS7Derived = linkonce_odr constant [9 x i8] c"7Derived\00", comdat
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTS4Base = linkonce_odr constant [6 x i8] c"4Base\00", comdat
@_ZTI4Base = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @_ZTS4Base, i32 0, i32 0) }, comdat
@_ZTI7Derived = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @_ZTS7Derived, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTI4Base to i8*) }, comdat

; Function Attrs: noinline uwtable
define void @_Z3fooP4Base(%class.Base*) local_unnamed_addr #0 !dbg !6 {
  tail call void @llvm.dbg.value(metadata %class.Base* %0, i64 0, metadata !26, metadata !27), !dbg !28
  %2 = bitcast %class.Base* %0 to i32 (%class.Base*)***, !dbg !29
  %3 = load i32 (%class.Base*)**, i32 (%class.Base*)*** %2, align 8, !dbg !29, !tbaa !30
  %4 = load i32 (%class.Base*)*, i32 (%class.Base*)** %3, align 8, !dbg !29
  %5 = tail call i32 %4(%class.Base* %0), !dbg !29
  ret void, !dbg !33
}

; Function Attrs: norecurse uwtable
define i32 @main() local_unnamed_addr #1 !dbg !34 {
  %1 = tail call i8* @_Znwm(i64 8) #7, !dbg !37
  %2 = bitcast i8* %1 to i32 (...)***, !dbg !38
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTV7Derived, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !dbg !38, !tbaa !30
  %3 = bitcast i8* %1 to %class.Base*, !dbg !37
  tail call void @llvm.dbg.value(metadata %class.Base* %3, i64 0, metadata !36, metadata !27), !dbg !55
  tail call void @_Z3fooP4Base(%class.Base* nonnull %3), !dbg !56
  %4 = bitcast i8* %1 to void (%class.Base*)***, !dbg !57
  %5 = load void (%class.Base*)**, void (%class.Base*)*** %4, align 8, !dbg !57, !tbaa !30
  %6 = getelementptr inbounds void (%class.Base*)*, void (%class.Base*)** %5, i64 2, !dbg !57
  %7 = load void (%class.Base*)*, void (%class.Base*)** %6, align 8, !dbg !57
  tail call void %7(%class.Base* nonnull %3) #8, !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nobuiltin
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZN7Derived9interfaceEv(%class.Derived*) unnamed_addr #3 comdat align 2 !dbg !59 {
  tail call void @llvm.dbg.value(metadata %class.Derived* %0, i64 0, metadata !61, metadata !27), !dbg !64
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !62, metadata !27), !dbg !65
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !62, metadata !27), !dbg !65
  br label %3, !dbg !66

; <label>:2:                                      ; preds = %3
  ret i32 0, !dbg !68

; <label>:3:                                      ; preds = %3, %1
  %4 = phi i32 [ 0, %1 ], [ %5, %3 ]
  tail call void asm sideeffect "", "~{dirflag},~{fpsr},~{flags}"() #8, !dbg !69, !srcloc !73
  %5 = add nuw nsw i32 %4, 1, !dbg !74
  tail call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !62, metadata !27), !dbg !65
  tail call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !62, metadata !27), !dbg !65
  %6 = icmp eq i32 %5, 100, !dbg !76
  br i1 %6, label %2, label %3, !dbg !66, !llvm.loop !78
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN7DerivedD0Ev(%class.Derived*) unnamed_addr #4 comdat align 2 !dbg !81 {
  tail call void @llvm.dbg.value(metadata %class.Derived* %0, i64 0, metadata !84, metadata !27), !dbg !85
  %2 = bitcast %class.Derived* %0 to i8*, !dbg !86
  tail call void @_ZdlPv(i8* %2) #9, !dbg !87
  ret void, !dbg !86
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4BaseD2Ev(%class.Base*) unnamed_addr #3 comdat align 2 !dbg !89 {
  tail call void @llvm.dbg.value(metadata %class.Base* %0, i64 0, metadata !91, metadata !27), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #6

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { builtin }
attributes #8 = { nounwind }
attributes #9 = { builtin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.1-10 (tags/RELEASE_401/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "crtp_asm.cpp", directory: "/usr/local/google/home/hongm/ssd_part/git/cpp_study")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 4.0.1-10 (tags/RELEASE_401/final)"}
!6 = distinct !DISubprogram(name: "foo", linkageName: "_Z3fooP4Base", scope: !1, file: !1, line: 29, type: !7, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !25)
!7 = !DISubroutineType(types: !8)
!8 = !{null, !9}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Base", file: !1, line: 14, size: 64, elements: !11, vtableHolder: !10, identifier: "_ZTS4Base")
!11 = !{!12, !18, !22}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$Base", scope: !1, file: !1, baseType: !13, size: 64, flags: DIFlagArtificial)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !15, size: 64)
!15 = !DISubroutineType(types: !16)
!16 = !{!17}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DISubprogram(name: "interface", linkageName: "_ZN4Base9interfaceEv", scope: !10, file: !1, line: 16, type: !19, isLocal: false, isDefinition: false, scopeLine: 16, containingType: !10, virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!19 = !DISubroutineType(types: !20)
!20 = !{!17, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!22 = !DISubprogram(name: "~Base", scope: !10, file: !1, line: 18, type: !23, isLocal: false, isDefinition: false, scopeLine: 18, containingType: !10, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !21}
!25 = !{!26}
!26 = !DILocalVariable(name: "obj", arg: 1, scope: !6, file: !1, line: 29, type: !9)
!27 = !DIExpression()
!28 = !DILocation(line: 29, column: 43, scope: !6)
!29 = !DILocation(line: 30, column: 8, scope: !6)
!30 = !{!31, !31, i64 0}
!31 = !{!"vtable pointer", !32, i64 0}
!32 = !{!"Simple C++ TBAA"}
!33 = !DILocation(line: 31, column: 1, scope: !6)
!34 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 33, type: !15, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !35)
!35 = !{!36}
!36 = !DILocalVariable(name: "obj", scope: !34, file: !1, line: 34, type: !9)
!37 = !DILocation(line: 34, column: 15, scope: !34)
!38 = !DILocation(line: 21, column: 7, scope: !39, inlinedAt: !53)
!39 = distinct !DISubprogram(name: "Derived", linkageName: "_ZN7DerivedC2Ev", scope: !40, file: !1, line: 21, type: !47, isLocal: false, isDefinition: true, scopeLine: 21, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !49, variables: !50)
!40 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Derived", file: !1, line: 21, size: 64, elements: !41, vtableHolder: !10, identifier: "_ZTS7Derived")
!41 = !{!42, !43}
!42 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !40, baseType: !10, flags: DIFlagPublic)
!43 = !DISubprogram(name: "interface", linkageName: "_ZN7Derived9interfaceEv", scope: !40, file: !1, line: 23, type: !44, isLocal: false, isDefinition: false, scopeLine: 23, containingType: !40, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!44 = !DISubroutineType(types: !45)
!45 = !{!17, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!47 = !DISubroutineType(types: !48)
!48 = !{null, !46}
!49 = !DISubprogram(name: "Derived", scope: !40, type: !47, isLocal: false, isDefinition: false, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, isOptimized: true)
!50 = !{!51}
!51 = !DILocalVariable(name: "this", arg: 1, scope: !39, type: !52, flags: DIFlagArtificial | DIFlagObjectPointer)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!53 = distinct !DILocation(line: 34, column: 19, scope: !54)
!54 = !DILexicalBlockFile(scope: !34, file: !1, discriminator: 1)
!55 = !DILocation(line: 34, column: 9, scope: !34)
!56 = !DILocation(line: 35, column: 3, scope: !34)
!57 = !DILocation(line: 36, column: 3, scope: !54)
!58 = !DILocation(line: 37, column: 3, scope: !34)
!59 = distinct !DISubprogram(name: "interface", linkageName: "_ZN7Derived9interfaceEv", scope: !40, file: !1, line: 23, type: !44, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !43, variables: !60)
!60 = !{!61, !62}
!61 = !DILocalVariable(name: "this", arg: 1, scope: !59, type: !52, flags: DIFlagArtificial | DIFlagObjectPointer)
!62 = !DILocalVariable(name: "i", scope: !63, file: !1, line: 24, type: !17)
!63 = distinct !DILexicalBlock(scope: !59, file: !1, line: 24, column: 5)
!64 = !DILocation(line: 0, scope: !59)
!65 = !DILocation(line: 24, column: 14, scope: !63)
!66 = !DILocation(line: 24, column: 5, scope: !67)
!67 = !DILexicalBlockFile(scope: !63, file: !1, discriminator: 1)
!68 = !DILocation(line: 25, column: 5, scope: !59)
!69 = !DILocation(line: 24, column: 37, scope: !70)
!70 = !DILexicalBlockFile(scope: !71, file: !1, discriminator: 3)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 24, column: 35)
!72 = distinct !DILexicalBlock(scope: !63, file: !1, line: 24, column: 5)
!73 = !{i32 419}
!74 = !DILocation(line: 24, column: 30, scope: !75)
!75 = !DILexicalBlockFile(scope: !72, file: !1, discriminator: 4)
!76 = !DILocation(line: 24, column: 23, scope: !77)
!77 = !DILexicalBlockFile(scope: !72, file: !1, discriminator: 1)
!78 = distinct !{!78, !79, !80}
!79 = !DILocation(line: 24, column: 5, scope: !63)
!80 = !DILocation(line: 24, column: 46, scope: !63)
!81 = distinct !DISubprogram(name: "~Derived", linkageName: "_ZN7DerivedD0Ev", scope: !40, file: !1, line: 21, type: !47, isLocal: false, isDefinition: true, scopeLine: 21, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !82, variables: !83)
!82 = !DISubprogram(name: "~Derived", scope: !40, type: !47, isLocal: false, isDefinition: false, containingType: !40, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, isOptimized: true)
!83 = !{!84}
!84 = !DILocalVariable(name: "this", arg: 1, scope: !81, type: !52, flags: DIFlagArtificial | DIFlagObjectPointer)
!85 = !DILocation(line: 0, scope: !81)
!86 = !DILocation(line: 21, column: 7, scope: !81)
!87 = !DILocation(line: 21, column: 7, scope: !88)
!88 = !DILexicalBlockFile(scope: !81, file: !1, discriminator: 1)
!89 = distinct !DISubprogram(name: "~Base", linkageName: "_ZN4BaseD2Ev", scope: !10, file: !1, line: 18, type: !23, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !22, variables: !90)
!90 = !{!91}
!91 = !DILocalVariable(name: "this", arg: 1, scope: !89, type: !9, flags: DIFlagArtificial | DIFlagObjectPointer)
!92 = !DILocation(line: 0, scope: !89)
!93 = !DILocation(line: 18, column: 20, scope: !89)
