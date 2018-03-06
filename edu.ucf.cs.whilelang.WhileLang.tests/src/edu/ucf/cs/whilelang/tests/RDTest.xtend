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
 * JUnit (4) tests for free variables.
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
    
    @Test
    def void testRDPSpaceEquals() {
        val rdpBot = new RDPropertySpace()
        Assert.assertEquals(rdpBot, rdpBot)
        val rd = new RDPropertySpace()
        rd.join(new RDPropertySpace("q", new MaybeLabel(1)))
        Assert.assertEquals(rd, rd)
        Assert.assertNotEquals(rdpBot, rd) 
        val rd2 = new RDPropertySpace()
        rd2.join(new RDPropertySpace("r", new MaybeLabel()))
        rd2.join(new RDPropertySpace("q", new MaybeLabel(1)))
        rd.join(new RDPropertySpace("r", new MaybeLabel()))
        Assert.assertEquals(rd, rd2)    
        Assert.assertEquals(rd2, rd)    
    } 
    
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
    
    @Test
    def void testPropertyVectorSimpleWh() {
        val p = fromFileName("testsrc/simpleWhile.wh")
        val rda = new WhileLangRDAnalysis(p)
        rda.computeAnalysis()
        val PropertyVector<Integer, RDPropertySpace, Pair<String, MaybeLabel>> rd = rda.RDInfo
        /** The expected value of the RD analysis for this program. */
        val PropertyVector<Integer, RDPropertySpace, Pair<String, MaybeLabel>> shouldBeRD 
            = new PVAsMap<Integer, RDPropertySpace, Pair<String, MaybeLabel>>()
        val ent1 = new RDPropertySpace("i", new MaybeLabel())
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
	
    @Test
    def void testRDcfg1() {
        val p = fromFileName("testsrc/cfg1.wh")
        val rda = new WhileLangRDAnalysis(p)
        rda.computeAnalysis()
        val PropertyVector<Integer, RDPropertySpace, Pair<String, MaybeLabel>> rd = rda.RDInfo
        val bod = p.body as CompoundS
        val fv = new FreeVars()
        val fvsbod = fv.FV(bod)
        Assert.assertEquals(4, fvsbod.size())
        val allQuestions = new RDPropertySpace(fvsbod, new MaybeLabel())
        Assert.assertEquals(allQuestions, rd.get(Access.ENTRY, 1))
        var ex1 = new RDPropertySpace()
        for (v : fvsbod) {
            if (v.equals("q")) {
                ex1.join(new RDPropertySpace("q", new MaybeLabel(1)))
            } else {
                ex1.join(new RDPropertySpace(v, new MaybeLabel()))
            }   
        }
        // System.out.println(ex1.toString())
        Assert.assertEquals(rd.labels, CFG.labels(bod)) 
        Assert.assertEquals(ex1, rd.get(Access.EXIT, 1))
    }  
}