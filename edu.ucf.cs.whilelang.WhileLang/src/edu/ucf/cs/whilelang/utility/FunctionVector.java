package edu.ucf.cs.whilelang.utility;

import java.util.Map;
import java.util.Set;

/** A vector of Analysis functions; i.e., for each program point (pair of ENTRY/EXIT
 * and label), what is the transfer function for that label. 
 * @param Label, is the type of the labels in the Control Flow Graph.
 * @param L is the type of the elements of property vectors. */
public interface FunctionVector<Label, 
                                L extends PropertySpace<L,E>,
                                E> 
{
	//@ public model Map<Label, AnalysisFun<Label, L>> entries, exits;
	//@ public invariant entries.keySet().equals(exits.keySet());
	//@ public invariant isMonotone(entries) && isMonotone(exits);
	
	/** Return the value for the given access, a (entry or exit), 
	 * at the given label l 
	 * for the given property vector arg. */
	/*@ pure @*/
	L apply(Access a, Label l, PropertyVector<Label, L, E> arg);
	
	/*@ ensures \result == (forall Label lab;; (\forall L v1;; (\forall L v2;;
	  @                        v1.leq(v2) ==> f(lab, v1).leq(f(lab, v2)))));
	  @ pure model boolean isMonotone(AnalysisFun<Label, L> f); 
	  @*/
	
	/*@ ensures \result == (forall Label lab; funs.keySet().has(lab); isMonotone(funs.get(lab)));
	  @ pure model boolean isMonotone(Map<Label, AnalysisFun<Label, L>> funs); 
	  @*/	
	
	/** Return a new function vector with the given entry and exit functions 
	 * (for each label). 
	 * @param entryfuns, the entry functions for each label
	 * @param exitfuns, the exit functions for each label. */
	//@ requires entryfuns.keySet().equals(exitfuns.keySet());
	//@ requires isMonotone(entryfuns) && isMonotone(exitfuns);
	//@ assignable entries, exits;
	//@ ensures this.entries.equals(entryfuns);
	//@ ensures this.exits.equals(exitfuns);
	void initialize(Map<Label, AnalysisFun<Label, L, E>> entryfuns, 
					Map<Label, AnalysisFun<Label, L, E>> exitfuns);

	/** Return a new function vector that is one iteration of the function vector over all the labels
	 *  for the given vector argument. */
	/*@ ensures (\forall Label lab; labels.has(lab); 
	  @             \result.get(Access.ENTRY, lab).equals(entries.get(lab).apply(arg))); @*/
	/*@ ensures (\forall Label lab; labels.has(lab); 
	  @             \result.get(Access.EXIT, lab).equals(exits.get(lab).apply(arg))); @*/
	/*@ pure @*/
	PropertyVector<Label, L, E> next(Set<Label> labels, PropertyVector<Label, L, E> arg);
	
	/** Return a new function vector that is the least fixed-point of the 
	 * function vector over all the labels 
	 * starting with the initial vector value given. */
	/*@ requires (\forall Label lab; labels.has(lab); 
	  @                  initial.get(Access.ENTRY, lab).isBottom());
	  @ ensures \result.equals(next(\result));
	  @ ensures (\forall PropertyVector<Label, L> v; v.equals(next(v));
	  @                  \result.leq(v));  @*/
	/*@ pure @*/
	PropertyVector<Label, L, E> fix(Set<Label> labels, PropertyVector<Label, L, E> initial);
}
