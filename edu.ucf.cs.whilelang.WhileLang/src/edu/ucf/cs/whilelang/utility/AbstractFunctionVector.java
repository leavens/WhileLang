package edu.ucf.cs.whilelang.utility;

import java.util.Set;

/** This class encapsulates finding fixedpoints for FunctionVectors */
public abstract class AbstractFunctionVector<Label, L> implements FunctionVector<Label, L> {

	/** Return a new function vector that is the fixed-point of the function vector over all the labels. */
	@Override
	public PropertyVector<Label, L> fix(Set<Label> labels, PropertyVector<Label, L> initial) {
		PropertyVector<Label, L> last = initial;
		PropertyVector<Label, L> curr = next(labels, last);
		while (!last.equals(curr)) {
			PropertyVector<Label, L> temp = next(labels, last);
			last = curr;
			curr = temp;
		}
		// last.equals(curr), so last (and curr) is a fixed-point.
		return last;
	}

}
