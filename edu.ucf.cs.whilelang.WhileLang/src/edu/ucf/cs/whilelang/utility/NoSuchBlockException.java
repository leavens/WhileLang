package edu.ucf.cs.whilelang.utility;

public class NoSuchBlockException extends RuntimeException {
	private static final long serialVersionUID = 8468954940907211613L;

	NoSuchBlockException(String msg) {
		super(msg);
	}
}
