# WhileLang
The WHILE language as used in several Programming Language texts, here for a course in program analysis at UCF

Note that once you clone this, you'll have to generate the XText artifacts by right clicking on edu.ucf.cs.whilelang.WhileLang/src/WhileLang.xtext and selecting "Generate XText Artifacts...". Then the project has to build to get rid of the errors.

    If necessary, change the JRE System Library to Alternate JRE
      by changing the buildpath settings in each project,
          right click on project,
               select Properties,
               select Libraries,
                  remove JRE System Lib from the list,
                  then add it back with Add Library,
                      select JRE System Library,
                      select alternate JRE.

     I also changed access restriction errors into warnings
