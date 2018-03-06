package edu.ucf.cs.whilelang.utility;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/** Function Vectors represented as a pair of maps */
public class FVAsMap<Label, L extends PropertySpace<L>> 
		extends AbstractFunctionVector<Label, L> 
{
	protected Map<Label, AnalysisFun<Label, L>> entryfuns 
	    = new HashMap<Label, AnalysisFun<Label, L>>();
	protected Map<Label, AnalysisFun<Label, L>> exitfuns 
	    = new HashMap<Label, AnalysisFun<Label, L>>();
	
	/** Create a FVAsMap with no mappings. */
	public FVAsMap() {}
	
	/** Construct this vector with the given entry and exit functions. */
	public FVAsMap(Map<Label, AnalysisFun<Label, L>> entryfuns, 
				   Map<Label, AnalysisFun<Label, L>> exitfuns) {
		this.initialize(entryfuns, exitfuns);
	}
	
	@Override
	public L apply(Access a, Label l, PropertyVector<Label, L> arg) {
		if (a.equals(Access.ENTRY)) {
			return entryfuns.get(l).apply(arg);
		} else { /* Access.EXIT */
			return exitfuns.get(l).apply(arg);
		}
	}

	// TODO: fix the argument and rep exposure here
	@Override
	public void initialize(Map<Label, AnalysisFun<Label, L>> entryfuns, 
						   Map<Label, AnalysisFun<Label, L>> exitfuns) {
		this.entryfuns = entryfuns;
		this.exitfuns = exitfuns;
	}

	@Override
	public PropertyVector<Label, L> next(Set<Label> labels, 
			                             PropertyVector<Label, L> arg) 
	{
		PropertyVector<Label, L> ret = new PVAsMap<Label, L>();
		for (Label lab : labels) {
			ret.put(Access.ENTRY, lab, entryfuns.get(lab).apply(arg));
			ret.put(Access.EXIT, lab, exitfuns.get(lab).apply(arg));
		}
		return ret;
	}
}
