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
		int count = 0;
//		final int COUNT_LIMIT = 1250;
		PropertyVector<Label, L> last = initial;
		if (TRACE) {
			System.out.println("fix's last = initial is:");
			System.out.println(last.toString());
		}
		PropertyVector<Label, L> curr = next(labels, last);
		while (
//				count < COUNT_LIMIT && 
				!last.equals(curr)) {
			if (TRACE) {
				System.out.println("curr is:");
				System.out.println(curr.toString());
			}
			PropertyVector<Label, L> temp = next(labels, curr);
			count++;
			last = curr;
			curr = temp;
		}
//		if (count >= COUNT_LIMIT) {
//		 	System.err.println("Count limit exceeded in fix!");
//		}
		if (TRACE) {
		    System.out.println("fix returning:");
		    System.out.println(last.toString());
	    }  
		// last.equals(curr), so last (and curr) is a fixed-point.
		return last;
	}
}
