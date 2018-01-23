package edu.ucf.cs.whilelang.utility

import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.S
import edu.ucf.cs.whilelang.whileLang.WhileS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import java.util.Set
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock
import java.util.Map
import java.util.HashMap

class CFG {
    
    /** What is the ElementaryBlock with the given label? */
    public static val Map<Integer, EBHolder> itsBlockMap = new HashMap<Integer, EBHolder>()
    /** What is the set of flows within each statement? */
    public static val FlowGraph cfgMap = new FlowGraph()
    
    /** Return the ElementaryBlock with the given label. */
    def static ElementaryBlock blockOf(int lab) {
        val ebh = itsBlockMap.get(lab)
        if (ebh === null) {
            throw new NoSuchBlockException("no block for" + lab)
        } else {
            return ebh.getBlock();
        }
    }

    /** Return the flow graph of the given statement. */    
    def static Set<Map.Entry<Integer,Integer>> flowsOf(S stmt) {
        return cfgMap.get(stmt)
    }

    /** Returns the label of the initial ElementaryBlock of a statement. */
    def dispatch static int init(AssignS s) {
        s.label
    }
    
    /** Returns the label of the initial ElementaryBlock of a statement. */
    def dispatch static int init(SkipS s) {
        s.label
    }
    
    /** Returns the label of the initial ElementaryBlock of a statement. */
    def dispatch static int init(IfS s) {
        s.bexp.label
    }
    
    /** Returns the label of the initial ElementaryBlock of a statement. */
    def dispatch static int init(WhileS s) {
        s.bexp.label
    }
    
    /** Returns the label of the initial ElementaryBlock of a statement. */
    def dispatch static int init(CompoundS s) {
        s.stmts.get(0).init
    }
    
    /** Returns the label of the initial ElementaryBlock of a statement. */
    def dispatch static int init(S s) { return 0; }
            
    /** Returns all the labels of the final ElementaryBlocks of a statement. */
    def dispatch static Set<Integer> finals(AssignS s) {
        new SetRepUtility(s.label)
    }
    
    /** Returns all the labels of the final ElementaryBlocks of a statement. */
    def dispatch static Set<Integer> finals(SkipS s) {
        new SetRepUtility(s.label)
    }
    
    /** Returns all the labels of the final ElementaryBlocks of a statement. */
    def dispatch static Set<Integer> finals(IfS s) {
         val ret = s.s1.finals;
         ret.addAll(s.s2.finals);
         return ret;
    }
    
    /** Returns all the labels of the final ElementaryBlocks of a statement. */
    def dispatch static Set<Integer> finals(WhileS s) {
        new SetRepUtility(s.bexp.label)
    }
    
    /** Returns all the labels of the final ElementaryBlocks of a statement. */
    def dispatch static Set<Integer> finals(CompoundS s) {
        s.stmts.get(s.stmts.size()-1).finals
    }
    
    /** Returns all the labels of the final ElementaryBlocks of a statement. */
    def dispatch static Set<Integer> finals(S s) {
        return new SetRepUtility();
    }
    
    /** Returns the set of elementary blocks in a statement. */
    def dispatch static Set<EBHolder> blocks(AssignS s) {
        new SetRepUtility(new EBHolder(s))
    }
    
    /** Returns the set of elementary blocks in a statement. */
    def dispatch static Set<EBHolder> blocks(SkipS s) {
        new SetRepUtility(new EBHolder(s))
    }
    
    /** Returns the set of elementary blocks in a statement. */
    def dispatch static Set<EBHolder> blocks(IfS s) {
         val ret = s.s1.blocks
         ret.addAll(s.s2.blocks)
         ret.add(new EBHolder(s.bexp as ElementaryBlock))
         return ret
    }
    
    /** Returns the set of elementary blocks in a statement. */
    def dispatch static Set<EBHolder> blocks(WhileS s) {
         val Set<EBHolder> ret = s.block.blocks
         ret.add(new EBHolder(s.bexp as ElementaryBlock))
         return ret
    }
    
    /** Returns the set of elementary blocks in a statement. */
    def dispatch static Set<EBHolder> blocks(CompoundS s) {
         val ret = new SetRepUtility<EBHolder>();
         for (c : s.stmts) {
            ret.addAll(c.blocks);
         }
         return ret
    }
    
    /** Returns the set of elementary blocks in a statement. */
    def dispatch static Set<EBHolder> blocks(S s) { 
        return new SetRepUtility<EBHolder>();
    }
    
    /** Returns the set of the labels of all elementary blocks in a statement. */
    def dispatch static Set<Integer> labels(AssignS s) {
        new SetRepUtility(s.label)
    }
    
    /** Returns the set of the labels of all elementary blocks in a statement. */
    def dispatch static Set<Integer> labels(SkipS s) {
        new SetRepUtility(s.label)
    }
    
    /** Returns the set of the labels of all elementary blocks in a statement. */
    def dispatch static Set<Integer> labels(IfS s) {
         val ret = new SetRepUtility(s.bexp.label)
         ret.addAll(s.s1.labels)
         ret.addAll(s.s2.labels)
         return ret
    }
    
    /** Returns the set of the labels of all elementary blocks in a statement. */
    def dispatch static Set<Integer> labels(WhileS s) {
        val ret = new SetRepUtility(s.bexp.label)
        ret.addAll(s.block.labels)
        return ret
    }
    
    /** Returns the set of the labels of all elementary blocks in a statement. */
    def dispatch static Set<Integer> labels(CompoundS s) {
         val ret = new SetRepUtility();
         for (c : s.stmts) {
             ret.addAll(c.labels);
         }
         return ret;
    }
    
    /** Returns the set of the labels of all elementary blocks in a statement. */
    def dispatch static Set<Integer> labels(S s) { 
        return new SetRepUtility();
    }
    
}