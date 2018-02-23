package edu.ucf.cs.whilelang.utility;

import java.util.Set;

public interface PropertyVector<Label, L extends PropertySpace> {
	
	/** Define the value of this vector to be the given value for each access and label. */
	void putAll(Set<Label> labels, L initial);
	
	/** set the value of this vector for the given access and label to the given value. */
	public void put(Access a, Label lab, L value);
	
	/** Return the value in the vector for the given access (entry or exit) and label. */
	/*@ pure @*/
	L get(Access access, Label l);

	/** Return the set of labels of this property vector. */
	/*@ pure @*/
	Set<Label> getLabels();

	/** Is this property vector pointwise over-approximated by oth (as a PropertyVector)? */
	/*@ requires this.getLabels().equals(oth.getLabels());
	/*@ pure @*/
	boolean leq(PropertyVector<Label, L> oth);

	/** Is this property vector equal (at each access and label) to oth (as a PropertyVector)? */
	/*@ also
	  @   requires oth instanceof PropertyVector<Label, L>;
	  @   ensures \result ==> this.getLabels().equals(((PropertyVector<Label, L>) oth).getLabels())
	  @                      && (\forall Label lab; this.getLabels().has(lab);
	  @                                  this.get(Access.ENTRY, lab).equals(
	  @                                  ((PropertyVector<Label, L>) oth).get(Access.ENTRY, lab))
	  @                                  && this.get(Access.EXIT, lab).equals(
	  @                                  ((PropertyVector<Label, L>) oth).get(Access.EXIT, lab)));
	  @*/
	/*@ pure @*/
	boolean equals(Object oth);
}
