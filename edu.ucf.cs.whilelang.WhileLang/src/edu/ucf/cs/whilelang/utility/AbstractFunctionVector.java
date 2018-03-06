package edu.ucf.cs.whilelang.utility;

import java.util.Set;

/** This class encapsulates a simple default implementation of
 * finding fixed-points for FunctionVectors */
public abstract class AbstractFunctionVector<Label, 
                                             L extends PropertySpace<L,E>, 
                                             E> 
		implements FunctionVector<Label, L, E> 
{
	/** Return a new function vector that is the fixed-point of the function vector over all the labels. */
	@Override
	public PropertyVector<Label, L, E> fix(Set<Label> labels, 
									       PropertyVector<Label, L, E> initial) 
	{
		final boolean TRACE = false;
		PropertyVector<Label, L, E> last = initial;
		if (TRACE) {
			System.out.println("fix's last = initial is:");
			System.out.println(last.toString());
		}
		PropertyVector<Label, L, E> curr = next(labels, last);
		while (!last.equals(curr)) {
			if (TRACE) {
				System.out.println("curr is:");
				System.out.println(curr.toString());
			}
			PropertyVector<Label, L, E> temp = next(labels, curr);
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
