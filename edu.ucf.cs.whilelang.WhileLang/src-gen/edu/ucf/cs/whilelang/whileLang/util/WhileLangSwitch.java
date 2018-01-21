/**
 * generated by Xtext 2.13.0
 */
package edu.ucf.cs.whilelang.whileLang.util;

import edu.ucf.cs.whilelang.whileLang.*;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.util.Switch;

/**
 * <!-- begin-user-doc -->
 * The <b>Switch</b> for the model's inheritance hierarchy.
 * It supports the call {@link #doSwitch(EObject) doSwitch(object)}
 * to invoke the <code>caseXXX</code> method for each class of the model,
 * starting with the actual class of the object
 * and proceeding up the inheritance hierarchy
 * until a non-null result is returned,
 * which is the result of the switch.
 * <!-- end-user-doc -->
 * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage
 * @generated
 */
public class WhileLangSwitch<T> extends Switch<T>
{
  /**
   * The cached model package
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected static WhileLangPackage modelPackage;

  /**
   * Creates an instance of the switch.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public WhileLangSwitch()
  {
    if (modelPackage == null)
    {
      modelPackage = WhileLangPackage.eINSTANCE;
    }
  }

  /**
   * Checks whether this is a switch for the given package.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @parameter ePackage the package in question.
   * @return whether this is a switch for the given package.
   * @generated
   */
  @Override
  protected boolean isSwitchFor(EPackage ePackage)
  {
    return ePackage == modelPackage;
  }

  /**
   * Calls <code>caseXXX</code> for each class of the model until one returns a non null result; it yields that result.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the first non-null result returned by a <code>caseXXX</code> call.
   * @generated
   */
  @Override
  protected T doSwitch(int classifierID, EObject theEObject)
  {
    switch (classifierID)
    {
      case WhileLangPackage.PROGRAM:
      {
        Program program = (Program)theEObject;
        T result = caseProgram(program);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.FORMALS:
      {
        Formals formals = (Formals)theEObject;
        T result = caseFormals(formals);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.S:
      {
        S s = (S)theEObject;
        T result = caseS(s);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.COMPOUND_S:
      {
        CompoundS compoundS = (CompoundS)theEObject;
        T result = caseCompoundS(compoundS);
        if (result == null) result = caseS(compoundS);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.ASSIGN_S:
      {
        AssignS assignS = (AssignS)theEObject;
        T result = caseAssignS(assignS);
        if (result == null) result = caseS(assignS);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.SKIP_S:
      {
        SkipS skipS = (SkipS)theEObject;
        T result = caseSkipS(skipS);
        if (result == null) result = caseS(skipS);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.WHILE_S:
      {
        WhileS whileS = (WhileS)theEObject;
        T result = caseWhileS(whileS);
        if (result == null) result = caseS(whileS);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.IF_S:
      {
        IfS ifS = (IfS)theEObject;
        T result = caseIfS(ifS);
        if (result == null) result = caseS(ifS);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.LABELED_EXP:
      {
        LabeledExp labeledExp = (LabeledExp)theEObject;
        T result = caseLabeledExp(labeledExp);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.EXPR:
      {
        Expr expr = (Expr)theEObject;
        T result = caseExpr(expr);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.VAR_REF_EXPR:
      {
        VarRefExpr varRefExpr = (VarRefExpr)theEObject;
        T result = caseVarRefExpr(varRefExpr);
        if (result == null) result = caseExpr(varRefExpr);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.NUM_LIT_EXPR:
      {
        NumLitExpr numLitExpr = (NumLitExpr)theEObject;
        T result = caseNumLitExpr(numLitExpr);
        if (result == null) result = caseExpr(numLitExpr);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.BOOL_LIT_EXPR:
      {
        BoolLitExpr boolLitExpr = (BoolLitExpr)theEObject;
        T result = caseBoolLitExpr(boolLitExpr);
        if (result == null) result = caseExpr(boolLitExpr);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.NOT_EXPR:
      {
        NotExpr notExpr = (NotExpr)theEObject;
        T result = caseNotExpr(notExpr);
        if (result == null) result = caseExpr(notExpr);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.BDISJ:
      {
        BDisj bDisj = (BDisj)theEObject;
        T result = caseBDisj(bDisj);
        if (result == null) result = caseExpr(bDisj);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.BCONJ:
      {
        BConj bConj = (BConj)theEObject;
        T result = caseBConj(bConj);
        if (result == null) result = caseExpr(bConj);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.BREL_EXP:
      {
        BRelExp bRelExp = (BRelExp)theEObject;
        T result = caseBRelExp(bRelExp);
        if (result == null) result = caseExpr(bRelExp);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.AEXPRESSION:
      {
        AExpression aExpression = (AExpression)theEObject;
        T result = caseAExpression(aExpression);
        if (result == null) result = caseExpr(aExpression);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case WhileLangPackage.FACTOR:
      {
        Factor factor = (Factor)theEObject;
        T result = caseFactor(factor);
        if (result == null) result = caseExpr(factor);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      default: return defaultCase(theEObject);
    }
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Program</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Program</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseProgram(Program object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Formals</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Formals</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseFormals(Formals object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>S</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>S</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseS(S object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Compound S</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Compound S</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseCompoundS(CompoundS object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Assign S</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Assign S</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseAssignS(AssignS object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Skip S</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Skip S</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseSkipS(SkipS object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>While S</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>While S</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseWhileS(WhileS object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>If S</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>If S</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseIfS(IfS object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Labeled Exp</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Labeled Exp</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseLabeledExp(LabeledExp object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Expr</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Expr</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseExpr(Expr object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Var Ref Expr</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Var Ref Expr</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseVarRefExpr(VarRefExpr object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Num Lit Expr</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Num Lit Expr</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseNumLitExpr(NumLitExpr object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Bool Lit Expr</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Bool Lit Expr</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseBoolLitExpr(BoolLitExpr object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Not Expr</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Not Expr</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseNotExpr(NotExpr object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>BDisj</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>BDisj</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseBDisj(BDisj object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>BConj</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>BConj</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseBConj(BConj object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>BRel Exp</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>BRel Exp</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseBRelExp(BRelExp object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>AExpression</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>AExpression</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseAExpression(AExpression object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Factor</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Factor</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseFactor(Factor object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>EObject</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch, but this is the last case anyway.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>EObject</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject)
   * @generated
   */
  @Override
  public T defaultCase(EObject object)
  {
    return null;
  }

} //WhileLangSwitch
