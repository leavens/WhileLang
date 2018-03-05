package edu.ucf.cs.whilelang.utility;

import java.util.Set;
import java.util.function.Predicate;


/** Property Spaces as in Static Analysis.
 * @author Gary T. Leavens
 */
public interface PropertySpace {
	/** Return a copy of this property space element. */
	PropertySpace copy();
	
	/** Return the lattice join of the given sets. 
	 * This is an in-place (mutating) version of the property space's 
	 * combination operator. */
	void joinAll(Set<PropertySpace> sets);
	
	/** Join the given element with this property space info, in place. */
	void join(PropertySpace p);	
	
	/** Removes all of the elements of this property space 
	 * that satisfy the given predicate. */
	void removeIf(Predicate<Pair<String, MaybeLabel>> p);
	
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
