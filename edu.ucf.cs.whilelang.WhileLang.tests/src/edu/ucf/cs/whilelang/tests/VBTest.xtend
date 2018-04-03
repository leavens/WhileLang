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
import edu.ucf.cs.whilelang.whileLang.IfS

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
	
    /** Test the Very Busy Expressions analysis for the vb1.wh program. */
    @Test
    def void testVBvb1() {
        val p = fromFileName("testsrc/vb1.wh")
        VBPropertySpace.setProgram(p)
        /** The expected value of the VB analysis for this program. */
        val PropertyVector<Integer, VBPropertySpace> shouldBeVB 
            = new PVAsMap<Integer, VBPropertySpace>()
        val bod = p.body as CompoundS
        val s9 = bod.stmts.get(5) as IfS
        val s10 = s9.s1 as AssignS
        val s11 = s9.s2 as AssignS
        val s12 = bod.stmts.get(6) as IfS
        val s13 = s12.s1 as AssignS
        shouldBeVB.put(Access.EXIT,13,new VBPropertySpace())
        val en13 = new VBPropertySpace(s13.aexp)
        shouldBeVB.put(Access.ENTRY,13,en13)
        shouldBeVB.put(Access.EXIT,14,new VBPropertySpace())
        shouldBeVB.put(Access.ENTRY,14,new VBPropertySpace())
        shouldBeVB.put(Access.EXIT, 12, new VBPropertySpace())
        shouldBeVB.put(Access.ENTRY, 12, new VBPropertySpace())
        val en11 = new VBPropertySpace(s11.aexp)
        shouldBeVB.put(Access.EXIT,11,new VBPropertySpace())
        shouldBeVB.put(Access.ENTRY,11,en11)
        shouldBeVB.put(Access.EXIT,10,new VBPropertySpace())
        val en10 = new VBPropertySpace(s10.aexp)
        shouldBeVB.put(Access.ENTRY,10,en10)
        val ex9 = new VBPropertySpace()
        ex9.join(en11)
        ex9.join(en10)
        for (i : 1..9) {
            shouldBeVB.put(Access.EXIT,i,ex9)
            shouldBeVB.put(Access.ENTRY,i,ex9)
        }
        Assert.assertEquals(shouldBeVB, shouldBeVB)
//        System.out.println("Starting VB analysis for vb1.wh")
//        val VBa = new WhileLangVBAnalysis(p)
//        VBa.computeAnalysis()
//        val PropertyVector<Integer, VBPropertySpace> VB = VBa.VBInfo
//        System.out.println("Finished VB analysis for vb1.wh")
//        Assert.assertEquals(shouldBeVB, VB)
    }  
}