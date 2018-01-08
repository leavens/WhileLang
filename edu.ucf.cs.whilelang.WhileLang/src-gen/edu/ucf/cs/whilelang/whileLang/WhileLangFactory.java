/**
 * generated by Xtext 2.13.0
 */
package edu.ucf.cs.whilelang.whileLang;

import org.eclipse.emf.ecore.EFactory;

/**
 * <!-- begin-user-doc -->
 * The <b>Factory</b> for the model.
 * It provides a create method for each non-abstract class of the model.
 * <!-- end-user-doc -->
 * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage
 * @generated
 */
public interface WhileLangFactory extends EFactory
{
  /**
   * The singleton instance of the factory.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  WhileLangFactory eINSTANCE = edu.ucf.cs.whilelang.whileLang.impl.WhileLangFactoryImpl.init();

  /**
   * Returns a new object of class '<em>Program</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>Program</em>'.
   * @generated
   */
  Program createProgram();

  /**
   * Returns a new object of class '<em>S</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>S</em>'.
   * @generated
   */
  S createS();

  /**
   * Returns a new object of class '<em>Compound S</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>Compound S</em>'.
   * @generated
   */
  CompoundS createCompoundS();

  /**
   * Returns a new object of class '<em>Assign S</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>Assign S</em>'.
   * @generated
   */
  AssignS createAssignS();

  /**
   * Returns a new object of class '<em>Skip S</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>Skip S</em>'.
   * @generated
   */
  SkipS createSkipS();

  /**
   * Returns a new object of class '<em>While S</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>While S</em>'.
   * @generated
   */
  WhileS createWhileS();

  /**
   * Returns a new object of class '<em>If S</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>If S</em>'.
   * @generated
   */
  IfS createIfS();

  /**
   * Returns a new object of class '<em>AExpr</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>AExpr</em>'.
   * @generated
   */
  AExpr createAExpr();

  /**
   * Returns a new object of class '<em>Var Ref Expr</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>Var Ref Expr</em>'.
   * @generated
   */
  VarRefExpr createVarRefExpr();

  /**
   * Returns a new object of class '<em>Num Lit Expr</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>Num Lit Expr</em>'.
   * @generated
   */
  NumLitExpr createNumLitExpr();

  /**
   * Returns a new object of class '<em>BExpr</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>BExpr</em>'.
   * @generated
   */
  BExpr createBExpr();

  /**
   * Returns a new object of class '<em>Not Expr</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>Not Expr</em>'.
   * @generated
   */
  NotExpr createNotExpr();

  /**
   * Returns a new object of class '<em>BComp Exp</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>BComp Exp</em>'.
   * @generated
   */
  BCompExp createBCompExp();

  /**
   * Returns a new object of class '<em>BPrimary</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>BPrimary</em>'.
   * @generated
   */
  BPrimary createBPrimary();

  /**
   * Returns a new object of class '<em>AExpression</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>AExpression</em>'.
   * @generated
   */
  AExpression createAExpression();

  /**
   * Returns a new object of class '<em>ATerm</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>ATerm</em>'.
   * @generated
   */
  ATerm createATerm();

  /**
   * Returns a new object of class '<em>BExpression</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>BExpression</em>'.
   * @generated
   */
  BExpression createBExpression();

  /**
   * Returns a new object of class '<em>BTerm</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>BTerm</em>'.
   * @generated
   */
  BTerm createBTerm();

  /**
   * Returns the package supported by this factory.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the package supported by this factory.
   * @generated
   */
  WhileLangPackage getWhileLangPackage();

} //WhileLangFactory
