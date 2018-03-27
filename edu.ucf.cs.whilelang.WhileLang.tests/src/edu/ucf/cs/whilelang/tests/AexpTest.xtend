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
	
    @Test
    def void testAexpcfg1() {
        val p = fromFileName("testsrc/cfg1.wh")
        val bod = p.body as CompoundS
        val aes = new AExps()
        val s0 = bod.stmts.get(0)  // AST for statement labeled 1
        val e0 = new HashSet() // s0 has no non-trivial arith. exps.
        val aes0 = aes.Aexp(s0)
        Assert.assertEquals("e0 is " + aes.setOfExprToString(e0)
                            + " and aes.Aexp(s0) is " + aes.setOfExprToString(aes0), 
                            e0, aes0)  
        val s1 = bod.stmts.get(1)
        val e1 = new HashSet()
        val aes1 = aes.Aexp(s1)
        Assert.assertEquals("e1 is " + aes.setOfExprToString(e1)
                            + " and aes.Aexp(s1) is " + aes.setOfExprToString(aes1), 
                            e1, aes1)
        val s2 = bod.stmts.get(2)
        val e2 = new HashSet()
        val wb = (s2 as WhileS).block as CompoundS
        val wb0 = wb.stmts.get(0) as AssignS
        e2.add(wb0.aexp as Expr)
        val wb2 = wb.stmts.get(2) as AssignS
        e2.add(wb2.aexp as Expr)
        val aes2 = aes.Aexp(s2)
        Assert.assertEquals("e2 is " + aes.setOfExprToString(e2)
                            + " and aes.Aexp(s2) is " + aes.setOfExprToString(aes2), 
                            e2, aes2)
        val aesbod = aes.Aexp(bod)
        Assert.assertEquals("e2 is " + aes.setOfExprToString(e2)
                            + " and aes.Aexp(bod) is " + aes.setOfExprToString(aesbod), 
                            e2, aesbod)
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
        val aes4 = aes.Aexp(s4)
        Assert.assertEquals("expected is " + aes.setOfExprToString(expected)
                            + " and aes.Aexp(if2) is " + aes.setOfExprToString(aes4), 
                            expected, aes4)
        val aes34 = aes.Aexp(s34)
        Assert.assertEquals("expected is " + aes.setOfExprToString(expected)
                            + " and aes.Aexp(if2) is " + aes.setOfExprToString(aes34), 
                            expected, aes34)
        val be2 = if2.bexp.be as BRelExp
        val bm1 = be2.right // b-1
        expected.add(bm1)
        val ae2 = aes.Aexp(if2)
        Assert.assertEquals("expected is " + aes.setOfExprToString(expected)
                            + " and aes.Aexp(if2) is " + aes.setOfExprToString(ae2), 
                            expected, ae2)
        val c6 = if1.s2 as CompoundS
        val if6 = c6.stmts.get(0) as IfS
        val e6 = (if6.bexp.be as BRelExp).left  // a+1
        expected.add(e6)
        val c7 = if6.s1 as CompoundS
        val s7 = c7.stmts.get(0) as AssignS
        val e7 = s7.aexp // -7
        expected.add(e7)
        val aeif1 = aes.Aexp(if1)
        Assert.assertEquals("expected is " + aes.setOfExprToString(expected)
                            + " and aes.Aexp(if1) is " + aes.setOfExprToString(aeif1),
                            expected, aeif1)
        val aebod = aes.Aexp(bod)                           
        Assert.assertEquals("expected is " + aes.setOfExprToString(expected)
                            + " and aes.Aexp(bod) is " + aes.setOfExprToString(aebod),
                            expected, aebod)
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
        val aes3 = aes.Aexp(s3)
        Assert.assertEquals("expected is " + aes.setOfExprToString(expected)
                            + " and aes.Aexp(s3) is " + aes.setOfExprToString(aes3),
                            expected, aes3)
        val aes2 = aes.Aexp(s2)
        Assert.assertEquals("expected is " + aes.setOfExprToString(expected)
                            + " and aes.Aexp(s2) is " + aes.setOfExprToString(aes2),
                            expected, aes2)
        val aesbod = aes.Aexp(bod)
        Assert.assertEquals("expected is " + aes.setOfExprToString(expected)
                            + " and aes.Aexp(bod) is " + aes.setOfExprToString(aesbod),
                            expected, aesbod)
    }  
    
//    @Test
//    def void testAexpexprs() {
//        val p = fromFileName("testsrc/exprs.wh")
//        val bod = p.body as CompoundS
//        val expected = new HashSet()
//        val fv = new AExps()
//        expected.add("a")
//        expected.add("b")
//        expected.add("c")
//        expected.add("q")
//        expected.add("r")
//        expected.add("y")
//        expected.add("x")
//        expected.add("z")
//        val fvs = fv.Aexp(bod)
//        Assert.assertEquals(expected, fvs)
//    }  
//     
//	@Test
//	def void testCFGAssert() {
//	    val p = fromFileName("testsrc/cfgassert.wh")
//	    val bod = p.body as CompoundS
//	    val fvs = new AExps().Aexp(bod)
//	    val expected = new HashSet()
//	    expected.add("a")
//	    expected.add("b")
//	    Assert.assertEquals(expected, fvs)
//	}	
}
