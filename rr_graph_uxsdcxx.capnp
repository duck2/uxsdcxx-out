# This file is generated by uxsdcap 0.0.3.
# https://github.com/duck2/uxsdcxx
# Modify only if your build process doesn't involve regenerating this file.
#
# Cmdline: ./uxsdcap.py rr_graph.xsd
# Input file: /home/duck2/uxsdcxx/rr_graph.xsd
# md5sum of input file: 5d63f2f2f736d8615ce857e15484ba76

@0xd7fc24a4b3dfe728;

enum SwitchType {
	mux @0;
	tristate @1;
	passGate @2;
	short @3;
	buffer @4;
}

enum PinType {
	open @0;
	output @1;
	input @2;
}

enum LocSide {
	left @0;
	right @1;
	top @2;
	bottom @3;
}

enum NodeType {
	chanx @0;
	chany @1;
	source @2;
	sink @3;
	opin @4;
	ipin @5;
}

enum NodeDirection {
	incDir @0;
	decDir @1;
	biDir @2;
}

struct Channel {
	chanWidthMax @0 :Int32;
	xMax @1 :Int32;
	xMin @2 :Int32;
	yMax @3 :Int32;
	yMin @4 :Int32;
}

struct XList {
	index @0 :UInt32;
	info @1 :Int32;
}

struct YList {
	index @0 :UInt32;
	info @1 :Int32;
}

struct Timing {
	cin @0 :Float32;
	cinternal @1 :Float32;
	cout @2 :Float32;
	r @3 :Float32;
	tdel @4 :Float32;
}

struct Sizing {
	bufSize @0 :Float32;
	muxTransSize @1 :Float32;
}

struct Switch {
	id @0 :Int32;
	name @1 :Text;
	type @2 :SwitchType;
	timing @3 :Timing;
	sizing @4 :Sizing;
}

struct SegmentTiming {
	cPerMeter @0 :Float32;
	rPerMeter @1 :Float32;
}

struct Segment {
	id @0 :Int32;
	name @1 :Text;
	timing @2 :SegmentTiming;
}

struct Pin {
	ptc @0 :Int32;
	value @1 :Text;
}

struct PinClass {
	type @0 :PinType;
	pins @1 :List(Pin);
}

struct Meta {
	name @0 :Text;
	value @1 :Text;
}

struct Metadata {
	metas @0 :List(Meta);
}

struct BlockType {
	height @0 :Int32;
	id @1 :Int32;
	name @2 :Text;
	width @3 :Int32;
	pinClasses @4 :List(PinClass);
}

struct GridLoc {
	blockTypeId @0 :Int32;
	heightOffset @1 :Int32;
	widthOffset @2 :Int32;
	x @3 :Int32;
	y @4 :Int32;
}

struct NodeLoc {
	ptc @0 :Int32;
	side @1 :LocSide;
	xhigh @2 :Int32;
	xlow @3 :Int32;
	yhigh @4 :Int32;
	ylow @5 :Int32;
}

struct NodeTiming {
	c @0 :Float32;
	r @1 :Float32;
}

struct NodeSegment {
	segmentId @0 :Int32;
}

struct Node {
	capacity @0 :UInt32;
	direction @1 :NodeDirection;
	id @2 :UInt32;
	type @3 :NodeType;
	loc @4 :NodeLoc;
	timing @5 :NodeTiming;
	segment @6 :NodeSegment;
	metadata @7 :Metadata;
}

struct Edge {
	id @0 :UInt32;
	sinkNode @1 :UInt32;
	srcNode @2 :UInt32;
	switchId @3 :UInt32;
	metadata @4 :Metadata;
}

struct Channels {
	channel @0 :Channel;
	xLists @1 :List(XList);
	yLists @2 :List(YList);
}

struct Switches {
	switches @0 :List(Switch);
}

struct Segments {
	segments @0 :List(Segment);
}

struct BlockTypes {
	blockTypes @0 :List(BlockType);
}

struct GridLocs {
	gridLocs @0 :List(GridLoc);
}

struct RrNodes {
	nodes @0 :List(Node);
}

struct RrEdges {
	edges @0 :List(Edge);
}

struct BinNodes {
	file @0 :Text;
}

struct ConnectionBox {
	id @0 :UInt32;
	name @1 :Text;
}

struct ConnectionBoxes {
	numBoxes @0 :UInt32;
	xDim @1 :Int32;
	yDim @2 :Int32;
	connectionBoxes @3 :List(ConnectionBox);
}

struct RrGraph {
	toolComment @0 :Text;
	toolName @1 :Text;
	toolVersion @2 :Text;
	binaryNodesAndEdges @3 :BinNodes;
	connectionBoxes @4 :ConnectionBoxes;
	channels @5 :Channels;
	switches @6 :Switches;
	segments @7 :Segments;
	blockTypes @8 :BlockTypes;
	grid @9 :GridLocs;
	rrNodes @10 :RrNodes;
	rrEdges @11 :RrEdges;
}
