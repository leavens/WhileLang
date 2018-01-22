/**
 * generated by Xtext 2.13.0
 */
package edu.ucf.cs.whilelang.whileLang.impl;

import edu.ucf.cs.whilelang.whileLang.AExpression;
import edu.ucf.cs.whilelang.whileLang.AssignS;
import edu.ucf.cs.whilelang.whileLang.BConj;
import edu.ucf.cs.whilelang.whileLang.BDisj;
import edu.ucf.cs.whilelang.whileLang.BRelExp;
import edu.ucf.cs.whilelang.whileLang.BoolLitExpr;
import edu.ucf.cs.whilelang.whileLang.CompoundS;
import edu.ucf.cs.whilelang.whileLang.ElementaryBlock;
import edu.ucf.cs.whilelang.whileLang.Expr;
import edu.ucf.cs.whilelang.whileLang.Factor;
import edu.ucf.cs.whilelang.whileLang.Formals;
import edu.ucf.cs.whilelang.whileLang.IfS;
import edu.ucf.cs.whilelang.whileLang.LabeledExp;
import edu.ucf.cs.whilelang.whileLang.NotExpr;
import edu.ucf.cs.whilelang.whileLang.NumLitExpr;
import edu.ucf.cs.whilelang.whileLang.Program;
import edu.ucf.cs.whilelang.whileLang.SkipS;
import edu.ucf.cs.whilelang.whileLang.VarRefExpr;
import edu.ucf.cs.whilelang.whileLang.WhileLangFactory;
import edu.ucf.cs.whilelang.whileLang.WhileLangPackage;
import edu.ucf.cs.whilelang.whileLang.WhileS;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;

import org.eclipse.emf.ecore.impl.EPackageImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Package</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class WhileLangPackageImpl extends EPackageImpl implements WhileLangPackage
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass programEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass formalsEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass sEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass compoundSEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass assignSEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass skipSEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass whileSEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass ifSEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass labeledExpEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass exprEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass varRefExprEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass numLitExprEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass boolLitExprEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass notExprEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass elementaryBlockEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass bDisjEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass bConjEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass bRelExpEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass aExpressionEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass factorEClass = null;

  /**
   * Creates an instance of the model <b>Package</b>, registered with
   * {@link org.eclipse.emf.ecore.EPackage.Registry EPackage.Registry} by the package
   * package URI value.
   * <p>Note: the correct way to create the package is via the static
   * factory method {@link #init init()}, which also performs
   * initialization of the package, or returns the registered package,
   * if one already exists.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.eclipse.emf.ecore.EPackage.Registry
   * @see edu.ucf.cs.whilelang.whileLang.WhileLangPackage#eNS_URI
   * @see #init()
   * @generated
   */
  private WhileLangPackageImpl()
  {
    super(eNS_URI, WhileLangFactory.eINSTANCE);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private static boolean isInited = false;

  /**
   * Creates, registers, and initializes the <b>Package</b> for this model, and for any others upon which it depends.
   * 
   * <p>This method is used to initialize {@link WhileLangPackage#eINSTANCE} when that field is accessed.
   * Clients should not invoke it directly. Instead, they should simply access that field to obtain the package.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #eNS_URI
   * @see #createPackageContents()
   * @see #initializePackageContents()
   * @generated
   */
  public static WhileLangPackage init()
  {
    if (isInited) return (WhileLangPackage)EPackage.Registry.INSTANCE.getEPackage(WhileLangPackage.eNS_URI);

    // Obtain or create and register package
    WhileLangPackageImpl theWhileLangPackage = (WhileLangPackageImpl)(EPackage.Registry.INSTANCE.get(eNS_URI) instanceof WhileLangPackageImpl ? EPackage.Registry.INSTANCE.get(eNS_URI) : new WhileLangPackageImpl());

    isInited = true;

    // Create package meta-data objects
    theWhileLangPackage.createPackageContents();

    // Initialize created meta-data
    theWhileLangPackage.initializePackageContents();

    // Mark meta-data to indicate it can't be changed
    theWhileLangPackage.freeze();

  
    // Update the registry and return the package
    EPackage.Registry.INSTANCE.put(WhileLangPackage.eNS_URI, theWhileLangPackage);
    return theWhileLangPackage;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getProgram()
  {
    return programEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getProgram_Name()
  {
    return (EAttribute)programEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getProgram_Args()
  {
    return (EReference)programEClass.getEStructuralFeatures().get(1);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getProgram_Body()
  {
    return (EReference)programEClass.getEStructuralFeatures().get(2);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getFormals()
  {
    return formalsEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getFormals_Names()
  {
    return (EAttribute)formalsEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getS()
  {
    return sEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getCompoundS()
  {
    return compoundSEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getCompoundS_Stmts()
  {
    return (EReference)compoundSEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getAssignS()
  {
    return assignSEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getAssignS_V()
  {
    return (EAttribute)assignSEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getAssignS_Aexp()
  {
    return (EReference)assignSEClass.getEStructuralFeatures().get(1);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getAssignS_Label()
  {
    return (EAttribute)assignSEClass.getEStructuralFeatures().get(2);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getSkipS()
  {
    return skipSEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getSkipS_Label()
  {
    return (EAttribute)skipSEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getWhileS()
  {
    return whileSEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getWhileS_Bexp()
  {
    return (EReference)whileSEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getWhileS_Block()
  {
    return (EReference)whileSEClass.getEStructuralFeatures().get(1);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getIfS()
  {
    return ifSEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getIfS_Bexp()
  {
    return (EReference)ifSEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getIfS_S1()
  {
    return (EReference)ifSEClass.getEStructuralFeatures().get(1);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getIfS_S2()
  {
    return (EReference)ifSEClass.getEStructuralFeatures().get(2);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getLabeledExp()
  {
    return labeledExpEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getLabeledExp_Be()
  {
    return (EReference)labeledExpEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getLabeledExp_Label()
  {
    return (EAttribute)labeledExpEClass.getEStructuralFeatures().get(1);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getExpr()
  {
    return exprEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getVarRefExpr()
  {
    return varRefExprEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getVarRefExpr_Vname()
  {
    return (EAttribute)varRefExprEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getNumLitExpr()
  {
    return numLitExprEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getNumLitExpr_Num()
  {
    return (EAttribute)numLitExprEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getBoolLitExpr()
  {
    return boolLitExprEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getBoolLitExpr_Bval()
  {
    return (EAttribute)boolLitExprEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getNotExpr()
  {
    return notExprEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getNotExpr_Bexp()
  {
    return (EReference)notExprEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getElementaryBlock()
  {
    return elementaryBlockEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getBDisj()
  {
    return bDisjEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getBDisj_Left()
  {
    return (EReference)bDisjEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getBDisj_Op()
  {
    return (EAttribute)bDisjEClass.getEStructuralFeatures().get(1);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getBDisj_Right()
  {
    return (EReference)bDisjEClass.getEStructuralFeatures().get(2);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getBConj()
  {
    return bConjEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getBConj_Left()
  {
    return (EReference)bConjEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getBConj_Op()
  {
    return (EAttribute)bConjEClass.getEStructuralFeatures().get(1);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getBConj_Right()
  {
    return (EReference)bConjEClass.getEStructuralFeatures().get(2);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getBRelExp()
  {
    return bRelExpEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getBRelExp_Left()
  {
    return (EReference)bRelExpEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getBRelExp_Op()
  {
    return (EAttribute)bRelExpEClass.getEStructuralFeatures().get(1);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getBRelExp_Right()
  {
    return (EReference)bRelExpEClass.getEStructuralFeatures().get(2);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getAExpression()
  {
    return aExpressionEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getAExpression_Left()
  {
    return (EReference)aExpressionEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getAExpression_Op()
  {
    return (EAttribute)aExpressionEClass.getEStructuralFeatures().get(1);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getAExpression_Right()
  {
    return (EReference)aExpressionEClass.getEStructuralFeatures().get(2);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getFactor()
  {
    return factorEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getFactor_Left()
  {
    return (EReference)factorEClass.getEStructuralFeatures().get(0);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EAttribute getFactor_Op()
  {
    return (EAttribute)factorEClass.getEStructuralFeatures().get(1);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EReference getFactor_Right()
  {
    return (EReference)factorEClass.getEStructuralFeatures().get(2);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public WhileLangFactory getWhileLangFactory()
  {
    return (WhileLangFactory)getEFactoryInstance();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private boolean isCreated = false;

  /**
   * Creates the meta-model objects for the package.  This method is
   * guarded to have no affect on any invocation but its first.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void createPackageContents()
  {
    if (isCreated) return;
    isCreated = true;

    // Create classes and their features
    programEClass = createEClass(PROGRAM);
    createEAttribute(programEClass, PROGRAM__NAME);
    createEReference(programEClass, PROGRAM__ARGS);
    createEReference(programEClass, PROGRAM__BODY);

    formalsEClass = createEClass(FORMALS);
    createEAttribute(formalsEClass, FORMALS__NAMES);

    sEClass = createEClass(S);

    compoundSEClass = createEClass(COMPOUND_S);
    createEReference(compoundSEClass, COMPOUND_S__STMTS);

    assignSEClass = createEClass(ASSIGN_S);
    createEAttribute(assignSEClass, ASSIGN_S__V);
    createEReference(assignSEClass, ASSIGN_S__AEXP);
    createEAttribute(assignSEClass, ASSIGN_S__LABEL);

    skipSEClass = createEClass(SKIP_S);
    createEAttribute(skipSEClass, SKIP_S__LABEL);

    whileSEClass = createEClass(WHILE_S);
    createEReference(whileSEClass, WHILE_S__BEXP);
    createEReference(whileSEClass, WHILE_S__BLOCK);

    ifSEClass = createEClass(IF_S);
    createEReference(ifSEClass, IF_S__BEXP);
    createEReference(ifSEClass, IF_S__S1);
    createEReference(ifSEClass, IF_S__S2);

    labeledExpEClass = createEClass(LABELED_EXP);
    createEReference(labeledExpEClass, LABELED_EXP__BE);
    createEAttribute(labeledExpEClass, LABELED_EXP__LABEL);

    exprEClass = createEClass(EXPR);

    varRefExprEClass = createEClass(VAR_REF_EXPR);
    createEAttribute(varRefExprEClass, VAR_REF_EXPR__VNAME);

    numLitExprEClass = createEClass(NUM_LIT_EXPR);
    createEAttribute(numLitExprEClass, NUM_LIT_EXPR__NUM);

    boolLitExprEClass = createEClass(BOOL_LIT_EXPR);
    createEAttribute(boolLitExprEClass, BOOL_LIT_EXPR__BVAL);

    notExprEClass = createEClass(NOT_EXPR);
    createEReference(notExprEClass, NOT_EXPR__BEXP);

    elementaryBlockEClass = createEClass(ELEMENTARY_BLOCK);

    bDisjEClass = createEClass(BDISJ);
    createEReference(bDisjEClass, BDISJ__LEFT);
    createEAttribute(bDisjEClass, BDISJ__OP);
    createEReference(bDisjEClass, BDISJ__RIGHT);

    bConjEClass = createEClass(BCONJ);
    createEReference(bConjEClass, BCONJ__LEFT);
    createEAttribute(bConjEClass, BCONJ__OP);
    createEReference(bConjEClass, BCONJ__RIGHT);

    bRelExpEClass = createEClass(BREL_EXP);
    createEReference(bRelExpEClass, BREL_EXP__LEFT);
    createEAttribute(bRelExpEClass, BREL_EXP__OP);
    createEReference(bRelExpEClass, BREL_EXP__RIGHT);

    aExpressionEClass = createEClass(AEXPRESSION);
    createEReference(aExpressionEClass, AEXPRESSION__LEFT);
    createEAttribute(aExpressionEClass, AEXPRESSION__OP);
    createEReference(aExpressionEClass, AEXPRESSION__RIGHT);

    factorEClass = createEClass(FACTOR);
    createEReference(factorEClass, FACTOR__LEFT);
    createEAttribute(factorEClass, FACTOR__OP);
    createEReference(factorEClass, FACTOR__RIGHT);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private boolean isInitialized = false;

  /**
   * Complete the initialization of the package and its meta-model.  This
   * method is guarded to have no affect on any invocation but its first.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void initializePackageContents()
  {
    if (isInitialized) return;
    isInitialized = true;

    // Initialize package
    setName(eNAME);
    setNsPrefix(eNS_PREFIX);
    setNsURI(eNS_URI);

    // Create type parameters

    // Set bounds for type parameters

    // Add supertypes to classes
    compoundSEClass.getESuperTypes().add(this.getS());
    assignSEClass.getESuperTypes().add(this.getS());
    assignSEClass.getESuperTypes().add(this.getElementaryBlock());
    skipSEClass.getESuperTypes().add(this.getS());
    skipSEClass.getESuperTypes().add(this.getElementaryBlock());
    whileSEClass.getESuperTypes().add(this.getS());
    ifSEClass.getESuperTypes().add(this.getS());
    labeledExpEClass.getESuperTypes().add(this.getElementaryBlock());
    varRefExprEClass.getESuperTypes().add(this.getExpr());
    numLitExprEClass.getESuperTypes().add(this.getExpr());
    boolLitExprEClass.getESuperTypes().add(this.getExpr());
    notExprEClass.getESuperTypes().add(this.getExpr());
    bDisjEClass.getESuperTypes().add(this.getExpr());
    bConjEClass.getESuperTypes().add(this.getExpr());
    bRelExpEClass.getESuperTypes().add(this.getExpr());
    aExpressionEClass.getESuperTypes().add(this.getExpr());
    factorEClass.getESuperTypes().add(this.getExpr());

    // Initialize classes and features; add operations and parameters
    initEClass(programEClass, Program.class, "Program", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEAttribute(getProgram_Name(), ecorePackage.getEString(), "name", null, 0, 1, Program.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEReference(getProgram_Args(), this.getFormals(), null, "args", null, 0, 1, Program.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEReference(getProgram_Body(), this.getS(), null, "body", null, 0, 1, Program.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(formalsEClass, Formals.class, "Formals", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEAttribute(getFormals_Names(), ecorePackage.getEString(), "names", null, 0, -1, Formals.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, !IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(sEClass, edu.ucf.cs.whilelang.whileLang.S.class, "S", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

    initEClass(compoundSEClass, CompoundS.class, "CompoundS", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEReference(getCompoundS_Stmts(), this.getS(), null, "stmts", null, 0, -1, CompoundS.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(assignSEClass, AssignS.class, "AssignS", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEAttribute(getAssignS_V(), ecorePackage.getEString(), "v", null, 0, 1, AssignS.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEReference(getAssignS_Aexp(), this.getExpr(), null, "aexp", null, 0, 1, AssignS.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEAttribute(getAssignS_Label(), ecorePackage.getEInt(), "label", null, 0, 1, AssignS.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(skipSEClass, SkipS.class, "SkipS", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEAttribute(getSkipS_Label(), ecorePackage.getEInt(), "label", null, 0, 1, SkipS.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(whileSEClass, WhileS.class, "WhileS", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEReference(getWhileS_Bexp(), this.getLabeledExp(), null, "bexp", null, 0, 1, WhileS.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEReference(getWhileS_Block(), this.getCompoundS(), null, "block", null, 0, 1, WhileS.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(ifSEClass, IfS.class, "IfS", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEReference(getIfS_Bexp(), this.getLabeledExp(), null, "bexp", null, 0, 1, IfS.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEReference(getIfS_S1(), this.getCompoundS(), null, "s1", null, 0, 1, IfS.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEReference(getIfS_S2(), this.getCompoundS(), null, "s2", null, 0, 1, IfS.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(labeledExpEClass, LabeledExp.class, "LabeledExp", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEReference(getLabeledExp_Be(), this.getExpr(), null, "be", null, 0, 1, LabeledExp.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEAttribute(getLabeledExp_Label(), ecorePackage.getEInt(), "label", null, 0, 1, LabeledExp.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(exprEClass, Expr.class, "Expr", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

    initEClass(varRefExprEClass, VarRefExpr.class, "VarRefExpr", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEAttribute(getVarRefExpr_Vname(), ecorePackage.getEString(), "vname", null, 0, 1, VarRefExpr.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(numLitExprEClass, NumLitExpr.class, "NumLitExpr", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEAttribute(getNumLitExpr_Num(), ecorePackage.getEInt(), "num", null, 0, 1, NumLitExpr.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(boolLitExprEClass, BoolLitExpr.class, "BoolLitExpr", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEAttribute(getBoolLitExpr_Bval(), ecorePackage.getEString(), "bval", null, 0, 1, BoolLitExpr.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(notExprEClass, NotExpr.class, "NotExpr", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEReference(getNotExpr_Bexp(), this.getExpr(), null, "bexp", null, 0, 1, NotExpr.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(elementaryBlockEClass, ElementaryBlock.class, "ElementaryBlock", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

    initEClass(bDisjEClass, BDisj.class, "BDisj", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEReference(getBDisj_Left(), this.getExpr(), null, "left", null, 0, 1, BDisj.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEAttribute(getBDisj_Op(), ecorePackage.getEString(), "op", null, 0, 1, BDisj.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEReference(getBDisj_Right(), this.getExpr(), null, "right", null, 0, 1, BDisj.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(bConjEClass, BConj.class, "BConj", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEReference(getBConj_Left(), this.getExpr(), null, "left", null, 0, 1, BConj.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEAttribute(getBConj_Op(), ecorePackage.getEString(), "op", null, 0, 1, BConj.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEReference(getBConj_Right(), this.getExpr(), null, "right", null, 0, 1, BConj.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(bRelExpEClass, BRelExp.class, "BRelExp", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEReference(getBRelExp_Left(), this.getExpr(), null, "left", null, 0, 1, BRelExp.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEAttribute(getBRelExp_Op(), ecorePackage.getEString(), "op", null, 0, 1, BRelExp.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEReference(getBRelExp_Right(), this.getExpr(), null, "right", null, 0, 1, BRelExp.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(aExpressionEClass, AExpression.class, "AExpression", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEReference(getAExpression_Left(), this.getExpr(), null, "left", null, 0, 1, AExpression.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEAttribute(getAExpression_Op(), ecorePackage.getEString(), "op", null, 0, 1, AExpression.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEReference(getAExpression_Right(), this.getExpr(), null, "right", null, 0, 1, AExpression.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    initEClass(factorEClass, Factor.class, "Factor", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
    initEReference(getFactor_Left(), this.getExpr(), null, "left", null, 0, 1, Factor.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEAttribute(getFactor_Op(), ecorePackage.getEString(), "op", null, 0, 1, Factor.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
    initEReference(getFactor_Right(), this.getExpr(), null, "right", null, 0, 1, Factor.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, IS_COMPOSITE, !IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

    // Create resource
    createResource(eNS_URI);
  }

} //WhileLangPackageImpl
