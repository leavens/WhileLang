package edu.ucf.cs.whilelang.utility;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.function.Predicate;

public class PVAsMap<Label, L extends PropertySpace<L,E>, E> 
		implements PropertyVector<Label, L, E> 
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
		PropertyVector<Label, L, E> ov = (PropertyVector<Label, L, E>) oth;
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
	/** Return a string representation of this property space vector. */
	public String toString() {
		StringBuffer ret = new StringBuffer();
		ret.append("(entries: {");
		int sz = entries.keySet().size();
		for (Label lab : entries.keySet()) {
			ret.append('(');
			ret.append(lab.toString());
			ret.append("|->");
			ret.append(entries.get(lab).toString());
			ret.append(")");
			if (sz > 1) {
				ret.append(", ");
			}
			sz--;
		}
		ret.append("}\n");
		ret.append(" exits  : {");
		sz = exits.keySet().size();
		for (Label lab : exits.keySet()) {
			ret.append('(');
			ret.append(lab.toString());
			ret.append("|->");
			ret.append(exits.get(lab).toString());
			ret.append(")");
			if (sz > 1) {
				ret.append(", ");
			}
			sz--;
		}
		ret.append("})");
		return ret.toString();
	}

	@Override
	public Set<Label> getLabels() {
		return entries.keySet();
	}

	@Override
	public boolean leq(PropertyVector<Label, L, E> ov) {
		boolean ret = true;
		if (!entries.keySet().equals(ov.getLabels())) {
			return false;
		}
		for (Label lab: entries.keySet()) {
			ret &= entries.get(lab).leq(ov.get(Access.ENTRY, lab))
					&& exits.get(lab).leq(ov.get(Access.EXIT, lab));
			if (!ret) { return false; }
		}
		return ret;
	}

	@Override
	public PVAsMap<Label, L, E> copy() {
		PVAsMap<Label,L,E> ret = new PVAsMap<Label,L,E>();
		for (Label lab: entries.keySet()) {
			ret.put(Access.ENTRY, lab, entries.get(lab));
		}
		for (Label lab: exits.keySet()) {
			ret.put(Access.EXIT, lab, exits.get(lab));
		}
		return ret;
	}

	/*@ requires (\forall PropertyVector<Label,L,E> v; vs.contains(v);
	  @                   this.getLabels().equals(v.getLabels())); @*/
	@Override
	public void joinAll(Set<PropertyVector<Label, L, E>> vs) {
		for (PropertyVector<Label, L, E> v : vs) {
			this.join(v);
		}
	}

	//@ requires this.getLabels().equals(v.getLabels());
	@Override
	public void join(PropertyVector<Label, L, E> v) {
		for (Label lab : v.getLabels()) {
			L entryv = entries.get(lab);
			entryv.join(v.get(Access.ENTRY, lab));
			entries.put(lab, entryv);
			L exitv = exits.get(lab);
			exitv.join(v.get(Access.EXIT, lab));
			exits.put(lab, exitv);
		}
	}

	@Override
	public void removeIf(Predicate<E> p) {
		for (Label lab : entries.keySet()) {
			L entryv = entries.get(lab);
			entryv.removeIf(p);
			L exitv = exits.get(lab);
			exitv.removeIf(p);
		}		
	}

	/*@ requires (\forall PropertyVector<Label,L,E> v; vs.contains(v);
	  @                   this.getLabels().equals(v.getLabels())); @*/
	@Override
	public PropertyVector<Label, L, E> lub(Set<PropertyVector<Label, L, E>> vs) {
		PVAsMap<Label, L, E> ret = new PVAsMap<Label,L,E>();
		boolean foundOne = false;
		for (PropertyVector<Label, L, E> v : vs) {
			for (Label lab : v.getLabels()) {
			    ret.entries.put(lab, v.get(Access.ENTRY, lab));
			    ret.exits.put(lab, v.get(Access.EXIT, lab));
			}
			foundOne=true;
			break;
		}
		if (foundOne) {
			ret.joinAll(vs);
		}
		return ret;
	}

	@Override
	public boolean isBottom() {
		boolean ret = true;
		for (Label lab : entries.keySet()) {
			ret &= entries.get(lab).isBottom() & exits.get(lab).isBottom();
			if (!ret) {
				return false;
			}
		}
		return ret;
	}
}
