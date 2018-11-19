#include <cstdlib>
#include <BuildMode.hpp>
#include <iostream>
using namespace std;

int main ()
{
	using namespace BuildMode;

	if constexpr (isRelease && !isDebug && current == Release && current != Debug)
		return EXIT_SUCCESS;

	return EXIT_FAILURE;
}