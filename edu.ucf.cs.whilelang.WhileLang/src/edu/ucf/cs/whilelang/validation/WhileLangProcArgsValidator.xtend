package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.whileLang.Formals
import edu.ucf.cs.whilelang.whileLang.WhileLangPackage.Literals
import java.util.HashSet
import org.eclipse.xtext.validation.Check

/** Validates the uniqueness of names in the list of a proc's formals. */
class WhileLangProcArgsValidator extends AbstractWhileLangValidator {
    
    public static val ISSUE_CODE_PREFIX = "edu.ucf.cs.whilelang."
    
    public static val DUPLICATE_FORMAL = ISSUE_CODE_PREFIX + "DuplicateFormal"
    
    /** Check that the names in formals are all unique. */
    @Check    
    def checkUniqueNames(Formals formals) {
        val checked = new HashSet<String>()
        for (e: formals.names) {
            if (!checked.add(e)) {
                System.err.println("duplicate formal '" + e + "'")
                val feat = formals.eContainingFeature
                // TODO: fix the following, it doesn't highlight properly
                error("duplicate formal '" + e + "'",
                      if (formals instanceof Formals) {
                         Literals.FORMALS__NAMES
                      } else { feat }
                     )
                // System.err.println("Finished with error report")
            }
        }
    }   
}