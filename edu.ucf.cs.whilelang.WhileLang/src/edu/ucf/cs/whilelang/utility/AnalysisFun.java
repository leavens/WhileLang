package edu.ucf.cs.whilelang.utility;

/** The type of transfer functions as in static analysis, 
 * where the domain is a property vector 
 * and the co-domain is the type of the vector's elements (L). 
 * @param Label, the type of labels,
 * @param L, the property space. */
public interface AnalysisFun<Label, L extends PropertySpace<L>> {
	/** apply the function to the property vector argument arg.
	 * @param arg, the property vector to apply this function to. */
	L apply(PropertyVector<Label, L> arg);
}
