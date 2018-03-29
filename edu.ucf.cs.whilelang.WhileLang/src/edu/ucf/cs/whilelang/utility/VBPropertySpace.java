package edu.ucf.cs.whilelang.utility;

import java.util.HashSet;
import java.util.Set;
import java.util.function.Predicate;

import edu.ucf.cs.whilelang.generator.WhileLangUnparser;
import edu.ucf.cs.whilelang.whileLang.Expr;
import edu.ucf.cs.whilelang.whileLang.Program;

/** The property space for the Very Busy Expressions analysis. 
 * Note that the setProgram method must be called before any others!
 * @author Gary T. Leavens
 */
public class VBPropertySpace 
        implements PropertySpace<VBPropertySpace> 
{

	/** The set of expression ASTs that represents the property. */
	protected Set<Expr> rep; 
	
	/** The program that this property space is for. */
	protected static Program theProg = null;
	
	/** Initialize the program for this property space. 
	 * requires p is not null. */
	public static void setProgram(Program p) {
		theProg = p;
	}
	
	/** Initialize this property space element to be the bottom element 
	 * of this property space (the set of all non-trivial expression in the program).
	 * requires: theProg is not null */
	/*@ pure @*/
	public VBPropertySpace() {
		rep = new HashSet<Expr>();
		AExps aes = new AExps();
		rep.addAll(aes.Aexp(theProg.getBody()));
	}
	
	/** Initialize this property space element to be 
	 * a set containing just the given arithmetic expression. 
	 * requires nonTrivialArithExp(e) */
	public VBPropertySpace(Expr e) {
		rep = new HashSet<Expr>();
		rep.add(e);
	}
	
	/** Initialize this property space element to be 
	 * the given set. */
	 public VBPropertySpace(Set<Expr> s) {
		rep = new HashSet<Expr>();
		for (Expr e : s) {
			rep.add(e);
		}
	}
	
	/** Return a copy of this property space element. */
	@Override
	public VBPropertySpace copy() {
		VBPropertySpace ret = new VBPropertySpace();
		ret.join(this);
		return ret;
	}
	
	/** @see edu.ucf.cs.whilelang.utility.PropertySpace#joinAll(java.util.Set) */
	@Override
	public void joinAll(Set<VBPropertySpace> sets) {
		for (VBPropertySpace e : sets) {
			rep.retainAll(e.rep);
		}
	}

	/** @see edu.ucf.cs.whilelang.utility.PropertySpace#lub(java.util.Set) */
	@Override
	public VBPropertySpace lub(Set<VBPropertySpace> sets) {
		VBPropertySpace ret = new VBPropertySpace();
		ret.joinAll(sets);
		return ret;
	}

	/** @see edu.ucf.cs.whilelang.utility.PropertySpace#leq(edu.ucf.cs.whilelang.utility.PropertySpace)
	 */
	@Override
	public boolean leq(VBPropertySpace v) {
		return this.rep.containsAll(v.rep);
	}

	/** @see edu.ucf.cs.whilelang.utility.PropertySpace#isBottom() */
	@Override
	public boolean isBottom() {
		AExps aes = new AExps();
		return rep.equals(aes.Aexp(VBPropertySpace.theProg));
	}
	
	/** Are these two sets equal (as VBPropertySpace values)? */
	@Override
	public boolean equals(Object oth) {
		if (oth == null || !(oth instanceof VBPropertySpace)) {
			return false;
		}
		VBPropertySpace v = (VBPropertySpace) oth;
		return v.rep.equals(this.rep);
	}
	
	/** Return a hash code for this. */
	@Override
	public int hashCode() {
		return this.rep.hashCode();
	}
	
	/** Join the given element with this property space info, in place. */
	@Override
	public void join(VBPropertySpace v) {
	    rep.retainAll(v.rep);
	}
	
	/** Return a string representation of this property space info. */
	@Override
	public String toString() {
		StringBuffer ret = new StringBuffer();
		ret.append('{');
		int sz = this.rep.size();
		WhileLangUnparser wlup = new WhileLangUnparser();
		for (Expr e : this.rep) {
			ret.append(wlup.unparse(e));
			if (sz > 1) {
				ret.append(", ");
			}
			sz--;
		}
		ret.append('}');
		return ret.toString();
	}
	
	/** Removes all of the elements of this property space 
	 * that satisfy the given predicate. */
	public void removeIf(Predicate<Expr> p) {
		rep.removeIf(p);
	}

	/** Return whether this set contains the given expression. 
	 * @param e, the arithmetic expression (from the program). */
	public boolean contains(Expr e) {
	    return rep.contains(e);
	}
	
	/** Add the given set of non-trivial arithmetic expressions to this property space. */
	public void addAll(Set<Expr> se) {
		rep.addAll(se);
	}
}
