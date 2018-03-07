package edu.ucf.cs.whilelang.utility

import edu.ucf.cs.whilelang.whileLang.BoolLitExpr
import edu.ucf.cs.whilelang.whileLang.Expr
import edu.ucf.cs.whilelang.whileLang.NotExpr
import edu.ucf.cs.whilelang.whileLang.NumLitExpr
import edu.ucf.cs.whilelang.whileLang.SignedNum
import edu.ucf.cs.whilelang.whileLang.VarRefExpr
import java.util.HashSet
import java.util.Set
import static extension edu.ucf.cs.whilelang.utility.ASTExtensions.*
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.WhileS
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.AssertS
import edu.ucf.cs.whilelang.whileLang.LabeledExp

/** The FV method computes the set of free variables in an expression. */
class FreeVars {
    /** Return the set of Free Variables in the given expression. */
    def dispatch Set<String> FV(VarRefExpr v) {
        val ret = new HashSet()
        ret.add(v.vname)
        return ret
    }
    
    /** Return the set of Free Variables in the given expression. */
    def dispatch Set<String> FV(NumLitExpr n) {
        return new HashSet()
    }
    
    /** Return the set of Free Variables in the given expression. */
    def dispatch Set<String> FV(SignedNum n) {
        val ret = new HashSet()
        ret.addAll(FV(n.nval)) // n.nval is a Primary, so could be a variable
        return ret
    }
    
    /** Return the set of Free Variables in the given expression. */
    def dispatch Set<String> FV(BoolLitExpr b) {
        return new HashSet()
    }
    
    /** Return the set of Free Variables in the given expression. */
    def dispatch Set<String> FV(NotExpr n) {
        return FV(n.bexp)
    }
    
    /** Return the set of Free Variables in the given expression. */
    def dispatch Set<String> FV(Expr e) {
        val ret = new HashSet()
        ret.addAll(FV(e.leftSubExp))
        ret.addAll(FV(e.rightSubExp))
        return ret
    }

    /** Return the set of free variables used in the given labeled expression. */
    def dispatch Set<String> FV(LabeledExp labe) {
        return FV(labe.be)
    }
    
    /** Return the set of free variables used in the given statement. */
    def dispatch Set<String> FV(AssignS s) {
        val ret = new HashSet()
        ret.add(s.v);
        ret.addAll(FV(s.aexp))
        return ret
    }

    /** Return the set of free variables used in the given statement. */
    def dispatch Set<String> FV(SkipS s) {
        return new HashSet()
    }
    
    /** Return the set of free variables used in the given statement. */
    def dispatch Set<String> FV(CompoundS blk) {
        val ret = new HashSet()
        for (s : blk.stmts) {
            ret.addAll(FV(s))
        }
        return ret
    }
    
    /** Return the set of free variables used in the given statement. */
    def dispatch Set<String> FV(WhileS s) {
        val ret = new HashSet()
        ret.addAll(FV(s.bexp))
        ret.addAll(FV(s.block))
        return ret
    }

    /** Return the set of free variables used in the given statement. */
    def dispatch Set<String> FV(IfS s) {
        val ret = new HashSet()
        ret.addAll(FV(s.bexp))
        ret.addAll(FV(s.s1))
        ret.addAll(FV(s.s2))
        return ret
    }

    /** Return the set of free variables used in the given statement. */
    def dispatch Set<String> FV(AssertS s) {
        val ret = new HashSet()
        ret.addAll(FV(s.bexp))
        return ret
    }
        
}