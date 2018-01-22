package edu.ucf.cs.whilelang.utility

import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.LabeledExp
import edu.ucf.cs.whilelang.whileLang.S
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.WhileS
import java.util.Set
import java.util.Map
import java.util.HashMap

/** Control Flow Graph attributes, see Section 2.1 of "Principles of Program Analysis"
 * by Nielsen, Nielsen, and Hankin (Springer-Verlag, 1999 and 2005).
 */
class CFG {
    
    /** What is the ElementaryBlock labeled by this key? */
    public static val Map<Integer, ElementaryBlock> itsBlockMap = new HashMap<Integer, ElementaryBlock>()
    /** What is the set of flows within each statement? */
    public static val FlowGraph cfgMap = new FlowGraph()
    
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
