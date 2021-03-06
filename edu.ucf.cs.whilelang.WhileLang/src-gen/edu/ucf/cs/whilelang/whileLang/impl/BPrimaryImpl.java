/**
 * generated by Xtext 2.13.0
 */
package edu.ucf.cs.whilelang.whileLang.impl;

import edu.ucf.cs.whilelang.whileLang.BPrimary;
import edu.ucf.cs.whilelang.whileLang.WhileLangPackage;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>BPrimary</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link edu.ucf.cs.whilelang.whileLang.impl.BPrimaryImpl#getBval <em>Bval</em>}</li>
 * </ul>
 *
 * @generated
 */
public class BPrimaryImpl extends BExprImpl implements BPrimary
{
  /**
   * The default value of the '{@link #getBval() <em>Bval</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getBval()
   * @generated
   * @ordered
   */
  protected static final String BVAL_EDEFAULT = null;

  /**
   * The cached value of the '{@link #getBval() <em>Bval</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getBval()
   * @generated
   * @ordered
   */
  protected String bval = BVAL_EDEFAULT;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected BPrimaryImpl()
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
    return WhileLangPackage.Literals.BPRIMARY;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String getBval()
  {
    return bval;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void setBval(String newBval)
  {
    String oldBval = bval;
    bval = newBval;
    if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, WhileLangPackage.BPRIMARY__BVAL, oldBval, bval));
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
      case WhileLangPackage.BPRIMARY__BVAL:
        return getBval();
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
      case WhileLangPackage.BPRIMARY__BVAL:
        setBval((String)newValue);
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
      case WhileLangPackage.BPRIMARY__BVAL:
        setBval(BVAL_EDEFAULT);
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
      case WhileLangPackage.BPRIMARY__BVAL:
        return BVAL_EDEFAULT == null ? bval != null : !BVAL_EDEFAULT.equals(bval);
    }
    return super.eIsSet(featureID);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public String toString()
  {
    if (eIsProxy()) return super.toString();

    StringBuffer result = new StringBuffer(super.toString());
    result.append(" (bval: ");
    result.append(bval);
    result.append(')');
    return result.toString();
  }

} //BPrimaryImpl
