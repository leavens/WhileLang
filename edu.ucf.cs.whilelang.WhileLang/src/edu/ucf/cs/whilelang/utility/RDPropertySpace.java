package edu.ucf.cs.whilelang.utility;

import java.util.HashSet;
import java.util.Set;
import java.util.function.Predicate;

/** The property space for the Reaching Definitions analysis. 
 * @author Gary T. Leavens
 */
public class RDPropertySpace 
        implements PropertySpace<RDPropertySpace, Pair<String, MaybeLabel>> 
{

	/** The set of pairs that represents the property. */
	protected Set<Pair<String, MaybeLabel>> rep; 
	
	/** Initialize this property space element to be the bottom element 
	 * of this property space (the empty set). */
	/*@ pure @*/
	public RDPropertySpace() {
		rep = new HashSet<Pair<String, MaybeLabel>>();
	}
	
	/** Initialize this property space element to be 
	 * a set containing a singleton pair with the given name and label. */
	public RDPropertySpace(String name, MaybeLabel lab) {
		rep = new HashSet<Pair<String, MaybeLabel>>();
		rep.add(new Pair<String, MaybeLabel>(name, lab));
	}
	
	/** Initialize this property space element to be 
	 * a mapping from the given set of variables (fvs) to the given label (lab). */
	public RDPropertySpace(Set<String> fvs, MaybeLabel lab) {
		rep = new HashSet<Pair<String, MaybeLabel>>();
		for (String name : fvs) {
			rep.add(new Pair<String,MaybeLabel>(name, lab));
		}
	}
	
	/** Return a property space element with the given set of pairs. 
	 *  Note that this implementation commits argument exposure, 
	 *  so this constructor should NOT be available to public clients. */
	protected RDPropertySpace(Set<Pair<String, MaybeLabel>> s) {
		rep = s;
	}
	
	/** Return a copy of this property space element. */
	@Override
	public RDPropertySpace copy() {
		RDPropertySpace ret = new RDPropertySpace();
		ret.join(this);
		return ret;
	}
	
	/** @see edu.ucf.cs.whilelang.utility.PropertySpace#joinAll(java.util.Set) */
	@Override
	public void joinAll(Set<RDPropertySpace> sets) {
		for (RDPropertySpace e : sets) {
			rep.addAll(e.rep);
		}
	}

	/** @see edu.ucf.cs.whilelang.utility.PropertySpace#lub(java.util.Set) */
	@Override
	public RDPropertySpace lub(Set<RDPropertySpace> sets) {
		RDPropertySpace ret = new RDPropertySpace();
		ret.joinAll(sets);
		return ret;
	}

	/** @see edu.ucf.cs.whilelang.utility.PropertySpace#leq(edu.ucf.cs.whilelang.utility.PropertySpace)
	 */
	@Override
	public boolean leq(RDPropertySpace v) {
		return v.rep.containsAll(this.rep);
	}

	/** @see edu.ucf.cs.whilelang.utility.PropertySpace#isBottom() */
	@Override
	public boolean isBottom() {
		return rep.isEmpty();
	}
	
	/** Are these two sets equal (as RDPropertySpace values)? */
	@Override
	public boolean equals(Object oth) {
		if (oth == null || !(oth instanceof RDPropertySpace)) {
			return false;
		}
		RDPropertySpace v = (RDPropertySpace) oth;
		return v.rep.equals(this.rep);
	}
	
	/** Return a hash code for this. */
	@Override
	public int hashCode() {
		return this.rep.hashCode();
	}

	/** Removes all of the elements of this property space 
	 * that satisfy the given predicate. */
	public void removeIf(Predicate<Pair<String, MaybeLabel>> p) {
		rep.removeIf(p);
	}
	
	/** Join the given element with this property space info, in place. */
	public void join(RDPropertySpace v) {
	    rep.addAll(v.rep);
	}
	
	/** Return a string representation of this property space info. */
	@Override
	public String toString() {
		StringBuffer ret = new StringBuffer();
		ret.append('{');
		int sz = this.rep.size();
		for (Pair<String, MaybeLabel> p : this.rep) {
			ret.append(p.toString());
			if (sz > 1) {
				ret.append(", ");
			}
			sz--;
		}
		ret.append('}');
		return ret.toString();
	}

	/** Return the image of the string in this property space.
	 * That is, return the set of all labels where vname may have been last
	 * defined (assigned). 
	 * @param vname, the variable name */
	public Set<MaybeLabel> get(String vname) {
	    Set<MaybeLabel> ret = new HashSet<MaybeLabel>();
	    for (Pair<String, MaybeLabel> p : this.rep) {
	    	if (p.getKey().equals(vname)) {
	    		ret.add(p.getValue());
	    	}
	    }
	    return ret;
	}
}
