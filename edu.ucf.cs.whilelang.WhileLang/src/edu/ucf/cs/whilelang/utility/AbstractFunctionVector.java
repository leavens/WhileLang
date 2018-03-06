package edu.ucf.cs.whilelang.utility;

import java.util.Set;

/** This class encapsulates a simple default implementation of
 * finding fixed-points for FunctionVectors */
public abstract class AbstractFunctionVector<Label, L extends PropertySpace<L>> 
		implements FunctionVector<Label, L> 
{
	/** Return a new function vector that is the fixed-point 
	 * of the function vector over all the labels. */
	@Override
	public PropertyVector<Label, L> fix(Set<Label> labels, 
									    PropertyVector<Label, L> initial) 
	{
		final boolean TRACE = false;
		PropertyVector<Label, L> last = initial;
		if (TRACE) {
			System.out.println("fix's last = initial is:");
			System.out.println(last.toString());
		}
		PropertyVector<Label, L> curr = next(labels, last);
		while (!last.equals(curr)) {
			if (TRACE) {
				System.out.println("curr is:");
				System.out.println(curr.toString());
			}
			PropertyVector<Label, L> temp = next(labels, curr);
			last = curr;
			curr = temp;
		}
		if (TRACE) {
		    System.out.println("fix returning:");
		    System.out.println(last.toString());
	    }  
		// last.equals(curr), so last (and curr) is a fixed-point.
		return last;
	}
}
