package edu.ucf.cs.whilelang.utility

import edu.ucf.cs.whilelang.whileLang.VarRefExpr
import java.util.HashSet
import edu.ucf.cs.whilelang.whileLang.NumLitExpr
import edu.ucf.cs.whilelang.whileLang.SignedNum
import edu.ucf.cs.whilelang.whileLang.BoolLitExpr
import edu.ucf.cs.whilelang.whileLang.NotExpr
import edu.ucf.cs.whilelang.whileLang.Expr
import edu.ucf.cs.whilelang.whileLang.BDisj
import edu.ucf.cs.whilelang.whileLang.BConj
import edu.ucf.cs.whilelang.whileLang.BRelExp
import edu.ucf.cs.whilelang.whileLang.Factor
import java.util.Set

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
        ret.addAll(FV(e.left))
        ret.addAll(FV(e.right))
        return ret
    }
    
    /** Return the left subexpression. */
    def Expr getLeft(Expr expr) {
        switch expr {
            case BDisj : expr.left
            case BConj : expr.left
            case BRelExp : expr.left
            case Factor : expr.left
            default : throw new RuntimeException("Missing case in getLeft for Expr")
        }
    }
    /** Return the right subexpression. */
    def Expr getRight(Expr expr) {
        switch expr {
            case BDisj : expr.right
            case BConj : expr.right
            case BRelExp : expr.right
            case Factor : expr.right
            default : throw new RuntimeException("Missing case in getRight for Expr")
        }
    }
    
}