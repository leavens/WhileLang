package edu.ucf.cs.whilelang.validation

import org.eclipse.xtext.validation.Check
import edu.ucf.cs.whilelang.whileLang.Program

/**
 * This class combines all the custom validations for the While language. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
public class WhileLangValidator extends AbstractWhileLangValidator {
    
	@Check
	def checkStaticConstraints(Program p) {
	    new WhileLangProcArgsValidator().checkUniqueFormals(p)
		new WhileLangLabelsValidator().checkUniqueLabels(p)
		new WhileLangCFGValidator().constructCFG(p)
		new WhileLangAssignedBeforeUseValidator().checkAssignedBeforeUse(p)
		new WhileLangNoRepeatedVBExpValidator().checkNoRepeatedVBExps(p)
	}

}
