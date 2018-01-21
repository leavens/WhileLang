package edu.ucf.cs.whilelang.generator

import edu.ucf.cs.whilelang.whileLang.S
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import edu.ucf.cs.whilelang.generator.WhileLangCodeGen
import edu.ucf.cs.whilelang.generator.WhileLangUnparser

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class WhileLangGenerator extends AbstractGenerator {

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
        val p = resource.getContents.get(0) as S
        fsa.generateFile("generated/Unparsed.wh", unparser(p))
        fsa.generateFile("generated/RunMe.java", compile(p))	
	}
	
	/** Unparse the given statement. */
    def String unparser(S s) {
        new WhileLangUnparser().unparse(s)
    }
     
    /** Translate the given statement into Java. */
    def String compile(S s) {
        new WhileLangCodeGen().toJava(s)
    }
    
}