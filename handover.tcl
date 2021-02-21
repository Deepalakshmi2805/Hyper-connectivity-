set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     43                         ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      3096                     	;# X dimension of topography
set val(y)      1000                      	;# Y dimension of topography
set val(stop)   10.0                        ;# time of simulation end

#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god [expr $val(nn)-1]

set pr(0) [open probability0.tr w]
$ns trace-all $pr(0)
puts $pr(0) "Markers: true"
puts $pr(0) "BoundBox: true"
puts $pr(0) "Background: white"
set pr(4) [open probability4.tr w]
$ns trace-all $pr(4)
puts $pr(4) "Markers: true"
puts $pr(4) "BoundBox: true"
puts $pr(4) "Background: white"
set pr(2) [open probability2.tr w]
$ns trace-all $pr(2)
puts $pr(2) "Markers: true"
puts $pr(2) "BoundBox: true"
puts $pr(2) "Background: white"
set pr(15) [open probability15.tr w]
$ns trace-all $pr(15)
puts $pr(15) "Markers: true"
puts $pr(15) "BoundBox: true"
puts $pr(15) "Background: white"
set hov [open Handover.tr w]
$ns trace-all $hov
set hop [open HOprobability.tr w]
$ns trace-all $hop
#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON

#Create 42 nodes
set n(0) [$ns node]
$n(0) set X_ 299
$n(0) set Y_ 403
$n(0) set Z_ 0.0
$ns initial_node_pos $n(0) 30
set n(1) [$ns node]
$n(1) set X_ 200
$n(1) set Y_ 501
$n(1) set Z_ 0.0
$ns initial_node_pos $n(1) 30
set n(2) [$ns node]
$n(2) set X_ 199
$n(2) set Y_ 305
$n(2) set Z_ 0.0
$ns initial_node_pos $n(2) 30
set n(3) [$ns node]
$n(3) set X_ 297
$n(3) set Y_ 603
$n(3) set Z_ 0.0
$ns initial_node_pos $n(3) 30
set n(4) [$ns node]
$n(4) set X_ 399
$n(4) set Y_ 503
$n(4) set Z_ 0.0
$ns initial_node_pos $n(4) 30
set n(5) [$ns node]
$n(5) set X_ 400
$n(5) set Y_ 300
$n(5) set Z_ 0.0
$ns initial_node_pos $n(5) 30
set n(6) [$ns node]
$n(6) set X_ 297
$n(6) set Y_ 203
$n(6) set Z_ 0.0
$ns initial_node_pos $n(6) 30
set n(7) [$ns node]
$n(7) set X_ 801
$n(7) set Y_ 496
$n(7) set Z_ 0.0
$ns initial_node_pos $n(7) 30
set n(8) [$ns node]
$n(8) set X_ 500
$n(8) set Y_ 601
$n(8) set Z_ 0.0
$ns initial_node_pos $n(8) 30
set n(9) [$ns node]
$n(9) set X_ 600
$n(9) set Y_ 503
$n(9) set Z_ 0.0
$ns initial_node_pos $n(9) 30
set n(10) [$ns node]
$n(10) set X_ 599
$n(10) set Y_ 300
$n(10) set Z_ 0.0
$ns initial_node_pos $n(10) 30
set n(11) [$ns node]
$n(11) set X_ 495
$n(11) set Y_ 200
$n(11) set Z_ 0.0
$ns initial_node_pos $n(11) 30
set n(12) [$ns node]
$n(12) set X_ 700
$n(12) set Y_ 200
$n(12) set Z_ 0.0
$ns initial_node_pos $n(12) 30
set n(13) [$ns node]
$n(13) set X_ 700
$n(13) set Y_ 599
$n(13) set Z_ 0.0
$ns initial_node_pos $n(13) 30
set n(14) [$ns node]
$n(14) set X_ 799
$n(14) set Y_ 300
$n(14) set Z_ 0.0
$ns initial_node_pos $n(14) 30
set n(15) [$ns node]
$n(15) set X_ 498
$n(15) set Y_ 403
$n(15) set Z_ 0.0
$ns initial_node_pos $n(15) 30
set n(16) [$ns node]
$n(16) set X_ 701
$n(16) set Y_ 401
$n(16) set Z_ 0.0
$ns initial_node_pos $n(16) 30
set n(17) [$ns node]
$n(17) set X_ 99 
$n(17) set Y_ 601 
$n(17) set Z_ 0.0
$ns initial_node_pos $n(17) 30
set n(18) [$ns node]
$n(18) set X_ 895
$n(18) set Y_ 602
$n(18) set Z_ 0.0
$ns initial_node_pos $n(18) 30
set n(19) [$ns node]
$n(19) set X_ 498
$n(19) set Y_ 799
$n(19) set Z_ 0.0
$ns initial_node_pos $n(19) 30
set n(20) [$ns node]
$n(20) set X_ 599
$n(20) set Y_ 902
$n(20) set Z_ 0.0
$ns initial_node_pos $n(20) 30
set n(21) [$ns node]
$n(21) set X_ 698
$n(21) set Y_ 802
$n(21) set Z_ 0.0
$ns initial_node_pos $n(21) 30
set n(22) [$ns node]
$n(22) set X_ 299
$n(22) set Y_ 800
$n(22) set Z_ 0.0
$ns initial_node_pos $n(22) 30
set n(23) [$ns node]
$n(23) set X_ 96
$n(23) set Y_ 803
$n(23) set Z_ 0.0
$ns initial_node_pos $n(23) 30
set n(24) [$ns node]
$n(24) set X_ 201
$n(24) set Y_ 898
$n(24) set Z_ 0.0
$ns initial_node_pos $n(24) 30
set n(25) [$ns node]
$n(25) set X_ 199
$n(25) set Y_ 697
$n(25) set Z_ 0.0
$ns initial_node_pos $n(25) 30
set n(26) [$ns node]
$n(26) set X_ 402
$n(26) set Y_ 698
$n(26) set Z_ 0.0
$ns initial_node_pos $n(26) 30
set n(27) [$ns node]
$n(27) set X_ 599
$n(27) set Y_ 700
$n(27) set Z_ 0.0
$ns initial_node_pos $n(27) 30
set n(28) [$ns node]
$n(28) set X_ 799
$n(28) set Y_ 902
$n(28) set Z_ 0.0
$ns initial_node_pos $n(28) 30
set n(29) [$ns node]
$n(29) set X_ 899
$n(29) set Y_ 800
$n(29) set Z_ 0.0
$ns initial_node_pos $n(29) 30
set n(30) [$ns node]
$n(30) set X_ 401
$n(30) set Y_ 901 
$n(30) set Z_ 0.0
$ns initial_node_pos $n(30) 30
set n(31) [$ns node]
$n(31) set X_ 799
$n(31) set Y_ 702
$n(31) set Z_ 0.0
$ns initial_node_pos $n(31) 30
set n(32) [$ns node]
$n(32) set X_ 201
$n(32) set Y_ 1103
$n(32) set Z_ 0.0
$ns initial_node_pos $n(32) 30
set n(33) [$ns node]
$n(33) set X_ 300
$n(33) set Y_ 1204
$n(33) set Z_ 0.0
$ns initial_node_pos $n(33) 30
set n(34) [$ns node]
$n(34) set X_ 400
$n(34) set Y_ 1101
$n(34) set Z_ 0.0
$ns initial_node_pos $n(34) 30
set n(35) [$ns node]
$n(35) set X_ 499
$n(35) set Y_ 1200
$n(35) set Z_ 0.0
$ns initial_node_pos $n(35) 30
set n(36) [$ns node]
$n(36) set X_ 600
$n(36) set Y_ 1099
$n(36) set Z_ 0.0
$ns initial_node_pos $n(36) 30
set n(37) [$ns node]
$n(37) set X_ 699
$n(37) set Y_ 1199
$n(37) set Z_ 0.0
$ns initial_node_pos $n(37) 30
set n(38) [$ns node]
$n(38) set X_ 801
$n(38) set Y_ 1102
$n(38) set Z_ 0.0
$ns initial_node_pos $n(38) 30
set n(39) [$ns node]
$n(39) set X_ 300
$n(39) set Y_ 1002
$n(39) set Z_ 0.0
$ns initial_node_pos $n(39) 30
set n(40) [$ns node]
$n(40) set X_ 498
$n(40) set Y_ 1001
$n(40) set Z_ 0.0
$ns initial_node_pos $n(40) 30
set n(41) [$ns node]
$n(41) set X_ 700
$n(41) set Y_ 1000
$n(41) set Z_ 0.0
$ns initial_node_pos $n(41) 30
set n(42) [$ns node]
$n(42) set X_ 97
$n(42) set Y_ 403
$n(42) set Z_ 0.0
$ns initial_node_pos $n(42) 30

$ns at 0.0 "$n(0) color red"
for {set i 0} {$i<$val(nn)} {incr i} {
$n($i) color green
}
for {set i 0} {$i<$val(nn)} {incr i} {
$ns at 0.0 "$n($i) color darkviolet"
}
$ns at 0.1 "$n(0) color deeppink"
$ns at 0.1 "$n(15) color deeppink"
$ns at 0.1 "$n(16) color deeppink"
$ns at 0.1 "$n(25) color deeppink"
$ns at 0.1 "$n(26) color deeppink"
$ns at 0.1 "$n(27) color deeppink"
$ns at 0.1 "$n(31) color deeppink"
$ns at 0.1 "$n(39) color deeppink"
$ns at 0.1 "$n(40) color deeppink"
$ns at 0.1 "$n(41) color deeppink"

proc random_int { upper_limit } {
            global myrand
            set myrand [expr int(rand() * $upper_limit + 1)]
            return $myrand
}

set nn 42
	for {set i 0} {$i<$nn} {incr i} {
		set x_pos1 [$n($i) set X_]
		set y_pos1 [$n($i) set Y_]
 		for {set j 0} {$j<$nn} {incr j} {
			if {$j!=$i} {
			set x_pos2 [$n($j) set X_]
			set y_pos2 [$n($j) set Y_]
			set x_pos [expr $x_pos1-$x_pos2]
			set y_pos [expr $y_pos1-$y_pos2]
			set v [expr $x_pos*$x_pos + $y_pos*$y_pos]
			set d [expr sqrt($v)]
			set nd($i$j) $d
			if {$d<200} {
				$n($i) add-neighbor $n($j)
			}
			}
		}
		puts "-----------------------------------"
		set nnc 0
		set neighbor1 [$n($i) neighbors]
			foreach nb1 $neighbor1 {
			incr nnc
			set now [$ns now]
			set idv [$nb1 id]
			}
			set nns($i) $nnc
	}
for {set a 0} {$a<[expr $val(nn)-1]} {incr a} {
	$ns at 0.0 "$n($a) label BS$a"
}
$ns at 0.0 "$n(42) label Mobile"
puts $hov "****************************"
puts $hov "BS(to)  BS(from)  Hocount"
puts $hov "****************************"
puts "BS(to)  BS(from)  Hocount"
for {set b 0} {$b<[expr $val(nn)-1]} {incr b} {
	for {set c 0} {$c<[expr $val(nn)-1]} {incr c} {
		set hoc [random_int 70]
		if {$b!=$c} {
			set hocount($b,$c) $hoc
			puts "BS$b    BS$c      $hoc"
			puts $hov "BS$b    BS$c      $hoc"
		}
	}
}

#Prbability of the handover
for {set f 0} {$f<[expr $val(nn)-1]} {incr f} {
	for {set g 0} {$g<[expr $val(nn)-1]} {incr g} {
		if {$f!=$g} {
			set ho($f,$g) 0
			for {set h 0} {$h<$nns($f)} {incr h} {
				set ho($f,$g) [expr $ho($f,$g)+$hocount($f,$g)]
			}
			set p($f,$g) [expr ($hocount($f,$g)+0.0)/($ho($f,$g)+0.0)]
		}
	}
}
puts $hop "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts $hop "BS(to)  BS(from)  HoProbability"
puts $hop "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

for {set h 0} {$h<[expr $val(nn)-1]} {incr h} {
	for {set k 0} {$k<[expr $val(nn)-1]} {incr k} {
	if {$h!=$k} {
	puts "BS$h    BS$k     $p($h,$k)"
	puts $hop "BS$h    BS$k     $p($h,$k)"
	}
	}
}
for {set i 0} {$i < $val(stop)} {set i [expr $i+0.5]} {
    set x [random_int 1110]
	 set y [random_int 700]
	$ns at $i "$n(42) setdest $x $y 100"        
}

proc attach-cbr-traffic { node sink size interval } {
	global ns
	set source [new Agent/UDP]
	$source set class_ 2
	$ns attach-agent $node $source
	set traffic [new Application/Traffic/CBR]
	$traffic set packetSize_ $size
	$traffic set interval_ $interval
	$traffic attach-agent $source
	$ns connect $source $sink
	return $traffic
}
set null1 [new Agent/LossMonitor]
	$ns attach-agent $n(2) $null1
	set cbr1 [attach-cbr-traffic $n(42) $null1 100 0.008]
	$ns at 0.0 "$cbr1 start"
	$ns at 1.0 "$cbr1 stop"
	$ns at 0.0 "$ns trace-annotate \" Mobile access the signal from BS2\""
	$ns at 0.0 "$ns trace-annotate \" Hand over probability of BS2 $p(2,0)\""	
set null2 [new Agent/LossMonitor]
	$ns attach-agent $n(0) $null1
	set cbr1 [attach-cbr-traffic $n(42) $null1 100 0.008]
	$ns at 1.0 "$cbr1 start"
	$ns at 5.0 "$cbr1 stop"
	$ns at 1.0 "$ns trace-annotate \" Hand over probability of BS0 $p(2,0)\""
	$ns at 1.0 "$ns trace-annotate \" Hand over is performed between BS2 and BS0\""	
	
set null4 [new Agent/LossMonitor]
	$ns attach-agent $n(4) $null1
	set cbr1 [attach-cbr-traffic $n(42) $null1 100 0.008]
	$ns at 5.0 "$cbr1 start"
	$ns at 6.0 "$cbr1 stop"
	$ns at 5.0 "$ns trace-annotate \" Hand over probability of BS2 $p(0,4)\""
	$ns at 5.0 "$ns trace-annotate \" Hand over is performed between BS0 and BS4\""	
set null3 [new Agent/LossMonitor]
	$ns attach-agent $n(15) $null1
	set cbr1 [attach-cbr-traffic $n(42) $null1 100 0.008]
	$ns at 6.0 "$cbr1 start"
	$ns at 10.0 "$cbr1 stop"
	$ns at 6.0 "$ns trace-annotate \" Hand over probability of BS2 $p(4,15)\""
	$ns at 6.0 "$ns trace-annotate \" Hand over is performed between BS4 and BS15\""	
set bsl [list 0 4 15 2]
proc graph {} {
	global ns array nmes pr array names p array names val bsl
	
	foreach bl $bsl { 
	for {set l 0} {$l<[expr $val(nn)-1]} {incr l} {
		if {$l!=$bl} {
			puts $pr($bl) "$l $p($l,$bl)"	
		}
			# puts $p4 "$now $p($l,4)"
			# puts $p15 "$now $p($l,15)"
			# puts $p2 "$now $p($l,2)"
	}
	}
	#$ns at [expr $now+0.5] "graph"
}
	
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}

for {set i 0} {$i < [expr $val(nn)-1] } { incr i } {
    $ns at $val(stop) "\$n($i) reset"
}
$ns at 0.0 "graph"
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
