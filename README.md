# Calculus

This repository contains latex codes for the materials used in my course *Calculus (I)* and *Calculus (II)* at National Dong Hwa University, Taiwan.  The course is intended for international students in the Management Science and Finance Program.

## Notes on lecture_note.tex
- I did not typewrite my lecture notes until I reached Chapter 5, so the first four chapters link to the handwritten materials.  I may typewrite these chapters in the near future.
- The colored frames for examples and solutions depend on the pacakge *luacolor*, so please use LuaLaTex to compile it.
- In *easyclass.cls*:
  - If you intend to use this note for self-study, comment out **\newcommand{\std}{1}** in line 8 so that the solutions for exercises are shown
  - If you intend to use this note for teaching, and you want the students to solve the exercises in class, comment out **\newcommand{\std}{0}** in line 9 so that the solutions for exercises are hidden
