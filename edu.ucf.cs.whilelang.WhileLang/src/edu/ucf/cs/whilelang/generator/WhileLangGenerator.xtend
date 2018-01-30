package edu.ucf.cs.whilelang.generator

import edu.ucf.cs.whilelang.whileLang.Program
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
        val p = resource.getContents.get(0) as Program
        fsa.generateFile("generated/" + p.name + ".wh", unparser(p))
        fsa.generateFile("generated/" + p.name + ".java", compile(p))	
	}
	
	/** Unparse the given program. */
    def String unparser(Program p) {
        '''
        proc «p.name»(«IF p.args !== null»«FOR i: p.args.names SEPARATOR ', '»«i»«ENDFOR»«ENDIF») is
        «new WhileLangUnparser().unparse(p.body)»
        '''   
    }

    /** Translate the given program to Java. */
    def String compile(Program p) {
        '''
        public class «p.name» {
            public static void main(String[] args) {
                if (args.length != «p.args.names.size()») {
                    System.err.println("«p.name» expects «p.args.names.size()» arguments");
                    System.exit(1);
                }
                int «FOR f : p.args.names SEPARATOR ','»«f»«ENDFOR»;
                «FOR i : 0..p.args.names.size()-1»«p.args.names.get(i)» = Integer.valueOf(args[«i»]);«ENDFOR»
                System.out.print("input:");
                «FOR f : p.args.names»System.out.print(" «f» = " + «f»);«ENDFOR»
                System.out.println();
                «new WhileLangCodeGen().toJava(p.body)»
                System.out.print("final:");
                «FOR f : p.args.names»System.out.print(" «f» = " + «f»);«ENDFOR»
                System.out.println();
            }
        }
        '''   
    }
}