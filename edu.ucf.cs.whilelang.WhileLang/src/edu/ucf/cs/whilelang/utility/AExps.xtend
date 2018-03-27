package edu.ucf.cs.whilelang.utility

import edu.ucf.cs.whilelang.whileLang.AExpression
import edu.ucf.cs.whilelang.whileLang.AssertS
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.BConj
import edu.ucf.cs.whilelang.whileLang.BDisj
import edu.ucf.cs.whilelang.whileLang.BRelExp
import edu.ucf.cs.whilelang.whileLang.BoolLitExpr
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.Expr
import edu.ucf.cs.whilelang.whileLang.Factor
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.LabeledExp
import edu.ucf.cs.whilelang.whileLang.NotExpr
import edu.ucf.cs.whilelang.whileLang.NumLitExpr
import edu.ucf.cs.whilelang.whileLang.SignedNum
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.VarRefExpr
import edu.ucf.cs.whilelang.whileLang.WhileS
import java.util.HashSet
import java.util.Set

import static extension edu.ucf.cs.whilelang.utility.ASTExtensions.*

/** The Aexp method computes the set of non-trivial arithmetic expressions 
 * in a statement.
 */
class AExps {
    /** Return the set of non-trivial arithmetic expressions in the given expression. */
    def dispatch Set<Expr> Aexp(VarRefExpr v) {
        return new HashSet()
    }
    
    /** Return the set of non-trivial arithmetic expressions in the given expression. */
    def dispatch Set<Expr> Aexp(NumLitExpr n) {
        return new HashSet()
    }
    
    /** Return the set of non-trivial arithmetic expressions in the given expression. */
    def dispatch Set<Expr> Aexp(SignedNum n) {
        val ret = new HashSet()
        ret.add(n)
        ret.addAll(Aexp(n.nval))
        return ret
    }
    
    /** Return the set of non-trivial arithmetic expressions in the given expression. */
    def dispatch Set<Expr> Aexp(BoolLitExpr b) {
        return new HashSet()
    }
    
    /** Return the set of non-trivial arithmetic expressions in the given expression. */
    def dispatch Set<Expr> Aexp(NotExpr n) {
        return Aexp(n.bexp)
    }
    
    /** Return the set of non-trivial arithmetic expressions in the given expression. */
    def dispatch Set<Expr> Aexp(Expr e) {
        val ret = new HashSet()
        if (nonTrivalArithExp(e)) { ret.add(e) }
        ret.addAll(Aexp(e.leftSubExp))
        ret.addAll(Aexp(e.rightSubExp))
        return ret
    }
    
    def dispatch boolean nonTrivalArithExp(BDisj expr) { false }
    def dispatch boolean nonTrivalArithExp(BConj expr) { false }
    def dispatch boolean nonTrivalArithExp(BRelExp expr) { false }
    def dispatch boolean nonTrivalArithExp(AExpression expr) { true }
    def dispatch boolean nonTrivalArithExp(Factor expr) { true }
    def dispatch boolean nonTrivalArithExp(Expr expr) { false }   
    
    /** Return the set of non-trivial arithmetic expressions in the given labeled expression. */
    def dispatch Set<Expr> Aexp(LabeledExp labe) {
        return Aexp(labe.be)
    }
    
    /** Return the set of non-trivial arithmetic expressions in the given statement. */
    def dispatch Set<Expr> Aexp(AssignS s) {
        val ret = new HashSet()
        ret.addAll(Aexp(s.aexp))
        return ret
    }

    /** Return the set of non-trivial arithmetic expressions in the given statement. */
    def dispatch Set<Expr> Aexp(SkipS s) {
        return new HashSet()
    }
    
    /** Return the set of non-trivial arithmetic expressions in the given statement. */
    def dispatch Set<Expr> Aexp(CompoundS blk) {
        val ret = new HashSet()
        for (s : blk.stmts) {
            ret.addAll(Aexp(s))
        }
        return ret
    }
    
    /** Return the set of non-trivial arithmetic expressions in the given statement. */
    def dispatch Set<Expr> Aexp(WhileS s) {
        val ret = new HashSet()
        ret.addAll(Aexp(s.bexp))
        ret.addAll(Aexp(s.block))
        return ret
    }

    /** Return the set of non-trivial arithmetic expressions in the given statement. */
    def dispatch Set<Expr> Aexp(IfS s) {
        val ret = new HashSet()
        ret.addAll(Aexp(s.bexp))
        ret.addAll(Aexp(s.s1))
        ret.addAll(Aexp(s.s2))
        return ret
    }

    /** Return the set of non-trivial arithmetic expressions in the given statement. */
    def dispatch Set<Expr> Aexp(AssertS s) {
        val ret = new HashSet()
        ret.addAll(Aexp(s.bexp))
        return ret
    }    
}