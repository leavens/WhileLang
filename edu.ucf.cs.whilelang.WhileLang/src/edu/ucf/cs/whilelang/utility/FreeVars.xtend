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
        return new HashSet()
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
        
}