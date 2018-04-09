package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.utility.AExps
import edu.ucf.cs.whilelang.utility.Access
import edu.ucf.cs.whilelang.utility.AnalysisFun
import edu.ucf.cs.whilelang.utility.CFG
import edu.ucf.cs.whilelang.utility.FVAsMap
import edu.ucf.cs.whilelang.utility.FreeVars
import edu.ucf.cs.whilelang.utility.FunctionVector
import edu.ucf.cs.whilelang.utility.PVAsMap
import edu.ucf.cs.whilelang.utility.PropertyVector
import edu.ucf.cs.whilelang.utility.VBPropertySpace
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock
import edu.ucf.cs.whilelang.whileLang.Expr
import edu.ucf.cs.whilelang.whileLang.LabeledExp
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.SkipS
import java.util.HashMap
import java.util.HashSet
import java.util.function.Predicate

import static extension edu.ucf.cs.whilelang.utility.ASTExtensions.*

/**
 * This class constructs the Very Busy Expressions (VB) analysis for the given program.
 * See Section 2.1.3 of "Principles of Program Analysis"
 * by Nielsen, Nielsen, and Hankin (Springer-Verlag, 1999 and 2005).
 */
class WhileLangVBAnalysis {
    
    /** This program's statement. */
    var Program theProg;
     
    /** The Function Vector that represents the VB analysis for this program. */
    var FunctionVector<Integer, VBPropertySpace> VBFunVec; 
    /** The Property Vector that is the fixed point of the VB analysis 
     * for this program. */
    public var PropertyVector<Integer, VBPropertySpace> VBInfo;
         
    /** Initialize the function vector and property vector. */       
    new (Program p) {
        theProg = p;
        val entryfuns = new HashMap<Integer, AnalysisFun<Integer, VBPropertySpace>>()
        val exitfuns = new HashMap<Integer, AnalysisFun<Integer, VBPropertySpace>>()
        for (lab : CFG.labels(p.body)) {
            val bl = CFG.itsBlockMap.get(lab)
            entryfuns.put(lab, entryFunFor(bl))
            exitfuns.put(lab, exitFunFor(bl))
        }
        VBFunVec = new FVAsMap<Integer, VBPropertySpace>(entryfuns, exitfuns)
    }
     
    /** Compute the Very Busy Expressions analysis (the VBInfo static field). */   
    def computeAnalysis() {
        val labels = CFG.labels(theProg.body)
        val botvec = new PVAsMap<Integer, VBPropertySpace>(labels, new VBPropertySpace())
        VBInfo = VBFunVec.fix(labels, botvec)
    }

    /** Return the entry function for the given elementary block argument. */
    def AnalysisFun<Integer, VBPropertySpace>
        exitFunFor(ElementaryBlock block) 
    {
        new AnalysisFun<Integer, VBPropertySpace>() 
        {
            override apply(PropertyVector<Integer, VBPropertySpace> arg) {
                if (CFG.finals(theProg.body).contains(block.itsLabel)) {
                    new VBPropertySpace(new HashSet<Expr>())
                } else {
                    var VBPropertySpace ret = new VBPropertySpace()
                    val vbInfoSet = new HashSet<VBPropertySpace>()
                    for (lab_pair : CFG.cfgMap.get(theProg.body)) {
                        if (lab_pair.key == block.itsLabel) {
                            vbInfoSet.add(arg.get(Access.ENTRY, lab_pair.value))
                        }
                    }
                    ret.joinAll(vbInfoSet)
                    return ret
                }
            }
        }
    }
    
    /** Return the entry function for the given elementary block argument. */
    def dispatch AnalysisFun<Integer, VBPropertySpace>
        entryFunFor(AssignS s) 
    {
        new AnalysisFun<Integer, VBPropertySpace>() 
        {
            override apply(PropertyVector<Integer, VBPropertySpace> arg) {
                    val exitInfo = arg.get(Access.EXIT, s.label)
                    // subtract the kill info
                    val ret = exitInfo.copy()
                    ret.removeIf(new Predicate<Expr>() 
                        {
                            override boolean test(Expr e) { 
                               new FreeVars().FV(e).contains(s.v);
                            }
                        })
                    // add the generated info
                    ret.addAll(new AExps().Aexp(s.aexp));                   
                    return ret;
            }
        }
    }
 
    /** Return the entry function for the given elementary block argument. */
    def dispatch AnalysisFun<Integer, VBPropertySpace>
        entryFunFor(SkipS s) 
    {
        new AnalysisFun<Integer, VBPropertySpace>() 
        {
            override apply(PropertyVector<Integer, VBPropertySpace> arg) {
                    return arg.get(Access.EXIT, s.label).copy()
            }
        }
    }

    /** Return the entry function for the given elementary block argument. */
    def dispatch AnalysisFun<Integer, VBPropertySpace>
        entryFunFor(LabeledExp le) 
    {
        new AnalysisFun<Integer, VBPropertySpace>() 
        {
            override apply(PropertyVector<Integer, VBPropertySpace> arg) {
                val VBPropertySpace exitInfo = arg.get(Access.EXIT, le.label);
                // make a copy of the exit info to prevent aliasing!
                val ret = exitInfo.copy();
                // add the generated info
                ret.addAll(new AExps().Aexp(le));                   
                return ret;
            }
        }
    }  
}