package edu.ucf.cs.whilelang.utility;

import java.util.Map;
import java.util.Set;

/** A vector of self-mapping (whose domain is the same as their codomain) functions. 
 * @param Label, is the type of the labels in the Control Flow Graph.
 * @param L is the type the function's domain and codomain. */
public interface FunctionVector<Label, L> {
	
	/** Return the value for the given access (entry or exit) at label l for the given property vector. */
	L apply(Access a, Label l, PropertyVector<Label, L> arg);
	
	/** Return a new function vector with the given entry and exit functions (for each label). 
	 * @param entryfuns, the entry functions for each label
	 * @param exitfuns, the exit functions for each label. */
	void initialize(Map<Label, AnalysisFun<Label, L>> entryfuns, 
					Map<Label, AnalysisFun<Label, L>> exitfuns);

	/** Return a new function vector that is one iteration of the function vector over all the labels
	 *  for the given vector argument. */
	PropertyVector<Label, L> next(Set<Label> labels, PropertyVector<Label, L> arg);
	
	/** Return a new function vector that is the fixed-point of the function vector over all the labels 
	 * starting with the initial vector value given. */
	PropertyVector<Label, L> fix(Set<Label> labels, PropertyVector<Label, L> initial);
}
