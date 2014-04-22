#include "Core/Integers.h"
#include <gtest/gtest.h>

TEST( IntegersTest, Uint32Is4Bytes )
{
  EXPECT_EQ( sizeof( uint32 ), 4 );
}

TEST( IntegersTest, Uint64Is8Bytes )
{
  EXPECT_EQ( sizeof( uint64 ), 8 );
}
