package edu.ucf.cs.whilelang.utility;

import java.util.AbstractMap.SimpleEntry;

/** Pairs of Keys and Values that print as "(k,v)".
 * @author Gary T. Leavens
 */
public class Pair<K,V> extends SimpleEntry<K, V> {

	public Pair(K key, V val) {
		super(key, val);
	}

	private static final long serialVersionUID = 1L;
	
	@Override
	public String toString() {
		return "(" + getKey().toString() + "," 
			       + getValue().toString() + ")";
	}
	
	@Override
	public boolean equals(Object oth) {
		if (oth == null || !(oth instanceof Pair)) {
			return false;
		}
		@SuppressWarnings("unchecked")
		Pair<K,V> po = (Pair<K,V>) oth;
		return this.getKey().equals(po.getKey())
				&& this.getValue().equals(po.getValue());
	}
	
	@Override
	public int hashCode() {
		return this.getKey().hashCode() + this.getValue().hashCode();
	}
}
