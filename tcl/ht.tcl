#!/usr/local/bin/tclsh8.0
package require http 1.0

if {$argc < 2} {
    puts stderr "Usage: $argv0 url file"
    exit 1
}
set url [lindex $argv 0]
set file [lindex $argv 1]
set out [open $file w]

proc progress {token total current} {
    puts -nonewline "."
}

http_config -proxyhost proxy.foo.co.jp -proxyport 8080
set token [http_get $url -progress progress \
	-headers {Pragma no-cache} -channel $out]
close $out

upvar #0 $token state
puts $state(http)
foreach {key value} $state(meta) {
    puts "$key: $value"
}
exit 0