#!/usr/bin/python

# intersect.py
#
# find the intersecting point of two lines
#
# written to find strongholds in Minecraft
# (and ported to Python to learn Python)
# so we use X and Z instead of X and Y
# 
# user is prompted for input
# 

# for example, line A has points 5,595 and 675,10, line B has points 125,7 375,590
# intersection is approximately 276,359

LINEA_X1 = float(raw_input("Line A Start X: "))
LINEA_Z1 = float(raw_input("Line A Start Z: "))
LINEA_X2 = float(raw_input("Line A End X: "))
LINEA_Z2 = float(raw_input("Line A End Z: "))
LINEB_X1 = float(raw_input("Line B Start X: "))
LINEB_Z1 = float(raw_input("Line B Start Z: "))
LINEB_X2 = float(raw_input("Line B End  X: "))
LINEB_Z2 = float(raw_input("Line B End Z: "))

# the usual linear equation form is:
# y = mx + b
#
# m is the slope
# m = (y2-y1)/(x2-x1)
#
# we will use z for y

lineA_m = ( LINEA_Z2 - LINEA_Z1 ) / ( LINEA_X2 - LINEA_X1 )
lineB_m = ( LINEB_Z2 - LINEB_Z1 ) / ( LINEB_X2 - LINEB_X1 )

# now what about b?
# 
# y = mx + b
#
# solve for b 
# we know x and y for two points, and m for the line
# 
# b + mx = y
# b = y - mx

lineA_b = LINEA_Z1 - ( LINEA_X1 * lineA_m )
lineB_b = LINEB_Z1 - ( LINEB_X1 * lineB_m )

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

intersect_X = ( lineB_b - lineA_b ) / ( lineA_m - lineB_m )
intersect_Z = ( lineA_m * intersect_X ) + lineA_b

print "Intersection is %f, %f" % (intersect_X, intersect_Z)

# LINE A point 1 - (5,595)
# LINE A point 2 - (675,10)
#
# LINE B point 1 - (125,7)
# LINE B point 2 - (375,590)
#
# INTERSECTION - (276,359)
