/* outside_view()
//=====================================================//
Checks if the object that called this script is outside
the room and performs the following code if it's true.
//=====================================================*/
if x < view_xview[0]
|| x > view_xview[0]+426
|| y > view_yview[0]+240
    return true
else
    return false
