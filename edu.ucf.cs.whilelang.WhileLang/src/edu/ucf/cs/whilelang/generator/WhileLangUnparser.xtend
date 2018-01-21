package edu.ucf.cs.whilelang.generator

import edu.ucf.cs.whilelang.whileLang.AExpression
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.BConj
import edu.ucf.cs.whilelang.whileLang.BDisj
import edu.ucf.cs.whilelang.whileLang.BRelExp
import edu.ucf.cs.whilelang.whileLang.BoolLitExpr
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.Factor
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.NotExpr
import edu.ucf.cs.whilelang.whileLang.NumLitExpr
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.VarRefExpr
import edu.ucf.cs.whilelang.whileLang.WhileS

/**
 * Produces unparsed version of the While program
 */
class WhileLangUnparser {
     
    def dispatch String unparse(AssignS s) {
        '''«s.v»''' + " := " + '''«s.aexp.unparse»''' 	
    }
	
	def dispatch String unparse(CompoundS c) {
        val ret = 
        '''
        {
        «FOR s : c.stmts»
            «s.unparse» ;
        «ENDFOR»
        }
        '''
        return ret.substring(0,ret.length()-2) // take out the last semicolon
    }

    def dispatch String unparse(SkipS s) {
        '''
        skip
        '''
    }

    def dispatch String unparse(WhileS w) {
        '''
        while («w.bexp.unparse») 
        «w.block.unparse»
        '''
    }
    
    def dispatch String unparse(IfS i) {
        '''
        if «i.bexp.unparse» 
            «i.s1.unparse»
        } else {
            «i.s2.unparse»
        }
        '''
    }
             
    def dispatch String unparse(BDisj be) {
        '''(«be.left» || «be.right»)'''
    }
    
    def dispatch String unparse(BConj be) {
        '''(«be.left» && «be.right»)'''
    }
    
    def dispatch String unparse(BRelExp be) {
        '''(«be.left» «be.op» «be.right»)'''
    }

    def dispatch String unparse(AExpression ae) {
        '''(«ae.left» «ae.op» «ae.right»)'''
    }

    def dispatch String unparse(Factor ae) {
        '''(«ae.left» «ae.op» «ae.right»)'''
    }

    def dispatch String unparse(VarRefExpr vre) {
        vre.vname
    }
    
    def dispatch String unparse(NumLitExpr nl) {
        (if (nl.negated) "-" else "") + nl.num.toString()
    }
    
    def dispatch String unparse(BoolLitExpr bl) {
        bl.bval
    }
    
    def dispatch String unparse(NotExpr ne) {
        '''!(«ne.bexp.unparse»)'''
    }
    
}