package edu.ucf.cs.whilelang.tests;

import com.google.inject.Inject
import edu.ucf.cs.whilelang.whileLang.Program
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.Assert
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(WhileLangInjectorProvider)
class ParserTest {
	
	@Inject extension ParseHelper<Program> parseHelper
	
  	// utility asserts to test parser
	  
  	def void assertParseOk(String s) {
		val result = s.parse
		Assert.assertNotNull(result)
		val errors = result.eResource.errors
		Assert.assertTrue('''Unexpected errors: «errors.join(", ")»''', errors.isEmpty)
  	}
  
	def void assertParseError(String s) {
		val result = s.parse
		Assert.assertNotNull(result)
		val errors = result.eResource.errors
		Assert.assertFalse("Expected to find parse error in " + s, errors.isEmpty)
	}
	  
	@Test
	def void testSimpleBlock() {
		assertParseOk("proc testSimpleBLock() is {skip}");
	}
	
	@Test
	def void testSimpleSkip2() {
		assertParseOk("proc testSimpleSkip2() is { skip; skip }");
	}
	
	@Test
	def void testExtraSemi() {
	    assertParseError("proc testExtraSemi() is { skip; skip; }");
	  }

	// Statements
	@Test
	def void testSimpleAssign() {
		assertParseOk("proc testSimpleAssign() is { x := 3-1*4 }")
	}
	
	@Test
	def void testCompoundSWithIf() {
		assertParseOk('''
				proc testCompoundSWithIf(i, j, x) is
				{ skip; 
				  i := 3; 
				  j := i*i-5/7+2; 
				  if true then {x := 1} else {x := 0} 
				}
				''')
	}
	
	@Test
	def void testNestedStmts() {
		assertParseOk('''
				proc testNestedStmts(i,z,k,j) is {
					i := z + 5*5*4/3-4*6+8-k; 
					j := (3+4)*7;
					{
						if i < 0 
						then { x := 1; 
							   y := y-x+4*7; 
							   skip; 
							   while 3 < z 
							   do { z := z+1 }
						} else { 
							if q >= 7 and y <= 5 or 3 != 4 
							then { skip } 
							else { skip; x := x*4-1 }
							}
						}; 
						s := s+403-1 
					}; 
					skip 
				}
				''')  
	}
}
