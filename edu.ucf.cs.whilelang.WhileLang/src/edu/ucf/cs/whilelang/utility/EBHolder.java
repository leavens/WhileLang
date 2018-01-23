package edu.ucf.cs.whilelang.utility;

import edu.ucf.cs.whilelang.whileLang.AssignS;
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock;
import edu.ucf.cs.whilelang.whileLang.LabeledExp;
import edu.ucf.cs.whilelang.whileLang.SkipS;

/** Objects that can hold an ElementaryBlock, for use in hashed sets and maps. */
public class EBHolder {
	private final ElementaryBlock bl;
	
	/** Initialize this holder with the block eb. */
	public EBHolder(/*@ non_null @*/ ElementaryBlock eb) {
		bl = eb;
	}
	
	@Override
	public boolean equals(Object oth) {
		if (oth == null || !(oth instanceof ElementaryBlock)) { return false; }
        ElementaryBlock b = (ElementaryBlock) oth;
        return this.getLabel() == new EBHolder(b).getLabel();
	}
	
	/** Return the block in this holder */
	public ElementaryBlock getBlock() {
		return bl;
	}
	
	/** Return the label of this holder's block. */
	public int getLabel() {
		if (bl instanceof AssignS) {
			return ((AssignS) bl).getLabel();
		} else if (bl instanceof SkipS) {
			return ((SkipS) bl).getLabel();
		} else if (bl instanceof LabeledExp) {
			return ((LabeledExp) bl).getLabel();
		} else {
			throw new IllegalArgumentException("getLabel in EBHolder can't get label of " 
											  + bl.toString());
		}
	}
	
	@Override
	/** Return a hash code for this block holder. */
	public int hashCode() {
		return this.getLabel();
	}
}
