#include "common.h"
/* -------------------------------------------------------------*/
/* Operations of regsiter */

/* Write to a register - 32bit Register*/
/* User writes */
void write_reg_with_mask(reg *Register,uint32_t data)
{
    //Register.val=((Register.w1c | Register.wmask) & data);
    int i;
    for(i=0;i<32;i++)//TODO:Check that wmask and w1c are mutually exclusive
    {
        if((Register->wmask & (uint32_t)(1<<i)))
        {
            if((data & (uint32_t)(1<<i)))
            {
                Register->val=Register->val | (uint32_t)(1<<i);
            }
            else
            {
                Register->val=Register->val & ~(uint32_t)(1<<i);
            }
        }
        else if((Register->w1c & 1<<i))
        {
            if((data & (uint32_t)(1<<i)))
            {
                Register->val=Register->val & ~(uint32_t)(1<<i);
            }
        }
    }
}


uint32_t int_to_uint(int number)
{
    uint32_t byte;
    byte = number & 0xffffffff;
    return byte;
}

/* BE order of bits */
uint32_t set_bit(uint32_t value, int bit)
{
    return value | (uint32_t)(1<<(31-bit));
}

/* BE order of bits */
uint32_t clear_bit(uint32_t value, int bit)
{
    return value & ~(uint32_t)(1<<(31-bit));
}

/* BE order of bits */
/* IP changes itself */
uint32_t change_bit_val(uint32_t reg_val,uint32_t new_val,int bit,int bit_size)
{
    int i;
    for(i=0;i<bit_size;i++)
    {
	if(new_val & (uint32_t)(1<<i))
	    reg_val=set_bit(reg_val,bit-i);
	else
	    reg_val=clear_bit(reg_val,bit-i);
    }
    return reg_val;
}

/* BE order of bits */
/* IP reads */
uint32_t get_bit_val(uint32_t reg_val,int bit,int bit_size)
{
    uint32_t return_val=0x0;
    int i;
    for(i=0;i<bit_size;i++)
    {
	if(reg_val & (uint32_t)(1<<((31-bit)+i)))
	    return_val=return_val | (uint32_t)(1<<i);
    }	
    return return_val;
}




