package edu.ucf.cs.whilelang.utility;

/** Self-mapping functions as in static analysis, where the domain and codomain are equal. 
 * @param L, the property space. */
public interface AnalysisFun<Label, L> {
	/** apply the function to the property vector argument arg. */
	L apply(PropertyVector<Label, L> arg);
}
