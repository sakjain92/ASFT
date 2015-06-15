#ifndef __COMMON_H__
#define __COMMON_H__
#include <stdint.h>
#include <stdio.h>
#include <string.h>

/* Defination of Register */
typedef struct {
	char name[100]; //Reg Name
	uint32_t addr; //Reg Addr
	int reg_size; //Reg size
	uint32_t def;//Default Value at POR
	uint32_t rmask; //Read Mask
	uint32_t wmask; //Write Mask
	uint32_t w1c;//w1c and wmask are mutually exclusive
	uint32_t val;//Current Value it is holding
}reg;

void write_reg_with_mask(reg *Register,uint32_t data);
uint32_t int_to_uint(int number);
uint32_t set_bit(uint32_t value, int bit);
uint32_t clear_bit(uint32_t value, int bit);
uint32_t change_bit_val(uint32_t reg_val,uint32_t new_val,int bit,int bit_size);
uint32_t get_bit_val(uint32_t reg_val,int bit,int bit_size);

#define RUNTIME_DEBUG

#if defined(RUNTIME_DEBUG)
#define RUNTIME_PRINT(pargs)    printf pargs
#else
#define RUNTIME_PRINT(pargs)     
#endif



#include "stm_main.h"
#include "executioner_main.h"

#endif
