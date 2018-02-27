package edu.ucf.cs.whilelang.utility;

import com.google.common.base.Objects;
import edu.ucf.cs.whilelang.whileLang.BConj;
import edu.ucf.cs.whilelang.whileLang.BDisj;
import edu.ucf.cs.whilelang.whileLang.BRelExp;
import edu.ucf.cs.whilelang.whileLang.BoolLitExpr;
import edu.ucf.cs.whilelang.whileLang.Expr;
import edu.ucf.cs.whilelang.whileLang.Factor;
import edu.ucf.cs.whilelang.whileLang.NotExpr;
import edu.ucf.cs.whilelang.whileLang.NumLitExpr;
import edu.ucf.cs.whilelang.whileLang.SignedNum;
import edu.ucf.cs.whilelang.whileLang.VarRefExpr;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

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
    ret.addAll(this.FV(this.getLeft(e)));
    ret.addAll(this.FV(this.getRight(e)));
    return ret;
  }
  
  /**
   * Return the left subexpression.
   */
  public Expr getLeft(final Expr expr) {
    Expr _switchResult = null;
    boolean _matched = false;
    if (Objects.equal(expr, BDisj.class)) {
      _matched=true;
      _switchResult = this.getLeft(expr);
    }
    if (!_matched) {
      if (Objects.equal(expr, BConj.class)) {
        _matched=true;
        _switchResult = this.getLeft(expr);
      }
    }
    if (!_matched) {
      if (Objects.equal(expr, BRelExp.class)) {
        _matched=true;
        _switchResult = this.getLeft(expr);
      }
    }
    if (!_matched) {
      if (Objects.equal(expr, Factor.class)) {
        _matched=true;
        _switchResult = this.getLeft(expr);
      }
    }
    if (!_matched) {
      throw new RuntimeException("Missing case in getLeft for Expr");
    }
    return _switchResult;
  }
  
  /**
   * Return the right subexpression.
   */
  public Expr getRight(final Expr expr) {
    Expr _switchResult = null;
    boolean _matched = false;
    if (Objects.equal(expr, BDisj.class)) {
      _matched=true;
      _switchResult = this.getRight(expr);
    }
    if (!_matched) {
      if (Objects.equal(expr, BConj.class)) {
        _matched=true;
        _switchResult = this.getRight(expr);
      }
    }
    if (!_matched) {
      if (Objects.equal(expr, BRelExp.class)) {
        _matched=true;
        _switchResult = this.getRight(expr);
      }
    }
    if (!_matched) {
      if (Objects.equal(expr, Factor.class)) {
        _matched=true;
        _switchResult = this.getRight(expr);
      }
    }
    if (!_matched) {
      throw new RuntimeException("Missing case in getRight for Expr");
    }
    return _switchResult;
  }
  
  public Set<String> FV(final Expr b) {
    if (b instanceof BoolLitExpr) {
      return _FV((BoolLitExpr)b);
    } else if (b instanceof NotExpr) {
      return _FV((NotExpr)b);
    } else if (b instanceof NumLitExpr) {
      return _FV((NumLitExpr)b);
    } else if (b instanceof SignedNum) {
      return _FV((SignedNum)b);
    } else if (b instanceof VarRefExpr) {
      return _FV((VarRefExpr)b);
    } else if (b != null) {
      return _FV(b);
    } else {
      throw new IllegalArgumentException("Unhandled parameter types: " +
        Arrays.<Object>asList(b).toString());
    }
  }
}
