#include "Core/Data/ConstData.h"
#include <gtest/gtest.h>

TEST( ConstDataTest, ConstDataReturns3 )
{
  EXPECT_EQ( ConstData(), 3 );
}
