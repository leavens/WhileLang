/*
 * generated by Xtext 2.13.0
 */
package edu.ucf.cs.whilelang.ide

import com.google.inject.Guice
import edu.ucf.cs.whilelang.WhileLangRuntimeModule
import edu.ucf.cs.whilelang.WhileLangStandaloneSetup
import org.eclipse.xtext.util.Modules2

/**
 * Initialization support for running Xtext languages as language servers.
 */
class WhileLangIdeSetup extends WhileLangStandaloneSetup {

	override createInjector() {
		Guice.createInjector(Modules2.mixin(new WhileLangRuntimeModule, new WhileLangIdeModule))
	}
	
}
