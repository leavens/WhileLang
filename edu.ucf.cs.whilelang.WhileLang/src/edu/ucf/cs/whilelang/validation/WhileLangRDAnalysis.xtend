package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.S
import edu.ucf.cs.whilelang.utility.FunctionVector
import edu.ucf.cs.whilelang.utility.FVAsMap
import edu.ucf.cs.whilelang.utility.RDPropertySpace
import edu.ucf.cs.whilelang.utility.PropertyVector
import edu.ucf.cs.whilelang.utility.PVAsMap
import edu.ucf.cs.whilelang.utility.CFG
import java.util.HashMap
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.utility.AnalysisFun
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.utility.Access
import edu.ucf.cs.whilelang.whileLang.LabeledExp
import edu.ucf.cs.whilelang.utility.MaybeLabel
import edu.ucf.cs.whilelang.utility.Pair
import java.util.function.Predicate

/**
 * This class constructs the Reaching Definitions (RD) analysis for the given program.
 * See Sections 1.3 and 2.1.2 of "Principles of Program Analysis"
 * by Nielsen, Nielsen, and Hankin (Springer-Verlag, 1999 and 2005).
 */
class WhileLangRDAnalysis {
    
    /** The program's statement. */
    var S progBody;
     
    /** The Function Vector that represents the RD analysis for this program. */
    var FunctionVector<Integer, RDPropertySpace> RDFunVec; 
    /** The Property Vector that is the fixed point of the RD analysis 
     * for this program. */
    public var PropertyVector<Integer, RDPropertySpace> RDTuple;
     
    /** Initialize the function vector and property vector. */       
    def WhileLangRDAnalysis(Program p) {
        progBody = p.body
        val entryfuns = new HashMap<Integer, AnalysisFun<Integer, RDPropertySpace>>()
        val exitfuns = new HashMap<Integer, AnalysisFun<Integer, RDPropertySpace>>()
        for (lab : CFG.labels(progBody)) {
            val bl = CFG.itsBlockMap.get(lab)
            //entryfuns.put(lab, TODO)
        }
        RDFunVec = new FVAsMap<Integer, RDPropertySpace>(entryfuns, exitfuns)
    }
    
    def computeAnalysis() {
        RDTuple = RDFunVec.fix(CFG.labels(progBody), new PVAsMap<Integer, RDPropertySpace>())
    }
    
    def dispatch AnalysisFun<Integer, RDPropertySpace>
        exitFunFor(AssignS s) 
    {
        new AnalysisFun<Integer, RDPropertySpace>() 
        {
            override apply(PropertyVector<Integer, RDPropertySpace> arg) {
                    val entryInfo = arg.get(Access.ENTRY, s.label)
                    // subtract the kill info
                    entryInfo.removeIf(new Predicate<Pair<String, MaybeLabel>>() {
                            override boolean test(Pair<String, MaybeLabel> p) { 
                               p.key.equals(s.v);
                        }
                    })                     
                    return entryInfo  // TODO subtract kill and add gen
            }
        }
    }
 
    def dispatch AnalysisFun<Integer, RDPropertySpace>
        exitFunFor(SkipS s) 
    {
        new AnalysisFun<Integer, RDPropertySpace>() 
        {
            override apply(PropertyVector<Integer, RDPropertySpace> arg) {
                    return arg.get(Access.ENTRY, s.label)
            }
        }
    }

    def dispatch AnalysisFun<Integer, RDPropertySpace>
        exitFunFor(LabeledExp s) 
    {
        new AnalysisFun<Integer, RDPropertySpace>() 
        {
            override apply(PropertyVector<Integer, RDPropertySpace> arg) {
                    return arg.get(Access.ENTRY, s.label)
            }
        }
    }
   
}