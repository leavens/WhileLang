package edu.ucf.cs.whilelang.tests;

import edu.ucf.cs.whilelang.utility.AExps
import edu.ucf.cs.whilelang.whileLang.CompoundS
import java.util.HashSet
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.junit.Assert
import org.junit.Test
import org.junit.runner.RunWith
import edu.ucf.cs.whilelang.whileLang.Program
import org.eclipse.xtext.testing.util.ParseHelper
import edu.ucf.cs.whilelang.WhileLangStandaloneSetup
import org.eclipse.xtext.resource.XtextResourceSet
import java.io.FileInputStream
import java.util.HashMap
import edu.ucf.cs.whilelang.validation.WhileLangValidator
import com.google.inject.Inject
import org.eclipse.emf.common.util.URI
import edu.ucf.cs.whilelang.whileLang.WhileS
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.BRelExp
import edu.ucf.cs.whilelang.whileLang.Expr
import static extension edu.ucf.cs.whilelang.utility.ASTExtensions.*
import java.util.Set
import edu.ucf.cs.whilelang.whileLang.AssertS

/**
 * JUnit (4) tests for the Aexp method of AExps 
 * (which finds sets of non-trivial arithmetic expressions).
 */
@RunWith(XtextRunner)
@InjectWith(WhileLangInjectorProvider)
class AexpTest {	
 
    /** Parse a program from the given file name and validate it, 
     * then return the validated AST. */
    @Inject extension ParseHelper<Program> parseHelper  
    def Program fromFileName(String fn) {
        val injector = new WhileLangStandaloneSetup().createInjectorAndDoEMFRegistration()
        val resourceSet = injector.getInstance(XtextResourceSet)
        val uri = URI.createURI(fn)
        // val xtextResource = resourceSet.getResource(uri, true);
        val p = parse(new FileInputStream(fn), uri, new HashMap(), resourceSet)
        new WhileLangValidator().checkStaticConstraints(p)
        return p
    } 
    
    /** Assert equality with nice formatting of messages. */
    def static void checkEquality(String exp_name, Set<Expr> exp, 
                                  String act_name, Set<Expr> act) 
    {
        val aes = new AExps()
        val msg = exp_name + " is " + aes.setOfExprToString(exp) 
                  + "\n" + act_name + " is " + aes.setOfExprToString(act)
        if (!exp.equals(act)) {
            System.err.println(msg)
        }
        Assert.assertEquals(msg, exp, act)
    }
	
    @Test
    def void testAexpcfg1() {
        val p = fromFileName("testsrc/cfg1.wh")
        val bod = p.body as CompoundS
        val aes = new AExps()
        val s0 = bod.stmts.get(0)  // AST for statement labeled 1
        val e0 = new HashSet() // s0 has no non-trivial arith. exps.
        checkEquality("e0", e0, "aes.Aexp(s0)", aes.Aexp(s0)) 
        val s1 = bod.stmts.get(1)
        val e1 = new HashSet()
        checkEquality("e1", e1, "aes.Aexp(s1)", aes.Aexp(s1))
        val s2 = bod.stmts.get(2)
        val e2 = new HashSet()
        val wb = (s2 as WhileS).block as CompoundS
        val wb0 = wb.stmts.get(0) as AssignS
        e2.add(wb0.aexp as Expr)
        val wb2 = wb.stmts.get(2) as AssignS
        e2.add(wb2.aexp as Expr)
        checkEquality("e2", e2,"aes.Aexp(s2)", aes.Aexp(s2))
        checkEquality("e2", e2, "aes.Aexp(bod)", aes.Aexp(bod))
    }  

//    TODO: add tests like the following for AExps.Aexp(). 
    @Test
    def void testAexpifs() {
        val aes = new AExps()
        val p = fromFileName("testsrc/cfgifs.wh")
        val bod = p.body as CompoundS
        val if1 = bod.stmts.get(0) as IfS
        val c2 = if1.s1 as CompoundS
        val if2 = c2.stmts.get(0) as IfS
        val s34 = if2.s1 as CompoundS
        val s4 = s34.stmts.get(1) as AssignS
        val rp1 = s4.aexp // r+1
        val expected = new HashSet()
        expected.add(rp1)
        checkEquality("expected", expected, "aes.Aexp(s4)", aes.Aexp(s4))
        checkEquality("expected", expected, "aes.Aexp(s34)", aes.Aexp(s34))
        val be2 = if2.bexp.be as BRelExp
        val bm1 = be2.right // b-1
        expected.add(bm1)
        checkEquality("expected", expected, "aes.Aexp(if2)", aes.Aexp(if2))
        val c6 = if1.s2 as CompoundS
        val if6 = c6.stmts.get(0) as IfS
        val e6 = (if6.bexp.be as BRelExp).left  // a+1
        expected.add(e6)
        val c7 = if6.s1 as CompoundS
        val s7 = c7.stmts.get(0) as AssignS
        val e7 = s7.aexp // -7
        expected.add(e7)
        checkEquality("expected", expected, "aes.Aexp(if1)", aes.Aexp(if1))
        checkEquality("expected", expected, "aes.Aexp(bod)", aes.Aexp(bod))
    }  
    
    @Test
    def void testSimpleWhile() {
        val aes = new AExps()
        val p = fromFileName("testsrc/simpleWhile.wh")
        val bod = p.body as CompoundS
        val s2 = bod.stmts.get(1) as WhileS
        val s3 = s2.block as AssignS
        val e3 = s3.aexp
        val expected = new HashSet()
        expected.add(e3)
        checkEquality("expected", expected, "aes.Aexp(s3)", aes.Aexp(s3))
        checkEquality("expected", expected, "aes.Aexp(s2)", aes.Aexp(s2))
        checkEquality("expected", expected, "aes.Aexp(bod)", aes.Aexp(bod))
    }  
       
    @Test
    def void testAexpexprs() {
        val aes = new AExps()
        val p = fromFileName("testsrc/exprs.wh")
        val bod = p.body as CompoundS
        val s1 = bod.stmts.get(0) as AssignS
        val e1 = s1.aexp // (((1+2)-(3*q))--(r))
        val e1left = e1.leftSubExp
        val e1right = e1.rightSubExp
        val expected = new HashSet()
        expected.add(e1)
        expected.add(e1left)
        expected.add(e1left.leftSubExp)
        expected.add(e1left.rightSubExp)
        expected.add(e1right)
        val aes1 = aes.Aexp(s1)
        checkEquality("expected", expected, "aes.Aexp(s1)", aes1)
        val s2 = bod.stmts.get(1) as AssignS
        val e2 = s2.aexp // b/(b-c)
        val exp2 = new HashSet()
        exp2.add(e2)
        exp2.add(e2.rightSubExp)
        val aes2 = aes.Aexp(s2)
        checkEquality("exp2", exp2, "aes.Aexp(s2)", aes2)
        val s3 = bod.stmts.get(2) as IfS
        val s4 = s3.s1 as AssignS
        val e4 = s4.aexp // (2*(a*b)+c*c)-4*a*c
        val aes4 = new HashSet()
        aes4.add(e4)
        val e4left = e4.leftSubExp // (2*(a*b)+c*c)
        val e4right = e4.rightSubExp // 4*a*c
        aes4.add(e4left)
        aes4.add(e4right)
        aes4.add(e4right.leftSubExp) // 4*a
        aes4.add(e4left.leftSubExp) // 2*(a*b)
        aes4.add(e4left.rightSubExp) // c*c
        aes4.add(e4left.leftSubExp.rightSubExp) // a*b
        val aes4v = aes.Aexp(s4)
        checkEquality("aes4", aes4, "aes.Aexp(s4)", aes4v)
        val c56 = s3.s2 as CompoundS
        val s5 = c56.stmts.get(0) as WhileS
        val s6 = s5.block as AssignS
        val e6 = s6.aexp // x*x*x*(-q)
        val aes6 = new HashSet()
        aes6.add(e6)
        aes6.add(e6.leftSubExp) // x*x*x
        aes6.add(e6.rightSubExp) // (-q)
        val aes6v = aes.Aexp(s6)
        aes6.add(e6.leftSubExp.leftSubExp) // x*x
        checkEquality("aes6", aes6, "aes.Aexp(s6)", aes6v)
        val s5test = s5.bexp.be //x < 0 or -y > 3 and b <= c and c >= b
        val my = s5test.rightSubExp.leftSubExp.leftSubExp.leftSubExp // -y
        val aes5 = new HashSet()
        aes5.addAll(aes6)
        aes5.add(my)
        val aes5v = aes.Aexp(s5)
        checkEquality("aes5", aes5, "aes.Aexp(s5)", aes5v)
        val aes3 = new HashSet()
        aes3.addAll(aes5)
        aes3.addAll(aes4)
        checkEquality("aes3", aes3, "aes.Aexp(s3)", aes.Aexp(s3))
    }  
     
	@Test
	def void testCFGAssert() {
	    val p = fromFileName("testsrc/cfgassert.wh")
	    val bod = p.body as CompoundS
	    val aesv = new AExps().Aexp(bod)
	    val expected = new HashSet()
	    val s1 = bod.stmts.get(0) as AssertS
	    val e1 = s1.bexp.be.rightSubExp
	    expected.add(e1)
	    checkEquality("expected", expected, "new AExps().Aexp(bod)", aesv)
	}	
}
