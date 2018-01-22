package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.utility.LabelUtility
import edu.ucf.cs.whilelang.whileLang.Program
import java.util.HashSet
import org.eclipse.xtext.validation.Check
import edu.ucf.cs.whilelang.whileLang.AssignS
import org.eclipse.emf.ecore.EObject
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.WhileS
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.LabeledExp

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
                System.err.println("Error duplicate label " + label + " for " + ast.toString)
                error("duplicate label '" + label + "'", ast.eContainingFeature)
            } else {
                usedLabels.add(label)
            }
            // assert usedLabels.contains(label);     
            return label
        }
    }
	
	// Statements
	def dispatch checkLabel(AssignS a) {
	    a.label = checkTheLabel(a, a.label)
	}
	
	def dispatch checkLabel(SkipS s) {
        s.label = checkTheLabel(s, s.label)
    }
    
    def dispatch checkLabel(CompoundS c) {
        for (s : c.stmts) {
            checkLabel(s)
        }
    }
    
    def dispatch checkLabel(WhileS ws) {
        checkLabel(ws.bexp)
        checkLabel(ws.block)
    }	
    
    def dispatch checkLabel(IfS ifs) {
        checkLabel(ifs.bexp)
        checkLabel(ifs.s1)
        checkLabel(ifs.s2)
    } 
    
    // LabeledExp
    def dispatch checkLabel(LabeledExp le) {
        le.label = checkTheLabel(le,le.label)
    } 
}
