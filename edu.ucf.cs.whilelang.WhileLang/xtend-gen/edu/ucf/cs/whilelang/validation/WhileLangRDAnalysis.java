package edu.ucf.cs.whilelang.validation;

import edu.ucf.cs.whilelang.utility.ASTExtensions;
import edu.ucf.cs.whilelang.utility.Access;
import edu.ucf.cs.whilelang.utility.AnalysisFun;
import edu.ucf.cs.whilelang.utility.CFG;
import edu.ucf.cs.whilelang.utility.FVAsMap;
import edu.ucf.cs.whilelang.utility.FunctionVector;
import edu.ucf.cs.whilelang.utility.MaybeLabel;
import edu.ucf.cs.whilelang.utility.PVAsMap;
import edu.ucf.cs.whilelang.utility.Pair;
import edu.ucf.cs.whilelang.utility.PropertyVector;
import edu.ucf.cs.whilelang.utility.RDPropertySpace;
import edu.ucf.cs.whilelang.whileLang.AssignS;
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock;
import edu.ucf.cs.whilelang.whileLang.Formals;
import edu.ucf.cs.whilelang.whileLang.LabeledExp;
import edu.ucf.cs.whilelang.whileLang.Program;
import edu.ucf.cs.whilelang.whileLang.S;
import edu.ucf.cs.whilelang.whileLang.SkipS;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.function.Predicate;
import org.eclipse.emf.common.util.EList;

/**
 * This class constructs the Reaching Definitions (RD) analysis for the given program.
 * See Sections 1.3 and 2.1.2 of "Principles of Program Analysis"
 * by Nielsen, Nielsen, and Hankin (Springer-Verlag, 1999 and 2005).
 */
@SuppressWarnings("all")
public class WhileLangRDAnalysis {
  /**
   * This program's statement.
   */
  private S progBody;
  
  public final Set<String> inFormals = new HashSet<String>();
  
  /**
   * The Function Vector that represents the RD analysis for this program.
   */
  private FunctionVector<Integer, RDPropertySpace> RDFunVec;
  
  /**
   * The Property Vector that is the fixed point of the RD analysis
   * for this program.
   */
  public PropertyVector<Integer, RDPropertySpace> RDInfo;
  
  /**
   * Initialize the function vector and property vector.
   */
  public WhileLangRDAnalysis(final Program p) {
    this.progBody = p.getBody();
    Formals _vformals = p.getVformals();
    boolean _tripleNotEquals = (_vformals != null);
    if (_tripleNotEquals) {
      EList<String> _names = p.getVformals().getNames();
      for (final String vf : _names) {
        this.inFormals.add(vf);
      }
    }
    final HashMap<Integer, AnalysisFun<Integer, RDPropertySpace>> entryfuns = new HashMap<Integer, AnalysisFun<Integer, RDPropertySpace>>();
    final HashMap<Integer, AnalysisFun<Integer, RDPropertySpace>> exitfuns = new HashMap<Integer, AnalysisFun<Integer, RDPropertySpace>>();
    Set<Integer> _labels = CFG.labels(this.progBody);
    for (final Integer lab : _labels) {
      {
        final ElementaryBlock bl = CFG.itsBlockMap.get(lab);
        entryfuns.put(lab, this.entryFunFor(bl));
        exitfuns.put(lab, this.exitFunFor(bl));
      }
    }
    FVAsMap<Integer, RDPropertySpace> _fVAsMap = new FVAsMap<Integer, RDPropertySpace>(entryfuns, exitfuns);
    this.RDFunVec = _fVAsMap;
  }
  
  /**
   * Compute the Reaching Definitions analysis (the RDInfo static field).
   */
  public PropertyVector<Integer, RDPropertySpace> computeAnalysis() {
    PropertyVector<Integer, RDPropertySpace> _xblockexpression = null;
    {
      final Set<Integer> labels = CFG.labels(this.progBody);
      RDPropertySpace _rDPropertySpace = new RDPropertySpace();
      final PVAsMap<Integer, RDPropertySpace> botvec = new PVAsMap<Integer, RDPropertySpace>(labels, _rDPropertySpace);
      _xblockexpression = this.RDInfo = this.RDFunVec.fix(labels, botvec);
    }
    return _xblockexpression;
  }
  
  /**
   * Return the exit function for the given elementary block argument.
   */
  public AnalysisFun<Integer, RDPropertySpace> entryFunFor(final ElementaryBlock block) {
    return new AnalysisFun<Integer, RDPropertySpace>() {
      @Override
      public RDPropertySpace apply(final PropertyVector<Integer, RDPropertySpace> arg) {
        RDPropertySpace _xifexpression = null;
        int _init = CFG.init(WhileLangRDAnalysis.this.progBody);
        int _itsLabel = ASTExtensions.itsLabel(block);
        boolean _equals = (_init == _itsLabel);
        if (_equals) {
          MaybeLabel _maybeLabel = new MaybeLabel();
          _xifexpression = new RDPropertySpace(WhileLangRDAnalysis.this.inFormals, _maybeLabel);
        } else {
          RDPropertySpace ret = new RDPropertySpace();
          final HashSet<RDPropertySpace> rdInfoSet = new HashSet<RDPropertySpace>();
          Set<Map.Entry<Integer, Integer>> _get = CFG.cfgMap.get(WhileLangRDAnalysis.this.progBody);
          for (final Map.Entry<Integer, Integer> lab_pair : _get) {
            Integer _value = lab_pair.getValue();
            int _itsLabel_1 = ASTExtensions.itsLabel(block);
            boolean _equals_1 = ((_value).intValue() == _itsLabel_1);
            if (_equals_1) {
              rdInfoSet.add(arg.get(Access.EXIT, lab_pair.getKey()));
            }
          }
          ret.joinAll(rdInfoSet);
          return ret;
        }
        return _xifexpression;
      }
    };
  }
  
  /**
   * Return the exit function for the given elementary block argument.
   */
  protected AnalysisFun<Integer, RDPropertySpace> _exitFunFor(final AssignS s) {
    return new AnalysisFun<Integer, RDPropertySpace>() {
      @Override
      public RDPropertySpace apply(final PropertyVector<Integer, RDPropertySpace> arg) {
        final RDPropertySpace entryInfo = arg.get(Access.ENTRY, Integer.valueOf(s.getLabel()));
        final RDPropertySpace ret = entryInfo.copy();
        ret.removeIf(new Predicate<Pair<String, MaybeLabel>>() {
          @Override
          public boolean test(final Pair<String, MaybeLabel> p) {
            return p.getKey().equals(s.getV());
          }
        });
        String _v = s.getV();
        int _label = s.getLabel();
        MaybeLabel _maybeLabel = new MaybeLabel(_label);
        RDPropertySpace _rDPropertySpace = new RDPropertySpace(_v, _maybeLabel);
        ret.join(_rDPropertySpace);
        return ret;
      }
    };
  }
  
  /**
   * Return the exit function for the given elementary block argument.
   */
  protected AnalysisFun<Integer, RDPropertySpace> _exitFunFor(final SkipS s) {
    return new AnalysisFun<Integer, RDPropertySpace>() {
      @Override
      public RDPropertySpace apply(final PropertyVector<Integer, RDPropertySpace> arg) {
        return arg.get(Access.ENTRY, Integer.valueOf(s.getLabel())).copy();
      }
    };
  }
  
  /**
   * Return the exit function for the given elementary block argument.
   */
  protected AnalysisFun<Integer, RDPropertySpace> _exitFunFor(final LabeledExp s) {
    return new AnalysisFun<Integer, RDPropertySpace>() {
      @Override
      public RDPropertySpace apply(final PropertyVector<Integer, RDPropertySpace> arg) {
        return arg.get(Access.ENTRY, Integer.valueOf(s.getLabel())).copy();
      }
    };
  }
  
  public AnalysisFun<Integer, RDPropertySpace> exitFunFor(final ElementaryBlock s) {
    if (s instanceof AssignS) {
      return _exitFunFor((AssignS)s);
    } else if (s instanceof LabeledExp) {
      return _exitFunFor((LabeledExp)s);
    } else if (s instanceof SkipS) {
      return _exitFunFor((SkipS)s);
    } else {
      throw new IllegalArgumentException("Unhandled parameter types: " +
        Arrays.<Object>asList(s).toString());
    }
  }
}
