/**
 * generated by Xtext 2.13.0
 */
package edu.ucf.cs.whilelang.whileLang.util;

import edu.ucf.cs.whilelang.whileLang.*;

import org.eclipse.emf.common.notify.Adapter;
import org.eclipse.emf.common.notify.Notifier;

import org.eclipse.emf.common.notify.impl.AdapterFactoryImpl;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * The <b>Adapter Factory</b> for the model.
 * It provides an adapter <code>createXXX</code> method for each class of the model.
 * <!-- end-user-doc -->
 * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage
 * @generated
 */
public class WhileLangAdapterFactory extends AdapterFactoryImpl
{
  /**
   * The cached model package.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected static WhileLangPackage modelPackage;

  /**
   * Creates an instance of the adapter factory.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public WhileLangAdapterFactory()
  {
    if (modelPackage == null)
    {
      modelPackage = WhileLangPackage.eINSTANCE;
    }
  }

  /**
   * Returns whether this factory is applicable for the type of the object.
   * <!-- begin-user-doc -->
   * This implementation returns <code>true</code> if the object is either the model's package or is an instance object of the model.
   * <!-- end-user-doc -->
   * @return whether this factory is applicable for the type of the object.
   * @generated
   */
  @Override
  public boolean isFactoryForType(Object object)
  {
    if (object == modelPackage)
    {
      return true;
    }
    if (object instanceof EObject)
    {
      return ((EObject)object).eClass().getEPackage() == modelPackage;
    }
    return false;
  }

  /**
   * The switch that delegates to the <code>createXXX</code> methods.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected WhileLangSwitch<Adapter> modelSwitch =
    new WhileLangSwitch<Adapter>()
    {
      @Override
      public Adapter caseProgram(Program object)
      {
        return createProgramAdapter();
      }
      @Override
      public Adapter caseFormals(Formals object)
      {
        return createFormalsAdapter();
      }
      @Override
      public Adapter caseS(S object)
      {
        return createSAdapter();
      }
      @Override
      public Adapter caseCompoundS(CompoundS object)
      {
        return createCompoundSAdapter();
      }
      @Override
      public Adapter caseAssignS(AssignS object)
      {
        return createAssignSAdapter();
      }
      @Override
      public Adapter caseSkipS(SkipS object)
      {
        return createSkipSAdapter();
      }
      @Override
      public Adapter caseWhileS(WhileS object)
      {
        return createWhileSAdapter();
      }
      @Override
      public Adapter caseIfS(IfS object)
      {
        return createIfSAdapter();
      }
      @Override
      public Adapter caseAssertS(AssertS object)
      {
        return createAssertSAdapter();
      }
      @Override
      public Adapter caseLabeledExp(LabeledExp object)
      {
        return createLabeledExpAdapter();
      }
      @Override
      public Adapter caseExpr(Expr object)
      {
        return createExprAdapter();
      }
      @Override
      public Adapter caseVarRefExpr(VarRefExpr object)
      {
        return createVarRefExprAdapter();
      }
      @Override
      public Adapter caseSignedNum(SignedNum object)
      {
        return createSignedNumAdapter();
      }
      @Override
      public Adapter caseNumLitExpr(NumLitExpr object)
      {
        return createNumLitExprAdapter();
      }
      @Override
      public Adapter caseBoolLitExpr(BoolLitExpr object)
      {
        return createBoolLitExprAdapter();
      }
      @Override
      public Adapter caseNotExpr(NotExpr object)
      {
        return createNotExprAdapter();
      }
      @Override
      public Adapter caseElementaryBlock(ElementaryBlock object)
      {
        return createElementaryBlockAdapter();
      }
      @Override
      public Adapter caseBDisj(BDisj object)
      {
        return createBDisjAdapter();
      }
      @Override
      public Adapter caseBConj(BConj object)
      {
        return createBConjAdapter();
      }
      @Override
      public Adapter caseBRelExp(BRelExp object)
      {
        return createBRelExpAdapter();
      }
      @Override
      public Adapter caseAExpression(AExpression object)
      {
        return createAExpressionAdapter();
      }
      @Override
      public Adapter caseFactor(Factor object)
      {
        return createFactorAdapter();
      }
      @Override
      public Adapter defaultCase(EObject object)
      {
        return createEObjectAdapter();
      }
    };

  /**
   * Creates an adapter for the <code>target</code>.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param target the object to adapt.
   * @return the adapter for the <code>target</code>.
   * @generated
   */
  @Override
  public Adapter createAdapter(Notifier target)
  {
    return modelSwitch.doSwitch((EObject)target);
  }


  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.Program <em>Program</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.Program
   * @generated
   */
  public Adapter createProgramAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.Formals <em>Formals</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.Formals
   * @generated
   */
  public Adapter createFormalsAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.S <em>S</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.S
   * @generated
   */
  public Adapter createSAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.CompoundS <em>Compound S</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.CompoundS
   * @generated
   */
  public Adapter createCompoundSAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.AssignS <em>Assign S</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.AssignS
   * @generated
   */
  public Adapter createAssignSAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.SkipS <em>Skip S</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.SkipS
   * @generated
   */
  public Adapter createSkipSAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.WhileS <em>While S</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.WhileS
   * @generated
   */
  public Adapter createWhileSAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.IfS <em>If S</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.IfS
   * @generated
   */
  public Adapter createIfSAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.AssertS <em>Assert S</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.AssertS
   * @generated
   */
  public Adapter createAssertSAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.LabeledExp <em>Labeled Exp</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.LabeledExp
   * @generated
   */
  public Adapter createLabeledExpAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.Expr <em>Expr</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.Expr
   * @generated
   */
  public Adapter createExprAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.VarRefExpr <em>Var Ref Expr</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.VarRefExpr
   * @generated
   */
  public Adapter createVarRefExprAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.SignedNum <em>Signed Num</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.SignedNum
   * @generated
   */
  public Adapter createSignedNumAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.NumLitExpr <em>Num Lit Expr</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.NumLitExpr
   * @generated
   */
  public Adapter createNumLitExprAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.BoolLitExpr <em>Bool Lit Expr</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.BoolLitExpr
   * @generated
   */
  public Adapter createBoolLitExprAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.NotExpr <em>Not Expr</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.NotExpr
   * @generated
   */
  public Adapter createNotExprAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.ElementaryBlock <em>Elementary Block</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.ElementaryBlock
   * @generated
   */
  public Adapter createElementaryBlockAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.BDisj <em>BDisj</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.BDisj
   * @generated
   */
  public Adapter createBDisjAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.BConj <em>BConj</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.BConj
   * @generated
   */
  public Adapter createBConjAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.BRelExp <em>BRel Exp</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.BRelExp
   * @generated
   */
  public Adapter createBRelExpAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.AExpression <em>AExpression</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.AExpression
   * @generated
   */
  public Adapter createAExpressionAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for an object of class '{@link edu.ucf.cs.whilelang.whileLang.Factor <em>Factor</em>}'.
   * <!-- begin-user-doc -->
   * This default implementation returns null so that we can easily ignore cases;
   * it's useful to ignore a case when inheritance will catch all the cases anyway.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @see edu.ucf.cs.whilelang.whileLang.Factor
   * @generated
   */
  public Adapter createFactorAdapter()
  {
    return null;
  }

  /**
   * Creates a new adapter for the default case.
   * <!-- begin-user-doc -->
   * This default implementation returns null.
   * <!-- end-user-doc -->
   * @return the new adapter.
   * @generated
   */
  public Adapter createEObjectAdapter()
  {
    return null;
  }

} //WhileLangAdapterFactory
