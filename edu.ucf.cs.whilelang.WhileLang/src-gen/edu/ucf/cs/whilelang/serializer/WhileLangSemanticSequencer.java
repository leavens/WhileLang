/*
 * generated by Xtext 2.13.0
 */
package edu.ucf.cs.whilelang.serializer;

import com.google.inject.Inject;
import edu.ucf.cs.whilelang.services.WhileLangGrammarAccess;
import edu.ucf.cs.whilelang.whileLang.AExpression;
import edu.ucf.cs.whilelang.whileLang.AssignS;
import edu.ucf.cs.whilelang.whileLang.BConj;
import edu.ucf.cs.whilelang.whileLang.BDisj;
import edu.ucf.cs.whilelang.whileLang.BRelExp;
import edu.ucf.cs.whilelang.whileLang.BoolLitExpr;
import edu.ucf.cs.whilelang.whileLang.CompoundS;
import edu.ucf.cs.whilelang.whileLang.Factor;
import edu.ucf.cs.whilelang.whileLang.Formals;
import edu.ucf.cs.whilelang.whileLang.IfS;
import edu.ucf.cs.whilelang.whileLang.LabeledExp;
import edu.ucf.cs.whilelang.whileLang.NotExpr;
import edu.ucf.cs.whilelang.whileLang.NumLitExpr;
import edu.ucf.cs.whilelang.whileLang.Program;
import edu.ucf.cs.whilelang.whileLang.SkipS;
import edu.ucf.cs.whilelang.whileLang.VarRefExpr;
import edu.ucf.cs.whilelang.whileLang.WhileLangPackage;
import edu.ucf.cs.whilelang.whileLang.WhileS;
import java.util.Set;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.xtext.Action;
import org.eclipse.xtext.Parameter;
import org.eclipse.xtext.ParserRule;
import org.eclipse.xtext.serializer.ISerializationContext;
import org.eclipse.xtext.serializer.acceptor.SequenceFeeder;
import org.eclipse.xtext.serializer.sequencer.AbstractDelegatingSemanticSequencer;
import org.eclipse.xtext.serializer.sequencer.ITransientValueService.ValueTransient;

@SuppressWarnings("all")
public class WhileLangSemanticSequencer extends AbstractDelegatingSemanticSequencer {

	@Inject
	private WhileLangGrammarAccess grammarAccess;
	
	@Override
	public void sequence(ISerializationContext context, EObject semanticObject) {
		EPackage epackage = semanticObject.eClass().getEPackage();
		ParserRule rule = context.getParserRule();
		Action action = context.getAssignedAction();
		Set<Parameter> parameters = context.getEnabledBooleanParameters();
		if (epackage == WhileLangPackage.eINSTANCE)
			switch (semanticObject.eClass().getClassifierID()) {
			case WhileLangPackage.AEXPRESSION:
				sequence_AExpression(context, (AExpression) semanticObject); 
				return; 
			case WhileLangPackage.ASSIGN_S:
				sequence_Assignment(context, (AssignS) semanticObject); 
				return; 
			case WhileLangPackage.BCONJ:
				sequence_BConj(context, (BConj) semanticObject); 
				return; 
			case WhileLangPackage.BDISJ:
				sequence_BDisj(context, (BDisj) semanticObject); 
				return; 
			case WhileLangPackage.BREL_EXP:
				sequence_BRelExp(context, (BRelExp) semanticObject); 
				return; 
			case WhileLangPackage.BOOL_LIT_EXPR:
				sequence_BoolLitExpr(context, (BoolLitExpr) semanticObject); 
				return; 
			case WhileLangPackage.COMPOUND_S:
				sequence_Block(context, (CompoundS) semanticObject); 
				return; 
			case WhileLangPackage.FACTOR:
				sequence_Factor(context, (Factor) semanticObject); 
				return; 
			case WhileLangPackage.FORMALS:
				sequence_Formals(context, (Formals) semanticObject); 
				return; 
			case WhileLangPackage.IF_S:
				sequence_If(context, (IfS) semanticObject); 
				return; 
			case WhileLangPackage.LABELED_EXP:
				sequence_LabeledExp(context, (LabeledExp) semanticObject); 
				return; 
			case WhileLangPackage.NOT_EXPR:
				sequence_NotExpr(context, (NotExpr) semanticObject); 
				return; 
			case WhileLangPackage.NUM_LIT_EXPR:
				sequence_NumLitExpr(context, (NumLitExpr) semanticObject); 
				return; 
			case WhileLangPackage.PROGRAM:
				sequence_Program(context, (Program) semanticObject); 
				return; 
			case WhileLangPackage.SKIP_S:
				sequence_Skip(context, (SkipS) semanticObject); 
				return; 
			case WhileLangPackage.VAR_REF_EXPR:
				sequence_VarRefExpr(context, (VarRefExpr) semanticObject); 
				return; 
			case WhileLangPackage.WHILE_S:
				sequence_While(context, (WhileS) semanticObject); 
				return; 
			}
		if (errorAcceptor != null)
			errorAcceptor.accept(diagnosticProvider.createInvalidContextOrTypeDiagnostic(semanticObject, context));
	}
	
	/**
	 * Contexts:
	 *     Expression returns AExpression
	 *     BDisj returns AExpression
	 *     BDisj.BDisj_1_0 returns AExpression
	 *     BConj returns AExpression
	 *     BConj.BConj_1_0 returns AExpression
	 *     BRelExp returns AExpression
	 *     BRelExp.BRelExp_1_0 returns AExpression
	 *     AExpression returns AExpression
	 *     AExpression.AExpression_1_0 returns AExpression
	 *     Factor returns AExpression
	 *     Factor.Factor_1_0 returns AExpression
	 *     Primary returns AExpression
	 *
	 * Constraint:
	 *     (left=AExpression_AExpression_1_0 op=OPPLUS right=AExpression)
	 */
	protected void sequence_AExpression(ISerializationContext context, AExpression semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.AEXPRESSION__LEFT) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.AEXPRESSION__LEFT));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.AEXPRESSION__OP) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.AEXPRESSION__OP));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.AEXPRESSION__RIGHT) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.AEXPRESSION__RIGHT));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getAExpressionAccess().getAExpressionLeftAction_1_0(), semanticObject.getLeft());
		feeder.accept(grammarAccess.getAExpressionAccess().getOpOPPLUSTerminalRuleCall_1_1_0(), semanticObject.getOp());
		feeder.accept(grammarAccess.getAExpressionAccess().getRightAExpressionParserRuleCall_1_2_0(), semanticObject.getRight());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     Stmt returns AssignS
	 *     Assignment returns AssignS
	 *     ElementaryBlock returns AssignS
	 *
	 * Constraint:
	 *     ((v=ID aexp=Expression) | (v=ID aexp=Expression label=INT))
	 */
	protected void sequence_Assignment(ISerializationContext context, AssignS semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     Expression returns BConj
	 *     BDisj returns BConj
	 *     BDisj.BDisj_1_0 returns BConj
	 *     BConj returns BConj
	 *     BConj.BConj_1_0 returns BConj
	 *     BRelExp returns BConj
	 *     BRelExp.BRelExp_1_0 returns BConj
	 *     AExpression returns BConj
	 *     AExpression.AExpression_1_0 returns BConj
	 *     Factor returns BConj
	 *     Factor.Factor_1_0 returns BConj
	 *     Primary returns BConj
	 *
	 * Constraint:
	 *     (left=BConj_BConj_1_0 op=AND right=BConj)
	 */
	protected void sequence_BConj(ISerializationContext context, BConj semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.BCONJ__LEFT) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.BCONJ__LEFT));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.BCONJ__OP) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.BCONJ__OP));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.BCONJ__RIGHT) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.BCONJ__RIGHT));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getBConjAccess().getBConjLeftAction_1_0(), semanticObject.getLeft());
		feeder.accept(grammarAccess.getBConjAccess().getOpANDTerminalRuleCall_1_1_0(), semanticObject.getOp());
		feeder.accept(grammarAccess.getBConjAccess().getRightBConjParserRuleCall_1_2_0(), semanticObject.getRight());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     Expression returns BDisj
	 *     BDisj returns BDisj
	 *     BDisj.BDisj_1_0 returns BDisj
	 *     BConj returns BDisj
	 *     BConj.BConj_1_0 returns BDisj
	 *     BRelExp returns BDisj
	 *     BRelExp.BRelExp_1_0 returns BDisj
	 *     AExpression returns BDisj
	 *     AExpression.AExpression_1_0 returns BDisj
	 *     Factor returns BDisj
	 *     Factor.Factor_1_0 returns BDisj
	 *     Primary returns BDisj
	 *
	 * Constraint:
	 *     (left=BDisj_BDisj_1_0 op=OR right=Expression)
	 */
	protected void sequence_BDisj(ISerializationContext context, BDisj semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.BDISJ__LEFT) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.BDISJ__LEFT));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.BDISJ__OP) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.BDISJ__OP));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.BDISJ__RIGHT) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.BDISJ__RIGHT));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getBDisjAccess().getBDisjLeftAction_1_0(), semanticObject.getLeft());
		feeder.accept(grammarAccess.getBDisjAccess().getOpORTerminalRuleCall_1_1_0(), semanticObject.getOp());
		feeder.accept(grammarAccess.getBDisjAccess().getRightExpressionParserRuleCall_1_2_0(), semanticObject.getRight());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     Expression returns BRelExp
	 *     BDisj returns BRelExp
	 *     BDisj.BDisj_1_0 returns BRelExp
	 *     BConj returns BRelExp
	 *     BConj.BConj_1_0 returns BRelExp
	 *     BRelExp returns BRelExp
	 *     BRelExp.BRelExp_1_0 returns BRelExp
	 *     AExpression returns BRelExp
	 *     AExpression.AExpression_1_0 returns BRelExp
	 *     Factor returns BRelExp
	 *     Factor.Factor_1_0 returns BRelExp
	 *     Primary returns BRelExp
	 *
	 * Constraint:
	 *     (left=BRelExp_BRelExp_1_0 op=OP_R right=AExpression)
	 */
	protected void sequence_BRelExp(ISerializationContext context, BRelExp semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.BREL_EXP__LEFT) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.BREL_EXP__LEFT));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.BREL_EXP__OP) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.BREL_EXP__OP));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.BREL_EXP__RIGHT) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.BREL_EXP__RIGHT));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getBRelExpAccess().getBRelExpLeftAction_1_0(), semanticObject.getLeft());
		feeder.accept(grammarAccess.getBRelExpAccess().getOpOP_RTerminalRuleCall_1_1_0(), semanticObject.getOp());
		feeder.accept(grammarAccess.getBRelExpAccess().getRightAExpressionParserRuleCall_1_2_0(), semanticObject.getRight());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     Stmt returns CompoundS
	 *     Block returns CompoundS
	 *
	 * Constraint:
	 *     (stmts+=Stmt stmts+=Stmt*)
	 */
	protected void sequence_Block(ISerializationContext context, CompoundS semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     Expression returns BoolLitExpr
	 *     BDisj returns BoolLitExpr
	 *     BDisj.BDisj_1_0 returns BoolLitExpr
	 *     BConj returns BoolLitExpr
	 *     BConj.BConj_1_0 returns BoolLitExpr
	 *     BRelExp returns BoolLitExpr
	 *     BRelExp.BRelExp_1_0 returns BoolLitExpr
	 *     AExpression returns BoolLitExpr
	 *     AExpression.AExpression_1_0 returns BoolLitExpr
	 *     Factor returns BoolLitExpr
	 *     Factor.Factor_1_0 returns BoolLitExpr
	 *     Primary returns BoolLitExpr
	 *     BoolLitExpr returns BoolLitExpr
	 *
	 * Constraint:
	 *     (bval='true' | bval='false')
	 */
	protected void sequence_BoolLitExpr(ISerializationContext context, BoolLitExpr semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     Expression returns Factor
	 *     BDisj returns Factor
	 *     BDisj.BDisj_1_0 returns Factor
	 *     BConj returns Factor
	 *     BConj.BConj_1_0 returns Factor
	 *     BRelExp returns Factor
	 *     BRelExp.BRelExp_1_0 returns Factor
	 *     AExpression returns Factor
	 *     AExpression.AExpression_1_0 returns Factor
	 *     Factor returns Factor
	 *     Factor.Factor_1_0 returns Factor
	 *     Primary returns Factor
	 *
	 * Constraint:
	 *     (left=Factor_Factor_1_0 op=OPMUL right=Factor)
	 */
	protected void sequence_Factor(ISerializationContext context, Factor semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.FACTOR__LEFT) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.FACTOR__LEFT));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.FACTOR__OP) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.FACTOR__OP));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.FACTOR__RIGHT) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.FACTOR__RIGHT));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getFactorAccess().getFactorLeftAction_1_0(), semanticObject.getLeft());
		feeder.accept(grammarAccess.getFactorAccess().getOpOPMULTerminalRuleCall_1_1_0(), semanticObject.getOp());
		feeder.accept(grammarAccess.getFactorAccess().getRightFactorParserRuleCall_1_2_0(), semanticObject.getRight());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     Formals returns Formals
	 *
	 * Constraint:
	 *     (names+=ID names+=ID*)
	 */
	protected void sequence_Formals(ISerializationContext context, Formals semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     Stmt returns IfS
	 *     If returns IfS
	 *
	 * Constraint:
	 *     (bexp=LabeledExp s1=Block s2=Block)
	 */
	protected void sequence_If(ISerializationContext context, IfS semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.IF_S__BEXP) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.IF_S__BEXP));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.IF_S__S1) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.IF_S__S1));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.IF_S__S2) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.IF_S__S2));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getIfAccess().getBexpLabeledExpParserRuleCall_1_0(), semanticObject.getBexp());
		feeder.accept(grammarAccess.getIfAccess().getS1BlockParserRuleCall_3_0(), semanticObject.getS1());
		feeder.accept(grammarAccess.getIfAccess().getS2BlockParserRuleCall_5_0(), semanticObject.getS2());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     LabeledExp returns LabeledExp
	 *     ElementaryBlock returns LabeledExp
	 *
	 * Constraint:
	 *     (be=Expression | (be=Expression label=INT))
	 */
	protected void sequence_LabeledExp(ISerializationContext context, LabeledExp semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     Expression returns NotExpr
	 *     BDisj returns NotExpr
	 *     BDisj.BDisj_1_0 returns NotExpr
	 *     BConj returns NotExpr
	 *     BConj.BConj_1_0 returns NotExpr
	 *     BRelExp returns NotExpr
	 *     BRelExp.BRelExp_1_0 returns NotExpr
	 *     AExpression returns NotExpr
	 *     AExpression.AExpression_1_0 returns NotExpr
	 *     Factor returns NotExpr
	 *     Factor.Factor_1_0 returns NotExpr
	 *     Primary returns NotExpr
	 *     NotExpr returns NotExpr
	 *
	 * Constraint:
	 *     bexp=Primary
	 */
	protected void sequence_NotExpr(ISerializationContext context, NotExpr semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.NOT_EXPR__BEXP) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.NOT_EXPR__BEXP));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getNotExprAccess().getBexpPrimaryParserRuleCall_1_0(), semanticObject.getBexp());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     Expression returns NumLitExpr
	 *     BDisj returns NumLitExpr
	 *     BDisj.BDisj_1_0 returns NumLitExpr
	 *     BConj returns NumLitExpr
	 *     BConj.BConj_1_0 returns NumLitExpr
	 *     BRelExp returns NumLitExpr
	 *     BRelExp.BRelExp_1_0 returns NumLitExpr
	 *     AExpression returns NumLitExpr
	 *     AExpression.AExpression_1_0 returns NumLitExpr
	 *     Factor returns NumLitExpr
	 *     Factor.Factor_1_0 returns NumLitExpr
	 *     Primary returns NumLitExpr
	 *     NumLitExpr returns NumLitExpr
	 *
	 * Constraint:
	 *     num=INT
	 */
	protected void sequence_NumLitExpr(ISerializationContext context, NumLitExpr semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.NUM_LIT_EXPR__NUM) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.NUM_LIT_EXPR__NUM));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getNumLitExprAccess().getNumINTTerminalRuleCall_0(), semanticObject.getNum());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     Program returns Program
	 *
	 * Constraint:
	 *     (name=ID args=Formals? body=Stmt)
	 */
	protected void sequence_Program(ISerializationContext context, Program semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     Stmt returns SkipS
	 *     Skip returns SkipS
	 *     ElementaryBlock returns SkipS
	 *
	 * Constraint:
	 *     label=INT?
	 */
	protected void sequence_Skip(ISerializationContext context, SkipS semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Contexts:
	 *     Expression returns VarRefExpr
	 *     BDisj returns VarRefExpr
	 *     BDisj.BDisj_1_0 returns VarRefExpr
	 *     BConj returns VarRefExpr
	 *     BConj.BConj_1_0 returns VarRefExpr
	 *     BRelExp returns VarRefExpr
	 *     BRelExp.BRelExp_1_0 returns VarRefExpr
	 *     AExpression returns VarRefExpr
	 *     AExpression.AExpression_1_0 returns VarRefExpr
	 *     Factor returns VarRefExpr
	 *     Factor.Factor_1_0 returns VarRefExpr
	 *     Primary returns VarRefExpr
	 *     VarRefExpr returns VarRefExpr
	 *
	 * Constraint:
	 *     vname=ID
	 */
	protected void sequence_VarRefExpr(ISerializationContext context, VarRefExpr semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.VAR_REF_EXPR__VNAME) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.VAR_REF_EXPR__VNAME));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getVarRefExprAccess().getVnameIDTerminalRuleCall_0(), semanticObject.getVname());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     Stmt returns WhileS
	 *     While returns WhileS
	 *
	 * Constraint:
	 *     (bexp=LabeledExp block=Block)
	 */
	protected void sequence_While(ISerializationContext context, WhileS semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.WHILE_S__BEXP) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.WHILE_S__BEXP));
			if (transientValues.isValueTransient(semanticObject, WhileLangPackage.Literals.WHILE_S__BLOCK) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, WhileLangPackage.Literals.WHILE_S__BLOCK));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getWhileAccess().getBexpLabeledExpParserRuleCall_1_0(), semanticObject.getBexp());
		feeder.accept(grammarAccess.getWhileAccess().getBlockBlockParserRuleCall_3_0(), semanticObject.getBlock());
		feeder.finish();
	}
	
	
}
