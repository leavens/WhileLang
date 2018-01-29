package edu.ucf.cs.whilelang.tests;

import com.google.inject.Inject
import edu.ucf.cs.whilelang.WhileLangStandaloneSetup
import edu.ucf.cs.whilelang.utility.CFG
import edu.ucf.cs.whilelang.utility.Pair
import edu.ucf.cs.whilelang.validation.WhileLangValidator
import edu.ucf.cs.whilelang.whileLang.CompoundS
import edu.ucf.cs.whilelang.whileLang.IfS
import edu.ucf.cs.whilelang.whileLang.Program
import edu.ucf.cs.whilelang.whileLang.WhileS
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

/**
 * JUnit (4) tests for inFlows and outFlows attributes. 
 * For the tests using the file testsrc/cfg1.wh, 
 * see cfg1.wh-prettyprint for what the labels are.
 */
@RunWith(XtextRunner)
@InjectWith(WhileLangInjectorProvider)
class CFGTest {
	
	@Inject extension ParseHelper<Program> parseHelper
	
	/** Parse a program from the given file name and validate it, 
	 * then return the validated AST. */
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
	def void testCFGInit() {
		val p = fromFileName("testsrc/cfg1.wh")
		val i = CFG.init(p.body)
		Assert.assertTrue("init of cfg1.wh was " + i + " not 1", CFG.init(p.body) == 1)
	}
	
	@Test
	def void testInit1A() {
		val p = fromFileName("testsrc/cfg1.wh");
		val CompoundS bod = p.body as CompoundS
		for (i : 0..1) {
			val ini = CFG.init(bod.stmts.get(i))
			Assert.assertEquals(i+1, ini)
		}
		val wl = bod.stmts.get(2) as WhileS
		val wli = CFG.init(wl)
		Assert.assertEquals("init of cfg1.wh's while loop is 3", 3, wli)
		val wlbod = wl.block
		for (i: 0..2) {
			val start = CFG.init(wlbod.stmts.get(i))
			Assert.assertEquals("block " + (i+4) + " of cfg1.wh's loop body has init " + (i+4),
					i+4, start);
		}

	}

	@Test
	def void testFinals1() {
		val p = fromFileName("testsrc/cfg1.wh");
		val outs = CFG.finals(p.body)
		Assert.assertEquals(1, outs.size());
		Assert.assertTrue("finals of cfg1.wh is {3}", outs.contains(3))
	}
	
	@Test
	def void testFinals1A() {
		val p = fromFileName("testsrc/cfg1.wh");
		val CompoundS bod = p.body as CompoundS
		for (i : 0..1) {
			val fini = CFG.finals(bod.stmts.get(i))
			Assert.assertTrue("finals of cfg1.wh label " + (i+1) + " is {" + (i+1) +"}", 
					fini.size() == 1 && fini.contains(i+1))
		}
		val wl = bod.stmts.get(2) as WhileS
		val wlf = CFG.finals(wl)
		Assert.assertEquals("size of while loop finals is 1", 1, wlf.size())
		Assert.assertTrue("finals of cfg1.wh's while loop is {3}", 
						wlf.contains(3))
		val wlbod = wl.block
		for (i: 0..2) {
			val fin = CFG.finals(wlbod.stmts.get(i))
			Assert.assertTrue("block " + (i+4) + " of cfg1.wh's loop body has finals {" + (i+4) + "}",
					fin.size() == 1 && fin.contains(i+4));
		}

	}
	

	@Test
	def void testFinalsIfs() {
		val p = fromFileName("testsrc/cfgifs.wh");
		val outs = CFG.finals(p.body)
		Assert.assertEquals(4, outs.size());
		Assert.assertTrue("finals of cfgifs.wh is {4,5,7,8}", 
				outs.contains(4) && outs.contains(5) && outs.contains(7) && outs.contains(8))
	}
	
	@Test
	def void testLabels1() {
		val p = fromFileName("testsrc/cfg1.wh");
		val labs = CFG.labels(p.body)
		Assert.assertEquals(6, labs.size());
		for (i: 1..6) {
			Assert.assertTrue("labels of cfg1.wh contains " +i, 
				labs.contains(i))
		}
		val bod = p.body as CompoundS
		for (i: 0..1) {
			val ls = CFG.labels(bod.stmts.get(i))
			Assert.assertEquals(1, ls.size());
			Assert.assertTrue("labels of cfg1.wh is {" + (i+1) + "}",
					ls.contains(i+1))
		}
		val wl = bod.stmts.get(2) as WhileS
		val wlabs = CFG.labels(wl)
		Assert.assertEquals(4, wlabs.size());
	}

	@Test
	def void testLabelsIfs() {
		val p = fromFileName("testsrc/cfgifs.wh");
		val labs = CFG.labels(p.body)
		Assert.assertEquals(8, labs.size());
		for (i: 1..8) {
			Assert.assertTrue("labels of cfgifs.wh contains " +i, 
				labs.contains(i))
		}
	}
	
	@Test
	def void testBlocks1() {
		val p = fromFileName("testsrc/cfg1.wh");
		val CompoundS bod = p.body as CompoundS
		val blks = CFG.blocks(bod)
		Assert.assertEquals(6, blks.size())
		for (i: 0..1) {
			Assert.assertTrue("blocks of cfg1.wh contains block with label " + (i+1),
					blks.contains(bod.stmts.get(i)));
		}
		val wl = bod.stmts.get(2) as WhileS
		Assert.assertTrue("blocks of cfg1.wh contains while loop's test",
				blks.contains(wl.bexp));
		val wlbod = wl.block
		for (i: 0..2) {
			Assert.assertTrue("blocks of cfg1.wh's loop contains block with label " + (i+4),
					blks.contains(wlbod.stmts.get(i)));
		}
	}

	@Test
	def void testBlockOf1() {
		val p = fromFileName("testsrc/cfg1.wh");
		Assert.assertEquals("itsBlockMap has size 6", 6, CFG.itsBlockMap.size())
		val CompoundS bod = p.body as CompoundS
		for (i: 0..1) {
			Assert.assertEquals(bod.stmts.get(i), CFG.blockOf(i+1))
		}
        val wl = bod.stmts.get(2) as WhileS
        Assert.assertEquals("block 3 of cfg1.wh is the while loop's test",
                wl.bexp, CFG.blockOf(3));
        val wlbod = wl.block
        for (i: 0..2) {
            Assert.assertEquals("block" + (i+4) + " of cfg1.wh's loop found",
                    wlbod.stmts.get(i), CFG.blockOf(i+4));
        }
		
	}
	
	@Test
    def void testFlowsOf1() {
        val p = fromFileName("testsrc/cfg1.wh");
        Assert.assertEquals("cfgMap has size 8", 8, CFG.cfgMap.size())
        val CompoundS bod = p.body as CompoundS
        // System.out.println(CFG.cfgMap.toString())
        for (i: 0..1) {
            val flmap = CFG.flowsOf(bod.stmts.get(i))
            Assert.assertEquals("In cfg1.wh block " + (i+1) + " is empty",
                    0, flmap.size()) 
        }
        val wl = bod.stmts.get(2) as WhileS
        val wflows = CFG.flowsOf(wl)
        Assert.assertEquals("loop of cfg1.wh has 4 flows", 4, wflows.size())
        // System.out.println("flows of loop: " + wflows.toString())
        Assert.assertTrue("loop in cfg1.wh has expected flow (3,4)",
               wflows.contains(new Pair<Integer,Integer>(3,4)));
        Assert.assertTrue("loop in cfg1.wh has expected flow (4,5)",
                wflows.contains(new Pair<Integer,Integer>(4,5)));
        Assert.assertTrue("loop in cfg1.wh has expected flow (5,6)",
                wflows.contains(new Pair<Integer,Integer>(5,6)));
        Assert.assertTrue("loop in cfg1.wh has expected flow (6,3)",
        		wflows.contains(new Pair<Integer,Integer>(6,3)));
    }

    @Test
    def void testFlowsOfIfs() {
        val p = fromFileName("testsrc/cfgifs.wh");
        Assert.assertEquals("cfgMap has size 15", 15, CFG.cfgMap.size())
        val CompoundS bod = p.body as CompoundS
        // System.out.println(CFG.cfgMap.toString())
        val IfS ifs = bod.stmts.get(0) as IfS;
        val bflows = CFG.flowsOf(bod)
        val ifsflows = CFG.flowsOf(ifs)
        // bflows.equals(ifs) doesn't work (as is using wrong notion of equals)
        Assert.assertEquals("flows of program same as if statement in body",
            bflows.size(), ifsflows.size())
        for (m: bflows) {
            Assert.assertTrue("elem in bflows is in ifsflows",
                ifsflows.contains(m))
        }
        val truePart = ifs.s1
        val tpflows = CFG.flowsOf(truePart)
        Assert.assertEquals("3 flows in outer true part", 3, tpflows.size())
        Assert.assertTrue("if in cfgifs.wh has expected flow (2,3)",
               tpflows.contains(new Pair<Integer,Integer>(2,3)));
        Assert.assertTrue("if in cfgifs.wh has expected flow (3,4)",
               tpflows.contains(new Pair<Integer,Integer>(3,4)));
        Assert.assertTrue("if in cfgifs.wh has expected flow (2,5)",
               tpflows.contains(new Pair<Integer,Integer>(2,5)));
    }
	
}
