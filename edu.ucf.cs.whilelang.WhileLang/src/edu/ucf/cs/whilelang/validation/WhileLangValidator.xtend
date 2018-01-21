package edu.ucf.cs.whilelang.validation

import org.eclipse.xtext.validation.Check
import edu.ucf.cs.whilelang.whileLang.Program


public class WhileLangValidator extends AbstractWhileLangValidator {
	@Check
	def checkStaticConstraints(Program p) {
		new WhileLangLabelsValidator().checkUniqueLabels(p)
	}

}
