package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.utility.CFG
import edu.ucf.cs.whilelang.utility.FlowGraph
import edu.ucf.cs.whilelang.utility.Pair
import edu.ucf.cs.whilelang.utility.SetRepUtility
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.LabeledExp
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.WhileS
import java.util.HashMap
import java.util.Map
import org.eclipse.xtext.validation.Check

/**
 * This class checks constructs a control flow graph (CFG) for the program.
 * See Section 2.1 of "Principles of Program Analysis"
 * by Nielsen, Nielsen, and Hankin (Springer-Verlag, 1999 and 2005).
 */
class WhileLangCFGValidator extends AbstractWhileLangValidator {
    
    /** What is the ElementaryBlock labeled by this key? */
    public static val Map<Integer, ElementaryBlock> itsBlockMap = new HashMap<Integer, ElementaryBlock>()
    /** What is the set of flows within each statement? */
    public static val FlowGraph cfgMap = new FlowGraph()
		
	@Check
	def constructCFG(Program p) {
		p.body.constructIBM
		p.body.constructFlows
	}
		
	// Statements
	def dispatch void constructIBM(AssignS a) {
	    itsBlockMap.put(a.label, a as ElementaryBlock)
	}
	
	def dispatch void constructIBM(SkipS s) {
        itsBlockMap.put(s.label, s as ElementaryBlock)
    }
    
    def dispatch void constructIBM(CompoundS c) {
        for (s : c.stmts) {
            s.constructIBM
        }
    }
    
    def dispatch void constructIBM(WhileS ws) {
        itsBlockMap.put(ws.bexp.label, ws.bexp as ElementaryBlock)
        ws.block.constructIBM
    }	
    
    def dispatch void constructIBM(IfS ifs) {
        itsBlockMap.put(ifs.bexp.label, ifs.bexp as ElementaryBlock)
        ifs.s1.constructIBM
        ifs.s2.constructIBM
    } 
        
    // flows
    def dispatch void constructFlows(AssignS a) {}
    
    def dispatch void constructFlows(SkipS s) {}
    
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
        for (i : 0..c.stmts.size()-2) {
            for (j : CFG.finals(c.stmts.get(i))) {
                    cfgMap.putUnion(c, 
                        new SetRepUtility<Map.Entry<Integer,Integer>>(
                            new Pair<Integer,Integer>(j, CFG.init(c.stmts.get(i+1)))
                        ))
            }
        }
    }
            
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

    /** initialize the global static maps */
    def resetMaps() {
        itsBlockMap.clear()
        cfgMap.clear()
    }    

    // the following are needed so that ElementaryBlocks can be hashed...
    /** Are these Assignment Statements equal? */
    def dispatch equals(AssignS s, Object oth) {
        if (oth === null || !(oth instanceof ElementaryBlock)) { return false }
        val ElementaryBlock b = oth as ElementaryBlock;
        return s.toString().equals(b.toString());
    }
    /** Are these Skip statements equal? */
    def dispatch equals(SkipS s, Object oth) {
        if (oth === null || !(oth instanceof ElementaryBlock)) { return false }
        val ElementaryBlock b = oth as ElementaryBlock;
        return s.toString().equals(b.toString());
    }
    /** Are these LabeledExps equal? */
    def dispatch equals(LabeledExp s, Object oth) {
        if (oth === null || !(oth instanceof ElementaryBlock)) { return false }
        val ElementaryBlock b = oth as ElementaryBlock;
        return s.toString().equals(b.toString());
    }

    /** Return the hash code for this AssignS. */
    def dispatch int hashCode(AssignS b) {
        return b.toString().hashCode()
    }
    /** Return the hash code for this SkipS. */
    def dispatch int hashCode(SkipS b) {
        return b.toString().hashCode()
    }
    /** Return the hash code for this AssignS. */
    def dispatch int hashCode(LabeledExp b) {
        return b.toString().hashCode()
    }
   
}
