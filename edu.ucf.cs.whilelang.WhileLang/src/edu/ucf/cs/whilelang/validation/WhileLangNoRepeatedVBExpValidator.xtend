package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.generator.WhileLangUnparser
import edu.ucf.cs.whilelang.utility.AExps
import edu.ucf.cs.whilelang.utility.Access
import edu.ucf.cs.whilelang.utility.FreeVars
import edu.ucf.cs.whilelang.utility.VBPropertySpace
import edu.ucf.cs.whilelang.whileLang.AssertS
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.Expr
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.S
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.WhileS
import java.util.function.Predicate
import org.eclipse.xtext.validation.Check

/** Validates that no expressions are repeated that are very busy. 
 * Issues errors if a variable is very busy and computed again.
 * The reason for worry about repeats is that if the programmer hoists an
 * expression, then it would still be very busy where it is computed. So
 * what we want to avoid is code like:
 *     x := e1+e2; ... y := e1 + e2
 * where e1+e2 is computed twice.
 * We look for a block which computes an expression E and such that 
 * E is in both the exit and entry sets for the VB analysis at that block,
 * but E does not have any free variables that are assigned in that block.
 * At such a place the programmer could define E and reuse it (from the defined variable).
 * This relies on the Very Busy Expressions analysis.
 */
class WhileLangNoRepeatedVBExpValidator extends AbstractWhileLangValidator {
    
    public static val ISSUE_CODE_PREFIX = "edu.ucf.cs.whilelang."
    
    public static val UNASSIGNED_VAR = ISSUE_CODE_PREFIX + "RepeatedVeryBusyExp"
    
    /** Check that the very busy expressions in a program 
     * may have been assigned before. */
    @Check    
    def checkNoRepeatedVBExps(Program p) {
        val vba = new WhileLangVBAnalysis(p)
        vba.computeAnalysis()
        val pname = p.name
        val pbody = p.body
        checkNRVBE(vba, pname, pbody)
    }
    
    /** Check that there are no repeated non-trivial arithmetic expressions that are
     * very busy on both entry and exit to the statement
     * (and not involving variables that the statement defines). */
    def dispatch void checkNRVBE(WhileLangVBAnalysis vb, String pname, AssignS s) {
        checkDefinedAndRepeated(vb, pname, s.v, s.aexp, s.label)
    }
    
    def void checkDefinedAndRepeated(WhileLangVBAnalysis analysis, String pname, String v, Expr expr, int lab) {
        val ntSubExps = new AExps().Aexp(expr)
        val exitInfo = analysis.VBInfo.get(Access.EXIT,lab)
        val entryInfo = analysis.VBInfo.get(Access.ENTRY,lab)
        val bothInfo = new VBPropertySpace()
        bothInfo.join(exitInfo)
        bothInfo.join(entryInfo)
        if (!(v.equals(""))) {
            bothInfo.removeIf(new Predicate<Expr>() {
                            override boolean test(Expr e) { 
                               new FreeVars().FV(e).contains(v);
                            }
                        })
        }
        for (e : ntSubExps) {
            if (bothInfo.contains(e)) {
                // e is very busy, repeated, and computed at lab
                issueError(pname, e, lab)
            }
        }
    }

    /** Check that there are no repeated non-trivial arithmetic expressions that are
     * very busy on both entry and exit to the statement
     * (and not involving variables that the statement defines). */
    def dispatch void checkNRVBE(WhileLangVBAnalysis vb, String pname, SkipS s) {
        // Can't be any problems with a skip statement.
    }
    
    /** Check that there are no repeated non-trivial arithmetic expressions that are
     * very busy on both entry and exit to the statement
     * (and not involving variables that the statement defines). */
    def dispatch void checkNRVBE(WhileLangVBAnalysis vb, String pname, CompoundS s) {
        for (S stmt : s.stmts) {
            checkNRVBE(vb, pname, stmt)
        }      
    }
    
    /** Check that there are no repeated non-trivial arithmetic expressions that are
     * very busy on both entry and exit to the statement
     * (and not involving variables that the statement defines). */
    def dispatch void checkNRVBE(WhileLangVBAnalysis vb, String pname, WhileS s) {
        checkDefinedAndRepeated(vb, pname, "", s.bexp.be, s.bexp.label)
        checkNRVBE(vb, pname, s.block)      
    }

    /** Check that there are no repeated non-trivial arithmetic expressions that are
     * very busy on both entry and exit to the statement
     * (and not involving variables that the statement defines). */
    def dispatch void checkNRVBE(WhileLangVBAnalysis vb, String pname, IfS s) {
        checkDefinedAndRepeated(vb, pname, "", s.bexp.be, s.bexp.label)
        checkNRVBE(vb, pname, s.s1)
        checkNRVBE(vb, pname, s.s2)     
    }
    
    /** Check that there are no repeated non-trivial arithmetic expressions that are
     * very busy on both entry and exit to the statement
     * (and not involving variables that the statement defines). */
    def dispatch void checkNRVBE(WhileLangVBAnalysis vb, String pname, AssertS s) {
        checkDefinedAndRepeated(vb, pname, "", s.bexp.be, s.bexp.label)
    }
    
    /** Issue an error message about expr being recomputed at the node. */   
    def void issueError(String pname, Expr expr, int lab) {
        val wlup = new WhileLangUnparser()
        val String msg = "The expression" + wlup.unparse(expr) 
                         + " is computed here and also afterwards " 
                         + " (proc: " + pname + " label: " + lab + ")"
        System.err.println(msg)
        // val feat = expr.eContainingFeature
        // error(msg, feat)
    }
}