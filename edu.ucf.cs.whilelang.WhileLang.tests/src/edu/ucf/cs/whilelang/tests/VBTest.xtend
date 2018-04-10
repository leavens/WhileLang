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
import edu.ucf.cs.whilelang.whileLang.Expr

import static extension edu.ucf.cs.whilelang.utility.ASTExtensions.*

/**
 * JUnit (4) tests for the Very Busy Expressions analysis.
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
    
    /** Test the equals method of VBPropertySpace */
    @Test
    def void testVBPSpaceEqualsForEmpty() {
        val p = fromFileName("testsrc/vb1.wh")
        VBPropertySpace.setProgram(p)
        val vbEmp = new VBPropertySpace(new HashSet<Expr>())
        Assert.assertEquals(vbEmp, vbEmp)
    } 
    
    /** Test the equals method of VBPropertySpace */
    @Test
    def void testVBPSpaceEquals1() {
        val p = fromFileName("testsrc/vb1.wh")
        VBPropertySpace.setProgram(p)
        val bod = p.body as CompoundS
        val s3 = bod.stmts.get(2) as IfS
        val t3 = s3.bexp.be
        val apb = t3.leftSubExp
        val amb = t3.rightSubExp
        val hs1 = new HashSet<Expr>()
        val hs2 = new HashSet<Expr>()
        hs1.add(apb)
        hs1.add(amb)
        hs2.add(amb)
        hs2.add(apb)
        val vb1 = new VBPropertySpace(hs1)
        val vb2 = new VBPropertySpace(hs2)
        Assert.assertEquals(vb1, vb2)
        val hs3 = new HashSet<Expr>()
        hs3.add(apb)
        val vb3 = new VBPropertySpace(hs3)
        val vb4 = new VBPropertySpace(hs3)
        Assert.assertEquals(vb3,vb4)
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
        val vb2 = new PVAsMap<Integer, VBPropertySpace>()
        Assert.assertEquals(shouldBeVB, vb2)
        val ent1 = new VBPropertySpace(new HashSet())
        shouldBeVB.put(Access.ENTRY,1,ent1)
        vb2.put(Access.ENTRY,1,ent1)
        val ent2 = new VBPropertySpace(new HashSet())
        shouldBeVB.put(Access.ENTRY,2,ent2)
        vb2.put(Access.ENTRY,2,ent2)
        val ent3 = new VBPropertySpace(e3)
        shouldBeVB.put(Access.ENTRY,3,ent3)
        vb2.put(Access.ENTRY,3,ent3)
        val ex1 = new VBPropertySpace(new HashSet())
        shouldBeVB.put(Access.EXIT,1,ex1)
        vb2.put(Access.EXIT,1,ex1)
        val ex2 = new VBPropertySpace(new HashSet())
        shouldBeVB.put(Access.EXIT,2,ex2)
        vb2.put(Access.EXIT,2,ex2)
        val ex3 = new VBPropertySpace(new HashSet())
        shouldBeVB.put(Access.EXIT,3,ex3)
        vb2.put(Access.EXIT,3,ex3)
        Assert.assertEquals(shouldBeVB, VB)
        Assert.assertEquals(shouldBeVB, vb2) 
        Assert.assertEquals(vb2, shouldBeVB)  
        Assert.assertEquals(vb2, vb2)     
    }
    
    /** Test the copy funciont on VBPropertySpace. */
    @Test
    def void testCopy() {
        val p = fromFileName("testsrc/vb1.wh")
        VBPropertySpace.setProgram(p)
        val vbBot = new VBPropertySpace()
        val vb2 = vbBot.copy()
        Assert.assertEquals(vbBot, vb2)
        val bod = p.body as CompoundS
        val s9 = bod.stmts.get(5) as IfS
        val s10 = s9.s1 as AssignS
        val v9 = new VBPropertySpace(s10.aexp)
        vb2.join(v9)
        Assert.assertNotEquals(vb2, vbBot)
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
        shouldBeVB.put(Access.EXIT,13,new VBPropertySpace(new HashSet()))
        val en13 = new VBPropertySpace(s13.aexp)
        shouldBeVB.put(Access.ENTRY,13,en13)
        shouldBeVB.put(Access.EXIT,14,new VBPropertySpace(new HashSet()))
        shouldBeVB.put(Access.ENTRY,14,new VBPropertySpace(new HashSet()))
        shouldBeVB.put(Access.EXIT, 12, new VBPropertySpace(new HashSet()))
        shouldBeVB.put(Access.ENTRY, 12, new VBPropertySpace(new HashSet()))
        val en11 = new VBPropertySpace(s11.aexp)
        shouldBeVB.put(Access.EXIT,11,new VBPropertySpace(new HashSet()))
        shouldBeVB.put(Access.ENTRY,11,en11)
        shouldBeVB.put(Access.EXIT,10,new VBPropertySpace(new HashSet()))
        val en10 = new VBPropertySpace(s10.aexp)
        shouldBeVB.put(Access.ENTRY,10,en10)
        val ex9 = new VBPropertySpace()
        ex9.join(en11)
        ex9.join(en10)
        for (i : 7..9) {
            shouldBeVB.put(Access.EXIT,i,ex9)
            shouldBeVB.put(Access.ENTRY,i,ex9)
        }
        for (i : 4..5) {
            shouldBeVB.put(Access.EXIT,i,ex9)
            shouldBeVB.put(Access.ENTRY,i,ex9)
        }
        shouldBeVB.put(Access.EXIT,3,ex9)
        val j3 = new VBPropertySpace()
        val es = new HashSet<VBPropertySpace>()
        es.add(ex9)
        es.add(ex9.copy())
        j3.joinAll(es)
        Assert.assertEquals(j3,ex9)
        val en3 = new VBPropertySpace()  // {a+b,a-b}
        shouldBeVB.put(Access.ENTRY,3,en3)
        for (i : 1..2) {
            shouldBeVB.put(Access.EXIT,i,en3)
            shouldBeVB.put(Access.ENTRY,i,en3)
        }
        Assert.assertEquals(shouldBeVB, shouldBeVB)
        val VBa = new WhileLangVBAnalysis(p)
        VBa.computeAnalysis()
        val PropertyVector<Integer, VBPropertySpace> VB = VBa.VBInfo
        Assert.assertEquals(shouldBeVB, VB)
    } 
    
    /** Test the Very Busy Expressions analysis for the vb2.wh program. */
    @Test
    def void testVBvb2() {
        val p = fromFileName("testsrc/vb2.wh")
        VBPropertySpace.setProgram(p)
        /** The expected value of the VB analysis for this program. */
        val PropertyVector<Integer, VBPropertySpace> vbexpected 
            = new PVAsMap<Integer, VBPropertySpace>()
        val bod = p.body as CompoundS
        val s1 = bod.stmts.get(0) as IfS
        val vbemp = new VBPropertySpace(new HashSet())
        vbexpected.put(Access.EXIT,4,vbemp)
        vbexpected.put(Access.ENTRY,4,vbemp)
        vbexpected.put(Access.EXIT,3,vbemp)
        vbexpected.put(Access.EXIT,2,vbemp)
        val s3 = s1.s2 as AssignS
        val vapb = new VBPropertySpace(s3.aexp)
        vbexpected.put(Access.ENTRY,3,vapb)
        vbexpected.put(Access.ENTRY,2,vapb)
        vbexpected.put(Access.EXIT,1,vapb)
        vbexpected.put(Access.ENTRY,1,new VBPropertySpace())
        val VBa = new WhileLangVBAnalysis(p)
        VBa.computeAnalysis()
        val PropertyVector<Integer, VBPropertySpace> VB = VBa.VBInfo
        Assert.assertEquals(vbexpected, VB)
    }

    /** Test the Very Busy Expressions analysis for the vb3.wh program. */
    @Test
    def void testVBvb3() {
        val p = fromFileName("testsrc/vb3.wh")
        VBPropertySpace.setProgram(p)
        /** The expected value of the VB analysis for this program. */
        val PropertyVector<Integer, VBPropertySpace> vbexpected 
            = new PVAsMap<Integer, VBPropertySpace>()
        val bod = p.body as CompoundS
        val s2 = bod.stmts.get(1) as IfS
        val vbemp = new VBPropertySpace(new HashSet())
        vbexpected.put(Access.EXIT,4,vbemp)
        vbexpected.put(Access.EXIT,3,vbemp)
        val s3 = s2.s1 as AssignS
        val s4 = s2.s2 as AssignS
        vbexpected.put(Access.ENTRY,4,new VBPropertySpace(s4.aexp))
        vbexpected.put(Access.ENTRY,3,new VBPropertySpace(s3.aexp))
        vbexpected.put(Access.EXIT,2,vbemp)
        vbexpected.put(Access.ENTRY,2,vbemp)
        vbexpected.put(Access.EXIT,1,vbemp)
        vbexpected.put(Access.ENTRY,1,vbemp)
        val VBa = new WhileLangVBAnalysis(p)
        VBa.computeAnalysis()
        val PropertyVector<Integer, VBPropertySpace> VB = VBa.VBInfo
        Assert.assertEquals(vbexpected, VB)
    }
  
    /** Test the Very Busy Expressions analysis for the vb4.wh program. */
    @Test
    def void testVBvb4() {
        val p = fromFileName("testsrc/vb4.wh")
        VBPropertySpace.setProgram(p)
        /** The expected value of the VB analysis for this program. */
        val PropertyVector<Integer, VBPropertySpace> vbexpected 
            = new PVAsMap<Integer, VBPropertySpace>()
        val bod = p.body as CompoundS
        val s2 = bod.stmts.get(1) as AssignS
        val s3 = bod.stmts.get(2) as AssignS
        val vbemp = new VBPropertySpace(new HashSet())
        vbexpected.put(Access.EXIT,3,vbemp)
        val v3 = new VBPropertySpace(s3.aexp)
        vbexpected.put(Access.ENTRY,3,v3)
        vbexpected.put(Access.EXIT,2,v3)
        val v2 = new VBPropertySpace(s2.aexp)
        vbexpected.put(Access.ENTRY,2,v2)
        vbexpected.put(Access.EXIT,1,v2)
        vbexpected.put(Access.ENTRY,1,vbemp)
        val VBa = new WhileLangVBAnalysis(p)
        VBa.computeAnalysis()
        val PropertyVector<Integer, VBPropertySpace> VB = VBa.VBInfo
        Assert.assertEquals(vbexpected, VB)
    }

    /** Test the Very Busy Expressions analysis for the cfg1.wh program. */
    @Test
    def void testCfg1() {
        val p = fromFileName("testsrc/cfg1.wh")
        VBPropertySpace.setProgram(p)
        /** The expected value of the VB analysis for this program. */
        val PropertyVector<Integer, VBPropertySpace> vbexpected 
            = new PVAsMap<Integer, VBPropertySpace>()
        val bod = p.body as CompoundS
        val s3 = bod.stmts.get(2) as WhileS
        val wb = s3.block as CompoundS
        val s6 = wb.stmts.get(2) as AssignS
        val vbemp = new VBPropertySpace(new HashSet())
        vbexpected.put(Access.EXIT,3,vbemp)
        vbexpected.put(Access.ENTRY,3,vbemp)
        vbexpected.put(Access.EXIT,6,vbemp)
        val v6 = new VBPropertySpace(s6.aexp)
        vbexpected.put(Access.ENTRY,6,v6)
        vbexpected.put(Access.EXIT,5,v6)
        vbexpected.put(Access.ENTRY,5,v6)
        vbexpected.put(Access.EXIT,4,v6)
        vbexpected.put(Access.ENTRY,4,new VBPropertySpace()) // {q+1,r-y}
        for (i : 1..2) {
            vbexpected.put(Access.EXIT,i,vbemp)
            vbexpected.put(Access.ENTRY,i,vbemp)
        }  
        val VBa = new WhileLangVBAnalysis(p)
        VBa.computeAnalysis()
        val PropertyVector<Integer, VBPropertySpace> VB = VBa.VBInfo
        Assert.assertEquals(vbexpected, VB)
    }
    
}