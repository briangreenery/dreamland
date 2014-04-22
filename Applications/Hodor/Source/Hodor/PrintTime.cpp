#include "PrintTime.h"
#include "Time/Now.h"
#include <iostream>

void PrintTime()
{
  std::cout << "The time is now: " << Now() << std::endl;
}
