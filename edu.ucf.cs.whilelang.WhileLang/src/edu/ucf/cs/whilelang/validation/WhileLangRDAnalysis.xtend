package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.utility.Access
import edu.ucf.cs.whilelang.utility.AnalysisFun
import edu.ucf.cs.whilelang.utility.CFG
import edu.ucf.cs.whilelang.utility.FVAsMap
import edu.ucf.cs.whilelang.utility.FreeVars
import edu.ucf.cs.whilelang.utility.FunctionVector
import edu.ucf.cs.whilelang.utility.MaybeLabel
import edu.ucf.cs.whilelang.utility.PVAsMap
import edu.ucf.cs.whilelang.utility.Pair
import edu.ucf.cs.whilelang.utility.PropertyVector
import edu.ucf.cs.whilelang.utility.RDPropertySpace
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock
import edu.ucf.cs.whilelang.whileLang.LabeledExp
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.S
import edu.ucf.cs.whilelang.whileLang.SkipS
import java.util.HashMap
import java.util.HashSet
import java.util.function.Predicate

import static extension edu.ucf.cs.whilelang.utility.ASTExtensions.*
import java.util.Set

/**
 * This class constructs the Reaching Definitions (RD) analysis for the given program.
 * See Sections 1.3 and 2.1.2 of "Principles of Program Analysis"
 * by Nielsen, Nielsen, and Hankin (Springer-Verlag, 1999 and 2005).
 */
class WhileLangRDAnalysis {
    
    /** This program's statement. */
    var S progBody;
    val fvars = new FreeVars()
     
    /** The Function Vector that represents the RD analysis for this program. */
    var FunctionVector<Integer, RDPropertySpace> RDFunVec; 
    /** The Property Vector that is the fixed point of the RD analysis 
     * for this program. */
    public var PropertyVector<Integer, RDPropertySpace> RDInfo;
         
    /** Initialize the function vector and property vector. */       
    new (Program p) {
        progBody = p.body
        val entryfuns = new HashMap<Integer, AnalysisFun<Integer, RDPropertySpace>>()
        val exitfuns = new HashMap<Integer, AnalysisFun<Integer, RDPropertySpace>>()
        for (lab : CFG.labels(progBody)) {
            val bl = CFG.itsBlockMap.get(lab)
            entryfuns.put(lab, entryFunFor(bl))
            exitfuns.put(lab, exitFunFor(bl))
        }
        RDFunVec = new FVAsMap<Integer, RDPropertySpace>(entryfuns, exitfuns)
    }
        
    def computeAnalysis() {
        val labels = CFG.labels(progBody)
        val botvec = new PVAsMap<Integer, RDPropertySpace>(labels, new RDPropertySpace())
        RDInfo = RDFunVec.fix(labels, botvec)
    }

    /** Return the exit function for the given elementary block argument. */
    def AnalysisFun<Integer, RDPropertySpace>
        entryFunFor(ElementaryBlock block) 
    {
        new AnalysisFun<Integer, RDPropertySpace>() 
        {
            override apply(PropertyVector<Integer, RDPropertySpace> arg) {
                if (CFG.init(progBody) == block.itsLabel) {
                    new RDPropertySpace(fvars.FV(progBody), new MaybeLabel())
                } else {
                    var RDPropertySpace ret = new RDPropertySpace()
                    val pairsets = new HashSet()
                    for (lab_pair : CFG.cfgMap.get(progBody)) {
                        if (lab_pair.value == block.itsLabel) {
                            pairsets.add(arg.get(Access.EXIT, lab_pair.key))
                        }
                    }
                    ret.joinAll(pairsets)
                    return ret
                }
            }
        }
    }
    
    /** Return the exit function for the given elementary block argument. */
    def dispatch AnalysisFun<Integer, RDPropertySpace>
        exitFunFor(AssignS s) 
    {
        new AnalysisFun<Integer, RDPropertySpace>() 
        {
            override apply(PropertyVector<Integer, RDPropertySpace> arg) {
                    val entryInfo = arg.get(Access.ENTRY, s.label)
                    // subtract the kill info
                    val ret = entryInfo.copy() as RDPropertySpace
                    ret.removeIf(new Predicate<Pair<String, MaybeLabel>>() 
                        {
                            override boolean test(Pair<String, MaybeLabel> p) { 
                               p.key.equals(s.v);
                            }
                        })
                    // add the generated info
                    ret.join(new RDPropertySpace(s.v, new MaybeLabel(s.label)));                   
                    return ret;
            }
        }
    }
 
    /** Return the exit function for the given elementary block argument. */
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

    /** Return the exit function for the given elementary block argument. */
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