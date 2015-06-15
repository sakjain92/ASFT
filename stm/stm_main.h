#ifndef __STM_MAIN_H__
#define __STM_MAIN_H__

#include "common.h"
/* Base Address Definations */
/* TODO:Check */
#define STM_BASE_ADDR  0xFBF58000
#define MC_CGM_BASE_ADDR 0xFFFA8000
#define INTC_BASE_ADDR 0xFFF50000
#define PSEUDO_REG_BASE_ADDR 0x0

/* STM bits Definations */
#define STM_CHANNEL_EN_BIT 31
#define STM_INTERRUPT_FLAG_BIT 31
#define STM_TIMER_EN_BIT 31
#define STM_FRZ_BIT 30
#define STM_PRESCALER_BIT 23
#define STM_PRESCALER_BIT_SIZE 8

#define STM_INTERRUPT_BASE_VECTOR 36

/* INTC bits Defination */
#define INTC_VEC_BIT 29
#define INTC_VEC_BIT_SIZE 10

/* MC_CGM bits Defination */
#define MC_CGM_DIVIDER_EN_BIT 0
#define MC_CGM_DIV_BIT 15
#define MC_CGM_DIV_BIT_SIZE 6

/* STM Channel defination */
typedef struct {
    reg CCR; //Channel Control
    reg CIF; //Channel Interrupt
    reg CMP; //Channel Compare
}STM_channel_tag;

/* STM Defination */
typedef struct {
    reg CR; //Control
    reg CNT; //Count
    STM_channel_tag CHANNEL[4];
}STM_tag;

/* INTC Definition */
typedef struct {
    reg IACKR0;
}INTC_tag;


/* MC_CGM Definition*/
typedef struct {
    reg SC_DC2;
}MC_CGM_tag;


/* Pseudo Regs Definition */
typedef struct {
    reg WAIT; /* PSEDUO for time increment */
    reg POR; /* Issue POR */
    reg DEBUG_ON; /* Go into Debug Mode */
    reg DEBUG_OFF; /* Get out of Debug Mode */
}PSEUDO_REG_tag; 


/* STM_STATE Deifinition */
typedef struct {
    int DEBUG_MODE;
} STM_STATE_tag;

/*
extern STM_tag STM;
extern const int STM_REG_COUNT;
extern INTC_tag INTC;
extern const int INTC_REG_COUNT;
extern const int MC_CGM_REG_COUNT;
extern MC_CGM_tag MC_CGM;
extern PSEUDO_REG_tag PSEUDO_REG;
extern const int PSEUDO_REG_COUNT;
extern reg *ALL_REG[100];
extern int ALL_REG_COUNT;
extern STM_STATE_tag STM_STATE;
*/

void set_interrupt(int channel_no);
void clear_interrupt(int channel_no);
int model_write_reg(reg *current_reg,uint32_t data);
void init_reg_por(void);

#endif
