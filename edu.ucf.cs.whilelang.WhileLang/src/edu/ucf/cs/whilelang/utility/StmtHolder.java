package edu.ucf.cs.whilelang.utility;

import edu.ucf.cs.whilelang.generator.WhileLangUnparser;
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock;
import edu.ucf.cs.whilelang.whileLang.S;


/** Objects that can hold a Statement, for use in hashed sets and maps. */
public class StmtHolder {
	private final S stmt;
	
	/** Initialize this holder with the statement st. */
	public StmtHolder(/*@ non_null @*/ S st) {
		stmt = st;
	}
	
	/** Return the statement in this holder */
	public S getStmt() {
		return stmt;
	}
	
	@Override
	public boolean equals(Object oth) {
		if (oth == null || !(oth instanceof ElementaryBlock)) { return false; }
        S s = (S) oth;
        WhileLangUnparser up = new WhileLangUnparser();
        return up.unparse(stmt).equals(up.unparse(s));
	}
		
	@Override
	/** Return a hash code for this statement holder. */
	public int hashCode() {
		return new WhileLangUnparser().unparse(stmt).hashCode();
	}
}
