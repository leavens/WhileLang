package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.generator.WhileLangUnparser
import edu.ucf.cs.whilelang.utility.Access
import edu.ucf.cs.whilelang.utility.FreeVars
import edu.ucf.cs.whilelang.utility.MaybeLabel
import edu.ucf.cs.whilelang.utility.RDPropertySpace
import edu.ucf.cs.whilelang.whileLang.AssertS
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.Expr
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.S
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.WhileS
import java.util.Set
import org.eclipse.xtext.validation.Check
import edu.ucf.cs.whilelang.whileLang.CompoundS

/** Validates that before using a variable it may have been assigned. 
 * Issues errors if a variable may be used and cannot have been assigned previously.
 * This relies on the Reaching Definitions analysis.
 */
class WhileLangAssignedBeforeUseValidator extends AbstractWhileLangValidator {
    
    public static val ISSUE_CODE_PREFIX = "edu.ucf.cs.whilelang."
    
    public static val UNASSIGNED_VAR = ISSUE_CODE_PREFIX + "UnassignedVariable"
    
    /** Check that the free variables used in a program 
     * may have been assigned before. */
    @Check    
    def checkAssignedBeforeUse(Program p) {
        val rda = new WhileLangRDAnalysis(p)
        rda.computeAnalysis()
        val pname = p.name
        val pbody = p.body
        checkABU(rda, pname, pbody)
    }
    
    /** Check that the free variables used in the given statement 
     * may have been assigned before. */
    def dispatch void checkABU(WhileLangRDAnalysis rd, String pname, AssignS s) {
        checkVarsOf(rd, pname, s.aexp, s.label)
    }

    /** Check that the free variables used in the given statement 
     * may have been assigned before. */
    def dispatch void checkABU(WhileLangRDAnalysis rd, String pname, SkipS s) {
        // Can't be any problems with a skip statement.
    }
    
    /** Check that the free variables used in the given statement 
     * may have been assigned before. */
    def dispatch void checkABU(WhileLangRDAnalysis rd, String pname, CompoundS s) {
        for (S stmt : s.stmts) {
            checkABU(rd, pname, stmt)
        }      
    }
    
    /** Check that the free variables used in the given statement 
     * may have been assigned before. */
    def dispatch void checkABU(WhileLangRDAnalysis rd, String pname, WhileS s) {
        checkVarsOf(rd, pname, s.bexp.be, s.bexp.label)
        checkABU(rd, pname, s.block)      
    }

    /** Check that the free variables used in the given statement 
     * may have been assigned before. */
    def dispatch void checkABU(WhileLangRDAnalysis rd, String pname, IfS s) {
        checkVarsOf(rd, pname, s.bexp.be, s.bexp.label)
        checkABU(rd, pname, s.s1)
        checkABU(rd, pname, s.s2)     
    }
    
    /** Check that the free variables used in the given statement 
     * may have been assigned before. */
    def dispatch void checkABU(WhileLangRDAnalysis rd, String pname, AssertS s) {
        checkVarsOf(rd, pname, s.bexp.be, s.bexp.label)
    }
    
    
    /** Check that each variable in exp may have been assigned according to rd. */
    def void checkVarsOf(WhileLangRDAnalysis rd, String pname, Expr exp, int lab) {
        val fv = new FreeVars()       
        for (String v : fv.FV(exp)) {
            val RDPropertySpace info = rd.RDInfo.get(Access.ENTRY,lab)
            val Set<MaybeLabel> labs = info.get(v)
            labs.remove(new MaybeLabel())  // don't count ?
            if (labs.isEmpty()) {
                issueError(pname, v, exp, lab)
            }
        }       
    }   
 
    /** Issue an error message about v not being defined in expr. */   
    def void issueError(String pname, String v, Expr expr, int i) {
        val wlup = new WhileLangUnparser()
        val String msg = "Variable " + v + " is used before being assigned in " 
                      + wlup.unparse(expr) + " (proc: " + pname + " label: " + i + ")"
        System.err.println(msg)
        // val feat = expr.eContainingFeature
        // error(msg, feat)
    }
}