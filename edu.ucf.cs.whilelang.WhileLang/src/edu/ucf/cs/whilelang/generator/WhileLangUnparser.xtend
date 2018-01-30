package edu.ucf.cs.whilelang.generator

import edu.ucf.cs.whilelang.whileLang.AExpression
import edu.ucf.cs.whilelang.whileLang.AssertS
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.BConj
import edu.ucf.cs.whilelang.whileLang.BDisj
import edu.ucf.cs.whilelang.whileLang.BRelExp
import edu.ucf.cs.whilelang.whileLang.BoolLitExpr
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.Factor
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.LabeledExp
import edu.ucf.cs.whilelang.whileLang.NotExpr
import edu.ucf.cs.whilelang.whileLang.NumLitExpr
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.VarRefExpr
import edu.ucf.cs.whilelang.whileLang.WhileS
import edu.ucf.cs.whilelang.whileLang.SignedNum

/**
 * Produces unparsed version of the While program
 */
class WhileLangUnparser {
    
    // Statements
    def dispatch String unparse(AssignS s) {
        '''[«s.v»''' + " := " + '''«s.aexp.unparse»]^«s.label.toString»''' 	
    }
	
	def dispatch String unparse(CompoundS c) {
        '''
        {
            «FOR s : c.stmts SEPARATOR ';'»
                «s.unparse»
            «ENDFOR»
        }
        '''
    }

    def dispatch String unparse(SkipS s) {
        '''[skip]^«s.label.toString»'''
    }

    def dispatch String unparse(WhileS w) {
        '''
        while «w.bexp.unparse» 
        do «w.block.unparse»
        '''
    }
    
    def dispatch String unparse(IfS i) {
        '''
        if «i.bexp.unparse» 
        then «i.s1.unparse»
        else «i.s2.unparse»
        '''
    }
 
    def dispatch String unparse(AssertS a) {
        '''assert «a.bexp.unparse»'''
    }
       
    // LabeledExp
    def dispatch String unparse(LabeledExp le) {
        '''[«le.be.unparse»]^«le.label.toString»'''
    }
    
    // Expressions         
    def dispatch String unparse(BDisj be) {
        '''(«be.left.unparse» || «be.right.unparse»)'''
    }
    
    def dispatch String unparse(BConj be) {
        '''(«be.left.unparse» && «be.right.unparse»)'''
    }
    
    def dispatch String unparse(BRelExp be) {
        '''(«be.left.unparse»«be.op»«be.right.unparse»)'''
    }

    def dispatch String unparse(AExpression ae) {
        '''(«ae.left.unparse»«ae.op»«ae.right.unparse»)'''
    }

    def dispatch String unparse(Factor ae) {
        '''(«ae.left.unparse»«ae.op»«ae.right.unparse»)'''
    }

    def dispatch String unparse(VarRefExpr vre) {
        vre.vname
    }
    
    def dispatch String unparse(SignedNum sn) {
        '''«sn.sign»(«sn.nval.unparse»)'''
    }
    
    def dispatch String unparse(NumLitExpr nl) {
        nl.num.toString()
    }
    
    def dispatch String unparse(BoolLitExpr bl) {
        bl.bval
    }
    
    def dispatch String unparse(NotExpr ne) {
        '''not («ne.bexp.unparse»)'''
    }
    
}