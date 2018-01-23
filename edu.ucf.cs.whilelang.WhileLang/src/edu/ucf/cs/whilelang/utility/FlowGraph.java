package edu.ucf.cs.whilelang.utility;

import java.util.AbstractMap;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import edu.ucf.cs.whilelang.whileLang.S;

/** A Map from statements (S) to sets of pairs of labels 
 * (Set<Map.Entry<Integer,Integer>>) that can be used as a flow graph. 
 */
public class FlowGraph 
		extends AbstractMap<S, Set<Map.Entry<Integer,Integer>>> 
//		implements Map<StmtHolder, Set<Map.Entry<Integer,Integer>>> 
{	
	/** The representation of this flowgraph. */
	private Map<S, Set<Map.Entry<Integer,Integer>>> map 
		= new HashMap<S, Set<Map.Entry<Integer,Integer>>>();
	
	/** Initialize this object to be an empty flowgraph. */
	public FlowGraph() {
	}
	
	/** Initialize this object to be a singleton flowgraph. */
	public FlowGraph(S s, Set<Map.Entry<Integer,Integer>> flws) {
		map.put(s, flws);
	}

	/** reinitialize this flow graph. */
	public void clear() {
		map.clear();
	}
	
	/** Returns this map as a set of pairs.*/
	public Set<Map.Entry<S, Set<Map.Entry<Integer, Integer>>>> entrySet(){
		return map.entrySet();
	}
		
	/** What is the set of flows for stmt? */
	public Set<Map.Entry<Integer,Integer>> get(S stmt) { 
		return map.get(stmt); 
	}

	
	@Override
	public Set<Map.Entry<Integer,Integer>> put(S stmt, 
			                              Set<Map.Entry<Integer,Integer>> fls) {
		return map.put(stmt, fls);
	}

	/** Adds the mapping from stmt to all of the flows in fls, unioning the
	 * flows in fls with the other flows that may already be present for stmt.
	 * @param stmt a StmtHolder for the statement
	 * @param fls a set of flows (a flowgraph)
	 */
	public Set<Map.Entry<Integer,Integer>> putUnion(S stmt, 
                                          Set<Map.Entry<Integer,Integer>> fls) {
		if (map.containsKey(stmt)) {
		    Set<Map.Entry<Integer,Integer>> ret = map.get(stmt);
		    ret.addAll(fls);
		    map.put(stmt, ret);
		    return ret;
		} else {
			return map.put(stmt, fls);
		}
	}
}
