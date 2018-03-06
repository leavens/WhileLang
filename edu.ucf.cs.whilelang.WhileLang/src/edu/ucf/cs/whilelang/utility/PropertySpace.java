package edu.ucf.cs.whilelang.utility;

import java.util.Set;


/** Property Spaces as in static analysis.
 * @param L, the type of the property space
 * @param E, the type of the elements in the property space
 * @author Gary T. Leavens
 */
public interface PropertySpace<L extends PropertySpace<L>> {
	/** Return a copy of this property space element. */
	L copy();
	
	/** Return the lattice join of the given sets. 
	 * This is an in-place (mutating) version of the property space's 
	 * combination operator. */
	void joinAll(Set<L> sets);
	
	/** Join the given element with this property space info, in place. */
	void join(L p);	
	
	/** Return the lattice's least upper bound of the given sets. */
	/*@ pure @*/
	L lub(Set<L> sets);
	
	/** Is this over-approximated (in the lattice ordering) by v? */
	/*@ pure @*/
	boolean leq(L v);
	
	/** Is this property space value equal to o (as a property space value)? */
	/*@ pure @*/
	boolean equals(Object o);
	
	/** Is this the bottom element of this property space? 
	 *  That is, is this leq to all other elements? */
	/*@ pure @*/
	boolean isBottom();
}
