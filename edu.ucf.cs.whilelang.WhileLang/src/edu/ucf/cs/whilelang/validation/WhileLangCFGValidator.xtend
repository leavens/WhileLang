package edu.ucf.cs.whilelang.validation

import edu.ucf.cs.whilelang.utility.Pair
import edu.ucf.cs.whilelang.utility.SetRepUtility
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.S
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.WhileS
import java.util.Map
import org.eclipse.xtext.validation.Check
import java.util.HashMap
import edu.ucf.cs.whilelang.utility.FlowGraph
import java.util.Set
import edu.ucf.cs.whilelang.whileLang.LabeledExp

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
            for (j : c.stmts.get(i).finals) {
                    cfgMap.putUnion(c, 
                        new SetRepUtility<Map.Entry<Integer,Integer>>(
                            new Pair<Integer,Integer>(j, c.stmts.get(i+1).init)
                        ))
            }
        }
    }
            
    def dispatch constructFlows(WhileS c) {
        // construct the flows of the body
        c.block.constructFlows
        cfgMap.putUnion(c, cfgMap.get(c.block))
        cfgMap.putUnion(c, new SetRepUtility(new Pair<Integer,Integer>(c.bexp.label, c.block.init)))
        for (j : c.block.finals) {
                cfgMap.putUnion(c, new SetRepUtility<Map.Entry<Integer,Integer>>(
                    new Pair<Integer,Integer>(j, c.bexp.label)
                ))
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

    /** initialize the global static maps */
    def resetMaps() {
        itsBlockMap.clear()
        cfgMap.clear()
    }
    
    /** The init() method returns the label of the initial 
     * ElementaryBlock of a statement.
     */
    def dispatch int init(AssignS s) {
        s.label
    }
    
    def dispatch int init(SkipS s) {
        s.label
    }
    
    def dispatch int init(IfS s) {
        s.bexp.label
    }
    
    def dispatch int init(WhileS s) {
        s.bexp.label
    }
    
    def dispatch int init(CompoundS s) {
        s.stmts.get(0).init
    }
    
    def dispatch int init(S s) { return 0; }
            
    /** finals() returns the set of all the labels of the 
     * final ElementaryBlocks of a statement.
     */
    def dispatch Set<Integer> finals(AssignS s) {
        new SetRepUtility(s.label)
    }
    
    def dispatch Set<Integer> finals(SkipS s) {
        new SetRepUtility(s.label)
    }
    
    def dispatch Set<Integer> finals(IfS s) {
         val ret = s.s1.finals;
         ret.addAll(s.s2.finals);
         return ret;
    }
    
    def dispatch Set<Integer> finals(WhileS s) {
        new SetRepUtility(s.bexp.label)
    }
    
    def dispatch Set<Integer> finals(CompoundS s) {
        s.stmts.get(s.stmts.size()-1).finals
    }
    
    def dispatch Set<Integer> finals(S s) {
        return new SetRepUtility();
    }
    
    /* blocks() returns the set of elementary blocks in a statement. */
    def dispatch Set<ElementaryBlock> blocks(AssignS s) {
        new SetRepUtility(s as ElementaryBlock)
    }
    
    def dispatch Set<ElementaryBlock> blocks(SkipS s) {
        new SetRepUtility(s as ElementaryBlock)
    }
    
    def dispatch Set<ElementaryBlock> blocks(IfS s) {
         val ret = s.s1.blocks
         ret.addAll(s.s2.blocks)
         ret.add(s.bexp as ElementaryBlock)
         return ret
    }
    
    def dispatch Set<ElementaryBlock> blocks(WhileS s) {
         val Set<ElementaryBlock> ret = s.block.blocks
         ret.add(s.bexp as ElementaryBlock)
         return ret
    }
    
    def dispatch Set<ElementaryBlock> blocks(CompoundS s) {
         val ret = new SetRepUtility();
         for (c : s.stmts) {
            ret.addAll(c.blocks);
         }
         return ret
    }
    
    def dispatch Set<ElementaryBlock> blocks(S s) { 
        return new SetRepUtility();
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
    
    // Set of labels in a statement
    def dispatch Set<Integer> labels(AssignS s) {
        new SetRepUtility(s.label)
    }
    
    def dispatch Set<Integer> labels(SkipS s) {
        new SetRepUtility(s.label)
    }
    
    def dispatch Set<Integer> labels(IfS s) {
         val ret = new SetRepUtility(s.bexp.label)
         ret.addAll(s.s1.labels)
         ret.addAll(s.s2.labels)
         return ret
    }
    
    def dispatch Set<Integer> labels(WhileS s) {
        val ret = new SetRepUtility(s.bexp.label)
        ret.addAll(s.block.labels)
        return ret
    }
    
    def dispatch Set<Integer> labels(CompoundS s) {
         val ret = new SetRepUtility();
         for (c : s.stmts) {
             ret.addAll(c.labels);
         }
         return ret;
    }
    
    def dispatch Set<Integer> labels(S s) { 
        return new SetRepUtility();
    }
   
}
