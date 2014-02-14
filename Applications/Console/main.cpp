#include "Core/Integers.h"
#include "Core/Hodor.h"

#include <zlib.h>
#include <iostream>

int main()
{
	uint32 i = 0;
	std::cout << "The value of i is: " << i << std::endl;
	std::cout << "The value of Hodor is: " << Hodor() << std::endl;

	z_stream stream;
	inflateInit( &stream );
	std::cout << "Initalized zstream" << std::endl;

	return 0;
}
