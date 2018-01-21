package edu.ucf.cs.whilelang.generator;

import edu.ucf.cs.whilelang.generator.WhileLangCodeGen;
import edu.ucf.cs.whilelang.generator.WhileLangUnparser;
import edu.ucf.cs.whilelang.whileLang.Program;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.eclipse.xtext.generator.AbstractGenerator;
import org.eclipse.xtext.generator.IFileSystemAccess2;
import org.eclipse.xtext.generator.IGeneratorContext;

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
@SuppressWarnings("all")
public class WhileLangGenerator extends AbstractGenerator {
  @Override
  public void doGenerate(final Resource resource, final IFileSystemAccess2 fsa, final IGeneratorContext context) {
    EObject _get = resource.getContents().get(0);
    final Program p = ((Program) _get);
    String _name = p.getName();
    String _plus = ("generated/" + _name);
    String _plus_1 = (_plus + ".wh");
    fsa.generateFile(_plus_1, this.unparser(p));
    String _name_1 = p.getName();
    String _plus_2 = ("generated/" + _name_1);
    String _plus_3 = (_plus_2 + ".java");
    fsa.generateFile(_plus_3, this.compile(p));
  }
  
  /**
   * Unparse the given program.
   */
  public String unparser(final Program p) {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("proc ");
    String _name = p.getName();
    _builder.append(_name);
    _builder.append("(");
    {
      EList<String> _names = p.getArgs().getNames();
      boolean _hasElements = false;
      for(final String i : _names) {
        if (!_hasElements) {
          _hasElements = true;
        } else {
          _builder.appendImmediate(", ", "");
        }
        _builder.append(i);
      }
    }
    _builder.append(") is");
    _builder.newLineIfNotEmpty();
    String _unparse = new WhileLangUnparser().unparse(p.getBody());
    _builder.append(_unparse);
    _builder.newLineIfNotEmpty();
    return _builder.toString();
  }
  
  /**
   * Translate the given program to Java.
   */
  public String compile(final Program p) {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("public class ");
    String _name = p.getName();
    _builder.append(_name);
    _builder.append(" {");
    _builder.newLineIfNotEmpty();
    _builder.append("    ");
    _builder.append("public static void main(String[] args) {");
    _builder.newLine();
    _builder.append("        ");
    String _java = new WhileLangCodeGen().toJava(p.getBody());
    _builder.append(_java, "        ");
    _builder.newLineIfNotEmpty();
    _builder.append("    ");
    _builder.append("}");
    _builder.newLine();
    _builder.append("}");
    _builder.newLine();
    return _builder.toString();
  }
}
