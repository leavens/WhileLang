package edu.ucf.cs.whilelang.tests;

import com.google.inject.Inject
import edu.ucf.cs.whilelang.validation.WhileLangValidator
import edu.ucf.cs.whilelang.whileLang.Program
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.runner.RunWith
import java.io.FileInputStream
import org.junit.Test
import org.junit.Assert
import edu.ucf.cs.whilelang.WhileLangStandaloneSetup
import edu.ucf.cs.whilelang.utility.CFG
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.xtext.resource.XtextResourceSet
import org.eclipse.emf.common.util.URI
import java.util.HashMap

/**
 * JUnit (4) tests for inFlows and outFlows attributes. 
 * For the tests using the file testsrc/cfg1.wh, 
 * see cfg1.wh-prettyprint for what the labels are.
 */
@RunWith(XtextRunner)
@InjectWith(WhileLangInjectorProvider)
class CFGTest {
	
	@Inject extension ParseHelper<Program> parseHelper
	
	/** Parse a program from the given file name. */
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
//
//	public void testOutFlowsProg() throws IOException, Exception {
//		Program p = parseFromFile("testsrc/cfg1.wh");
//		S pbody = p.getS();
//		Set<Label> outs = pbody.outFlows();
//		assertEquals(0, outs.size());
//	}
//
//	public void testOutFlows1() throws IOException, Exception {
//		Program p = parseFromFile("testsrc/cfg1.wh");
//		assertTrue(p.getS() instanceof CompoundS);
//		S stmt1 = ((CompoundS)p.getS()).getSList(0);
//		Set<Label> outs = stmt1.outFlows();
//		assertEquals(1, outs.size());
//		assertTrue(outs.contains(new NumLabel("2")));
//	}
//
//	public void testOutFlows2() throws IOException, Exception {
//		Program p = parseFromFile("testsrc/cfg1.wh");
//		assertTrue(p.getS() instanceof CompoundS);
//		S stmt2 = ((CompoundS)p.getS()).getSList(1);
//		Set<Label> outs = stmt2.outFlows();
//		assertEquals(1, outs.size());
//		assertTrue(outs.contains(new NumLabel("6")));
//	}
//	
//	public void testOutFlows3() throws IOException, Exception {
//		Program p = parseFromFile("testsrc/cfg1.wh");
//		assertTrue(p.getS() instanceof CompoundS);
//		S stmt3 = ((CompoundS)p.getS()).getSList(2);
//		assertTrue(stmt3 instanceof WhileS);
//		WhileS wh = (WhileS)stmt3;
//		LabeledExpr blk6 = wh.getLabeledExpr();
//		Set<Label> outs = blk6.outFlows();
//		assertEquals(2, outs.size());
//		assertTrue(outs.contains(new NumLabel("3")));
//		assertTrue(outs.contains(new NumLabel("7")));
//	}
//	
//	public void testInFlows3() throws IOException, Exception {
//		Program p = parseFromFile("testsrc/cfg1.wh");
//		assertTrue(p.getS() instanceof CompoundS);
//		S stmt3 = ((CompoundS)p.getS()).getSList(2);
//		assertTrue(stmt3 instanceof WhileS);
//		WhileS wh = (WhileS)stmt3;
//		LabeledExpr blk6 = wh.getLabeledExpr();
//		Set<Label> ins = blk6.inFlows();
//		assertEquals(2, ins.size());
//		assertTrue(ins.contains(new NumLabel("5")));
//		assertTrue(ins.contains(new NumLabel("2")));
//	}
//
//	public void testWhileBodyFlows() throws IOException, Exception {
//		Program p = parseFromFile("testsrc/cfg1.wh");
//		assertTrue(p.getS() instanceof CompoundS);
//		S stmt6 = ((CompoundS)p.getS()).getSList(2);
//		assertTrue(stmt6 instanceof WhileS);
//		WhileS wh = (WhileS)stmt6;
//		CompoundS body = (CompoundS)wh.getS();
//		S stmt3 = body.getSList(0);
//		Set<Label> ins = stmt3.inFlows();
//		assertEquals(1, ins.size());
//		assertTrue(ins.contains(new NumLabel("6")));
//		Set<Label> outs = stmt3.outFlows();
//		assertEquals(1, outs.size());
//		assertTrue(outs.contains(new NumLabel("4")));
//	}
//	
//	public void testProgLabels() throws IOException, Exception {
//		Program p = parseFromFile("testsrc/cfg1.wh");
//		assertTrue(p.getS() instanceof CompoundS);
//		S stmt6 = ((CompoundS)p.getS()).getSList(2);
//		assertTrue(stmt6 instanceof WhileS);
//		WhileS wh = (WhileS)stmt6;
//		CompoundS body = (CompoundS)wh.getS();
//		AssignS stmt3 = (AssignS) body.getSList(0);
//		Set<Label> labs = stmt3.progLabels();
//		assertEquals(7, labs.size());
//		assertTrue(labs.contains(new NumLabel("1")));
//		assertTrue(labs.contains(new NumLabel("2")));
//		assertTrue(labs.contains(new NumLabel("3")));
//		assertTrue(labs.contains(new NumLabel("4")));
//		assertTrue(labs.contains(new NumLabel("5")));
//		assertTrue(labs.contains(new NumLabel("6")));
//		assertTrue(labs.contains(new NumLabel("7")));
//	}
//
//	public void testProgFVs() throws IOException, Exception {
//		Program p = parseFromFile("testsrc/cfg1.wh");
//		assertTrue(p.getS() instanceof CompoundS);
//		S stmt6 = ((CompoundS)p.getS()).getSList(2);
//		assertTrue(stmt6 instanceof WhileS);
//		WhileS wh = (WhileS)stmt6;
//		CompoundS body = (CompoundS)wh.getS();
//		AssignS stmt3 = (AssignS) body.getSList(0);
//		Set<String> vars = stmt3.progFV();
//		assertEquals(4, vars.size());
//		assertTrue(vars.contains("q"));
//		assertTrue(vars.contains("r"));
//		assertTrue(vars.contains("x"));
//		assertTrue(vars.contains("y"));
//	}
//
//	public CFGTests(String s) {
//		super(s);
//	}
//	
//	public static junit.framework.Test suite() {
//		return new junit.framework.TestSuite(tests.CFGTests.class);
//	}
//
//	public static void main(String args[]) {
//		if (args.length == 1 && args[0].equals("-text")) {
//			junit.textui.TestRunner.run(CFGTests.class);
//		} else {
//			junit.swingui.TestRunner.run(CFGTests.class);
//		}
//	}

}
