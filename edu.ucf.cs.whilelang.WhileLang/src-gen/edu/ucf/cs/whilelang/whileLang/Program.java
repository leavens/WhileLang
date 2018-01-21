/**
 * generated by Xtext 2.13.0
 */
package edu.ucf.cs.whilelang.whileLang;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Program</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link edu.ucf.cs.whilelang.whileLang.Program#getName <em>Name</em>}</li>
 *   <li>{@link edu.ucf.cs.whilelang.whileLang.Program#getArgs <em>Args</em>}</li>
 *   <li>{@link edu.ucf.cs.whilelang.whileLang.Program#getBody <em>Body</em>}</li>
 * </ul>
 * </p>
 *
 * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#getProgram()
 * @model
 * @generated
 */
public interface Program extends EObject
{
  /**
   * Returns the value of the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Name</em>' attribute isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Name</em>' attribute.
   * @see #setName(String)
   * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#getProgram_Name()
   * @model
   * @generated
   */
  String getName();

  /**
   * Sets the value of the '{@link edu.ucf.cs.whilelang.whileLang.Program#getName <em>Name</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Name</em>' attribute.
   * @see #getName()
   * @generated
   */
  void setName(String value);

  /**
   * Returns the value of the '<em><b>Args</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Args</em>' containment reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Args</em>' containment reference.
   * @see #setArgs(Formals)
   * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#getProgram_Args()
   * @model containment="true"
   * @generated
   */
  Formals getArgs();

  /**
   * Sets the value of the '{@link edu.ucf.cs.whilelang.whileLang.Program#getArgs <em>Args</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Args</em>' containment reference.
   * @see #getArgs()
   * @generated
   */
  void setArgs(Formals value);

  /**
   * Returns the value of the '<em><b>Body</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Body</em>' containment reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Body</em>' containment reference.
   * @see #setBody(S)
   * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#getProgram_Body()
   * @model containment="true"
   * @generated
   */
  S getBody();

  /**
   * Sets the value of the '{@link edu.ucf.cs.whilelang.whileLang.Program#getBody <em>Body</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Body</em>' containment reference.
   * @see #getBody()
   * @generated
   */
  void setBody(S value);

} // Program
