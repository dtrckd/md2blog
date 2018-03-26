@profiling
@python


# Python Profiling

Basic profiling a script.py :

to stdout :

    python -m cProfile -s time script.py
    
to file + visualization :

    python -m cProfile -o script.profile script.profile
    pyprof2calltree -i script.profile -o script.calltree
    kcachegrind script.calltree

sunburst visu :

    snakeviz script.py

square map visu

    runsnake script.profile

Using pycallgraph  :

    pycallgraph graphviz -f svg -o script.svg script.py

## Installing Tools
* pip install pyprof2calltree
* aptitude install kcachegrind
* pip install runsnalkerun # aptitude install  python-profiler python-wxgtk2.8
* pip install pycallgraph

# Python debugging : 

* tutorial gdb : http://cs.brynmawr.edu/cs312/gdb-tutorial-handout.pdf 
* https://www.cs.cmu.edu/~gilpin/tutorial/
* debug c program with gdb : http://www.thegeekstuff.com/2010/03/debug-c-program-using-gdb
