package edu.ucf.cs.whilelang.tests;

import com.google.inject.Inject
import edu.ucf.cs.whilelang.WhileLangStandaloneSetup
import edu.ucf.cs.whilelang.utility.AExps
import edu.ucf.cs.whilelang.utility.Access
import edu.ucf.cs.whilelang.utility.PVAsMap
import edu.ucf.cs.whilelang.utility.PropertyVector
import edu.ucf.cs.whilelang.utility.VBPropertySpace
import edu.ucf.cs.whilelang.validation.WhileLangVBAnalysis
import edu.ucf.cs.whilelang.validation.WhileLangValidator
import edu.ucf.cs.whilelang.whileLang.AssignS
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.WhileS
import java.io.FileInputStream
import java.util.HashMap
import java.util.HashSet
import org.eclipse.emf.common.util.URI
import org.eclipse.xtext.resource.XtextResourceSet
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.Assert
import org.junit.Test
import org.junit.runner.RunWith

/**
 * JUnit (4) tests for free variables.
 */
@RunWith(XtextRunner)
@InjectWith(WhileLangInjectorProvider)
class VBTest {	
 
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
        
    /** Test the equals method of VBPropertySpace */
    @Test
    def void testVBPSpaceEquals() {
        val p = fromFileName("testsrc/exprs.wh")
        VBPropertySpace.setProgram(p)
        val vbpBot = new VBPropertySpace()
        Assert.assertEquals(vbpBot, vbpBot)
        val exps = new AExps().Aexp(p.body)
        for (e: exps) {
            val vb = new VBPropertySpace()
            vb.join(new VBPropertySpace(e))
            Assert.assertEquals(vb, vb)
            Assert.assertNotEquals(vbpBot, vb)
        }
    } 
    
    /** Test the Very Busy Expressions analysis for the simpleWhile.wh program. */
    @Test
    def void testPropertyVectorSimpleWh() {
        val p = fromFileName("testsrc/simpleWhile.wh")
        VBPropertySpace.setProgram(p)
        val vba = new WhileLangVBAnalysis(p)
        vba.computeAnalysis()
        val bod = p.body as CompoundS
        val s23 = bod.stmts.get(1) as WhileS
        val s3 = s23.block as AssignS
        val e3 = s3.aexp
        val PropertyVector<Integer, VBPropertySpace> VB = vba.VBInfo
        /** The expected value of the VB analysis for this program. */
        val PropertyVector<Integer, VBPropertySpace> shouldBeVB 
            = new PVAsMap<Integer, VBPropertySpace>()
        val ent1 = new VBPropertySpace(new HashSet())
        shouldBeVB.put(Access.ENTRY,1,ent1)
        val ent2 = new VBPropertySpace(new HashSet())
        shouldBeVB.put(Access.ENTRY,2,ent2)
        val ent3 = new VBPropertySpace(e3)
        shouldBeVB.put(Access.ENTRY,3,ent3)
        val ex1 = new VBPropertySpace(new HashSet())
        shouldBeVB.put(Access.EXIT,1,ex1)
        val ex2 = new VBPropertySpace(new HashSet())
        shouldBeVB.put(Access.EXIT,2,ex2)
        val ex3 = new VBPropertySpace(new HashSet())
        shouldBeVB.put(Access.EXIT,3,ex3)
        Assert.assertEquals(shouldBeVB, VB)
    }
	
//    /** Test the Very Busy Expressions analysis for the cfg1.wh program. */
//    @Test
//    def void testVBcfg1() {
//        val p = fromFileName("testsrc/cfg1.wh")
//        val VBa = new WhileLangVBAnalysis(p)
//        VBa.computeAnalysis()
//        val PropertyVector<Integer, VBPropertySpace> VB = VBa.VBInfo
//        val bod = p.body as CompoundS
//        val fv = new FreeVars()
//        val fvsbod = fv.FV(bod)
//        Assert.assertEquals(4, fvsbod.size())
//        Assert.assertEquals(2, VBa.inFormals.size())
//        val allQuestions = new VBPropertySpace(VBa.inFormals, new MaybeLabel())
//        Assert.assertEquals(allQuestions, VB.get(Access.ENTRY, 1))
//        val ex1 = allQuestions.copy()
//        ex1.join(new VBPropertySpace("q", new MaybeLabel(1)))
//        // System.out.println(ex1.toString())
//        Assert.assertEquals(VB.labels, CFG.labels(bod)) 
//        Assert.assertEquals(ex1, VB.get(Access.EXIT, 1))
//        val ent2 = ex1.copy()
//        Assert.assertEquals(ent2, VB.get(Access.ENTRY, 2))
//        val ex2 = ent2.copy()
//        ex2.join(new VBPropertySpace("r", new MaybeLabel(2)))
//        Assert.assertEquals(ex2, VB.get(Access.EXIT, 2))
//        val ent3 = ex2.copy()
//        ent3.join(new VBPropertySpace("r", new MaybeLabel(4)))
//        ent3.join(new VBPropertySpace("q", new MaybeLabel(6)))
//        Assert.assertEquals(ent3, VB.get(Access.ENTRY, 3))
//        val ex3 = ent3.copy()
//        Assert.assertEquals(ex3, VB.get(Access.EXIT, 3))
//        val ent4 = ex3.copy()
//        Assert.assertEquals(ent4, VB.get(Access.ENTRY, 4))
//        val ex4 = new VBPropertySpace()
//        ex4.join(new VBPropertySpace(VBa.inFormals, new MaybeLabel()))
//        ex4.join(new VBPropertySpace("r", new MaybeLabel(4)))
//        ex4.join(new VBPropertySpace("q", new MaybeLabel(1)))
//        ex4.join(new VBPropertySpace("q", new MaybeLabel(6)))
//        Assert.assertEquals(ex4, VB.get(Access.EXIT, 4))
//        val ent5 = ex4.copy()
//        Assert.assertEquals(ent5, VB.get(Access.ENTRY, 5))
//        val ex5 = ent5.copy()
//        Assert.assertEquals(ex5, VB.get(Access.EXIT, 5))
//        val ent6 = ex5.copy()
//        Assert.assertEquals(ent6, VB.get(Access.ENTRY, 6))
//        val ex6 = new VBPropertySpace()
//        ex6.join(new VBPropertySpace(VBa.inFormals, new MaybeLabel()))
//        ex6.join(new VBPropertySpace("r", new MaybeLabel(4)))
//        ex6.join(new VBPropertySpace("q", new MaybeLabel(6)))
//        Assert.assertEquals(ex6, VB.get(Access.EXIT, 6))
//    }  
}