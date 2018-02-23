package edu.ucf.cs.whilelang.utility;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class PVAsMap<Label, L extends PropertySpace> 
		implements PropertyVector<Label, L> 
{
	/** The entry elements of the vector */
	protected Map<Label, L> entries = new HashMap<Label, L>();
	/** The exit elements of the vector */
	protected Map<Label, L> exits = new HashMap<Label, L>();
	
	/** Initialize this to an empty property vector. */
	public PVAsMap() {}
	
	/** Initialize this to a property vector such that each value is initial. */
	public PVAsMap(Set<Label> labels, L initial) {
		this.putAll(labels, initial);
	}
	
	/** Define the initial value of this vector to be the given value for each access and label. */
	public void putAll(Set<Label> labels, L value) {
		for (Label lab : labels) {
			entries.put(lab, value);
			exits.put(lab, value);
		}		
	}
	
	/** set the value of this vector for the given access and label to the given value. */
	public void put(Access a, Label lab, L value) {
		if (a == Access.ENTRY) {
			entries.put(lab, value);
		} else {
			exits.put(lab, value);
		}
	}
	
	/** Return the value in the vector for the given access (entry or exit) and label. */
	public L get(Access access, Label l) {
		if (access == Access.ENTRY) {
			return entries.get(l);
		} else {
			/* access == Access.EXIT */
			return exits.get(l);
		}
	}
	
	/** Is this property vector equal (at each access and label) to oth (as a PropertyVector)? */
	public boolean equals(Object oth) {
		if (oth == null || !(oth instanceof PropertyVector)) {
			return false;
		}
		@SuppressWarnings("unchecked")
		PropertyVector<Label, L> ov = (PropertyVector<Label, L>) oth;
		boolean ret = true;
		for (Label lab: entries.keySet()) {
			ret &= entries.get(lab).equals(ov.get(Access.ENTRY, lab))
					&& exits.get(lab).equals(ov.get(Access.EXIT, lab));
			if (!ret) { return false; }
		}
		return ret;
	}

	@Override
	/** Return a hash code for this property vector. */
	public int hashCode() {
		int ret = 0;
		for (Label lab : entries.keySet()) {
			ret += entries.get(lab).hashCode() + exits.get(lab).hashCode();
		}
		return ret;
	}

	@Override
	public Set<Label> getLabels() {
		return entries.keySet();
	}

	@Override
	public boolean leq(PropertyVector<Label, L> ov) {
		boolean ret = true;
		for (Label lab: entries.keySet()) {
			ret &= entries.get(lab).leq(ov.get(Access.ENTRY, lab))
					&& exits.get(lab).leq(ov.get(Access.EXIT, lab));
			if (!ret) { return false; }
		}
		return ret;
	}
}
