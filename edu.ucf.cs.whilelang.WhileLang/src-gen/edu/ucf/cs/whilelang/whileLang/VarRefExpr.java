/**
 * generated by Xtext 2.13.0
 */
package edu.ucf.cs.whilelang.whileLang;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Var Ref Expr</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link edu.ucf.cs.whilelang.whileLang.VarRefExpr#getVname <em>Vname</em>}</li>
 * </ul>
 *
 * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#getVarRefExpr()
 * @model
 * @generated
 */
public interface VarRefExpr extends Expr
{
  /**
   * Returns the value of the '<em><b>Vname</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Vname</em>' attribute isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Vname</em>' attribute.
   * @see #setVname(String)
   * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#getVarRefExpr_Vname()
   * @model
   * @generated
   */
  String getVname();

  /**
   * Sets the value of the '{@link edu.ucf.cs.whilelang.whileLang.VarRefExpr#getVname <em>Vname</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Vname</em>' attribute.
   * @see #getVname()
   * @generated
   */
  void setVname(String value);

} // VarRefExpr
