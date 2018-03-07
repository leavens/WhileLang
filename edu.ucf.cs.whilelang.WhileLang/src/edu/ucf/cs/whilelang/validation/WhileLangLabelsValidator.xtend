package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.utility.LabelUtility
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.S
import java.util.HashSet
import org.eclipse.xtext.validation.Check
import edu.ucf.cs.whilelang.whileLang.AssertS
import edu.ucf.cs.whilelang.whileLang.AssignS
import org.eclipse.emf.ecore.EObject
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.WhileS
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.LabeledExp
import edu.ucf.cs.whilelang.generator.WhileLangUnparser
import edu.ucf.cs.whilelang.whileLang.WhileLangPackage.Literals

/**
 * This class checks that all labels in a program are unique, and adds labels
 * to each elementary block if they are not already given in the program.
 */
class WhileLangLabelsValidator extends AbstractWhileLangValidator {
	
	val usedLabels = new HashSet<Integer>()
	
	@Check
	def checkUniqueLabels(Program p) {
	    LabelUtility.reset()
		p.body.checkLabel
	}
	
	/** Check that the label, if given, is unique, or generate a unique label
	 * if it is not given explicitly.
	 * Ensures that the label is an element of usedLabels upon return
	 */
	def int checkTheLabel(EObject ast, int label) {
        if (label == 0) {
            var newLab = LabelUtility.nextLabel()
            while (usedLabels.contains(newLab)) {
                newLab = LabelUtility.nextLabel()
            }
            // assert !usedLabels.contains(newLab);
            usedLabels.add(newLab)
            // assert usedLabels.contains(newLab);
            return newLab
        } else {
            if (usedLabels.contains(label)) {
                val up = new WhileLangUnparser()
                System.err.println("Error duplicate label " + label + " for " + up.unparse(ast))
//                val feat = ast.eContainingFeature
//                // TODO: fix the following, it doesn't highlight properly
//                error("duplicate label '" + label + "'",
//                      if (ast instanceof AssignS) {
//                         Literals.ASSIGN_S__LABEL
//                      } else if (ast instanceof SkipS) {
//                         Literals.SKIP_S__LABEL
//                      } else if (ast instanceof LabeledExp) {
//                         Literals.LABELED_EXP__LABEL
//                      } else { feat }
//                     )
//                System.err.println("Finished with error report")
            } else {
                usedLabels.add(label)
            }
            // assert usedLabels.contains(label);     
            return label
        }
    }
	
	// Statements
	def dispatch void checkLabel(AssignS a) {
	    a.label = checkTheLabel(a, a.label)
	}
	
	def dispatch void checkLabel(SkipS s) {
        s.label = checkTheLabel(s, s.label)
    }
    
    def dispatch void checkLabel(CompoundS c) {
        for (s : c.stmts) {
            checkLabel(s)
        }
    }
    
    def dispatch void checkLabel(WhileS ws) {
        checkLabel(ws.bexp)
        checkLabel(ws.block)
    }	
    
    def dispatch void checkLabel(IfS ifs) {
        checkLabel(ifs.bexp)
        checkLabel(ifs.s1)
        checkLabel(ifs.s2)
    } 
    
    def dispatch void checkLabel(AssertS a) {
        checkLabel(a.bexp)
    }
  
    def dispatch void checkLabel(S s) {}
    
    // LabeledExp
    def dispatch void checkLabel(LabeledExp le) {
        le.label = checkTheLabel(le,le.label)
    } 
    
}
