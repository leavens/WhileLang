package edu.ucf.cs.whilelang.utility;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/** Function Vectors represented as a pair of maps */
public class FVAsMap<Label, L extends PropertySpace<L,E>, E> 
		extends AbstractFunctionVector<Label, L, E> 
{
	protected Map<Label, AnalysisFun<Label, L, E>> entryfuns 
	    = new HashMap<Label, AnalysisFun<Label, L, E>>();
	protected Map<Label, AnalysisFun<Label, L, E>> exitfuns 
	    = new HashMap<Label, AnalysisFun<Label, L, E>>();
	
	/** Create a FVAsMap with no mappings. */
	public FVAsMap() {}
	
	/** Construct this vector with the given entry and exit functions. */
	public FVAsMap(Map<Label, AnalysisFun<Label, L, E>> entryfuns, 
				   Map<Label, AnalysisFun<Label, L, E>> exitfuns) {
		this.initialize(entryfuns, exitfuns);
	}
	
	@Override
	public L apply(Access a, Label l, PropertyVector<Label, L, E> arg) {
		if (a.equals(Access.ENTRY)) {
			return entryfuns.get(l).apply(arg);
		} else { /* Access.EXIT */
			return exitfuns.get(l).apply(arg);
		}
	}

	// TODO: fix the argument and rep exposure here
	@Override
	public void initialize(Map<Label, AnalysisFun<Label, L, E>> entryfuns, 
						   Map<Label, AnalysisFun<Label, L, E>> exitfuns) {
		this.entryfuns = entryfuns;
		this.exitfuns = exitfuns;
	}

	@Override
	public PropertyVector<Label, L, E> next(Set<Label> labels, 
			                                PropertyVector<Label, L, E> arg) 
	{
		PropertyVector<Label, L, E> ret = new PVAsMap<Label, L, E>();
		for (Label lab : labels) {
			ret.put(Access.ENTRY, lab, entryfuns.get(lab).apply(arg));
			ret.put(Access.EXIT, lab, exitfuns.get(lab).apply(arg));
		}
		return ret;
	}
}
