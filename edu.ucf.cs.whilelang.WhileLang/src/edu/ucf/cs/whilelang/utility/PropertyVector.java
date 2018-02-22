package edu.ucf.cs.whilelang.utility;

import java.util.Set;

public interface PropertyVector<Label, L> {
	
	/** Define the value of this vector to be the given value for each access and label. */
	void putAll(Set<Label> labels, L initial);
	
	/** set the value of this vector for the given access and label to the given value. */
	public void put(Access a, Label lab, L value);
	
	/** Return the value in the vector for the given access (entry or exit) and label. */
	L get(Access access, Label l);
	
	/** Is this property vector equal (at each access and label) to oth (as a PropertyVector)? */
	boolean equals(Object oth);
}
