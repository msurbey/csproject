#include "UnitTest++.h"

TEST(fail)
{
	CHECK(false);
}

TEST(pass)
{
	CHECK(true);
}

int main ()
{
	    return UnitTest::RunAllTests();
}
