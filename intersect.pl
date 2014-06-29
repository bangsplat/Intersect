#!/usr/bin/perl

# intersect.pl
#
# find the intersecting point of two lines
# 
# written to find strongholds in Minecraft
# so we use X and Z instead of X and Y
# but it doesn't really matter from the user's standpoint
# 
# input is a series of numbers, the X and Z coordinates of two lines in pairs of points
# separated by spaces
#
# for example, line A has points 5,595 and 675,10, line B has points 125,7 375,590
# intersection is approximately 276,359
# $ ./intersect.pl 5 595 675 10 125 7 375 590
# RESULT: 

# LINE A point 1 - (5,595)
# LINE A point 2 - (675,10)
#
# LINE B point 1 - (125,7)
# LINE B point 2 - (375,590)
#
# INTERSECTION - (276,359)



use constant {
	LINEA_X1	=>	0,
	LINEA_Z1	=>	1,
	LINEA_X2	=>	2,
	LINEA_Z2	=>	3,
	LINEB_X1	=>	4,
	LINEB_Z1	=>	5,
	LINEB_X2	=>	6,
	LINEB_Z2	=>	7
};

# load up our array of point values
my @points;
for( my $i=0; $i<8; $i++ ) {
	$points[$i] = $ARGV[$i];
}

# print "Line 1: ($points[LINEA_X1],$points[LINEA_Z1]) to ($points[LINEA_X2],$points[LINEA_Z2])\n";
# print "Line 2: ($points[LINEB_X1],$points[LINEB_Z1]) to ($points[LINEB_X2],$points[LINEB_Z2])\n";

# the usual linear equation form is:
# y = mx + b
#
# m is the slope
# m = (y2-y1)/(x2-x1)
#
# we will use z for y

my $lineA_m = ($points[LINEA_Z2]-$points[LINEA_Z1])/($points[LINEA_X2]-$points[LINEA_X1]);
my $lineB_m = ($points[LINEB_Z2]-$points[LINEB_Z1])/($points[LINEB_X2]-$points[LINEB_X1]);

# print "Line A slope (m) = $lineA_m\n";
# print "Line B slope (m) = $lineB_m\n";

# now what about b?
# 
# y = mx + b
#
# solve for b 
# we know x and y for two points, and m for the line
# 
# b + mx = y
# b = y - mx

my $lineA_b = $points[LINEA_Z1] - ( $points[LINEA_X1] * $lineA_m );
my $lineB_b = $points[LINEB_Z1] - ( $points[LINEB_X1] * $lineB_m );

# print "Line A (b) = $lineA_b\n";
# print "Line B (b) = $lineB_b\n";

# OK, so now we have two equations
# how do we figure out at what point they intersect?
#
# Y1 = M1 * X1 + B1
# Y2 = M2 * X2 + B2
#
# find the common Y between the two, and solve for  X
#
# ( M1 * X ) + B1 = ( M2 * X ) + B2
# 	subtract M2*X from each side
# ( M1 * X ) - ( M2 * X ) + B1 = B2
# 	subtract B1 from each side
# ( M1 * X ) - ( M2 * X ) = B2 - B1
# 	combine ( M1 * X ) - ( M2 * X )
# 	commutative property says ( M1 * X ) - ( M2 * X ) = ( M1 - M2 ) * X
# ( M1 - M2 ) * X = B2 - B1
# 	divide each side by ( M1 - M2 )
# X = ( B2 - B1 ) / ( M1 - M2 )
#
# then use common intersection X with either line's linear equation to solve for Y

my $intersect_X = ( $lineB_b - $lineA_b ) / ( $lineA_m - $lineB_m );
# print "Intersection X = $intersect_X\n";

# then use common intersection X with either line's linear equation to solve for Y (or Z in our case)
#
# y = mx + b

my $intersect_Z = $lineA_m * $intersect_X + $lineA_b;
# print "Intersection Y/Z = $intersect_Z\n";

print "intersection: $intersect_X, $intersect_Z\n";



# LINE A point 1 - (5,595)
# LINE A point 2 - (675,10)
#
# LINE B point 1 - (125,7)
# LINE B point 2 - (375,590)
#
# INTERSECTION - (276,359)



