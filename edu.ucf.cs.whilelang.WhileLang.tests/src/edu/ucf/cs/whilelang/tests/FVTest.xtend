package edu.ucf.cs.whilelang.tests;

import edu.ucf.cs.whilelang.utility.FreeVars
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

/**
 * JUnit (4) tests for free variables.
 */
@RunWith(XtextRunner)
@InjectWith(WhileLangInjectorProvider)
class FVTest {	
 
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
    def void testFVcfg1() {
        val p = fromFileName("testsrc/cfg1.wh")
        val bod = p.body as CompoundS
        val fv = new FreeVars()
        val s0 = bod.stmts.get(0)
        val e0 = new HashSet()
        e0.add("q")
        Assert.assertEquals(e0, fv.FV(s0))
        val s1 = bod.stmts.get(1)
        val e1 = new HashSet()
        e1.add("r")
        e1.add("x")
        Assert.assertEquals(e1,fv.FV(s1))
        val s2 = bod.stmts.get(2)
        val e2 = new HashSet()
        e2.add("r")
        e2.add("y")
        e2.add("q")
        Assert.assertEquals(e2,fv.FV(s2))
        val expected = new HashSet()
        expected.add("q")
        expected.add("r")
        expected.add("x")
        expected.add("y")
        val fvs = fv.FV(bod)
        Assert.assertEquals(expected, fvs)
    }  
 
    @Test
    def void testFVifs() {
        val p = fromFileName("testsrc/cfgifs.wh")
        val bod = p.body as CompoundS
        val expected = new HashSet()
        val fv = new FreeVars()
        expected.add("a")
        expected.add("b")
        expected.add("r")
        val fvs = fv.FV(bod)
        Assert.assertEquals(expected, fvs)
    }  
    
    @Test
    def void testSimpleWhile() {
        val p = fromFileName("testsrc/simpleWhile.wh")
        val bod = p.body as CompoundS
        val expected = new HashSet()
        val fv = new FreeVars()
        expected.add("i")
        val fvs = fv.FV(bod)
        Assert.assertEquals(expected, fvs)
    }  
    
    @Test
    def void testFVexprs() {
        val p = fromFileName("testsrc/exprs.wh")
        val bod = p.body as CompoundS
        val expected = new HashSet()
        val fv = new FreeVars()
        expected.add("a")
        expected.add("b")
        expected.add("c")
        expected.add("q")
        expected.add("r")
        expected.add("y")
        expected.add("x")
        expected.add("z")
        val fvs = fv.FV(bod)
        Assert.assertEquals(expected, fvs)
    }  
     
	@Test
	def void testCFGAssert() {
	    val p = fromFileName("testsrc/cfgassert.wh")
	    val bod = p.body as CompoundS
	    val fvs = new FreeVars().FV(bod)
	    val expected = new HashSet()
	    expected.add("a")
	    expected.add("b")
	    Assert.assertEquals(expected, fvs)
	}	
}
