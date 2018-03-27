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
import edu.ucf.cs.whilelang.whileLang.Exp

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
        val e0 = new HashSet()
        Assert.assertEquals(e0, aes.Aexp(s0))  // s0 has no non-trivial arith. exps.
        val s1 = bod.stmts.get(1)
        val e1 = new HashSet()
        Assert.assertEquals(e1, aes.Aexp(s1))
        val s2 = bod.stmts.get(2)
        val e2 = new HashSet()
        val wb = (s2 as WhileS).block as CompoundS
        val wb0 = wb.stmts.get(0) as AssignS
        e2.add(wb0.aexp as Exp)
        val wb2 = wb.stmts.get(2) as AssignS
        e2.add(wb2.aexp as Exp)
        val aes2 = aes.Aexp(s2)
        Assert.assertEquals(e2, aes2)
        Assert.assertEquals(e2, aes.Aexp(bod))
    }  

//    TODO: add tests like the following for AExps.Aexp(). 
//    @Test
//    def void testAexpifs() {
//        val p = fromFileName("testsrc/cfgifs.wh")
//        val bod = p.body as CompoundS
//        val expected = new HashSet()
//        val fv = new AExps()
//        expected.add("a")
//        expected.add("b")
//        expected.add("r")
//        val fvs = fv.Aexp(bod)
//        Assert.assertEquals(expected, fvs)
//    }  
//    
//    @Test
//    def void testSimpleWhile() {
//        val p = fromFileName("testsrc/simpleWhile.wh")
//        val bod = p.body as CompoundS
//        val expected = new HashSet()
//        val fv = new AExps()
//        expected.add("i")
//        val fvs = fv.Aexp(bod)
//        Assert.assertEquals(expected, fvs)
//    }  
//    
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
