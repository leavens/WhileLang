/**
 * generated by Xtext 2.13.0
 */
package edu.ucf.cs.whilelang.whileLang.impl;

import edu.ucf.cs.whilelang.whileLang.CompoundS;
import edu.ucf.cs.whilelang.whileLang.IfS;
import edu.ucf.cs.whilelang.whileLang.LabeledExp;
import edu.ucf.cs.whilelang.whileLang.WhileLangPackage;

import org.eclipse.emf.common.notify.Notification;
import org.eclipse.emf.common.notify.NotificationChain;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>If S</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link edu.ucf.cs.whilelang.whileLang.impl.IfSImpl#getBexp <em>Bexp</em>}</li>
 *   <li>{@link edu.ucf.cs.whilelang.whileLang.impl.IfSImpl#getS1 <em>S1</em>}</li>
 *   <li>{@link edu.ucf.cs.whilelang.whileLang.impl.IfSImpl#getS2 <em>S2</em>}</li>
 * </ul>
 *
 * @generated
 */
public class IfSImpl extends SImpl implements IfS
{
  /**
   * The cached value of the '{@link #getBexp() <em>Bexp</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getBexp()
   * @generated
   * @ordered
   */
  protected LabeledExp bexp;

  /**
   * The cached value of the '{@link #getS1() <em>S1</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getS1()
   * @generated
   * @ordered
   */
  protected CompoundS s1;

  /**
   * The cached value of the '{@link #getS2() <em>S2</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getS2()
   * @generated
   * @ordered
   */
  protected CompoundS s2;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected IfSImpl()
  {
    super();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  protected EClass eStaticClass()
  {
    return WhileLangPackage.Literals.IF_S;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public LabeledExp getBexp()
  {
    return bexp;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public NotificationChain basicSetBexp(LabeledExp newBexp, NotificationChain msgs)
  {
    LabeledExp oldBexp = bexp;
    bexp = newBexp;
    if (eNotificationRequired())
    {
      ENotificationImpl notification = new ENotificationImpl(this, Notification.SET, WhileLangPackage.IF_S__BEXP, oldBexp, newBexp);
      if (msgs == null) msgs = notification; else msgs.add(notification);
    }
    return msgs;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void setBexp(LabeledExp newBexp)
  {
    if (newBexp != bexp)
    {
      NotificationChain msgs = null;
      if (bexp != null)
        msgs = ((InternalEObject)bexp).eInverseRemove(this, EOPPOSITE_FEATURE_BASE - WhileLangPackage.IF_S__BEXP, null, msgs);
      if (newBexp != null)
        msgs = ((InternalEObject)newBexp).eInverseAdd(this, EOPPOSITE_FEATURE_BASE - WhileLangPackage.IF_S__BEXP, null, msgs);
      msgs = basicSetBexp(newBexp, msgs);
      if (msgs != null) msgs.dispatch();
    }
    else if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, WhileLangPackage.IF_S__BEXP, newBexp, newBexp));
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public CompoundS getS1()
  {
    return s1;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public NotificationChain basicSetS1(CompoundS newS1, NotificationChain msgs)
  {
    CompoundS oldS1 = s1;
    s1 = newS1;
    if (eNotificationRequired())
    {
      ENotificationImpl notification = new ENotificationImpl(this, Notification.SET, WhileLangPackage.IF_S__S1, oldS1, newS1);
      if (msgs == null) msgs = notification; else msgs.add(notification);
    }
    return msgs;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void setS1(CompoundS newS1)
  {
    if (newS1 != s1)
    {
      NotificationChain msgs = null;
      if (s1 != null)
        msgs = ((InternalEObject)s1).eInverseRemove(this, EOPPOSITE_FEATURE_BASE - WhileLangPackage.IF_S__S1, null, msgs);
      if (newS1 != null)
        msgs = ((InternalEObject)newS1).eInverseAdd(this, EOPPOSITE_FEATURE_BASE - WhileLangPackage.IF_S__S1, null, msgs);
      msgs = basicSetS1(newS1, msgs);
      if (msgs != null) msgs.dispatch();
    }
    else if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, WhileLangPackage.IF_S__S1, newS1, newS1));
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public CompoundS getS2()
  {
    return s2;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public NotificationChain basicSetS2(CompoundS newS2, NotificationChain msgs)
  {
    CompoundS oldS2 = s2;
    s2 = newS2;
    if (eNotificationRequired())
    {
      ENotificationImpl notification = new ENotificationImpl(this, Notification.SET, WhileLangPackage.IF_S__S2, oldS2, newS2);
      if (msgs == null) msgs = notification; else msgs.add(notification);
    }
    return msgs;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void setS2(CompoundS newS2)
  {
    if (newS2 != s2)
    {
      NotificationChain msgs = null;
      if (s2 != null)
        msgs = ((InternalEObject)s2).eInverseRemove(this, EOPPOSITE_FEATURE_BASE - WhileLangPackage.IF_S__S2, null, msgs);
      if (newS2 != null)
        msgs = ((InternalEObject)newS2).eInverseAdd(this, EOPPOSITE_FEATURE_BASE - WhileLangPackage.IF_S__S2, null, msgs);
      msgs = basicSetS2(newS2, msgs);
      if (msgs != null) msgs.dispatch();
    }
    else if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, WhileLangPackage.IF_S__S2, newS2, newS2));
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public NotificationChain eInverseRemove(InternalEObject otherEnd, int featureID, NotificationChain msgs)
  {
    switch (featureID)
    {
      case WhileLangPackage.IF_S__BEXP:
        return basicSetBexp(null, msgs);
      case WhileLangPackage.IF_S__S1:
        return basicSetS1(null, msgs);
      case WhileLangPackage.IF_S__S2:
        return basicSetS2(null, msgs);
    }
    return super.eInverseRemove(otherEnd, featureID, msgs);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Object eGet(int featureID, boolean resolve, boolean coreType)
  {
    switch (featureID)
    {
      case WhileLangPackage.IF_S__BEXP:
        return getBexp();
      case WhileLangPackage.IF_S__S1:
        return getS1();
      case WhileLangPackage.IF_S__S2:
        return getS2();
    }
    return super.eGet(featureID, resolve, coreType);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public void eSet(int featureID, Object newValue)
  {
    switch (featureID)
    {
      case WhileLangPackage.IF_S__BEXP:
        setBexp((LabeledExp)newValue);
        return;
      case WhileLangPackage.IF_S__S1:
        setS1((CompoundS)newValue);
        return;
      case WhileLangPackage.IF_S__S2:
        setS2((CompoundS)newValue);
        return;
    }
    super.eSet(featureID, newValue);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public void eUnset(int featureID)
  {
    switch (featureID)
    {
      case WhileLangPackage.IF_S__BEXP:
        setBexp((LabeledExp)null);
        return;
      case WhileLangPackage.IF_S__S1:
        setS1((CompoundS)null);
        return;
      case WhileLangPackage.IF_S__S2:
        setS2((CompoundS)null);
        return;
    }
    super.eUnset(featureID);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public boolean eIsSet(int featureID)
  {
    switch (featureID)
    {
      case WhileLangPackage.IF_S__BEXP:
        return bexp != null;
      case WhileLangPackage.IF_S__S1:
        return s1 != null;
      case WhileLangPackage.IF_S__S2:
        return s2 != null;
    }
    return super.eIsSet(featureID);
  }

} //IfSImpl
