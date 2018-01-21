package edu.ucf.cs.whilelang.generator;

import com.google.common.collect.Iterables;
import edu.ucf.cs.whilelang.generator.WhileLangCodeGen;
import edu.ucf.cs.whilelang.generator.WhileLangUnparser;
import edu.ucf.cs.whilelang.whileLang.S;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.xtext.generator.AbstractGenerator;
import org.eclipse.xtext.generator.IFileSystemAccess2;
import org.eclipse.xtext.generator.IGeneratorContext;
import org.eclipse.xtext.xbase.lib.IteratorExtensions;

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
@SuppressWarnings("all")
public class WhileLangGenerator extends AbstractGenerator {
  @Override
  public void doGenerate(final Resource resource, final IFileSystemAccess2 fsa, final IGeneratorContext context) {
    Iterable<S> _filter = Iterables.<S>filter(IteratorExtensions.<EObject>toIterable(resource.getAllContents()), S.class);
    for (final S p : _filter) {
      {
        fsa.generateFile("generated/Unparsed.wh", this.unparser(p));
        fsa.generateFile("generated/RunMe.java", this.compile(p));
      }
    }
  }
  
  public String unparser(final S s) {
    return new WhileLangUnparser().unparse(s);
  }
  
  public String compile(final S s) {
    return new WhileLangCodeGen().toJava(s);
  }
}
