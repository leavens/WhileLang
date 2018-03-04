package edu.ucf.cs.whilelang.utility

import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.LabeledExp
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.Expr
import edu.ucf.cs.whilelang.whileLang.BDisj
import edu.ucf.cs.whilelang.whileLang.BConj
import edu.ucf.cs.whilelang.whileLang.BRelExp
import edu.ucf.cs.whilelang.whileLang.Factor
import edu.ucf.cs.whilelang.whileLang.AExpression

/** Functions defined on AST interface types: ElementaryBlock and Expr. 
 * For ElementaryBlocks this defines the extension function itsLabel(ElementaryBlock).
 * For Expr this defines the extension functions leftSubExp(Expr) and rightSubExp(Expr)*/
class ASTExtensions {

    /** Return the label of this elementary block. */         
    def static dispatch int itsLabel(AssignS s) {
        s.label
    }
    
    /** Return the label of this elementary block. */         
    def static dispatch int itsLabel(SkipS s){
        s.label
    }
    
    /** Return the label of this elementary block. */         
    def static dispatch int itsLabel(LabeledExp e) {
        e.label
    }
  
    
    /** Return the left subexpression. */
    def static dispatch Expr leftSubExp(BDisj e) {
        e.left
    }
    
    /** Return the left subexpression. */
    def static dispatch Expr leftSubExp(BConj e) {
        e.left
    }
    
    /** Return the left subexpression. */
    def static dispatch Expr leftSubExp(BRelExp e) {
        e.left
    }
    
    /** Return the left subexpression. */
    def static dispatch Expr leftSubExp(AExpression e) {
        e.left
    }
    
    /** Return the left subexpression. */
    def static dispatch Expr leftSubExp(Factor e) {
        e.left
    }
    
 
    /** Return the right subexpression. */
    def static dispatch Expr rightSubExp(BDisj e) {
        e.right
    }
    
    /** Return the right subexpression. */
    def static dispatch Expr rightSubExp(BConj e) {
        e.right
    }
    
    /** Return the right subexpression. */
    def static dispatch Expr rightSubExp(BRelExp e) {
        e.right
    }
    
    /** Return the right subexpression. */
    def static dispatch Expr rightSubExp(AExpression e) {
        e.right
    }
    
    /** Return the right subexpression. */
    def static dispatch Expr rightSubExp(Factor e) {
        e.right
    }
}