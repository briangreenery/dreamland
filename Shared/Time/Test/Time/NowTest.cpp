#include "Time/Now.h"
#include "Core/Data/Data.h"
#include <gtest/gtest.h>

TEST( NowTest, NowReturnsSomething )
{
  EXPECT_EQ( Now(), 4 );
}
