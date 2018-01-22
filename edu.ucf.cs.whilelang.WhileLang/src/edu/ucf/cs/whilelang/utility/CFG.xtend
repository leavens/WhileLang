package edu.ucf.cs.whilelang.utility

import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.LabeledExp
import edu.ucf.cs.whilelang.whileLang.SkipS
import edu.ucf.cs.whilelang.whileLang.WhileS
import java.util.Set

/** Control Flow Graph attributes, see Section 2.1 of "Principles of Program Analysis"
 * by Nielsen, Nielsen, and Hankin (Springer-Verlag, 1999 and 2005).
 */
class CFG {

    /* The init() method returns the initial ElementaryBlock of a statement. */
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
			
	/* finals() returns the set of all the labels of the final ElementaryBlocks 
	 * of a statement.
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
         val ret = s.block.blocks
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
		    
	/** Flows into a block.*/
	// inh Set<Label> S.inFlows();	
	// eq Program.getS().inFlows() = SetRepUtility.emptySet();
	/* eq IfS.getS1().inFlows() {
	    return SetRepUtility.singleton(getLabeledExpr().getLabelAST());
	}
	eq IfS.getS2().inFlows() {
	    return SetRepUtility.singleton(getLabeledExpr().getLabelAST());
	}
	eq WhileS.getS().inFlows() {
	    return SetRepUtility.singleton(getLabeledExpr().getLabelAST());
	}
	eq CompoundS.getSList(int index).inFlows() {
		if (index == 0) {
			return inFlows();
		} else { 
			return getSList(index-1).finals();
		}
	}	
	inh Set<Label> LabeledExpr.inFlows();
	eq IfS.getLabeledExpr().inFlows() = this.inFlows();
	eq WhileS.getLabeledExpr().inFlows() {
		Set<Label> ins = this.inFlows();
		ins.addAll(getS().finals());
		return ins;
	}
	*/

	/** Next statement in a sequence (lexically), null if none.
	  * This is a helping attribute for outFlows. */
	/* inh S S.next();
	eq CompoundS.getSList(int index).next() {
		if (index == getNumSList()-1) {
			return next();
		} else {
			return getSList(index+1);
		}
	}
	eq Program.getS().next() = null;
	eq IfS.getS1().next() = next();
	eq IfS.getS2().next() = next();
	eq WhileS.getS().next() = this;
	*/
	
	/** Flows out of a block. */
	/*inh Set<Label> S.outFlows();	
	eq Program.getS().outFlows() = SetRepUtility.emptySet();
	eq IfS.getS1().outFlows() {
	    return next() == null ? SetRepUtility.emptySet() 
	    		: SetRepUtility.singleton(next().init());
	}
	eq IfS.getS2().outFlows() {
	    return next() == null ? SetRepUtility.emptySet() 
	    		: SetRepUtility.singleton(next().init());
	}
	eq WhileS.getS().outFlows() {
	    return SetRepUtility.singleton(getLabeledExpr().getLabelAST());
	}
	eq CompoundS.getSList(int index).outFlows() {
		if (index == getNumSList()-1) {
			return outFlows();
		} else { 
			return SetRepUtility.singleton(getSList(index+1).init());
		}
	}
	*/
	
	/* inh Set<Label> LabeledExpr.outFlows();
	eq IfS.getLabeledExpr().outFlows() {
	    Set<Label> ret = SetRepUtility.singleton(getS1().init());
	    ret.add(getS2().init());
	    return ret;
	}
	eq WhileS.getLabeledExpr().outFlows() {
		Set<Label> outs = SetRepUtility.singleton(getS().init());
		if (next() != null) { outs.add(next().init()); }
		return outs;
	}
	*/

	/** flows inside of a statement */
	/* syn FlowGraph<Label, Label> S.flows();
	eq AssignS.flows() = new FlowGraph<Label, Label>();
	eq SkipS.flows() = new FlowGraph<Label, Label>();
	eq IfS.flows() {
	     FlowGraph<Label, Label> ret = getS1().flows();
	     ret.putAll(getS2().flows());
	     ret.put(getLabeledExpr().getLabelAST(), getS1().init());
	     ret.put(getLabeledExpr().getLabelAST(), getS2().init());
	     return ret;
	  }
	eq WhileS.flows() {
	     Label l = getLabeledExpr().getLabelAST();
	     FlowGraph<Label, Label> ret = getS().flows();
	     ret.put(l, getS().init());
	     ret.putAll(FlowGraph.crossWith(getS().finals(), l));
	     return ret;
          }
	eq CompoundS.flows() {
	     FlowGraph<Label, Label> ret = new FlowGraph<Label, Label>();
	     for (int i = 1; i < getNumSList()-1; i++) {
	        ret.putAll(getSList(i-1).flows());
	        Set<Label> finalsM1 = getSList(i-1).finals();
	        ret.putAll(FlowGraph.crossWith(finalsM1, getSList(i).init()));
	     }
	     ret.putAll(getSList(getNumSList()-1).flows());
	     return ret;
         }
     */
}
