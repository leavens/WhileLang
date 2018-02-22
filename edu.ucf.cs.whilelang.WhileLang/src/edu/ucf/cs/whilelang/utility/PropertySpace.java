package edu.ucf.cs.whilelang.utility;

import java.util.Set;

/** Property Spaces as in Static Analysis.
 * @author Gary T. Leavens
 */
public interface PropertySpace {
	/** Return the lattice join of the given sets. 
	 * This is the property space's combination operator. */
	PropertySpace joinAll(Set<PropertySpace> sets);
	
	/** Return the lattice's least upper bound of the given sets. */
	PropertySpace lub(Set<PropertySpace> sets);
	
	/** Is left over-approximated (in the lattice ordering) by right? */
	boolean leq(PropertySpace left, PropertySpace right);
	
	/** Is this property space equal to o (as a property space)? */
	boolean equals(Object o);
	
	/** Return the bottom element of this property space. The result should be leq to all other elements. */
	PropertySpace bottom();
}
