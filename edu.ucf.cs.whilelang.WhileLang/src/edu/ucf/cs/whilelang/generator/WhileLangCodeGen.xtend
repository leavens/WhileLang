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
import edu.ucf.cs.whilelang.whileLang.Program

/**
 * produces Java output to run the program.
 */
class WhileLangCodeGen {
    
    /** Translate the given program to Java. */
    def dispatch String toJava(Program p) {
        '''
        // generated code
        public class «p.name» {
            public static void main(String[] args) {
                «IF p.vformals !== null»
                if (args.length != «p.vformals.names.size()») {
                    System.err.println("«p.name» expects «p.vformals.names.size()» arguments");
                    System.exit(1);
                }
                int «FOR f : p.vformals.names SEPARATOR ','»«f»«ENDFOR»;
                «FOR i : 0..p.vformals.names.size()-1»
                «p.vformals.names.get(i)» = Integer.valueOf(args[«i»]);
                «ENDFOR»
                System.out.print("input:");
                «FOR f : p.vformals.names»
                System.out.print(" «f» = " + «f»);
                «ENDFOR»
                System.out.println();
                «ENDIF»
                // the body of «p.name» follows
                «toJava(p.body)»
                «IF p.rformals !== null»
                System.out.print("results:");
                «FOR f : p.rformals.names»
                System.out.print(" «f» = " + «f»);
                «ENDFOR»
                System.out.println();
                «ENDIF»
            }
        }
        '''   
    }    
 
    // Statements
    /** Translate the given statement to Java. */
    def dispatch String toJava(AssignS a) {
        '''
        «a.v» = «a.aexp.toJava»; /*«a.label.toString»*/
        '''
    }
  	
    /** Translate the given statement to Java. */
	def dispatch String toJava(CompoundS c) {
		'''
		{
		    «FOR s : c.stmts»
		      «s.toJava»
		    «ENDFOR»
		}
		'''
	}

    /** Translate the given statement to Java. */
    def dispatch String toJava(SkipS s) {
        '''
        /*«s.label.toString»*/;
        '''
    }

    /** Translate the given statement to Java. */
    def dispatch String toJava(WhileS w) {
        '''
        while («w.bexp.toJava») 
            «w.block.toJava»
        '''
    }
    
    /** Translate the given statement to Java. */
    def dispatch String toJava(IfS i) {
    	'''
    	if («i.bexp.toJava») {
    		«i.s1.toJava»
    	} else {
    		«i.s2.toJava»
    	}
    	'''
    }
    
    /** Translate the given statement to Java. */
    def dispatch String toJava(AssertS a) {
        '''assert «a.bexp.toJava»;'''
    }
    
    // LabeledExp
    /** Translate the given labeled expression to Java. */
    def dispatch String toJava(LabeledExp le) {
        '''«le.be.toJava»/*^«le.label.toString»*/'''
    }
    
    // Expressions     
    /** Translate the given expression to Java. */
    def dispatch String toJava(BDisj be) {
        '''(«be.left.toJava» || «be.right.toJava»)'''
    }
    
    /** Translate the given expression to Java. */
    def dispatch String toJava(BConj be) {
        '''(«be.left.toJava» && «be.right.toJava»)'''
    }
    
    /** Translate the given expression to Java. */
    def dispatch String toJava(BRelExp be) {
        '''(«be.left.toJava»«be.op»«be.right.toJava»)'''
    }

    /** Translate the given expression to Java. */
    def dispatch String toJava(AExpression ae) {
        '''(«ae.left.toJava»«ae.op»«ae.right.toJava»)'''
    }

    /** Translate the given expression to Java. */
    def dispatch String toJava(Factor ae) {
        '''(«ae.left.toJava»«ae.op»«ae.right.toJava»)'''
    }

    /** Translate the given expression to Java. */
    def dispatch String toJava(VarRefExpr vre) {
        vre.vname
    }

    /** Translate the given expression to Java. */
    def dispatch String toJava(SignedNum sn) {
        '''«sn.sign»(«sn.nval.toJava»)'''
    }
   
    /** Translate the given expression to Java. */
    def dispatch String toJava(NumLitExpr nl) {
        nl.num.toString()
    }
    
    /** Translate the given expression to Java. */
    def dispatch String toJava(BoolLitExpr bl) {
        bl.bval
    }
    
    /** Translate the given expression to Java. */
    def dispatch String toJava(NotExpr ne) {
        '''!(«ne.bexp.toJava»)'''
    }
}