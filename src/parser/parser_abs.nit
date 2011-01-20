# Raw AST node hierarchy.
# This file was generated by SableCC (http://www.sablecc.org/).
package parser_abs

import location

# Root of the AST hierarchy
abstract class ANode
	var _location: nullable Location

	# Location is set during AST building. Once built, location cannon be null
	# However, manual instanciated nodes may need mode care
	fun location: Location do return _location.as(not null)
end

# Ancestor of all tokens
abstract class Token
special ANode
end

# Ancestor of all productions
abstract class Prod
special ANode
	fun location=(loc: Location) do _location = loc
end
class TEol
special Token
end
class TComment
special Token
end
class TKwmodule
special Token
end
class TKwimport
special Token
end
class TKwclass
special Token
end
class TKwabstract
special Token
end
class TKwinterface
special Token
end
class TKwuniversal
special Token
end
class TKwspecial
special Token
end
class TKwend
special Token
end
class TKwmeth
special Token
end
class TKwtype
special Token
end
class TKwinit
special Token
end
class TKwredef
special Token
end
class TKwis
special Token
end
class TKwdo
special Token
end
class TKwreadable
special Token
end
class TKwwritable
special Token
end
class TKwvar
special Token
end
class TKwintern
special Token
end
class TKwextern
special Token
end
class TKwprotected
special Token
end
class TKwprivate
special Token
end
class TKwintrude
special Token
end
class TKwif
special Token
end
class TKwthen
special Token
end
class TKwelse
special Token
end
class TKwwhile
special Token
end
class TKwloop
special Token
end
class TKwfor
special Token
end
class TKwin
special Token
end
class TKwand
special Token
end
class TKwor
special Token
end
class TKwnot
special Token
end
class TKwreturn
special Token
end
class TKwcontinue
special Token
end
class TKwbreak
special Token
end
class TKwabort
special Token
end
class TKwassert
special Token
end
class TKwnew
special Token
end
class TKwisa
special Token
end
class TKwonce
special Token
end
class TKwsuper
special Token
end
class TKwself
special Token
end
class TKwtrue
special Token
end
class TKwfalse
special Token
end
class TKwnull
special Token
end
class TKwas
special Token
end
class TKwnullable
special Token
end
class TKwisset
special Token
end
class TKwlabel
special Token
end
class TOpar
special Token
end
class TCpar
special Token
end
class TObra
special Token
end
class TCbra
special Token
end
class TComma
special Token
end
class TColumn
special Token
end
class TQuad
special Token
end
class TAssign
special Token
end
class TPluseq
special Token
end
class TMinuseq
special Token
end
class TDotdotdot
special Token
end
class TDotdot
special Token
end
class TDot
special Token
end
class TPlus
special Token
end
class TMinus
special Token
end
class TStar
special Token
end
class TSlash
special Token
end
class TPercent
special Token
end
class TEq
special Token
end
class TNe
special Token
end
class TLt
special Token
end
class TLe
special Token
end
class TGt
special Token
end
class TGe
special Token
end
class TStarship
special Token
end
class TBang
special Token
end
class TClassid
special Token
end
class TId
special Token
end
class TAttrid
special Token
end
class TNumber
special Token
end
class TFloat
special Token
end
class TChar
special Token
end
class TString
special Token
end
class TStartString
special Token
end
class TMidString
special Token
end
class TEndString
special Token
end
class EOF
special Token
private init noinit do end
end
class AError
special EOF
private init noinit do end
end

class AModule special Prod end
class AModuledecl special Prod end
class AImport special Prod end
class AVisibility special Prod end
class AClassdef special Prod end
class AClasskind special Prod end
class AFormaldef special Prod end
class ASuperclass special Prod end
class APropdef special Prod end
class AAble special Prod end
class AMethid special Prod end
class ASignature special Prod end
class AParam special Prod end
class AClosureDecl special Prod end
class AType special Prod end
class ALabel special Prod end
class AExpr special Prod end
class AAssignOp special Prod end
class AClosureDef special Prod end
class AClosureId special Prod end
class AQualified special Prod end
class ADoc special Prod end

class AModule
special AModule
    readable var _n_moduledecl: nullable AModuledecl = null
    readable var _n_imports: List[AImport] = new List[AImport]
    readable var _n_classdefs: List[AClassdef] = new List[AClassdef]
end
class AModuledecl
special AModuledecl
    readable var _n_doc: nullable ADoc = null
    readable var _n_kwmodule: TKwmodule
    readable var _n_id: TId
end
class AStdImport
special AImport
    readable var _n_visibility: AVisibility
    readable var _n_kwimport: TKwimport
    readable var _n_id: TId
end
class ANoImport
special AImport
    readable var _n_visibility: AVisibility
    readable var _n_kwimport: TKwimport
    readable var _n_kwend: TKwend
end
class APublicVisibility
special AVisibility
end
class APrivateVisibility
special AVisibility
    readable var _n_kwprivate: TKwprivate
end
class AProtectedVisibility
special AVisibility
    readable var _n_kwprotected: TKwprotected
end
class AIntrudeVisibility
special AVisibility
    readable var _n_kwintrude: TKwintrude
end
class AStdClassdef
special AClassdef
    readable var _n_doc: nullable ADoc = null
    readable var _n_kwredef: nullable TKwredef = null
    readable var _n_visibility: AVisibility
    readable var _n_classkind: AClasskind
    readable var _n_id: nullable TClassid = null
    readable var _n_formaldefs: List[AFormaldef] = new List[AFormaldef]
    readable var _n_superclasses: List[ASuperclass] = new List[ASuperclass]
    readable var _n_propdefs: List[APropdef] = new List[APropdef]
end
class ATopClassdef
special AClassdef
    readable var _n_propdefs: List[APropdef] = new List[APropdef]
end
class AMainClassdef
special AClassdef
    readable var _n_propdefs: List[APropdef] = new List[APropdef]
end
class AConcreteClasskind
special AClasskind
    readable var _n_kwclass: TKwclass
end
class AAbstractClasskind
special AClasskind
    readable var _n_kwabstract: TKwabstract
    readable var _n_kwclass: TKwclass
end
class AInterfaceClasskind
special AClasskind
    readable var _n_kwinterface: TKwinterface
end
class AUniversalClasskind
special AClasskind
    readable var _n_kwuniversal: TKwuniversal
end
class AFormaldef
special AFormaldef
    readable var _n_id: TClassid
    readable var _n_type: nullable AType = null
end
class ASuperclass
special ASuperclass
    readable var _n_kwspecial: nullable TKwspecial = null
    readable var _n_kwsuper: nullable TKwsuper = null
    readable var _n_type: AType
end
class AAttrPropdef
special APropdef
    readable var _n_doc: nullable ADoc = null
    readable var _n_readable: nullable AAble = null
    readable var _n_writable: nullable AAble = null
    readable var _n_kwredef: nullable TKwredef = null
    readable var _n_visibility: AVisibility
    readable var _n_kwvar: TKwvar
    readable var _n_id: TAttrid
    readable var _n_type: nullable AType = null
    readable var _n_expr: nullable AExpr = null
end
class AMethPropdef
special APropdef
    readable var _n_doc: nullable ADoc = null
    readable var _n_kwredef: nullable TKwredef = null
    readable var _n_visibility: AVisibility
    readable var _n_methid: AMethid
    readable var _n_signature: ASignature
end
class ADeferredMethPropdef
special APropdef
    readable var _n_doc: nullable ADoc = null
    readable var _n_kwredef: nullable TKwredef = null
    readable var _n_visibility: AVisibility
    readable var _n_kwmeth: TKwmeth
    readable var _n_methid: AMethid
    readable var _n_signature: ASignature
end
class AInternMethPropdef
special APropdef
    readable var _n_doc: nullable ADoc = null
    readable var _n_kwredef: nullable TKwredef = null
    readable var _n_visibility: AVisibility
    readable var _n_kwmeth: TKwmeth
    readable var _n_methid: AMethid
    readable var _n_signature: ASignature
end
class AExternMethPropdef
special APropdef
    readable var _n_doc: nullable ADoc = null
    readable var _n_kwredef: nullable TKwredef = null
    readable var _n_visibility: AVisibility
    readable var _n_kwmeth: TKwmeth
    readable var _n_methid: AMethid
    readable var _n_signature: ASignature
    readable var _n_extern: nullable TString = null
end
class AConcreteMethPropdef
special APropdef
    readable var _n_doc: nullable ADoc = null
    readable var _n_kwredef: nullable TKwredef = null
    readable var _n_visibility: AVisibility
    readable var _n_kwmeth: TKwmeth
    readable var _n_methid: AMethid
    readable var _n_signature: ASignature
    readable var _n_block: nullable AExpr = null
end
class AConcreteInitPropdef
special APropdef
    readable var _n_doc: nullable ADoc = null
    readable var _n_kwredef: nullable TKwredef = null
    readable var _n_visibility: AVisibility
    readable var _n_kwinit: TKwinit
    readable var _n_methid: nullable AMethid = null
    readable var _n_signature: ASignature
    readable var _n_block: nullable AExpr = null
end
class AMainMethPropdef
special APropdef
    readable var _n_kwredef: nullable TKwredef = null
    readable var _n_block: nullable AExpr = null
end
class ATypePropdef
special APropdef
    readable var _n_doc: nullable ADoc = null
    readable var _n_kwredef: nullable TKwredef = null
    readable var _n_visibility: AVisibility
    readable var _n_kwtype: TKwtype
    readable var _n_id: TClassid
    readable var _n_type: AType
end
class AReadAble
special AAble
    readable var _n_kwredef: nullable TKwredef = null
    readable var _n_kwreadable: TKwreadable
end
class AWriteAble
special AAble
    readable var _n_kwredef: nullable TKwredef = null
    readable var _n_kwwritable: TKwwritable
end
class AIdMethid
special AMethid
    readable var _n_id: TId
end
class APlusMethid
special AMethid
    readable var _n_plus: TPlus
end
class AMinusMethid
special AMethid
    readable var _n_minus: TMinus
end
class AStarMethid
special AMethid
    readable var _n_star: TStar
end
class ASlashMethid
special AMethid
    readable var _n_slash: TSlash
end
class APercentMethid
special AMethid
    readable var _n_percent: TPercent
end
class AEqMethid
special AMethid
    readable var _n_eq: TEq
end
class ANeMethid
special AMethid
    readable var _n_ne: TNe
end
class ALeMethid
special AMethid
    readable var _n_le: TLe
end
class AGeMethid
special AMethid
    readable var _n_ge: TGe
end
class ALtMethid
special AMethid
    readable var _n_lt: TLt
end
class AGtMethid
special AMethid
    readable var _n_gt: TGt
end
class ABraMethid
special AMethid
    readable var _n_obra: TObra
    readable var _n_cbra: TCbra
end
class AStarshipMethid
special AMethid
    readable var _n_starship: TStarship
end
class AAssignMethid
special AMethid
    readable var _n_id: TId
    readable var _n_assign: TAssign
end
class ABraassignMethid
special AMethid
    readable var _n_obra: TObra
    readable var _n_cbra: TCbra
    readable var _n_assign: TAssign
end
class ASignature
special ASignature
    readable var _n_params: List[AParam] = new List[AParam]
    readable var _n_type: nullable AType = null
    readable var _n_closure_decls: List[AClosureDecl] = new List[AClosureDecl]
end
class AParam
special AParam
    readable var _n_id: TId
    readable var _n_type: nullable AType = null
    readable var _n_dotdotdot: nullable TDotdotdot = null
end
class AClosureDecl
special AClosureDecl
    readable var _n_kwbreak: nullable TKwbreak = null
    readable var _n_bang: TBang
    readable var _n_id: TId
    readable var _n_signature: ASignature
    readable var _n_expr: nullable AExpr = null
end
class AType
special AType
    readable var _n_kwnullable: nullable TKwnullable = null
    readable var _n_id: TClassid
    readable var _n_types: List[AType] = new List[AType]
end
class ALabel
special ALabel
    readable var _n_kwlabel: TKwlabel
    readable var _n_id: TId
end
class ABlockExpr
special AExpr
    readable var _n_expr: List[AExpr] = new List[AExpr]
end
class AVardeclExpr
special AExpr
    readable var _n_kwvar: TKwvar
    readable var _n_id: TId
    readable var _n_type: nullable AType = null
    readable var _n_assign: nullable TAssign = null
    readable var _n_expr: nullable AExpr = null
end
class AReturnExpr
special AExpr
    readable var _n_kwreturn: nullable TKwreturn = null
    readable var _n_expr: nullable AExpr = null
end
class ABreakExpr
special AExpr
    readable var _n_kwbreak: TKwbreak
    readable var _n_label: nullable ALabel = null
    readable var _n_expr: nullable AExpr = null
end
class AAbortExpr
special AExpr
    readable var _n_kwabort: TKwabort
end
class AContinueExpr
special AExpr
    readable var _n_kwcontinue: nullable TKwcontinue = null
    readable var _n_label: nullable ALabel = null
    readable var _n_expr: nullable AExpr = null
end
class ADoExpr
special AExpr
    readable var _n_kwdo: TKwdo
    readable var _n_block: nullable AExpr = null
    readable var _n_label: nullable ALabel = null
end
class AIfExpr
special AExpr
    readable var _n_kwif: TKwif
    readable var _n_expr: AExpr
    readable var _n_then: nullable AExpr = null
    readable var _n_else: nullable AExpr = null
end
class AIfexprExpr
special AExpr
    readable var _n_kwif: TKwif
    readable var _n_expr: AExpr
    readable var _n_kwthen: TKwthen
    readable var _n_then: AExpr
    readable var _n_kwelse: TKwelse
    readable var _n_else: AExpr
end
class AWhileExpr
special AExpr
    readable var _n_kwwhile: TKwwhile
    readable var _n_expr: AExpr
    readable var _n_kwdo: TKwdo
    readable var _n_block: nullable AExpr = null
    readable var _n_label: nullable ALabel = null
end
class ALoopExpr
special AExpr
    readable var _n_kwloop: TKwloop
    readable var _n_block: nullable AExpr = null
    readable var _n_label: nullable ALabel = null
end
class AForExpr
special AExpr
    readable var _n_kwfor: TKwfor
    readable var _n_id: TId
    readable var _n_expr: AExpr
    readable var _n_kwdo: TKwdo
    readable var _n_block: nullable AExpr = null
    readable var _n_label: nullable ALabel = null
end
class AAssertExpr
special AExpr
    readable var _n_kwassert: TKwassert
    readable var _n_id: nullable TId = null
    readable var _n_expr: AExpr
    readable var _n_else: nullable AExpr = null
end
class AOnceExpr
special AExpr
    readable var _n_kwonce: TKwonce
    readable var _n_expr: AExpr
end
class ASendExpr
special AExpr
    readable var _n_expr: AExpr
end
class ABinopExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AOrExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AAndExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AOrElseExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class ANotExpr
special AExpr
    readable var _n_kwnot: TKwnot
    readable var _n_expr: AExpr
end
class AEqExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AEeExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class ANeExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class ALtExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class ALeExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AGtExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AGeExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AIsaExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_type: AType
end
class APlusExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AMinusExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AStarshipExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AStarExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class ASlashExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class APercentExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AUminusExpr
special AExpr
    readable var _n_minus: TMinus
    readable var _n_expr: AExpr
end
class ANewExpr
special AExpr
    readable var _n_kwnew: TKwnew
    readable var _n_type: AType
    readable var _n_id: nullable TId = null
    readable var _n_args: List[AExpr] = new List[AExpr]
end
class AAttrExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_id: TAttrid
end
class AAttrAssignExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_id: TAttrid
    readable var _n_assign: TAssign
    readable var _n_value: AExpr
end
class AAttrReassignExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_id: TAttrid
    readable var _n_assign_op: AAssignOp
    readable var _n_value: AExpr
end
class ACallExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_id: TId
    readable var _n_args: List[AExpr] = new List[AExpr]
    readable var _n_closure_defs: List[AClosureDef] = new List[AClosureDef]
end
class ACallAssignExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_id: TId
    readable var _n_args: List[AExpr] = new List[AExpr]
    readable var _n_assign: TAssign
    readable var _n_value: AExpr
end
class ACallReassignExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_id: TId
    readable var _n_args: List[AExpr] = new List[AExpr]
    readable var _n_assign_op: AAssignOp
    readable var _n_value: AExpr
end
class ASuperExpr
special AExpr
    readable var _n_qualified: nullable AQualified = null
    readable var _n_kwsuper: TKwsuper
    readable var _n_args: List[AExpr] = new List[AExpr]
end
class AInitExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_kwinit: TKwinit
    readable var _n_args: List[AExpr] = new List[AExpr]
end
class ABraExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_args: List[AExpr] = new List[AExpr]
    readable var _n_closure_defs: List[AClosureDef] = new List[AClosureDef]
end
class ABraAssignExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_args: List[AExpr] = new List[AExpr]
    readable var _n_assign: TAssign
    readable var _n_value: AExpr
end
class ABraReassignExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_args: List[AExpr] = new List[AExpr]
    readable var _n_assign_op: AAssignOp
    readable var _n_value: AExpr
end
class AClosureCallExpr
special AExpr
    readable var _n_id: TId
    readable var _n_args: List[AExpr] = new List[AExpr]
    readable var _n_closure_defs: List[AClosureDef] = new List[AClosureDef]
end
class AVarExpr
special AExpr
    readable var _n_id: TId
end
class AVarAssignExpr
special AExpr
    readable var _n_id: TId
    readable var _n_assign: TAssign
    readable var _n_value: AExpr
end
class AVarReassignExpr
special AExpr
    readable var _n_id: TId
    readable var _n_assign_op: AAssignOp
    readable var _n_value: AExpr
end
class ARangeExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class ACrangeExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AOrangeExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_expr2: AExpr
end
class AArrayExpr
special AExpr
    readable var _n_exprs: List[AExpr] = new List[AExpr]
end
class ASelfExpr
special AExpr
    readable var _n_kwself: TKwself
end
class AImplicitSelfExpr
special AExpr
end
class ATrueExpr
special AExpr
    readable var _n_kwtrue: TKwtrue
end
class AFalseExpr
special AExpr
    readable var _n_kwfalse: TKwfalse
end
class ANullExpr
special AExpr
    readable var _n_kwnull: TKwnull
end
class AIntExpr
special AExpr
    readable var _n_number: TNumber
end
class AFloatExpr
special AExpr
    readable var _n_float: TFloat
end
class ACharExpr
special AExpr
    readable var _n_char: TChar
end
class AStringExpr
special AExpr
    readable var _n_string: TString
end
class AStartStringExpr
special AExpr
    readable var _n_string: TStartString
end
class AMidStringExpr
special AExpr
    readable var _n_string: TMidString
end
class AEndStringExpr
special AExpr
    readable var _n_string: TEndString
end
class ASuperstringExpr
special AExpr
    readable var _n_exprs: List[AExpr] = new List[AExpr]
end
class AParExpr
special AExpr
    readable var _n_expr: AExpr
end
class AAsCastExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_kwas: TKwas
    readable var _n_type: AType
end
class AAsNotnullExpr
special AExpr
    readable var _n_expr: AExpr
    readable var _n_kwas: TKwas
    readable var _n_kwnot: TKwnot
    readable var _n_kwnull: TKwnull
end
class AIssetAttrExpr
special AExpr
    readable var _n_kwisset: TKwisset
    readable var _n_expr: AExpr
    readable var _n_id: TAttrid
end
class APlusAssignOp
special AAssignOp
    readable var _n_pluseq: TPluseq
end
class AMinusAssignOp
special AAssignOp
    readable var _n_minuseq: TMinuseq
end
class AClosureDef
special AClosureDef
    readable var _n_bang: TBang
    readable var _n_id: AClosureId
    readable var _n_ids: List[TId] = new List[TId]
    readable var _n_kwdo: nullable TKwdo = null
    readable var _n_expr: nullable AExpr = null
    readable var _n_label: nullable ALabel = null
end
class ASimpleClosureId
special AClosureId
    readable var _n_id: TId
end
class ABreakClosureId
special AClosureId
    readable var _n_kwbreak: TKwbreak
end
class AQualified
special AQualified
    readable var _n_id: List[TId] = new List[TId]
    readable var _n_classid: nullable TClassid = null
end
class ADoc
special ADoc
    readable var _n_comment: List[TComment] = new List[TComment]
end

class Start
special Prod
    readable var _n_base: nullable AModule
    readable var _n_eof: EOF
end
