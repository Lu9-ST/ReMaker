/* enable_movement()
//=====================================================//
This script handles the movement when the player is
doing certain action.
//=====================================================*/
if (crouch) || (taunt)
{
    if (state == 2)
        {cj = 1; canmove = 1;}
    else
        {cj = 0; canmove = 0;}
}
else if (!crouch) || (taunt)
    canmove = 1;
