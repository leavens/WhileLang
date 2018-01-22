package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.utility.CFG
import edu.ucf.cs.whilelang.utility.Pair
import edu.ucf.cs.whilelang.utility.SetRepUtility
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.WhileS
import java.util.Map
import java.util.Set
import org.eclipse.xtext.validation.Check

/**
 * This class checks constructs a control flow graph (CFG) for the program.
 */
class WhileLangCFGValidator extends AbstractWhileLangValidator {
	
	val itsBlockMap = CFG.itsBlockMap
	val cfgMap = CFG.cfgMap
	
	@Check
	def constructCFG(Program p) {
		p.body.constructIBM
		p.body.constructFlows
	}
		
	// Statements
	def dispatch constructIBM(AssignS a) {
	    itsBlockMap.put(a.label, a as ElementaryBlock)
	}
	
	def dispatch constructIBM(SkipS s) {
        itsBlockMap.put(s.label, s as ElementaryBlock)
    }
    
    def dispatch constructIBM(CompoundS c) {
        for (s : c.stmts) {
            s.constructIBM
        }
    }
    
    def dispatch constructIBM(WhileS ws) {
        itsBlockMap.put(ws.bexp.label, ws.bexp as ElementaryBlock)
        ws.block.constructIBM
    }	
    
    def dispatch constructIBM(IfS ifs) {
        itsBlockMap.put(ifs.bexp.label, ifs.bexp as ElementaryBlock)
        ifs.s1.constructIBM
        ifs.s2.constructIBM
    } 
        
    // flows
    def dispatch constructFlows(AssignS a) {}
    
    def dispatch constructFlows(SkipS s) {}
    
    def dispatch constructFlows(CompoundS c) {
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
            for (Set<Integer> flabs : c.stmts.get(i).finals) {
                for (j : flabs) {
                    cfgMap.putUnion(c, 
                        new SetRepUtility<Map.Entry<Integer,Integer>>(
                            new Pair<Integer,Integer>(j, c.stmts.get(i+1).init)
                        ))
                }
            }
        }
    }
    
    def dispatch constructFlows(WhileS c) {
        // construct the flows of the body
        c.block.constructFlows
        cfgMap.putUnion(c, cfgMap.get(c.block))
        cfgMap.putUnion(c, new SetRepUtility(new Pair<Integer,Integer>(c.bexp.label, c.block.init)))
        for (Set<Integer> flabs : c.block.finals) {
            for (j : flabs) {
                cfgMap.putUnion(c, new SetRepUtility<Map.Entry<Integer,Integer>>(
                    new Pair<Integer,Integer>(j, c.bexp.label)
                ))
            }
        }
    }   
    
    def dispatch constructFlows(IfS ifs) {
        // construct the flows of the two sub-statements
        ifs.s1.constructFlows
        ifs.s2.constructFlows
        // add in all those flows
        cfgMap.putUnion(ifs, cfgMap.get(ifs.s1))
        cfgMap.putUnion(ifs, cfgMap.get(ifs.s2))
        // add flows from the test to the init of each sub-statement
        cfgMap.putUnion(ifs, new SetRepUtility<Map.Entry<Integer,Integer>>(
                    new Pair<Integer,Integer>(ifs.bexp.label, ifs.s1.init)
                ))
        cfgMap.putUnion(ifs, new SetRepUtility<Map.Entry<Integer,Integer>>(
                    new Pair<Integer,Integer>(ifs.bexp.label, ifs.s2.init)
                ))
    }
   
}
