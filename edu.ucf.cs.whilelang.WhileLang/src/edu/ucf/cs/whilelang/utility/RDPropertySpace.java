package edu.ucf.cs.whilelang.utility;

import java.util.HashSet;
import java.util.Set;
import java.util.function.Predicate;

/** The property space for the Reaching Definitions analysis. 
 * @author Gary T. Leavens
 */
public class RDPropertySpace implements PropertySpace {

	/** The set of pairs that is the property. */
	protected Set<Pair<String, MaybeLabel>> rep; 
	
	/** Return the bottom element of this property space (the empty set). */
	/*@ pure @*/
	public RDPropertySpace() {
		rep = new HashSet<Pair<String, MaybeLabel>>();
	}
	
	/** Return a property space element with the given set of pairs. 
	 *  Note that this implementation commits argument exposure, 
	 *  so this constructor should NOT be available to public clients. */
	protected RDPropertySpace(Set<Pair<String, MaybeLabel>> s) {
		rep = s;
	}
	
	/** @see edu.ucf.cs.whilelang.utility.PropertySpace#joinAll(java.util.Set) */
	@Override
	public PropertySpace joinAll(Set<PropertySpace> sets) {
		Set<Pair<String, MaybeLabel>> ret = new HashSet<Pair<String, MaybeLabel>>();
		for (PropertySpace e : sets) {
			if (e instanceof RDPropertySpace) {
				RDPropertySpace v = (RDPropertySpace) e;
				ret.addAll(v.rep);
			} else {
				throw new IllegalArgumentException();
			}
		}
		return new RDPropertySpace(ret);
	}

	/** @see edu.ucf.cs.whilelang.utility.PropertySpace#lub(java.util.Set) */
	@Override
	public PropertySpace lub(Set<PropertySpace> sets) {
		return joinAll(sets);
	}

	/** @see edu.ucf.cs.whilelang.utility.PropertySpace#leq(edu.ucf.cs.whilelang.utility.PropertySpace)
	 */
	@Override
	public boolean leq(PropertySpace e) {
		if (e instanceof RDPropertySpace) {
			RDPropertySpace v = (RDPropertySpace) e;
			return v.rep.containsAll(this.rep);
		} else {
			throw new IllegalArgumentException();
		}
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
	    this.rep.removeIf(p);
	}
}
