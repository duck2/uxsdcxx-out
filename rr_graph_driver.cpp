#include <fstream>
#include "rr_graph_uxsdcxx.h"

int main(int argc, char **argv){
	uxsd::rr_graph rr_graph;
	std::ifstream is;
	is.open(argv[1]);
	pugi::xml_parse_result result = rr_graph.load(is);
	if(!result){
		std::cout << "PugiXML parse failure\n";
		return 0;
	}
	rr_graph.write(std::cout);
}
