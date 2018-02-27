package edu.ucf.cs.whilelang.validation;

import edu.ucf.cs.whilelang.utility.AnalysisFun;
import edu.ucf.cs.whilelang.utility.FVAsMap;
import edu.ucf.cs.whilelang.utility.FunctionVector;
import edu.ucf.cs.whilelang.utility.PropertyVector;
import edu.ucf.cs.whilelang.utility.RDPropertySpace;
import edu.ucf.cs.whilelang.whileLang.AssignS;
import edu.ucf.cs.whilelang.whileLang.Program;
import edu.ucf.cs.whilelang.whileLang.S;
import edu.ucf.cs.whilelang.whileLang.SkipS;
import java.util.Arrays;
import org.eclipse.emf.ecore.EObject;

/**
 * This class constructs the Reaching Definitions (RD) analysis for the given program.
 * See Sections 1.3 and 2.1.2 of "Principles of Program Analysis"
 * by Nielsen, Nielsen, and Hankin (Springer-Verlag, 1999 and 2005).
 */
@SuppressWarnings("all")
public class WhileLangRDAnalysis {
  /**
   * The program's statement.
   */
  private S progBody;
  
  /**
   * The Function Vector that represents the RD analysis for this program.
   */
  private final FunctionVector<Integer, RDPropertySpace> RDFunVec = new FVAsMap<Integer, RDPropertySpace>();
  
  /**
   * The Property Vector that is the fixed point of the RD analysis
   * for this program.
   */
  public PropertyVector<Integer, RDPropertySpace> RDTuple;
  
  /**
   * Initialize the function vector and property vector.
   */
  public void WhileLangRDAnalysis(final Program p) {
    throw new Error("Unresolved compilation problems:"
      + "\nInvalid number of arguments. The method put(K, V) is not applicable for the arguments (Integer)");
  }
  
  public Object computeAnalysis() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field RDFunVec is undefined for the type PropertyVector<Integer, RDPropertySpace>"
      + "\nfix cannot be resolved");
  }
  
  protected AnalysisFun<Integer, PropertyVector<Integer, RDPropertySpace>> _funFor(final AssignS s) {
    throw new Error("Unresolved compilation problems:"
      + "\nBounds mismatch: The type arguments <Integer, PropertyVector<Integer, RDPropertySpace>> are not a valid substitute for the bounded type parameters <Label, L extends PropertySpace> of the constructor new AnalysisFun<Integer, PropertyVector<Integer, RDPropertySpace>>(){}()");
  }
  
  protected AnalysisFun<Integer, PropertyVector<Integer, RDPropertySpace>> _funFor(final SkipS s) {
    throw new Error("Unresolved compilation problems:"
      + "\nBounds mismatch: The type arguments <Integer, PropertyVector<Integer, RDPropertySpace>> are not a valid substitute for the bounded type parameters <Label, L extends PropertySpace> of the constructor new AnalysisFun<Integer, PropertyVector<Integer, RDPropertySpace>>(){}()"
      + "\nInvalid number of arguments. The method get(Access, Label) is not applicable without arguments"
      + "\nType mismatch: cannot convert from RDPropertySpace to PropertyVector<Integer, RDPropertySpace>");
  }
  
  public AnalysisFun<Integer, PropertyVector<Integer, RDPropertySpace>> funFor(final EObject s) {
    if (s instanceof AssignS) {
      return _funFor((AssignS)s);
    } else if (s instanceof SkipS) {
      return _funFor((SkipS)s);
    } else {
      throw new IllegalArgumentException("Unhandled parameter types: " +
        Arrays.<Object>asList(s).toString());
    }
  }
}
