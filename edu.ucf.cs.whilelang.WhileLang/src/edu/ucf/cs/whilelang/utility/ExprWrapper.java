package edu.ucf.cs.whilelang.utility;

import edu.ucf.cs.whilelang.generator.WhileLangUnparser;
import edu.ucf.cs.whilelang.whileLang.Expr;

/**
 * A wrapper for Expr that has a proper equals method.
 *
 */
public class ExprWrapper {
	
	protected static final WhileLangUnparser wlup = new WhileLangUnparser();
	protected final Expr rep;
	/** starts out as null and is a string when the expression has been unparsed. */
	protected String unparsed = null;

	/** Create an expression wrapper for the given expression.*/
	public ExprWrapper(Expr e) {
		rep = e;
	}
	
	/** Return the expression in this wrapper. */
	public Expr getExpr() {
		return rep;
	}
	
	@Override
	public boolean equals(Object oth) {
		if (oth == null || !(oth instanceof ExprWrapper)) {
			return false;
		}
		ExprWrapper eo = (ExprWrapper) oth;
		eo.forceUnparse();
		this.forceUnparse();
		return this.unparsed.equals(eo.unparsed);			
	}

	/** Make sure that unparsed is defined and not null. */
	private void forceUnparse() {
		if (unparsed == null) {
			unparsed = wlup.unparse(rep);
		}	
	}
	
	@Override
	public int hashCode() {
		this.forceUnparse();
		return this.unparsed.hashCode();
	}
	
	@Override
	public String toString() {
		this.forceUnparse();
		return this.unparsed;
	}
}
