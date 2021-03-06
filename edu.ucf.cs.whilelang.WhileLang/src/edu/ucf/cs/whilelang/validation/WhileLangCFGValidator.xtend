package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.utility.CFG
import edu.ucf.cs.whilelang.utility.FlowGraph
import edu.ucf.cs.whilelang.utility.Pair
import edu.ucf.cs.whilelang.utility.SetRepUtility
import edu.ucf.cs.whilelang.whileLang.AssertS
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.WhileS
import java.util.Map
import org.eclipse.xtext.validation.Check
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock

/**
 * This class constructs a control flow graph (CFG) for the program.
 * See Section 2.1 of "Principles of Program Analysis"
 * by Nielsen, Nielsen, and Hankin (Springer-Verlag, 1999 and 2005).
 */
class WhileLangCFGValidator extends AbstractWhileLangValidator {
    
    /** What is the ElementaryBlock with the given label? */
    val static Map<Integer, ElementaryBlock> itsBlockMap = CFG.itsBlockMap
    /** What is the set of flows within each statement? */
    val static FlowGraph cfgMap = CFG.cfgMap
    
	/** Construct the CFG for the given program. 
	 * Assumes that the labels have already been added to the program. */	
	@Check
	def constructCFG(Program p) {
	    resetMaps()
		p.body.constructIBM
		p.body.constructFlows
	}
		
	/** Constructs the itsBlockMap mapping 
	 * where the given statement refers to the enclosing block. */
	def dispatch void constructIBM(AssignS a) {
	    itsBlockMap.put(a.label, a)
	}
	
    /** Constructs the itsBlockMap mapping 
     * where the given statement refers to the enclosing block. */
	def dispatch void constructIBM(SkipS s) {
        itsBlockMap.put(s.label, s)
    }
    
    /** Constructs the itsBlockMap mapping 
     * where the given statement refers to the enclosing block. */
    def dispatch void constructIBM(CompoundS c) {
        for (s : c.stmts) {
            s.constructIBM
        }
    }
    
    /** Constructs the itsBlockMap mapping 
     * where the given statement refers to the enclosing block. */
    def dispatch void constructIBM(WhileS ws) {
        itsBlockMap.put(ws.bexp.label, ws.bexp)
        ws.block.constructIBM
    }	
    
    /** Constructs the itsBlockMap mapping 
     * where the given statement refers to the enclosing block. */
    def dispatch void constructIBM(IfS ifs) {
        itsBlockMap.put(ifs.bexp.label, ifs.bexp)
        ifs.s1.constructIBM
        ifs.s2.constructIBM
    } 
    
    /** Constructs the itsBlockMap mapping for this assert statement. */
    def dispatch void constructIBM(AssertS a) {
        itsBlockMap.put(a.bexp.label, a.bexp)
    }
        
    /** Constructs the cfgMap mapping 
     * where the given statement maps to all of the flows within it. */
    def dispatch void constructFlows(AssignS a) {
        cfgMap.putUnion(a, new SetRepUtility<Map.Entry<Integer,Integer>>())
    }
    
    /** Constructs the cfgMap mapping 
     * where the given statement maps to all of the flows within it. */
    def dispatch void constructFlows(SkipS s) {
        cfgMap.putUnion(s, new SetRepUtility<Map.Entry<Integer,Integer>>())      
    }
    
    /** Constructs the cfgMap mapping 
     * where the given statement maps to all of the flows within it. */
    def dispatch void constructFlows(CompoundS c) {
        // recursively treat each sub-statement
        for (i : 0..c.stmts.size()-1) {
            c.stmts.get(i).constructFlows
        }
        // the flows of each sub-statement are in the flows of c
        for (i : 0..c.stmts.size()-1) {
            cfgMap.putUnion(c, cfgMap.get(c.stmts.get(i)))
        }
        // the flows of c also contain a flow from each statement to the next
        for (i : 0..<c.stmts.size()-1) {
            for (j : CFG.finals(c.stmts.get(i))) {
                    cfgMap.putUnion(c, 
                        new SetRepUtility<Map.Entry<Integer,Integer>>(
                            new Pair<Integer,Integer>(j, CFG.init(c.stmts.get(i+1)))
                        ))
            }
        }
    }
            
    /** Constructs the cfgMap mapping 
     * where the given statement maps to all of the flows within it. */
    def dispatch void constructFlows(WhileS c) {
        // construct the flows of the body
        c.block.constructFlows
        cfgMap.putUnion(c, cfgMap.get(c.block))
        cfgMap.putUnion(c, new SetRepUtility(new Pair<Integer,Integer>(c.bexp.label, CFG.init(c.block))))
        for (j : CFG.finals(c.block)) {
                cfgMap.putUnion(c, new SetRepUtility<Map.Entry<Integer,Integer>>(
                    new Pair<Integer,Integer>(j, c.bexp.label)
                ))
        }
    }   
    
    /** Constructs the cfgMap mapping 
     * where the given statement maps to all of the flows within it. */
    def dispatch void constructFlows(IfS ifs) {
        // construct the flows of the two sub-statements
        ifs.s1.constructFlows
        ifs.s2.constructFlows
        // add in all those flows
        cfgMap.putUnion(ifs, cfgMap.get(ifs.s1))
        cfgMap.putUnion(ifs, cfgMap.get(ifs.s2))
        // add flows from the test to the init of each sub-statement
        cfgMap.putUnion(ifs, new SetRepUtility<Map.Entry<Integer,Integer>>(
                    new Pair<Integer,Integer>(ifs.bexp.label, CFG.init(ifs.s1))
                ))
        cfgMap.putUnion(ifs, new SetRepUtility<Map.Entry<Integer,Integer>>(
                    new Pair<Integer,Integer>(ifs.bexp.label, CFG.init(ifs.s2))
                ))
    }
    
    def dispatch void constructFlows(AssertS a) {
        cfgMap.putUnion(a, new SetRepUtility<Map.Entry<Integer,Integer>>())
    }

    /** initialize the global static maps */
    def resetMaps() {
        itsBlockMap.clear()
        cfgMap.clear()
    }  
}
