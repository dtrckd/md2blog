@profiling
@python


# Python Profiling



Basic profiling a script.py :
to stdout :
    python -m cProfile -s time script.py

The fit script can be profiled with the `--profile` options.
it will create the profile file build by cProfile (cumtime sorting by default).
The format of the file is as follows `{expe_name}.{run_id}.{description}.profile`

To read this file the easiet way and dump the text info of process times:

    ff=file.profile python3 -c "__import__('pstats').Stats('$ff').sort_stats('cumtime').print_stats()" # can be cumtime, time, etc


An onther tool that simply make the profiling visible in a browser:
    pip install cprofilev

and then

    cprofilev -f file.profile

### Graph

To observe the graph of execution (really cool!)
    pip install gprof2dot

then create the graph with

    gprof2dot -f pstats filename.profile | dot -Tpng -o profile_graph.png

### Snakeviz
An other cool tool with cool interactive dive in the profile results:
    pip install snakeviz

then

    snakeviz file.profile


### others

Using pycallgraph

    pycallgraph graphviz -f svg -o script.svg script.py


to file + visualization :

    python -m cProfile -o file.profile file.profile
    pyprof2calltree -i file.profile -o file.calltree
    kcachegrind file.calltree


## Memory

https://github.com/jmdana/memprof

J'ai essayé ce moyen pour profiler la mémoire ca marche pas mal, ca donne la consommation ligne par ligne, voila comment procéder:
* installer memory_profiler en suivant conseil ici: http://scikit-learn.org/stable/developers/performance.html#memory-usage-profiling   (en fait si on l'utilise   sans ipython, il suffit de faire `pip3 install -U memory_profiler`)

* mettre un `@profile` sur la fonction à profiler
* copier le "binaire"(script python en fait) pmk dans le repo `cp ~/.local/bin/pmk pmk.py`
* excuter avec le profiling `python3 -m memory_profiler pmk.py spec_name -x fit`





## Installing Tools
* pip install pyprof2calltree
* aptitude install kcachegrind
* pip install runsnalkerun # aptitude install  python-profiler python-wxgtk2.8
* pip install pycallgraph

# Python debugging :

* tutorial gdb : http://cs.brynmawr.edu/cs312/gdb-tutorial-handout.pdf
* https://www.cs.cmu.edu/~gilpin/tutorial/
* debug c program with gdb : http://www.thegeekstuff.com/2010/03/debug-c-program-using-gdb
