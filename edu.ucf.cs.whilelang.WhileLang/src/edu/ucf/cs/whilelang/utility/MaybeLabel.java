package edu.ucf.cs.whilelang.utility;

/** Either a label, which is an int, or none (i.e., '?'). */
public class MaybeLabel {
	protected int value;
	
	/** Initialize this to be a question mark label. */
	public MaybeLabel() {
		value = -1;
	}
	
	/** Initialize this to be the label lab. */
	//@ requires lab > 0;
	public MaybeLabel(int lab) {
		value = lab;
	}

	/** Is this a question mark label? */
	public boolean isQuestionMark() {
		return value < 0;
	}
	
	/** Return true when this object is the same label as oth (as a label) */
	public boolean equals(Object oth) {
		if (oth == null || !(oth instanceof MaybeLabel)) {
			return false;
		}
		MaybeLabel ol = (MaybeLabel) oth;
		return ol.value == value;
	}

	/** return a hash code for this object */
	public int hashCode() {
		return value;
	}
	
	/** Return a string representation of this label. */
	public String toString() {
		if (!isQuestionMark()) {
			return Integer.toString(value);
		} else {
			return "?";
		}
	}
}
