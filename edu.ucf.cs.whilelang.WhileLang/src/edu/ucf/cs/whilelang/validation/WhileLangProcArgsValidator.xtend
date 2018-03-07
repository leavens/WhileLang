package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.whileLang.Formals
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.WhileLangPackage.Literals
import java.util.HashSet
import org.eclipse.emf.common.util.EList
import org.eclipse.xtext.validation.Check
import java.util.List
import java.util.ArrayList

/** Validates the uniqueness of names in the list of a proc's formals. */
class WhileLangProcArgsValidator extends AbstractWhileLangValidator {
    
    public static val ISSUE_CODE_PREFIX = "edu.ucf.cs.whilelang."
    
    public static val DUPLICATE_FORMAL = ISSUE_CODE_PREFIX + "DuplicateFormal"
    
    /** Check that the names in program's formals are all unique. */
    @Check    
    def checkUniqueFormals(Program p) {
        val checked = new HashSet<String>()
        val List<String> allNames = new ArrayList<String>()
        if (p.vformals !== null) { allNames.addAll(p.vformals.names) }
        if (p.rformals !== null) { allNames.addAll(p.rformals.names) }
        for (v : allNames) {
            if (!checked.add(v)) {
                System.err.println("duplicate formal '" + v + "'")
                val feat = p.vformals.eContainingFeature
                // TODO: fix the following, it doesn't highlight properly
                error("duplicate formal '" + v + "'",
                      if (p.vformals instanceof Formals) {
                         Literals.PROGRAM__VFORMALS
                      } else { feat }
                     )
                // System.err.println("Finished with error report")
            }
        }
    }   
}