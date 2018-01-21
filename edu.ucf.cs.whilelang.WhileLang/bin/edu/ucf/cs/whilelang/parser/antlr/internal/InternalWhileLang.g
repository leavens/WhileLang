/*
 * generated by Xtext 2.13.0
 */
grammar InternalWhileLang;

options {
	superClass=AbstractInternalAntlrParser;
}

@lexer::header {
package edu.ucf.cs.whilelang.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package edu.ucf.cs.whilelang.parser.antlr.internal;

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import edu.ucf.cs.whilelang.services.WhileLangGrammarAccess;

}

@parser::members {

 	private WhileLangGrammarAccess grammarAccess;

    public InternalWhileLangParser(TokenStream input, WhileLangGrammarAccess grammarAccess) {
        this(input);
        this.grammarAccess = grammarAccess;
        registerRules(grammarAccess.getGrammar());
    }

    @Override
    protected String getFirstRuleName() {
    	return "Program";
   	}

   	@Override
   	protected WhileLangGrammarAccess getGrammarAccess() {
   		return grammarAccess;
   	}

}

@rulecatch {
    catch (RecognitionException re) {
        recover(input,re);
        appendSkippedTokens();
    }
}

// Entry rule entryRuleProgram
entryRuleProgram returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getProgramRule()); }
	iv_ruleProgram=ruleProgram
	{ $current=$iv_ruleProgram.current; }
	EOF;

// Rule Program
ruleProgram returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='proc'
		{
			newLeafNode(otherlv_0, grammarAccess.getProgramAccess().getProcKeyword_0());
		}
		(
			(
				lv_name_1_0=RULE_ID
				{
					newLeafNode(lv_name_1_0, grammarAccess.getProgramAccess().getNameIDTerminalRuleCall_1_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getProgramRule());
					}
					setWithLastConsumed(
						$current,
						"name",
						lv_name_1_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		otherlv_2='('
		{
			newLeafNode(otherlv_2, grammarAccess.getProgramAccess().getLeftParenthesisKeyword_2());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getProgramAccess().getArgsFormalsParserRuleCall_3_0());
				}
				lv_args_3_0=ruleFormals
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getProgramRule());
					}
					set(
						$current,
						"args",
						lv_args_3_0,
						"edu.ucf.cs.whilelang.WhileLang.Formals");
					afterParserOrEnumRuleCall();
				}
			)
		)
		otherlv_4=')'
		{
			newLeafNode(otherlv_4, grammarAccess.getProgramAccess().getRightParenthesisKeyword_4());
		}
		otherlv_5='is'
		{
			newLeafNode(otherlv_5, grammarAccess.getProgramAccess().getIsKeyword_5());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getProgramAccess().getBodyStmtParserRuleCall_6_0());
				}
				lv_body_6_0=ruleStmt
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getProgramRule());
					}
					set(
						$current,
						"body",
						lv_body_6_0,
						"edu.ucf.cs.whilelang.WhileLang.Stmt");
					afterParserOrEnumRuleCall();
				}
			)
		)
	)
;

// Entry rule entryRuleFormals
entryRuleFormals returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getFormalsRule()); }
	iv_ruleFormals=ruleFormals
	{ $current=$iv_ruleFormals.current; }
	EOF;

// Rule Formals
ruleFormals returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		(
			(
				lv_names_0_0=RULE_ID
				{
					newLeafNode(lv_names_0_0, grammarAccess.getFormalsAccess().getNamesIDTerminalRuleCall_0_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getFormalsRule());
					}
					addWithLastConsumed(
						$current,
						"names",
						lv_names_0_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		(
			otherlv_1=','
			{
				newLeafNode(otherlv_1, grammarAccess.getFormalsAccess().getCommaKeyword_1_0());
			}
			(
				(
					lv_names_2_0=RULE_ID
					{
						newLeafNode(lv_names_2_0, grammarAccess.getFormalsAccess().getNamesIDTerminalRuleCall_1_1_0());
					}
					{
						if ($current==null) {
							$current = createModelElement(grammarAccess.getFormalsRule());
						}
						addWithLastConsumed(
							$current,
							"names",
							lv_names_2_0,
							"org.eclipse.xtext.common.Terminals.ID");
					}
				)
			)
		)*
	)
;

// Entry rule entryRuleStmt
entryRuleStmt returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getStmtRule()); }
	iv_ruleStmt=ruleStmt
	{ $current=$iv_ruleStmt.current; }
	EOF;

// Rule Stmt
ruleStmt returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getStmtAccess().getAssignmentParserRuleCall_0());
		}
		this_Assignment_0=ruleAssignment
		{
			$current = $this_Assignment_0.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getStmtAccess().getSkipParserRuleCall_1());
		}
		this_Skip_1=ruleSkip
		{
			$current = $this_Skip_1.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getStmtAccess().getBlockParserRuleCall_2());
		}
		this_Block_2=ruleBlock
		{
			$current = $this_Block_2.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getStmtAccess().getWhileParserRuleCall_3());
		}
		this_While_3=ruleWhile
		{
			$current = $this_While_3.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getStmtAccess().getIfParserRuleCall_4());
		}
		this_If_4=ruleIf
		{
			$current = $this_If_4.current;
			afterParserOrEnumRuleCall();
		}
	)
;

// Entry rule entryRuleBlock
entryRuleBlock returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getBlockRule()); }
	iv_ruleBlock=ruleBlock
	{ $current=$iv_ruleBlock.current; }
	EOF;

// Rule Block
ruleBlock returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='{'
		{
			newLeafNode(otherlv_0, grammarAccess.getBlockAccess().getLeftCurlyBracketKeyword_0());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getBlockAccess().getStmtsStmtParserRuleCall_1_0());
				}
				lv_stmts_1_0=ruleStmt
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getBlockRule());
					}
					add(
						$current,
						"stmts",
						lv_stmts_1_0,
						"edu.ucf.cs.whilelang.WhileLang.Stmt");
					afterParserOrEnumRuleCall();
				}
			)
		)
		(
			otherlv_2=';'
			{
				newLeafNode(otherlv_2, grammarAccess.getBlockAccess().getSemicolonKeyword_2_0());
			}
			(
				(
					{
						newCompositeNode(grammarAccess.getBlockAccess().getStmtsStmtParserRuleCall_2_1_0());
					}
					lv_stmts_3_0=ruleStmt
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getBlockRule());
						}
						add(
							$current,
							"stmts",
							lv_stmts_3_0,
							"edu.ucf.cs.whilelang.WhileLang.Stmt");
						afterParserOrEnumRuleCall();
					}
				)
			)
		)*
		otherlv_4='}'
		{
			newLeafNode(otherlv_4, grammarAccess.getBlockAccess().getRightCurlyBracketKeyword_3());
		}
	)
;

// Entry rule entryRuleAssignment
entryRuleAssignment returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getAssignmentRule()); }
	iv_ruleAssignment=ruleAssignment
	{ $current=$iv_ruleAssignment.current; }
	EOF;

// Rule Assignment
ruleAssignment returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		(
			(
				(
					lv_v_0_0=RULE_ID
					{
						newLeafNode(lv_v_0_0, grammarAccess.getAssignmentAccess().getVIDTerminalRuleCall_0_0_0());
					}
					{
						if ($current==null) {
							$current = createModelElement(grammarAccess.getAssignmentRule());
						}
						setWithLastConsumed(
							$current,
							"v",
							lv_v_0_0,
							"org.eclipse.xtext.common.Terminals.ID");
					}
				)
			)
			otherlv_1=':='
			{
				newLeafNode(otherlv_1, grammarAccess.getAssignmentAccess().getColonEqualsSignKeyword_0_1());
			}
			(
				(
					{
						newCompositeNode(grammarAccess.getAssignmentAccess().getAexpExpressionParserRuleCall_0_2_0());
					}
					lv_aexp_2_0=ruleExpression
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getAssignmentRule());
						}
						set(
							$current,
							"aexp",
							lv_aexp_2_0,
							"edu.ucf.cs.whilelang.WhileLang.Expression");
						afterParserOrEnumRuleCall();
					}
				)
			)
		)
		    |
		(
			otherlv_3='['
			{
				newLeafNode(otherlv_3, grammarAccess.getAssignmentAccess().getLeftSquareBracketKeyword_1_0());
			}
			(
				(
					lv_v_4_0=RULE_ID
					{
						newLeafNode(lv_v_4_0, grammarAccess.getAssignmentAccess().getVIDTerminalRuleCall_1_1_0());
					}
					{
						if ($current==null) {
							$current = createModelElement(grammarAccess.getAssignmentRule());
						}
						setWithLastConsumed(
							$current,
							"v",
							lv_v_4_0,
							"org.eclipse.xtext.common.Terminals.ID");
					}
				)
			)
			otherlv_5=':='
			{
				newLeafNode(otherlv_5, grammarAccess.getAssignmentAccess().getColonEqualsSignKeyword_1_2());
			}
			(
				(
					{
						newCompositeNode(grammarAccess.getAssignmentAccess().getAexpExpressionParserRuleCall_1_3_0());
					}
					lv_aexp_6_0=ruleExpression
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getAssignmentRule());
						}
						set(
							$current,
							"aexp",
							lv_aexp_6_0,
							"edu.ucf.cs.whilelang.WhileLang.Expression");
						afterParserOrEnumRuleCall();
					}
				)
			)
			otherlv_7=']'
			{
				newLeafNode(otherlv_7, grammarAccess.getAssignmentAccess().getRightSquareBracketKeyword_1_4());
			}
			otherlv_8='^'
			{
				newLeafNode(otherlv_8, grammarAccess.getAssignmentAccess().getCircumflexAccentKeyword_1_5());
			}
			(
				(
					lv_label_9_0=RULE_INT
					{
						newLeafNode(lv_label_9_0, grammarAccess.getAssignmentAccess().getLabelINTTerminalRuleCall_1_6_0());
					}
					{
						if ($current==null) {
							$current = createModelElement(grammarAccess.getAssignmentRule());
						}
						setWithLastConsumed(
							$current,
							"label",
							lv_label_9_0,
							"org.eclipse.xtext.common.Terminals.INT");
					}
				)
			)
		)
	)
;

// Entry rule entryRuleSkip
entryRuleSkip returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getSkipRule()); }
	iv_ruleSkip=ruleSkip
	{ $current=$iv_ruleSkip.current; }
	EOF;

// Rule Skip
ruleSkip returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		(
			otherlv_0='skip'
			{
				newLeafNode(otherlv_0, grammarAccess.getSkipAccess().getSkipKeyword_0_0());
			}
			(
				{
					$current = forceCreateModelElement(
						grammarAccess.getSkipAccess().getSkipSAction_0_1(),
						$current);
				}
			)
		)
		    |
		(
			otherlv_2='['
			{
				newLeafNode(otherlv_2, grammarAccess.getSkipAccess().getLeftSquareBracketKeyword_1_0());
			}
			otherlv_3='skip'
			{
				newLeafNode(otherlv_3, grammarAccess.getSkipAccess().getSkipKeyword_1_1());
			}
			otherlv_4=']'
			{
				newLeafNode(otherlv_4, grammarAccess.getSkipAccess().getRightSquareBracketKeyword_1_2());
			}
			otherlv_5='^'
			{
				newLeafNode(otherlv_5, grammarAccess.getSkipAccess().getCircumflexAccentKeyword_1_3());
			}
			(
				(
					lv_label_6_0=RULE_INT
					{
						newLeafNode(lv_label_6_0, grammarAccess.getSkipAccess().getLabelINTTerminalRuleCall_1_4_0());
					}
					{
						if ($current==null) {
							$current = createModelElement(grammarAccess.getSkipRule());
						}
						setWithLastConsumed(
							$current,
							"label",
							lv_label_6_0,
							"org.eclipse.xtext.common.Terminals.INT");
					}
				)
			)
		)
	)
;

// Entry rule entryRuleWhile
entryRuleWhile returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getWhileRule()); }
	iv_ruleWhile=ruleWhile
	{ $current=$iv_ruleWhile.current; }
	EOF;

// Rule While
ruleWhile returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='while'
		{
			newLeafNode(otherlv_0, grammarAccess.getWhileAccess().getWhileKeyword_0());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getWhileAccess().getBexpLabeledExpParserRuleCall_1_0());
				}
				lv_bexp_1_0=ruleLabeledExp
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getWhileRule());
					}
					set(
						$current,
						"bexp",
						lv_bexp_1_0,
						"edu.ucf.cs.whilelang.WhileLang.LabeledExp");
					afterParserOrEnumRuleCall();
				}
			)
		)
		otherlv_2='do'
		{
			newLeafNode(otherlv_2, grammarAccess.getWhileAccess().getDoKeyword_2());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getWhileAccess().getBlockBlockParserRuleCall_3_0());
				}
				lv_block_3_0=ruleBlock
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getWhileRule());
					}
					set(
						$current,
						"block",
						lv_block_3_0,
						"edu.ucf.cs.whilelang.WhileLang.Block");
					afterParserOrEnumRuleCall();
				}
			)
		)
	)
;

// Entry rule entryRuleIf
entryRuleIf returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getIfRule()); }
	iv_ruleIf=ruleIf
	{ $current=$iv_ruleIf.current; }
	EOF;

// Rule If
ruleIf returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='if'
		{
			newLeafNode(otherlv_0, grammarAccess.getIfAccess().getIfKeyword_0());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getIfAccess().getBexpLabeledExpParserRuleCall_1_0());
				}
				lv_bexp_1_0=ruleLabeledExp
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getIfRule());
					}
					set(
						$current,
						"bexp",
						lv_bexp_1_0,
						"edu.ucf.cs.whilelang.WhileLang.LabeledExp");
					afterParserOrEnumRuleCall();
				}
			)
		)
		otherlv_2='then'
		{
			newLeafNode(otherlv_2, grammarAccess.getIfAccess().getThenKeyword_2());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getIfAccess().getS1BlockParserRuleCall_3_0());
				}
				lv_s1_3_0=ruleBlock
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getIfRule());
					}
					set(
						$current,
						"s1",
						lv_s1_3_0,
						"edu.ucf.cs.whilelang.WhileLang.Block");
					afterParserOrEnumRuleCall();
				}
			)
		)
		otherlv_4='else'
		{
			newLeafNode(otherlv_4, grammarAccess.getIfAccess().getElseKeyword_4());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getIfAccess().getS2BlockParserRuleCall_5_0());
				}
				lv_s2_5_0=ruleBlock
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getIfRule());
					}
					set(
						$current,
						"s2",
						lv_s2_5_0,
						"edu.ucf.cs.whilelang.WhileLang.Block");
					afterParserOrEnumRuleCall();
				}
			)
		)
	)
;

// Entry rule entryRuleLabeledExp
entryRuleLabeledExp returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getLabeledExpRule()); }
	iv_ruleLabeledExp=ruleLabeledExp
	{ $current=$iv_ruleLabeledExp.current; }
	EOF;

// Rule LabeledExp
ruleLabeledExp returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		(
			(
				{
					newCompositeNode(grammarAccess.getLabeledExpAccess().getBeExpressionParserRuleCall_0_0());
				}
				lv_be_0_0=ruleExpression
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getLabeledExpRule());
					}
					set(
						$current,
						"be",
						lv_be_0_0,
						"edu.ucf.cs.whilelang.WhileLang.Expression");
					afterParserOrEnumRuleCall();
				}
			)
		)
		    |
		(
			otherlv_1='['
			{
				newLeafNode(otherlv_1, grammarAccess.getLabeledExpAccess().getLeftSquareBracketKeyword_1_0());
			}
			(
				(
					{
						newCompositeNode(grammarAccess.getLabeledExpAccess().getBeExpressionParserRuleCall_1_1_0());
					}
					lv_be_2_0=ruleExpression
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getLabeledExpRule());
						}
						set(
							$current,
							"be",
							lv_be_2_0,
							"edu.ucf.cs.whilelang.WhileLang.Expression");
						afterParserOrEnumRuleCall();
					}
				)
			)
			otherlv_3=']'
			{
				newLeafNode(otherlv_3, grammarAccess.getLabeledExpAccess().getRightSquareBracketKeyword_1_2());
			}
			otherlv_4='^'
			{
				newLeafNode(otherlv_4, grammarAccess.getLabeledExpAccess().getCircumflexAccentKeyword_1_3());
			}
			(
				(
					lv_label_5_0=RULE_INT
					{
						newLeafNode(lv_label_5_0, grammarAccess.getLabeledExpAccess().getLabelINTTerminalRuleCall_1_4_0());
					}
					{
						if ($current==null) {
							$current = createModelElement(grammarAccess.getLabeledExpRule());
						}
						setWithLastConsumed(
							$current,
							"label",
							lv_label_5_0,
							"org.eclipse.xtext.common.Terminals.INT");
					}
				)
			)
		)
	)
;

// Entry rule entryRuleExpression
entryRuleExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getExpressionRule()); }
	iv_ruleExpression=ruleExpression
	{ $current=$iv_ruleExpression.current; }
	EOF;

// Rule Expression
ruleExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	{
		newCompositeNode(grammarAccess.getExpressionAccess().getBDisjParserRuleCall());
	}
	this_BDisj_0=ruleBDisj
	{
		$current = $this_BDisj_0.current;
		afterParserOrEnumRuleCall();
	}
;

// Entry rule entryRuleBDisj
entryRuleBDisj returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getBDisjRule()); }
	iv_ruleBDisj=ruleBDisj
	{ $current=$iv_ruleBDisj.current; }
	EOF;

// Rule BDisj
ruleBDisj returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getBDisjAccess().getBConjParserRuleCall_0());
		}
		this_BConj_0=ruleBConj
		{
			$current = $this_BConj_0.current;
			afterParserOrEnumRuleCall();
		}
		(
			(
				{
					$current = forceCreateModelElementAndSet(
						grammarAccess.getBDisjAccess().getBDisjLeftAction_1_0(),
						$current);
				}
			)
			(
				(
					lv_op_2_0=RULE_OR
					{
						newLeafNode(lv_op_2_0, grammarAccess.getBDisjAccess().getOpORTerminalRuleCall_1_1_0());
					}
					{
						if ($current==null) {
							$current = createModelElement(grammarAccess.getBDisjRule());
						}
						setWithLastConsumed(
							$current,
							"op",
							lv_op_2_0,
							"edu.ucf.cs.whilelang.WhileLang.OR");
					}
				)
			)
			(
				(
					{
						newCompositeNode(grammarAccess.getBDisjAccess().getRightExpressionParserRuleCall_1_2_0());
					}
					lv_right_3_0=ruleExpression
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getBDisjRule());
						}
						set(
							$current,
							"right",
							lv_right_3_0,
							"edu.ucf.cs.whilelang.WhileLang.Expression");
						afterParserOrEnumRuleCall();
					}
				)
			)
		)?
	)
;

// Entry rule entryRuleBConj
entryRuleBConj returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getBConjRule()); }
	iv_ruleBConj=ruleBConj
	{ $current=$iv_ruleBConj.current; }
	EOF;

// Rule BConj
ruleBConj returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getBConjAccess().getBRelExpParserRuleCall_0());
		}
		this_BRelExp_0=ruleBRelExp
		{
			$current = $this_BRelExp_0.current;
			afterParserOrEnumRuleCall();
		}
		(
			(
				{
					$current = forceCreateModelElementAndSet(
						grammarAccess.getBConjAccess().getBConjLeftAction_1_0(),
						$current);
				}
			)
			(
				(
					lv_op_2_0=RULE_AND
					{
						newLeafNode(lv_op_2_0, grammarAccess.getBConjAccess().getOpANDTerminalRuleCall_1_1_0());
					}
					{
						if ($current==null) {
							$current = createModelElement(grammarAccess.getBConjRule());
						}
						setWithLastConsumed(
							$current,
							"op",
							lv_op_2_0,
							"edu.ucf.cs.whilelang.WhileLang.AND");
					}
				)
			)
			(
				(
					{
						newCompositeNode(grammarAccess.getBConjAccess().getRightBConjParserRuleCall_1_2_0());
					}
					lv_right_3_0=ruleBConj
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getBConjRule());
						}
						set(
							$current,
							"right",
							lv_right_3_0,
							"edu.ucf.cs.whilelang.WhileLang.BConj");
						afterParserOrEnumRuleCall();
					}
				)
			)
		)?
	)
;

// Entry rule entryRuleBRelExp
entryRuleBRelExp returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getBRelExpRule()); }
	iv_ruleBRelExp=ruleBRelExp
	{ $current=$iv_ruleBRelExp.current; }
	EOF;

// Rule BRelExp
ruleBRelExp returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getBRelExpAccess().getAExpressionParserRuleCall_0());
		}
		this_AExpression_0=ruleAExpression
		{
			$current = $this_AExpression_0.current;
			afterParserOrEnumRuleCall();
		}
		(
			(
				{
					$current = forceCreateModelElementAndSet(
						grammarAccess.getBRelExpAccess().getBRelExpLeftAction_1_0(),
						$current);
				}
			)
			(
				(
					lv_op_2_0=RULE_OP_R
					{
						newLeafNode(lv_op_2_0, grammarAccess.getBRelExpAccess().getOpOP_RTerminalRuleCall_1_1_0());
					}
					{
						if ($current==null) {
							$current = createModelElement(grammarAccess.getBRelExpRule());
						}
						setWithLastConsumed(
							$current,
							"op",
							lv_op_2_0,
							"edu.ucf.cs.whilelang.WhileLang.OP_R");
					}
				)
			)
			(
				(
					{
						newCompositeNode(grammarAccess.getBRelExpAccess().getRightAExpressionParserRuleCall_1_2_0());
					}
					lv_right_3_0=ruleAExpression
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getBRelExpRule());
						}
						set(
							$current,
							"right",
							lv_right_3_0,
							"edu.ucf.cs.whilelang.WhileLang.AExpression");
						afterParserOrEnumRuleCall();
					}
				)
			)
		)?
	)
;

// Entry rule entryRuleAExpression
entryRuleAExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getAExpressionRule()); }
	iv_ruleAExpression=ruleAExpression
	{ $current=$iv_ruleAExpression.current; }
	EOF;

// Rule AExpression
ruleAExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getAExpressionAccess().getFactorParserRuleCall_0());
		}
		this_Factor_0=ruleFactor
		{
			$current = $this_Factor_0.current;
			afterParserOrEnumRuleCall();
		}
		(
			(
				{
					$current = forceCreateModelElementAndSet(
						grammarAccess.getAExpressionAccess().getAExpressionLeftAction_1_0(),
						$current);
				}
			)
			(
				(
					lv_op_2_0=RULE_OPPLUS
					{
						newLeafNode(lv_op_2_0, grammarAccess.getAExpressionAccess().getOpOPPLUSTerminalRuleCall_1_1_0());
					}
					{
						if ($current==null) {
							$current = createModelElement(grammarAccess.getAExpressionRule());
						}
						setWithLastConsumed(
							$current,
							"op",
							lv_op_2_0,
							"edu.ucf.cs.whilelang.WhileLang.OPPLUS");
					}
				)
			)
			(
				(
					{
						newCompositeNode(grammarAccess.getAExpressionAccess().getRightAExpressionParserRuleCall_1_2_0());
					}
					lv_right_3_0=ruleAExpression
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getAExpressionRule());
						}
						set(
							$current,
							"right",
							lv_right_3_0,
							"edu.ucf.cs.whilelang.WhileLang.AExpression");
						afterParserOrEnumRuleCall();
					}
				)
			)
		)?
	)
;

// Entry rule entryRuleFactor
entryRuleFactor returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getFactorRule()); }
	iv_ruleFactor=ruleFactor
	{ $current=$iv_ruleFactor.current; }
	EOF;

// Rule Factor
ruleFactor returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getFactorAccess().getPrimaryParserRuleCall_0());
		}
		this_Primary_0=rulePrimary
		{
			$current = $this_Primary_0.current;
			afterParserOrEnumRuleCall();
		}
		(
			(
				{
					$current = forceCreateModelElementAndSet(
						grammarAccess.getFactorAccess().getFactorLeftAction_1_0(),
						$current);
				}
			)
			(
				(
					lv_op_2_0=RULE_OPMUL
					{
						newLeafNode(lv_op_2_0, grammarAccess.getFactorAccess().getOpOPMULTerminalRuleCall_1_1_0());
					}
					{
						if ($current==null) {
							$current = createModelElement(grammarAccess.getFactorRule());
						}
						setWithLastConsumed(
							$current,
							"op",
							lv_op_2_0,
							"edu.ucf.cs.whilelang.WhileLang.OPMUL");
					}
				)
			)
			(
				(
					{
						newCompositeNode(grammarAccess.getFactorAccess().getRightFactorParserRuleCall_1_2_0());
					}
					lv_right_3_0=ruleFactor
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getFactorRule());
						}
						set(
							$current,
							"right",
							lv_right_3_0,
							"edu.ucf.cs.whilelang.WhileLang.Factor");
						afterParserOrEnumRuleCall();
					}
				)
			)
		)?
	)
;

// Entry rule entryRulePrimary
entryRulePrimary returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getPrimaryRule()); }
	iv_rulePrimary=rulePrimary
	{ $current=$iv_rulePrimary.current; }
	EOF;

// Rule Primary
rulePrimary returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getPrimaryAccess().getVarRefExprParserRuleCall_0());
		}
		this_VarRefExpr_0=ruleVarRefExpr
		{
			$current = $this_VarRefExpr_0.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getPrimaryAccess().getNumLitExprParserRuleCall_1());
		}
		this_NumLitExpr_1=ruleNumLitExpr
		{
			$current = $this_NumLitExpr_1.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getPrimaryAccess().getBoolLitExprParserRuleCall_2());
		}
		this_BoolLitExpr_2=ruleBoolLitExpr
		{
			$current = $this_BoolLitExpr_2.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getPrimaryAccess().getNotExprParserRuleCall_3());
		}
		this_NotExpr_3=ruleNotExpr
		{
			$current = $this_NotExpr_3.current;
			afterParserOrEnumRuleCall();
		}
		    |
		(
			otherlv_4='('
			{
				newLeafNode(otherlv_4, grammarAccess.getPrimaryAccess().getLeftParenthesisKeyword_4_0());
			}
			{
				newCompositeNode(grammarAccess.getPrimaryAccess().getExpressionParserRuleCall_4_1());
			}
			this_Expression_5=ruleExpression
			{
				$current = $this_Expression_5.current;
				afterParserOrEnumRuleCall();
			}
			otherlv_6=')'
			{
				newLeafNode(otherlv_6, grammarAccess.getPrimaryAccess().getRightParenthesisKeyword_4_2());
			}
		)
	)
;

// Entry rule entryRuleVarRefExpr
entryRuleVarRefExpr returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getVarRefExprRule()); }
	iv_ruleVarRefExpr=ruleVarRefExpr
	{ $current=$iv_ruleVarRefExpr.current; }
	EOF;

// Rule VarRefExpr
ruleVarRefExpr returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		(
			lv_vname_0_0=RULE_ID
			{
				newLeafNode(lv_vname_0_0, grammarAccess.getVarRefExprAccess().getVnameIDTerminalRuleCall_0());
			}
			{
				if ($current==null) {
					$current = createModelElement(grammarAccess.getVarRefExprRule());
				}
				setWithLastConsumed(
					$current,
					"vname",
					lv_vname_0_0,
					"org.eclipse.xtext.common.Terminals.ID");
			}
		)
	)
;

// Entry rule entryRuleNumLitExpr
entryRuleNumLitExpr returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getNumLitExprRule()); }
	iv_ruleNumLitExpr=ruleNumLitExpr
	{ $current=$iv_ruleNumLitExpr.current; }
	EOF;

// Rule NumLitExpr
ruleNumLitExpr returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		(
			(
				lv_negated_0_0='-'
				{
					newLeafNode(lv_negated_0_0, grammarAccess.getNumLitExprAccess().getNegatedHyphenMinusKeyword_0_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getNumLitExprRule());
					}
					setWithLastConsumed($current, "negated", true, "-");
				}
			)
		)?
		(
			(
				lv_num_1_0=RULE_INT
				{
					newLeafNode(lv_num_1_0, grammarAccess.getNumLitExprAccess().getNumINTTerminalRuleCall_1_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getNumLitExprRule());
					}
					setWithLastConsumed(
						$current,
						"num",
						lv_num_1_0,
						"org.eclipse.xtext.common.Terminals.INT");
				}
			)
		)
	)
;

// Entry rule entryRuleBoolLitExpr
entryRuleBoolLitExpr returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getBoolLitExprRule()); }
	iv_ruleBoolLitExpr=ruleBoolLitExpr
	{ $current=$iv_ruleBoolLitExpr.current; }
	EOF;

// Rule BoolLitExpr
ruleBoolLitExpr returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		(
			(
				lv_bval_0_0='true'
				{
					newLeafNode(lv_bval_0_0, grammarAccess.getBoolLitExprAccess().getBvalTrueKeyword_0_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getBoolLitExprRule());
					}
					setWithLastConsumed($current, "bval", lv_bval_0_0, "true");
				}
			)
		)
		    |
		(
			(
				lv_bval_1_0='false'
				{
					newLeafNode(lv_bval_1_0, grammarAccess.getBoolLitExprAccess().getBvalFalseKeyword_1_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getBoolLitExprRule());
					}
					setWithLastConsumed($current, "bval", lv_bval_1_0, "false");
				}
			)
		)
	)
;

// Entry rule entryRuleNotExpr
entryRuleNotExpr returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getNotExprRule()); }
	iv_ruleNotExpr=ruleNotExpr
	{ $current=$iv_ruleNotExpr.current; }
	EOF;

// Rule NotExpr
ruleNotExpr returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='not'
		{
			newLeafNode(otherlv_0, grammarAccess.getNotExprAccess().getNotKeyword_0());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getNotExprAccess().getBexpPrimaryParserRuleCall_1_0());
				}
				lv_bexp_1_0=rulePrimary
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getNotExprRule());
					}
					set(
						$current,
						"bexp",
						lv_bexp_1_0,
						"edu.ucf.cs.whilelang.WhileLang.Primary");
					afterParserOrEnumRuleCall();
				}
			)
		)
	)
;

RULE_SL_COMMENT : '%' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_OPPLUS : ('+'|'-');

RULE_OPMUL : ('*'|'/');

RULE_OR : 'or';

RULE_AND : 'and';

RULE_OP_R : ('=='|'!='|'<='|'>='|'<'|'>');

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;
