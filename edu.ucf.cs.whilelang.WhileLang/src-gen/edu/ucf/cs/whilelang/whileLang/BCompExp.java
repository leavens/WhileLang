/**
 * generated by Xtext 2.13.0
 */
package edu.ucf.cs.whilelang.whileLang;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>BComp Exp</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link edu.ucf.cs.whilelang.whileLang.BCompExp#getLeft <em>Left</em>}</li>
 *   <li>{@link edu.ucf.cs.whilelang.whileLang.BCompExp#getOp <em>Op</em>}</li>
 *   <li>{@link edu.ucf.cs.whilelang.whileLang.BCompExp#getRight <em>Right</em>}</li>
 * </ul>
 *
 * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#getBCompExp()
 * @model
 * @generated
 */
public interface BCompExp extends BExpr
{
  /**
   * Returns the value of the '<em><b>Left</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Left</em>' containment reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Left</em>' containment reference.
   * @see #setLeft(AExpr)
   * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#getBCompExp_Left()
   * @model containment="true"
   * @generated
   */
  AExpr getLeft();

  /**
   * Sets the value of the '{@link edu.ucf.cs.whilelang.whileLang.BCompExp#getLeft <em>Left</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Left</em>' containment reference.
   * @see #getLeft()
   * @generated
   */
  void setLeft(AExpr value);

  /**
   * Returns the value of the '<em><b>Op</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Op</em>' attribute isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Op</em>' attribute.
   * @see #setOp(String)
   * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#getBCompExp_Op()
   * @model
   * @generated
   */
  String getOp();

  /**
   * Sets the value of the '{@link edu.ucf.cs.whilelang.whileLang.BCompExp#getOp <em>Op</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Op</em>' attribute.
   * @see #getOp()
   * @generated
   */
  void setOp(String value);

  /**
   * Returns the value of the '<em><b>Right</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Right</em>' containment reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Right</em>' containment reference.
   * @see #setRight(AExpr)
   * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#getBCompExp_Right()
   * @model containment="true"
   * @generated
   */
  AExpr getRight();

  /**
   * Sets the value of the '{@link edu.ucf.cs.whilelang.whileLang.BCompExp#getRight <em>Right</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Right</em>' containment reference.
   * @see #getRight()
   * @generated
   */
  void setRight(AExpr value);

} // BCompExp
