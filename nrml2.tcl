set ns [new Simulator]
set namfile [open unr.nam w]
$ns namtrace-all $namfile

set wireless_tracefile [open unr.tr w]
set topography [new Topography]
$ns trace-all $wireless_tracefile
$ns namtrace-all-wireless $namfile 1500 1500
$topography load_flatgrid 1500 1500

set god_ [create-god 10]
#global node setting
$ns node-config -adhocRouting AODV \
                 -llType LL \
                 -macType Mac/802_15_4 \
                 #-macType Mac/802_11 \
                 -ifqType Queue/DropTail/PriQueue \
                 -ifqLen 50 \
                 -antType Antenna/OmniAntenna \
                 -propType Propagation/TwoRayGround \
                 -phyType Phy/WirelessPhy/802_15_4 \
                 #-phyType Phy/WirelessPhy/802_11 \
                 -channel [new Channel/WirelessChannel] \
                 -topoInstance $topography \
                 -agentTrace ON \
                 -routerTrace OFF \
                 -macTrace ON \
		 -energyModel EnergyModel \
		 -rxPower 0.175 \
		 -txPower 0.175 \
		 -sensePower 0.00000175 \
		 -idlePower 0.0 \
		 -initialEnergy 0.5               


# Create wireless nodes.
set node(1) [$ns node]
## node(1) at 485.525299,12.719421
$node(1) set X_ 485.525299
$node(1) set Y_ 12.719421
$node(1) set Z_ 0.0
$node(1) color "black"
$ns initial_node_pos $node(1) 10.000000
set node(2) [$ns node]
## node(2) at 522.218201,0.000000
$node(2) set X_ 522.218201
$node(2) set Y_ 0.000000
$node(2) set Z_ 0.0
$node(2) color "black"
$ns initial_node_pos $node(2) 10.000000
set node(3) [$ns node]
## node(3) at 562.020630,-5.657467
$node(3) set X_ 562.020630
$node(3) set Y_ -5.657467
$node(3) set Z_ 0.0
$node(3) color "black"
$ns initial_node_pos $node(3) 10.000000
set node(4) [$ns node]
## node(4) at 599.343628,-1.983274
$node(4) set X_ 599.343628
$node(4) set Y_ -1.983274
$node(4) set Z_ 0.0
$node(4) color "black"
$ns initial_node_pos $node(4) 10.000000
set node(5) [$ns node]
## node(5) at 639.531189,-1.473893
$node(5) set X_ 639.531189
$node(5) set Y_ -1.473893
$node(5) set Z_ 0.0
$node(5) color "black"
$ns initial_node_pos $node(5) 10.000000
set node(6) [$ns node]
## node(6) at 679.705383,13.536233
$node(6) set X_ 679.705383
$node(6) set Y_ 13.536233
$node(6) set Z_ 0.0
$node(6) color "black"
$ns initial_node_pos $node(6) 10.000000
set node(7) [$ns node]
## node(7) at 578.092773,300.216064
$node(7) set X_ 578.092773
$node(7) set Y_ 300.216064
$node(7) set Z_ 0.0
$node(7) color "black"
$ns initial_node_pos $node(7) 10.000000
set node(8) [$ns node]
## node(8) at 578.092773,400.731674
$node(8) set X_ 578.092773
$node(8) set Y_ 400.731674
$node(8) set Z_ 0.0
$node(8) color "black"
$ns initial_node_pos $node(8) 10.000000
set node(9) [$ns node]
## node(9) at 485.215576,140.731674
$node(9) set X_ 485.215576
$node(9) set Y_ 140.731674
$node(9) set Z_ 0.0
$node(9) color "black"
$ns initial_node_pos $node(9) 10.000000
set node(10) [$ns node]
## node(10) at 650.215576,140.731674
$node(10) set X_ 650.215576
$node(10) set Y_ 140.731674
$node(10) set Z_ 0.0
$node(10) color "black"
$ns initial_node_pos $node(10) 10.000000

set node(11) [$ns node]
## node(10) at 485.215576,24.731674
$node(11) set X_ 485.215576
$node(11) set Y_ 24.731674
$node(11) set Z_ 0.0
$node(11) color "black"
$ns initial_node_pos $node(11) 10.000000

set node(12) [$ns node]
## node(12) at 522.215576,30.731674
$node(12) set X_ 522.215576
$node(12) set Y_ 30.731674
$node(12) set Z_ 0.0
$node(12) color "black"
$ns initial_node_pos $node(12) 10.000000

set node(13) [$ns node]
## node(13) at 570.215576,34.731674
$node(13) set X_ 570.215576
$node(13) set Y_ 34.731674
$node(13) set Z_ 0.0
$node(13) color "black"
$ns initial_node_pos $node(13) 10.000000



$ns at 1.0 "$node(1) setdest 450.0 120.0 30.0"
$ns at 1.0 "$node(11) setdest 485.0 100.0 30.0"
$ns at 1.0 "$node(12) setdest 405.0 150.0 30.0"

$ns at 0.0 "$node(1) label L_U_Node"
$ns at 0.0 "$node(1) color RED"
$ns at 0.0 "$node(11) label L_U_Node"
$ns at 0.0 "$node(11) color RED"
$ns at 0.0 "$node(12) label L_U_Node"
$ns at 0.0 "$node(12) color RED"
$ns at 0.0 "$node(13) label L_U_Node"
$ns at 0.0 "$node(13) color RED"



$ns at 0.0 "$node(2) label L_U_Node"
$ns at 0.0 "$node(2) color RED"
$ns at 0.0 "$node(3) label L_U_Node"
$ns at 0.0 "$node(3) color RED"
$ns at 0.0 "$node(4) label L_U_Node"
$ns at 0.0 "$node(4) color RED"
$ns at 0.0 "$node(5) label L_U_Node"
$ns at 0.0 "$node(5) color RED"
$ns at 0.0 "$node(6) label L_U_Node"
$ns at 0.0 "$node(6) color RED"
$ns at 0.0 "$node(7) label Source"
$ns at 0.0 "$node(7) color pink"
$ns at 0.0 "$node(8) label Repeater"
$ns at 0.0 "$node(8) color blue"
$ns at 0.0 "$node(9) label U_U_1"
$ns at 0.0 "$node(9) color gold"
$ns at 0.0 "$node(10) label U_U_2"
$ns at 0.0 "$node(10) color gold"


$ns at 1.0 "$node(1) color green"
$ns at 3.0 "$node(1) color RED"
$ns at 2.0 "$node(2) color green"
$ns at 4.0 "$node(2) color RED"
$ns at 2.0 "$node(3) color green"
$ns at 5.0 "$node(3) color RED"
$ns at 1.5 "$node(4) color green"
$ns at 2.0 "$node(4) color RED"
$ns at 2.5 "$node(5) color green"
$ns at 3.0 "$node(5) color RED"
$ns at 4.0 "$node(6) color green"
$ns at 5.0 "$node(6) color RED"

$ns at 5.0 "$node(1) color green"
$ns at 9.0 "$node(1) color RED"
$ns at 8.0 "$node(2) color green"
$ns at 12.0 "$node(2) color RED"
$ns at 7.0 "$node(3) color green"
$ns at 13.0 "$node(3) color RED"
$ns at 8.0 "$node(4) color green"
$ns at 10.0 "$node(4) color RED"
$ns at 6.5 "$node(5) color green"
$ns at 9.5 "$node(5) color RED"
$ns at 9.0 "$node(6) color green"
$ns at 14.0 "$node(6) color RED"
$ns at 10.0 "$node(13) color green"

#Setup a TCP Connection
set tcp [new Agent/TCP]
$ns attach-agent $node(1) $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $node(8) $sink
$ns connect $tcp $sink
$tcp set fid_ 1
$tcp set packetSize_ 552
set ftp [new Application/FTP]
$ftp attach-agent $tcp

set tcp1 [new Agent/TCP]
$ns attach-agent $node(2) $tcp1
set sink1 [new Agent/TCPSink]
$ns attach-agent $node(8) $sink1
$ns connect $tcp1 $sink1
$tcp1 set fid_ 1
$tcp1 set packetSize_ 552
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1

set tcp2 [new Agent/TCP]
$ns attach-agent $node(3) $tcp2
set sink2 [new Agent/TCPSink]
$ns attach-agent $node(8) $sink2
$ns connect $tcp2 $sink2
$tcp2 set fid_ 1
$tcp2 set packetSize_ 552
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2

set tcp3 [new Agent/TCP]
$ns attach-agent $node(4) $tcp3
set sink3 [new Agent/TCPSink]
$ns attach-agent $node(8) $sink3
$ns connect $tcp3 $sink3
$tcp3 set fid_ 1
$tcp3 set packetSize_ 552
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3

set tcp4 [new Agent/TCP]
$ns attach-agent $node(5) $tcp4
set sink4 [new Agent/TCPSink]
$ns attach-agent $node(8) $sink4
$ns connect $tcp4 $sink4
$tcp4 set fid_ 1
$tcp4 set packetSize_ 552
set ftp4 [new Application/FTP]
$ftp4 attach-agent $tcp4

set tcp5 [new Agent/TCP]
$ns attach-agent $node(6) $tcp5
set sink5 [new Agent/TCPSink]
$ns attach-agent $node(8) $sink5
$ns connect $tcp5 $sink5
$tcp5 set fid_ 1
$tcp5 set packetSize_ 552
set ftp5 [new Application/FTP]
$ftp5 attach-agent $tcp5

# Connect agents.

#$ns at 6.0 "$ftp start"
#$ns at 11.0 "$ftp stop"
#$ns at 5.0 "$ftp1 start"
#$ns at 9.0 "$ftp1 stop"


$ns at 1.0 "$ftp start"
$ns at 3.0 "$ftp stop"
$ns at 2.0 "$ftp1 start"
$ns at 4.0 "$ftp1 stop"
$ns at 2.0 "$ftp2 start"
$ns at 5.0 "$ftp2 stop"
$ns at 1.5 "$ftp3 start"
$ns at 2.0 "$ftp3 stop"
$ns at 2.5 "$ftp4 start"
$ns at 3.0 "$ftp4 stop"
$ns at 4.0 "$ftp5 start"
$ns at 5.0 "$ftp5 stop"

$ns at 5.0 "$ftp start"
$ns at 9.0 "$ftp stop"
$ns at 8.0 "$ftp1 start"
$ns at 12.0 "$ftp1 stop"
$ns at 7.0 "$ftp2 start"
$ns at 13.0 "$ftp2 stop"
$ns at 8.0 "$ftp3 start"
$ns at 10.0 "$ftp3 stop"
$ns at 6.5 "$ftp4 start"
$ns at 9.5 "$ftp4 stop"
$ns at 9.0 "$ftp5 start"
$ns at 14.0 "$ftp5 stop"

# Run the simulation
proc finish {} {
	global ns namfile
	$ns flush-trace
	close $namfile
	exec nam -r 2000.000000us unr.nam &
	puts "Running the Proposed simulation......"
	exit 0
	}
$ns at 20.000000 "finish"
$ns run
