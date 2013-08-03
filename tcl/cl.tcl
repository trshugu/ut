package require dde
button .b -text Send -command {
    dde execute -async TclEval foo {set var Hello!}
}
pack .b