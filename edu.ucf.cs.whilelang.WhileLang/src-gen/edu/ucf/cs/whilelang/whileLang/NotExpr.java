/**
 * generated by Xtext 2.13.0
 */
package edu.ucf.cs.whilelang.whileLang;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Not Expr</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link edu.ucf.cs.whilelang.whileLang.NotExpr#getBexp <em>Bexp</em>}</li>
 * </ul>
 * </p>
 *
 * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#getNotExpr()
 * @model
 * @generated
 */
public interface NotExpr extends Expr
{
  /**
   * Returns the value of the '<em><b>Bexp</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Bexp</em>' containment reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Bexp</em>' containment reference.
   * @see #setBexp(Expr)
   * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#getNotExpr_Bexp()
   * @model containment="true"
   * @generated
   */
  Expr getBexp();

  /**
   * Sets the value of the '{@link edu.ucf.cs.whilelang.whileLang.NotExpr#getBexp <em>Bexp</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Bexp</em>' containment reference.
   * @see #getBexp()
   * @generated
   */
  void setBexp(Expr value);

} // NotExpr
