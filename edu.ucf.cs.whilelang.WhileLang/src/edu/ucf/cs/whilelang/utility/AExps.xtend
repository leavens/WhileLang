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
import edu.ucf.cs.whilelang.generator.WhileLangUnparser

/** The Aexp method computes the set of non-trivial arithmetic expressions 
 * in a statement or expression.
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
        if (nonTrivialArithExp(e)) { ret.add(e) }
        ret.addAll(Aexp(e.leftSubExp))
        ret.addAll(Aexp(e.rightSubExp))
        return ret
    }
    
    /** Is the given expression an non-trivial arithmetic expression? */
    def dispatch boolean nonTrivialArithExp(BDisj expr) { false }
    /** Is the given expression an non-trivial arithmetic expression? */
    def dispatch boolean nonTrivialArithExp(BConj expr) { false }
    /** Is the given expression an non-trivial arithmetic expression? */
    def dispatch boolean nonTrivialArithExp(BRelExp expr) { false }
    /** Is the given expression an non-trivial arithmetic expression? */
    def dispatch boolean nonTrivialArithExp(AExpression expr) { true }
    /** Is the given expression an non-trivial arithmetic expression? */
    def dispatch boolean nonTrivialArithExp(Factor expr) { true }
    /** Is the given expression an non-trivial arithmetic expression? */
    def dispatch boolean nonTrivialArithExp(SignedNum expr) { true }
    /** Is the given expression an non-trivial arithmetic expression? */
    def dispatch boolean nonTrivialArithExp(Expr expr) { false }   
    
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
    
    /** Return a string represenation of the given set of expressions. */
    def String setOfExprToString(Set<Expr> st) {
        val WhileLangUnparser wlup = new WhileLangUnparser();
        val StringBuffer ret = new StringBuffer();
        ret.append("{");
        var sz = st.size();
        for (e: st) {
            ret.append(wlup.unparse(e));
            if (sz > 1) { ret.append(", "); }
            sz--;
        }
        ret.append("}");
        return ret.toString();
    }
}