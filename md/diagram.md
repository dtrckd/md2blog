@linux
@recipes
@design

* Nextcloud diagram is great...
* https://casual-effects.com/markdeep/ seems cool

# WYSIWYG Wireframe
* [Dia](https://en.wikipedia.org/wiki/Dia_%28software%29): light, semms cool, free,
* [Moqups](https://app.moqups.com/edit/): powerfull, intuitive,, cloud non-free,
* [Framebox](http://framebox.org/): light, seems cool, cloud, free,
* [Pencil](http://pencil.evolus.vn/): seems cool and powerfull, free.

# Diagram / UML handle with Markdown
Extension of python-markdown (they can be installed via pymdown extension (equivalent to vundle):

* [PLantUML](https://github.com/mikitex70/plantuml-markdown)
* [superfences](http://facelessuser.github.io/pymdown-extensions/extensions/superfences/)

Uses the Paas, [gravizoo](http://www.gravizo.com/) interface to dowload remote the remotely build diagram:

```
    ![Alt text](http://g.gravizo.com/g?
        digraph G {
        aize ="4,4";
        main [shape=box];
        main -> parse [weight=8];
        parse -> execute;
        main -> init [style=dotted];
        main -> cleanup;
        execute -> { make_string; printf}
        init -> make_string;
        edge [color=red];
        main -> printf [style=bold,label="100 times"];
        make_string [label="make a string"];
        node [shape=box,style=filled,color=".7 .3 1.0"];
        execute -> compare;
        }
        )
```

or 
```
    <img src='http://g.gravizo.com/g?
        @startuml;

        [*] --> State1;
        State1 --> [*];
        State1 : this is a string;
        State1 : this is another string;

        State1 -> State2;
        State2 --> [*];

        @enduml;

        activate B;

        B -> C: DoWork;
        activate C;

        C --> B: WorkDone;
        destroy C;

        B --> A: Request Created;
        deactivate B;

        A --> User: Done;
        deactivate A;

        @enduml;
    '>
```

# Ditaa is to diagrams like Markdown is to HTML.

<span id="published-date">2012-12-18</span>

[http://ditaa.sourceforge.net/](http://ditaa.sourceforge.net/)

Ditaa is to diagrams like Markdown is to HTML.

    +--------+   +-------+    +-------+
    |        | --+ ditaa +--> |       |
    |  Text  |   +-------+    |diagram|
    |Document|   |!magic!|    |       |
    |     {d}|   |       |    |       |
    +---+----+   +-------+    +-------+
        :                         ^
        |       Lots of work      |
        +-------------------------+

after conversion using ditaa, the above becomes

![ditaa example](http://ditaa.sourceforge.net/images/first.png)

