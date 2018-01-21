package edu.ucf.cs.whilelang.validation;

import edu.ucf.cs.whilelang.validation.AbstractWhileLangValidator;
import edu.ucf.cs.whilelang.validation.WhileLangLabelsValidator;
import edu.ucf.cs.whilelang.whileLang.Program;
import org.eclipse.xtext.validation.Check;

@SuppressWarnings("all")
public class WhileLangValidator extends AbstractWhileLangValidator {
  @Check
  public Object checkStaticConstraints(final Program p) {
    return new WhileLangLabelsValidator().checkUniqueLabels(p);
  }
}
