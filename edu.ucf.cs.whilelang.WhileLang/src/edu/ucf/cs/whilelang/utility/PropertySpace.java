package edu.ucf.cs.whilelang.utility;

import java.util.Set;


/** Property Spaces as in Static Analysis.
 * @author Gary T. Leavens
 */
public interface PropertySpace {
	/** Return the lattice join of the given sets. 
	 * This is an in-place (mutating) version of the property space's 
	 * combination operator. */
	PropertySpace joinAll(Set<PropertySpace> sets);
	
	/** Return the lattice's least upper bound of the given sets. */
	/*@ pure @*/
	PropertySpace lub(Set<PropertySpace> sets);
	
	/** Is this over-approximated (in the lattice ordering) by v? */
	/*@ pure @*/
	boolean leq(PropertySpace v);
	
	/** Is this property space value equal to o (as a property space value)? */
	/*@ pure @*/
	boolean equals(Object o);
	
	/** Is this the bottom element of this property space? 
	 *  That is, is this leq to all other elements? */
	/*@ pure @*/
	boolean isBottom();
}
