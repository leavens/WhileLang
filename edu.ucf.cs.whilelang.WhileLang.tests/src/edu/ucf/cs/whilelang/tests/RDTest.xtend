package edu.ucf.cs.whilelang.tests;

import com.google.inject.Inject
import edu.ucf.cs.whilelang.WhileLangStandaloneSetup
import edu.ucf.cs.whilelang.utility.Access
import edu.ucf.cs.whilelang.utility.FreeVars
import edu.ucf.cs.whilelang.utility.MaybeLabel
import edu.ucf.cs.whilelang.utility.PropertyVector
import edu.ucf.cs.whilelang.utility.RDPropertySpace
import edu.ucf.cs.whilelang.validation.WhileLangRDAnalysis
import edu.ucf.cs.whilelang.validation.WhileLangValidator
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.Program
import java.io.FileInputStream
import java.util.HashMap
import org.eclipse.emf.common.util.URI
import org.eclipse.xtext.resource.XtextResourceSet
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.Assert
import org.junit.Test
import org.junit.runner.RunWith
import edu.ucf.cs.whilelang.utility.Pair
import edu.ucf.cs.whilelang.utility.CFG
import edu.ucf.cs.whilelang.utility.PVAsMap

/**
 * JUnit (4) tests for the Reaching Definitions analysis.
 */
@RunWith(XtextRunner)
@InjectWith(WhileLangInjectorProvider)
class RDTest {	
 
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
    
    /** Test the equals method of Pair */
    @Test
    def void testPairEquals() {
        val p1 = new Pair<Integer, MaybeLabel>(1, new MaybeLabel())
        val p2 = new Pair<Integer, MaybeLabel>(1, new MaybeLabel())
        val p3 = new Pair<Integer, MaybeLabel>(2, new MaybeLabel(3))
        val p4 = new Pair<Integer, MaybeLabel>(2, new MaybeLabel(4))
        Assert.assertEquals(p1, p1)
        Assert.assertEquals(p2,p2)
        Assert.assertEquals(p3, p3)
        Assert.assertEquals(p4,p4)
        Assert.assertEquals(p1, p2)
        Assert.assertEquals(p2,p1)
        Assert.assertEquals(p3, new Pair<Integer, MaybeLabel>(2, new MaybeLabel(3)))
        Assert.assertNotEquals(p1,p3)   
        Assert.assertNotEquals(p3,p4)   
    } 
    
    /** Test the equals method of RDPropertySpace */
    @Test
    def void testRDPSpaceEquals() {
        val rdpBot = new RDPropertySpace()
        Assert.assertEquals(rdpBot, rdpBot)
        val rd = new RDPropertySpace()
        rd.join(new RDPropertySpace("q", new MaybeLabel(1)))
        Assert.assertEquals(rd, rd)
        Assert.assertNotEquals(rdpBot, rd) 
        val rdi = new RDPropertySpace("i", new MaybeLabel(1))
        val rdi2 = new RDPropertySpace("i", new MaybeLabel(1))
        Assert.assertEquals(rdi, rdi2)
        Assert.assertEquals(rdi2, rdi)
        Assert.assertNotEquals(rdi, rd) 
        Assert.assertNotEquals(rdi2, rd)
        val rd2 = new RDPropertySpace()
        rd2.join(new RDPropertySpace("r", new MaybeLabel()))
        rd2.join(new RDPropertySpace("q", new MaybeLabel(1)))
        rd.join(new RDPropertySpace("r", new MaybeLabel()))
        Assert.assertEquals(rd, rd2)    
        Assert.assertEquals(rd2, rd)    
    } 
    
    /** Test the equals method of PropertyVector<MaybeLabel, RDPropertySpace> */
    @Test
    def void testPropertyVectorEquals() {
        val p = fromFileName("testsrc/simpleWhile.wh")
        val bod = p.body as CompoundS
        val labs = CFG.labels(bod)
        Assert.assertEquals(3, labs.size())
        val pvbot = new PVAsMap(labs, new RDPropertySpace())
        Assert.assertEquals(pvbot, pvbot)
        val pv2 = new PVAsMap(labs, new RDPropertySpace())
        val ent1 = new RDPropertySpace("i", new MaybeLabel())
        pv2.put(Access.ENTRY, 1, ent1)
        val ex1 = new RDPropertySpace("i", new MaybeLabel(1))
        pv2.put(Access.EXIT, 1, ex1)
        Assert.assertEquals(pv2,pv2)
        Assert.assertNotEquals(pvbot, pv2)
    }
    
    /** Test the Reaching Definitions analysis for the simpleWhile.wh program. */
    @Test
    def void testPropertyVectorSimpleWh() {
        val p = fromFileName("testsrc/simpleWhile.wh")
        val WhileLangRDAnalysis rda = new WhileLangRDAnalysis(p)
        rda.computeAnalysis()
        val PropertyVector<Integer, RDPropertySpace> rd = rda.RDInfo
        /** The expected value of the RD analysis for this program. */
        val PropertyVector<Integer, RDPropertySpace> shouldBeRD 
            = new PVAsMap<Integer, RDPropertySpace>()
        val ent1 = new RDPropertySpace() // i is a res variable, not a val!
        shouldBeRD.put(Access.ENTRY,1,ent1)
        val ent2 = new RDPropertySpace("i", new MaybeLabel(1))
        ent2.join(new RDPropertySpace("i", new MaybeLabel(3)))
        shouldBeRD.put(Access.ENTRY,2,ent2)
        val ent3 = new RDPropertySpace("i", new MaybeLabel(1))
        ent3.join(new RDPropertySpace("i", new MaybeLabel(3)))
        shouldBeRD.put(Access.ENTRY,3,ent3)
        val ex1 = new RDPropertySpace("i", new MaybeLabel(1))
        shouldBeRD.put(Access.EXIT,1,ex1)
        val ex2 = new RDPropertySpace("i", new MaybeLabel(1))
        ex2.join(new RDPropertySpace("i", new MaybeLabel(3)))
        shouldBeRD.put(Access.EXIT,2,ex2)
        val ex3 = new RDPropertySpace("i", new MaybeLabel(3))
        shouldBeRD.put(Access.EXIT,3,ex3)
        Assert.assertEquals(shouldBeRD, rd)
    }
	
    /** Test the Reaching Definitions analysis for the cfg1.wh program. */
    @Test
    def void testRDcfg1() {
        val p = fromFileName("testsrc/cfg1.wh")
        val rda = new WhileLangRDAnalysis(p)
        rda.computeAnalysis()
        val PropertyVector<Integer, RDPropertySpace> rd = rda.RDInfo
        val bod = p.body as CompoundS
        val fv = new FreeVars()
        val fvsbod = fv.FV(bod)
        Assert.assertEquals(4, fvsbod.size())
        Assert.assertEquals(2, rda.inFormals.size())
        val allQuestions = new RDPropertySpace(rda.inFormals, new MaybeLabel())
        Assert.assertEquals(allQuestions, rd.get(Access.ENTRY, 1))
        val ex1 = allQuestions.copy()
        ex1.join(new RDPropertySpace("q", new MaybeLabel(1)))
        // System.out.println(ex1.toString())
        Assert.assertEquals(rd.labels, CFG.labels(bod)) 
        Assert.assertEquals(ex1, rd.get(Access.EXIT, 1))
        val ent2 = ex1.copy()
        Assert.assertEquals(ent2, rd.get(Access.ENTRY, 2))
        val ex2 = ent2.copy()
        ex2.join(new RDPropertySpace("r", new MaybeLabel(2)))
        Assert.assertEquals(ex2, rd.get(Access.EXIT, 2))
        val ent3 = ex2.copy()
        ent3.join(new RDPropertySpace("r", new MaybeLabel(4)))
        ent3.join(new RDPropertySpace("q", new MaybeLabel(6)))
        Assert.assertEquals(ent3, rd.get(Access.ENTRY, 3))
        val ex3 = ent3.copy()
        Assert.assertEquals(ex3, rd.get(Access.EXIT, 3))
        val ent4 = ex3.copy()
        Assert.assertEquals(ent4, rd.get(Access.ENTRY, 4))
        val ex4 = new RDPropertySpace()
        ex4.join(new RDPropertySpace(rda.inFormals, new MaybeLabel()))
        ex4.join(new RDPropertySpace("r", new MaybeLabel(4)))
        ex4.join(new RDPropertySpace("q", new MaybeLabel(1)))
        ex4.join(new RDPropertySpace("q", new MaybeLabel(6)))
        Assert.assertEquals(ex4, rd.get(Access.EXIT, 4))
        val ent5 = ex4.copy()
        Assert.assertEquals(ent5, rd.get(Access.ENTRY, 5))
        val ex5 = ent5.copy()
        Assert.assertEquals(ex5, rd.get(Access.EXIT, 5))
        val ent6 = ex5.copy()
        Assert.assertEquals(ent6, rd.get(Access.ENTRY, 6))
        val ex6 = new RDPropertySpace()
        ex6.join(new RDPropertySpace(rda.inFormals, new MaybeLabel()))
        ex6.join(new RDPropertySpace("r", new MaybeLabel(4)))
        ex6.join(new RDPropertySpace("q", new MaybeLabel(6)))
        Assert.assertEquals(ex6, rd.get(Access.EXIT, 6))
    }  
}