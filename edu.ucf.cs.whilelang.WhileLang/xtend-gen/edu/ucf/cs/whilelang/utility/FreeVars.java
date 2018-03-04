package edu.ucf.cs.whilelang.utility;

import edu.ucf.cs.whilelang.utility.ASTExtensions;
import edu.ucf.cs.whilelang.whileLang.AssertS;
import edu.ucf.cs.whilelang.whileLang.AssignS;
import edu.ucf.cs.whilelang.whileLang.BoolLitExpr;
import edu.ucf.cs.whilelang.whileLang.CompoundS;
import edu.ucf.cs.whilelang.whileLang.Expr;
import edu.ucf.cs.whilelang.whileLang.IfS;
import edu.ucf.cs.whilelang.whileLang.LabeledExp;
import edu.ucf.cs.whilelang.whileLang.NotExpr;
import edu.ucf.cs.whilelang.whileLang.NumLitExpr;
import edu.ucf.cs.whilelang.whileLang.S;
import edu.ucf.cs.whilelang.whileLang.SignedNum;
import edu.ucf.cs.whilelang.whileLang.SkipS;
import edu.ucf.cs.whilelang.whileLang.VarRefExpr;
import edu.ucf.cs.whilelang.whileLang.WhileS;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;

/**
 * The FV method computes the set of free variables in an expression.
 */
@SuppressWarnings("all")
public class FreeVars {
  /**
   * Return the set of Free Variables in the given expression.
   */
  protected Set<String> _FV(final VarRefExpr v) {
    final HashSet<String> ret = new HashSet<String>();
    ret.add(v.getVname());
    return ret;
  }
  
  /**
   * Return the set of Free Variables in the given expression.
   */
  protected Set<String> _FV(final NumLitExpr n) {
    return new HashSet<String>();
  }
  
  /**
   * Return the set of Free Variables in the given expression.
   */
  protected Set<String> _FV(final SignedNum n) {
    return new HashSet<String>();
  }
  
  /**
   * Return the set of Free Variables in the given expression.
   */
  protected Set<String> _FV(final BoolLitExpr b) {
    return new HashSet<String>();
  }
  
  /**
   * Return the set of Free Variables in the given expression.
   */
  protected Set<String> _FV(final NotExpr n) {
    return this.FV(n.getBexp());
  }
  
  /**
   * Return the set of Free Variables in the given expression.
   */
  protected Set<String> _FV(final Expr e) {
    final HashSet<String> ret = new HashSet<String>();
    ret.addAll(this.FV(ASTExtensions.leftSubExp(e)));
    ret.addAll(this.FV(ASTExtensions.rightSubExp(e)));
    return ret;
  }
  
  /**
   * Return the set of free variables used in the given labeled expression.
   */
  protected Set<String> _FV(final LabeledExp labe) {
    return this.FV(labe.getBe());
  }
  
  /**
   * Return the set of free variables used in the given statement.
   */
  protected Set<String> _FV(final AssignS s) {
    final HashSet<String> ret = new HashSet<String>();
    ret.add(s.getV());
    ret.addAll(this.FV(s.getAexp()));
    return ret;
  }
  
  /**
   * Return the set of free variables used in the given statement.
   */
  protected Set<String> _FV(final SkipS s) {
    return new HashSet<String>();
  }
  
  /**
   * Return the set of free variables used in the given statement.
   */
  protected Set<String> _FV(final CompoundS blk) {
    final HashSet<String> ret = new HashSet<String>();
    EList<S> _stmts = blk.getStmts();
    for (final S s : _stmts) {
      ret.addAll(this.FV(s));
    }
    return ret;
  }
  
  /**
   * Return the set of free variables used in the given statement.
   */
  protected Set<String> _FV(final WhileS s) {
    final HashSet<String> ret = new HashSet<String>();
    ret.addAll(this.FV(s.getBexp()));
    ret.addAll(this.FV(s.getBlock()));
    return ret;
  }
  
  /**
   * Return the set of free variables used in the given statement.
   */
  protected Set<String> _FV(final IfS s) {
    final HashSet<String> ret = new HashSet<String>();
    ret.addAll(this.FV(s.getBexp()));
    ret.addAll(this.FV(s.getS1()));
    ret.addAll(this.FV(s.getS2()));
    return ret;
  }
  
  /**
   * Return the set of free variables used in the given statement.
   */
  protected Set<String> _FV(final AssertS s) {
    final HashSet<String> ret = new HashSet<String>();
    ret.addAll(this.FV(s.getBexp()));
    return ret;
  }
  
  public Set<String> FV(final EObject s) {
    if (s instanceof AssertS) {
      return _FV((AssertS)s);
    } else if (s instanceof AssignS) {
      return _FV((AssignS)s);
    } else if (s instanceof BoolLitExpr) {
      return _FV((BoolLitExpr)s);
    } else if (s instanceof CompoundS) {
      return _FV((CompoundS)s);
    } else if (s instanceof IfS) {
      return _FV((IfS)s);
    } else if (s instanceof LabeledExp) {
      return _FV((LabeledExp)s);
    } else if (s instanceof NotExpr) {
      return _FV((NotExpr)s);
    } else if (s instanceof NumLitExpr) {
      return _FV((NumLitExpr)s);
    } else if (s instanceof SignedNum) {
      return _FV((SignedNum)s);
    } else if (s instanceof SkipS) {
      return _FV((SkipS)s);
    } else if (s instanceof VarRefExpr) {
      return _FV((VarRefExpr)s);
    } else if (s instanceof WhileS) {
      return _FV((WhileS)s);
    } else if (s instanceof Expr) {
      return _FV((Expr)s);
    } else {
      throw new IllegalArgumentException("Unhandled parameter types: " +
        Arrays.<Object>asList(s).toString());
    }
  }
}
