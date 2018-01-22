package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.utility.LabelUtility
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.utility.FlowGraph
import org.eclipse.xtext.validation.Check
import edu.ucf.cs.whilelang.whileLang.AssignS
import org.eclipse.emf.ecore.EObject
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.WhileS
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.LabeledExp
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock
import edu.ucf.cs.whilelang.whileLang.S
import edu.ucf.cs.whilelang.utility.CFG
import java.util.Set
import edu.ucf.cs.whilelang.utility.SetRepUtility

/**
 * This class checks constructs a control flow graph (CFG) for the program.
 */
class WhileLangCFGValidator extends AbstractWhileLangValidator {
	
	/** What is the ElementaryBlock labeled by this key? */
	val itsBlockMap = new FlowGraph<Integer, ElementaryBlock>()
	/** What set of ElementaryBlocks may flow into the key block? */
	val inFlowsMap = new FlowGraph<ElementaryBlock, Set<ElementaryBlock>>()
	/** What is the next ElementaryBlock that lexically follows this one? */
	val nextFlowMap = new FlowGraph<S, S>()
	/** What set of ElementaryBlocks may the key flow to? */
	val outFlowsMap = new FlowGraph<ElementaryBlock, Set<ElementaryBlock>>()
	
	@Check
	def constructCFG(Program p) {
		p.body.constructIBM
		p.body.constructNextFlows
		p.body.constructInOutFlows
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
    
    def dispatch constructNextFlows(CompoundS c) {
        for (i : 0..c.stmts.size()-2) {
            nextFlowMap.put(c.stmts.get(i), c.stmts.get(i+1))
            if (c.stmts.get(i) instanceof IfS) {
                nextFlowMap.put((c.stmts.get(i) as IfS).s1, c.stmts.get(i+1))
                nextFlowMap.put((c.stmts.get(i) as IfS).s1, c.stmts.get(i+1))
            }
        }
        if (nextFlowMap.containsKey(c)) {
            nextFlowMap.put(c.stmts.get(c.stmts.size()-1), nextFlowMap.get(c))
        }
    }
    
    def dispatch constructNextFlows(WhileS ws) {
        nextFlowMap.put(ws.block, ws)
        ws.block.constructNextFlows
    }
    
    def dispatch constructNextFlows(IfS s) {
        s.s1.constructNextFlows
        s.s2.constructNextFlows
    }
    
    def dispatch constructNextFlows(S s) {}
    
    // in and out flows
    def dispatch constructInOutFLows(AssignS a) {}
    
    def dispatch constructInOutFLows(SkipS s) {}
    
    def dispatch constructInOutFLows(CompoundS c) {
        for (i : 0..c.stmts.size()-1) {
            c.stmts.get(i).constructInOutFLows
            if (i == 0) {
                if (inFlowsMap.containsKey(c)) {
                    inFlowsMap.put(c.stmts.get(i).initial, inFlowsMap.get(i))
                }
            } else {
                inFlowsMap.put(c.stmts.get(i), c.stmts.get(i-1).finals)
            }
            if (i < c.stmts.size()-1) {
                for (s : c.stmts.get(i).finals)
                outFlowsMap.put(s, nextFlowMap.get(c.stmts.get(i)))               
            }
        }
    }
    
    def dispatch constructInOutFLows(WhileS ws) {
        if (inFlowsMap.containsKey(ws.bexp as ElementaryBlock)) {
            inFlowsMap.get(ws.bexp as ElementaryBlock).add(ws as ElementaryBlock)    
        } else {
            inFlowsMap.put(ws.bexp as ElementaryBlock, new SetRepUtility(ws as ElementaryBlock))
        }
        
        ws.block.constructInOutFLows
    }   
    
    def dispatch constructInOutFLows(IfS ifs) {
        itsBlockMap.put(ifs.bexp.label, ifs.bexp as ElementaryBlock)
        ifs.s1.constructInOutFLows
        ifs.s2.constructInOutFLows
    } 
    

}
