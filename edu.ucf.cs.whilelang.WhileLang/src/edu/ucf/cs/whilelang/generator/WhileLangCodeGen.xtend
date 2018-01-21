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
 * produces Java output to run the program.
 */
class WhileLangCodeGen {
 
    // Statements
    def dispatch String toJava(AssignS a) {
        '''
        «a.v» = «a.aexp.toJava»;
        '''
    }
  	
	def dispatch String toJava(CompoundS c) {
		'''
		{
		    «FOR s : c.stmts»
		      «s.toJava»
		    «ENDFOR»
		}
		'''
	}

    def dispatch String toJava(SkipS s) {
        '''
        ;
        '''
    }

    def dispatch String toJava(WhileS w) {
        '''
        while («w.bexp.toJava») 
            «w.block.toJava»
        '''
    }
    
    def dispatch String toJava(IfS i) {
    	'''
    	if («i.bexp.toJava») {
    		«i.s1.toJava»
    	} else {
    		«i.s2.toJava»
    	}
    	'''
    }
    
    // Expressions     
    def dispatch String toJava(BDisj be) {
        '''(«be.left.toJava» || «be.right.toJava»)'''
    }
    
    def dispatch String toJava(BConj be) {
        '''(«be.left.toJava» && «be.right.toJava»)'''
    }
    
    def dispatch String toJava(BRelExp be) {
        '''(«be.left.toJava» «be.op» «be.right.toJava»)'''
    }

    def dispatch String toJava(AExpression ae) {
        '''(«ae.left.toJava» «ae.op» «ae.right.toJava»)'''
    }

    def dispatch String toJava(Factor ae) {
        '''(«ae.left.toJava» «ae.op» «ae.right.toJava»)'''
    }

    def dispatch String toJava(VarRefExpr vre) {
        vre.vname
    }
    
    def dispatch String toJava(NumLitExpr nl) {
        (if (nl.negated) "-" else "") + nl.num.toString()
    }
    
    def dispatch String toJava(BoolLitExpr bl) {
        bl.bval
    }
    
    def dispatch String toJava(NotExpr ne) {
        '''!(«ne.bexp.toJava»)'''
    }

}