package edu.ucf.cs.whilelang.utility;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Collection;
import java.util.HashSet;

/** This class knows about the representation chosen for sets. */
public class SetRepUtility<T> implements Set<T> {

	/** The representation of this set's values */
	private HashSet<T> h = new HashSet<T>();
	
	/** Construct a new singleton set. */
	public SetRepUtility(T o) { 
		h.add(o);
	}
		
	/** Construct a new empty set */
	public SetRepUtility() { return; }
		
	/** Form the set of Map.Entry pairs that is the cross product of 
	 * the given key with this set. */
	public <K> Set<Map.Entry<K,T>> crossWith(K key) {
		Set<Map.Entry<K,T>> ret = new SetRepUtility<Map.Entry<K,T>>();
		for (T e : h) {
			ret.add(new Pair<K,T>(key, e));
		}
		return ret;
	}
		
	/** Form the set of Map.Entry pairs that is the cross product of 
	 * this set (of keys) with the given value. */
	public <V> Set<Map.Entry<T,V>> crossedWith(V val) {
		Set<Map.Entry<T,V>> ret = new SetRepUtility<Map.Entry<T,V>>();
		for (T e : h) {
			ret.add(new Pair<T,V>(e, val));
		}
		return ret;
	}
		
	/** Form the set of Map.Entry pairs that is the cross product of 
	 * the given set of keys with this set of values. */
	public <K> Set<Map.Entry<K,T>> cross(Set<K> keys) {
		Set<Map.Entry<K,T>> ret = new SetRepUtility<Map.Entry<K,T>>();
		for (K ky : keys) {
			ret.addAll(this.crossWith(ky));
		}
		return ret;
	}

	public interface Fun<L,T> {
		T run(L x);
	}
		
	/** Map a computation over a set to produce another set. 
	 * @param <L> the element type of args
	 * @param <T> the type of the result
	 * @param f the function to apply
	 * @param args the set of arguments to which f is applied. */
	public <L> Set<T> map(Fun<L,T> f, Set<L> args) {
		Set<T> ret = new HashSet<T>();
		for (L e : args) {
			ret.add(f.run(e));
		}
		return ret;
	}
		
	/** Intersect all sets in a set of sets. */
	public Set<T> intersect(Set<Set<T>> sets) {
		Set<T> ret = new HashSet<T>();
		boolean started = false;
		for (Set<T> s : sets) {
			if (!started) {
				ret.addAll(s);
				started = true;
			} else {
				ret.retainAll(s);
			}
		}
		return ret;
	}

	@Override
	public int size() {
		return h.size();
	}

	@Override
	public boolean isEmpty() {
		return h.isEmpty();
	}

	@Override
	public boolean contains(Object o) {
		return h.contains(o);
	}

	@Override
	public Iterator<T> iterator() {
		return h.iterator();
	}

	@Override
	public Object[] toArray() {
		return h.toArray();
	}

	@Override
	public <E> E[] toArray(E[] a) {
		return h.toArray(a);
	}

	@Override
	public boolean add(T e) {
		return h.add(e);
	}

	@Override
	public boolean remove(Object o) {
		return h.remove(o);
	}

	@Override
	public boolean containsAll(Collection<?> c) {
		return h.containsAll(c);
	}

	@Override
	public boolean addAll(Collection<? extends T> c) {
		return h.addAll(c);
	}

	@Override
	public boolean retainAll(Collection<?> c) {
		return h.retainAll(c);
	}

	@Override
	public boolean removeAll(Collection<?> c) {
		return h.removeAll(c);
	}

	@Override
	public void clear() {
		h.clear();
	}
	
	@Override
	public String toString() {
		StringBuffer ret = new StringBuffer();
		ret.append("{");
		T elems[] = (T []) h.toArray();
		for (int i = 0; i < elems.length-1; i++) {
			ret.append(elems[i].toString());
			ret.append(", ");
		}
		if (elems.length > 0) {
			ret.append(elems[elems.length-1].toString());
		}
		ret.append("}");
		return ret.toString();
	}
}
