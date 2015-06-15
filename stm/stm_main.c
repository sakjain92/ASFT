#include "stm_main.h"

/* STM Declaration */
STM_tag STM;
const int STM_REG_COUNT=sizeof(STM_tag)/sizeof(reg);

/*INTC Declaration */
INTC_tag INTC;
const int INTC_REG_COUNT=sizeof(INTC_tag)/sizeof(reg);

/*MC_CGM Declaration */
MC_CGM_tag MC_CGM;
const int MC_CGM_REG_COUNT=sizeof(MC_CGM_tag)/sizeof(reg);

/*PSEDUO_REG Declaration */
PSEUDO_REG_tag PSEUDO_REG;
const int PSEUDO_REG_COUNT=sizeof(PSEUDO_REG_tag)/sizeof(reg);

/*ALL Reg Declaration */
reg *ALL_REG[100]; /* MAX REG COUNT is 100. Change it if more registers */
int ALL_REG_COUNT;

/* STM_STATE declaration */
STM_STATE_tag STM_STATE;


/* Initialize registers at POR */
/* TODO: IS SMT_CNT writtable? Don't think so.*/
void init_reg_por(void) {
    
    ALL_REG_COUNT=PSEUDO_REG_COUNT+ MC_CGM_REG_COUNT+ INTC_REG_COUNT+ STM_REG_COUNT;

    /* Format:                  Name                Address                Size    Reset Val  Read Mask  Write Mask  w1c      Value*/
    STM.CR              =(reg){"STM_CR"            ,0x00+STM_BASE_ADDR     ,32     ,0x00000000,0x0000ff03,0x0000ff03,0x000000,0x00000000};
    STM.CNT             =(reg){"STM_CNT"           ,0x04+STM_BASE_ADDR     ,32     ,0x00000000,0xffffffff,0x00000000,0x000000,0x00000000};
    
    STM.CHANNEL[0].CCR  =(reg){"STM_CHANNEL0_CCR"  ,0x10+STM_BASE_ADDR     ,32     ,0x00000000,0x00000001,0x00000001,0x000000,0x00000000};
    STM.CHANNEL[0].CIF  =(reg){"STM_CHANNEL0_CIF"  ,0x14+STM_BASE_ADDR     ,32     ,0x00000000,0x00000001,0x00000000,0x000001,0x00000000};
    STM.CHANNEL[0].CMP  =(reg){"STM_CHANNEL0_CMP"  ,0x18+STM_BASE_ADDR     ,32     ,0x00000000,0xffffffff,0xffffffff,0x000000,0x00000000};
    
    STM.CHANNEL[1].CCR  =(reg){"STM_CHANNEL1_CCR"  ,0x20+STM_BASE_ADDR     ,32     ,0x00000000,0x00000001,0x00000001,0x000000,0x00000000};
    STM.CHANNEL[1].CIF  =(reg){"STM_CHANNEL1_CIF"  ,0x24+STM_BASE_ADDR     ,32     ,0x00000000,0x00000001,0x00000000,0x000001,0x00000000};
    STM.CHANNEL[1].CMP  =(reg){"STM_CHANNEL1_CMP"  ,0x28+STM_BASE_ADDR     ,32     ,0x00000000,0xffffffff,0xffffffff,0x000000,0x00000000};
    
    STM.CHANNEL[2].CCR  =(reg){"STM_CHANNEL1_CCR"  ,0x30+STM_BASE_ADDR     ,32     ,0x00000000,0x00000001,0x00000001,0x000000,0x00000000};
    STM.CHANNEL[2].CIF  =(reg){"STM_CHANNEL1_CIF"  ,0x34+STM_BASE_ADDR     ,32     ,0x00000000,0x00000001,0x00000000,0x000001,0x00000000};
    STM.CHANNEL[2].CMP  =(reg){"STM_CHANNEL1_CMP"  ,0x38+STM_BASE_ADDR     ,32     ,0x00000000,0xffffffff,0xffffffff,0x000000,0x00000000};
    
    STM.CHANNEL[3].CCR  =(reg){"STM_CHANNEL1_CCR"  ,0x40+STM_BASE_ADDR     ,32     ,0x00000000,0x00000001,0x00000001,0x000000,0x00000000};
    STM.CHANNEL[3].CIF  =(reg){"STM_CHANNEL1_CIF"  ,0x44+STM_BASE_ADDR     ,32     ,0x00000000,0x00000001,0x00000000,0x000001,0x00000000};
    STM.CHANNEL[3].CMP  =(reg){"STM_CHANNEL1_CMP"  ,0x48+STM_BASE_ADDR     ,32     ,0x00000000,0xffffffff,0xffffffff,0x000000,0x00000000};
    
    /* TODO: Reset value might be different as initializing in SoC with some base address */
    INTC.IACKR0         =(reg){"INTC_IACKRO"       ,0x20+INTC_BASE_ADDR    ,32     ,0x00000000,0xfffffffe,0xfffff000,0x000000,0x00000000};
    
    MC_CGM.SC_DC2       =(reg){"MC_CGM_SC_DC2"     ,0xF0+MC_CGM_BASE_ADDR  ,32     ,0x80000000,0x803f0000,0x803f0000,0x000000,0x80000000};
    
    PSEUDO_REG.WAIT     =(reg){"PSEUDO_REG_WAIT"  ,0x0+PSEUDO_REG_BASE_ADDR,32     ,0x00000000,0xffffffff,0xffffffff,0x000000,0x00000000};
    PSEUDO_REG.POR      =(reg){"PSEUDO_REG_POR"   ,0x4+PSEUDO_REG_BASE_ADDR,32     ,0x00000000,0x00000001,0x00000001,0x000000,0x00000000};
    PSEUDO_REG.DEBUG_ON =(reg){"PSEUDO_REG_DEBUG_ON",0x8+PSEUDO_REG_BASE_ADDR,32   ,0x00000000,0x00000001,0x00000001,0x000000,0x00000000};
    PSEUDO_REG.DEBUG_OFF=(reg){"PSEUDO_REG_DBUG_OFF",0xC+PSEUDO_REG_BASE_ADDR,32   ,0x00000000,0x00000001,0x00000001,0x000000,0x00000000}; 
    /* Add pointers to all reg in ALL_REG */
    int i;
    int offset;
    for(i=0; i < ALL_REG_COUNT; i++) {
        if(i < STM_REG_COUNT) {

            offset = i;
            ALL_REG[i]= ((reg *)(&(STM.CR)) + offset);

        } else if(i< (STM_REG_COUNT + INTC_REG_COUNT) ) {

            offset=i-STM_REG_COUNT;
            ALL_REG[i]= ((reg *)(&(INTC.IACKR0)) +offset);

        } else if(i< (STM_REG_COUNT + INTC_REG_COUNT + MC_CGM_REG_COUNT) ) {

            offset=i-(STM_REG_COUNT + INTC_REG_COUNT) ;
            ALL_REG[i]= ((reg *)(&(MC_CGM.SC_DC2)) +offset);

        }  else if(i< (STM_REG_COUNT + INTC_REG_COUNT + MC_CGM_REG_COUNT + PSEUDO_REG_COUNT))
        {
            offset=i-(STM_REG_COUNT + INTC_REG_COUNT + MC_CGM_REG_COUNT) ;
            ALL_REG[i]= ((reg *)(&(MC_CGM.SC_DC2)) +offset); 
        }

    }
    /* Initialize STATE */
    STM_STATE.DEBUG_MODE=0;
}

void set_interrupt(int channel_no) {
    /*Set STM channel flag */
    STM.CHANNEL[channel_no].CIF.val=change_bit_val(STM.CHANNEL[channel_no].CIF.val,0x1,STM_INTERRUPT_FLAG_BIT,1);
    /*Set INTC Vec Number */
    INTC.IACKR0.val=change_bit_val(INTC.IACKR0.val, 36 + channel_no,INTC_VEC_BIT,INTC_VEC_BIT_SIZE);
}

void clear_interrupt(int channel_no) {
    /*Clear STM channel interrupt flag */
    /* TODO) Assuming STM channel disable doesn't effect interrupt */
    STM.CHANNEL[channel_no].CIF.val=change_bit_val(STM.CHANNEL[channel_no].CIF.val,0x0,STM_INTERRUPT_FLAG_BIT,1);
    /*Set INTC Vec Number to 0 )Check Does it revert back to zero. If not, how to check if interrupt occured */
    /* Use Pseudo Variable to store PC values to read if interrupt and which interrupt*/
    INTC.IACKR0.val=change_bit_val(INTC.IACKR0.val,0x0,INTC_VEC_BIT,INTC_VEC_BIT_SIZE);

}
int model_write_reg(reg *current_reg,uint32_t data) {
    RUNTIME_PRINT(("MODEL WRITE called\n")); 
    if(current_reg->addr==STM.CR.addr){

        RUNTIME_PRINT(("STM.CR called\n")); 
        /* Simple write to the register */
        write_reg_with_mask(current_reg,data);
        
    }
    else if(current_reg->addr== STM.CNT.addr){

        RUNTIME_PRINT(("STM.CNT called\n")); 
        /* Do nothing */
        /* Even though doesn't do anything, still needed, as still will check writing on this reg in silicon will 
           have no effect */ 
        
    }
    else if(current_reg->addr== STM.CHANNEL[0].CCR.addr)
    {
        
        RUNTIME_PRINT(("STM.CHANNEL[0].CCR called\n")); 

        int previous_channel_en=get_bit_val(STM.CHANNEL[0].CCR.val,STM_CHANNEL_EN_BIT,1);
        write_reg_with_mask(current_reg,data);
        int current_channel_en=get_bit_val(STM.CHANNEL[0].CCR.val,STM_CHANNEL_EN_BIT,1);
        /* If pending Interrupt flag when enabled, then set interrupt*/
        /* TODO) Check if disabling the timer has effect of negating interrupt to the controller, if interrupt pending? */
        /* Currently assuming that disabling channel has no effect on present interrupt */

        /*
        if ( get_bit_val(STM.CHANNEL[0].CIF.val,STM_INTERRUPT_FLAG_BIT,1) == 0x1) {
            if ( get_bit_val(STM.CHANNEL[0].CCR.val,STM_CHANNEL_EN_BIT,1)==0x1) {
                set_interrupt(0);
            }
        }
        */

        /* If CMP==CNT when channel enabled from disabled state then set interrupt */
        if( (previous_channel_en==0x0) && (current_channel_en==0x1)) {
            int cmp_val=STM.CHANNEL[0].CMP.val;
            int timer_val=STM.CNT.val;
            if(timer_val==cmp_val) {
                set_interrupt(0);
            }
        }
        
    }
    else if(current_reg->addr== STM.CHANNEL[0].CIF.addr){
    
        RUNTIME_PRINT(("STM.CHANNEL[0].CIF called\n")); 

        int previous_flag_bit= get_bit_val(STM.CHANNEL[0].CIF.val,STM_INTERRUPT_FLAG_BIT,1);
        /* Simple write to the register */
        write_reg_with_mask(current_reg,data);
        int current_flag_bit= get_bit_val(STM.CHANNEL[0].CIF.val,STM_INTERRUPT_FLAG_BIT,1);
        /* Clear interrupt if previously bit set and currently the cleared */
        if ( (previous_flag_bit==0x1) && (current_flag_bit==0x0)) {
            clear_interrupt(0);
        }
        
    }
    else if(current_reg->addr== STM.CHANNEL[0].CMP.addr) {

        RUNTIME_PRINT(("STM.CHANNEL[0].CMP called\n")); 

        /* Simple write to the register */
        write_reg_with_mask(current_reg,data);

        /* If CMP==CNT and channel enable then set the interrupt */
        /*
        int current_channel_enable= get_bit_val(STM.CHANNEL[0].CCR.val,STM_CHANNEL_EN_BIT,1);
        int current_timer_val= STM.CT.val      
      
        if ( (current_channel_enable==0x1) && (current_timer==STM.CHANNEL[0].CMP.val) ) {
            set_interrupt(0);
        }
        */
        
    }
    else if(current_reg->addr== STM.CHANNEL[1].CCR.addr) {

        RUNTIME_PRINT(("STM.CHANNEL[1].CCR called\n"));

        int previous_channel_en=get_bit_val(STM.CHANNEL[1].CCR.val,STM_CHANNEL_EN_BIT,1);
        write_reg_with_mask(current_reg,data);
        int current_channel_en=get_bit_val(STM.CHANNEL[1].CCR.val,STM_CHANNEL_EN_BIT,1);
        /* If pending Interrupt flag when enabled, then set interrupt*/
        /* TODO) Check if disabling the timer has effect of negating interrupt to the controller, if interrupt pending? */
        /* Currently assuming that disabling channel has no effect on present interrupt */

        /*
        if ( get_bit_val(STM.CHANNEL[1].CIF.val,STM_INTERRUPT_FLAG_BIT,1) == 0x1) {
            if ( get_bit_val(STM.CHANNEL[1].CCR.val,STM_CHANNEL_EN_BIT,1)==0x1) {
                set_interrupt(1);
            }
        }
        */

        /* If CMP==CNT when channel enabled from disabled state then set interrupt */
        if( (previous_channel_en==0x0) && (current_channel_en==0x1)) {
            int cmp_val=STM.CHANNEL[1].CMP.val;
            int timer_val=STM.CNT.val;
            if(timer_val==cmp_val) {
                set_interrupt(1);
            }

        }
        
    }
    else if(current_reg->addr== STM.CHANNEL[1].CIF.addr) {

        RUNTIME_PRINT(("STM.CHANNEL[1].CIF called\n")); 

        int previous_flag_bit= get_bit_val(STM.CHANNEL[1].CIF.val,STM_INTERRUPT_FLAG_BIT,1);
        /* Simple write to the register */
        write_reg_with_mask(current_reg,data);
        int current_flag_bit= get_bit_val(STM.CHANNEL[1].CIF.val,STM_INTERRUPT_FLAG_BIT,1);
        /* Clear interrupt if previously bit set and currently the cleared */
        if ( (previous_flag_bit==0x1) && (current_flag_bit==0x0)) {
            clear_interrupt(1);
        }
        
    }
    else if(current_reg->addr== STM.CHANNEL[1].CMP.addr) {

        RUNTIME_PRINT(("STM.CHANNEL[1].CMP called\n")); 

        /* Simple write to the register */
        write_reg_with_mask(current_reg,data);

        /* If CMP==CNT and channel enable then set the interrupt */
        /*
        int current_channel_enable= get_bit_val(STM.CHANNEL[1].CCR.val,STM_CHANNEL_EN_BIT,1);
        int current_timer_val= STM.CT.val      
      
        if ( (current_channel_enable==0x1) && (current_timer==STM.CHANNEL[1].CMP.val) ) {
            set_interrupt(1);
        }
        */
        
    }
    else if(current_reg->addr== STM.CHANNEL[2].CCR.addr) {
    
        RUNTIME_PRINT(("STM.CHANNEL[2].CCR called\n"));

        int previous_channel_en=get_bit_val(STM.CHANNEL[2].CCR.val,STM_CHANNEL_EN_BIT,1);
        write_reg_with_mask(current_reg,data);
        int current_channel_en=get_bit_val(STM.CHANNEL[2].CCR.val,STM_CHANNEL_EN_BIT,1);
        /* If pending Interrupt flag when enabled, then set interrupt*/
        /* TODO) Check if disabling the timer has effect of negating interrupt to the controller, if interrupt pending? */
        /* Currently assuming that disabling channel has no effect on present interrupt */

        /*
        if ( get_bit_val(STM.CHANNEL[2].CIF.val,STM_INTERRUPT_FLAG_BIT,1) == 0x1) {
            if ( get_bit_val(STM.CHANNEL[2].CCR.val,STM_CHANNEL_EN_BIT,1)==0x1) {
                set_interrupt(2);
            }
        }
        */

        /* If CMP==CNT when channel enabled from disabled state then set interrupt */
        if( (previous_channel_en==0x0) && (current_channel_en==0x1)) {
            int cmp_val=STM.CHANNEL[2].CMP.val;
            int timer_val=STM.CNT.val;
            if(timer_val==cmp_val) {
                set_interrupt(2);
            }

        }
        
    }
    else if(current_reg->addr== STM.CHANNEL[2].CIF.addr) {

        RUNTIME_PRINT(("STM.CHANNEL[2].CIF called\n")); 

        int previous_flag_bit= get_bit_val(STM.CHANNEL[2].CIF.val,STM_INTERRUPT_FLAG_BIT,1);
        /* Simple write to the register */
        write_reg_with_mask(current_reg,data);
        int current_flag_bit= get_bit_val(STM.CHANNEL[2].CIF.val,STM_INTERRUPT_FLAG_BIT,1);
        /* Clear interrupt if previously bit set and currently the cleared */
        if ( (previous_flag_bit==0x1) && (current_flag_bit==0x0)) {
            clear_interrupt(2);
        }
        
    }
    else if(current_reg->addr== STM.CHANNEL[2].CMP.addr) {

        RUNTIME_PRINT(("STM.CHANNEL[2].CMP called\n")); 

        /* Simple write to the register */
        write_reg_with_mask(current_reg,data);

        /* If CMP==CNT and channel enable then set the interrupt */
        /*
        int current_channel_enable= get_bit_val(STM.CHANNEL[2].CCR.val,STM_CHANNEL_EN_BIT,1);
        int current_timer_val= STM.CT.val      
      
        if ( (current_channel_enable==0x1) && (current_timer==STM.CHANNEL[2].CMP.val) ) {
            set_interrupt(2);
        }
        */
        
    }
    else if(current_reg->addr== STM.CHANNEL[3].CCR.addr) {

        RUNTIME_PRINT(("STM.CHANNEL[3].CCR called\n"));

        int previous_channel_en=get_bit_val(STM.CHANNEL[3].CCR.val,STM_CHANNEL_EN_BIT,1);
        write_reg_with_mask(current_reg,data);
        int current_channel_en=get_bit_val(STM.CHANNEL[3].CCR.val,STM_CHANNEL_EN_BIT,1);
        /* If pending Interrupt flag when enabled, then set interrupt*/
        /* TODO) Check if disabling the timer has effect of negating interrupt to the controller, if interrupt pending? */
        /* Currently assuming that disabling channel has no effect on present interrupt */

        /*
        if ( get_bit_val(STM.CHANNEL[3].CIF.val,STM_INTERRUPT_FLAG_BIT,1) == 0x1) {
            if ( get_bit_val(STM.CHANNEL[3].CCR.val,STM_CHANNEL_EN_BIT,1)==0x1) {
                set_interrupt(3);
            }
        }
        */

        /* If CMP==CNT when channel enabled from disabled state then set interrupt */
        if( (previous_channel_en==0x0) && (current_channel_en==0x1)) {
            int cmp_val=STM.CHANNEL[3].CMP.val;
            int timer_val=STM.CNT.val;
            if(timer_val==cmp_val) {
                set_interrupt(3);
            }

        }
        
    }
    else if(current_reg->addr== STM.CHANNEL[3].CIF.addr) {

        RUNTIME_PRINT(("STM.CHANNEL[3].CIF called\n")); 

        int previous_flag_bit= get_bit_val(STM.CHANNEL[3].CIF.val,STM_INTERRUPT_FLAG_BIT,1);
        /* Simple write to the register */
        write_reg_with_mask(current_reg,data);
        int current_flag_bit= get_bit_val(STM.CHANNEL[3].CIF.val,STM_INTERRUPT_FLAG_BIT,1);
        /* Clear interrupt if previously bit set and currently the cleared */
        if ( (previous_flag_bit==0x1) && (current_flag_bit==0x0)) {
            clear_interrupt(3);
        }
          
    }
    else if(current_reg->addr== STM.CHANNEL[3].CMP.addr) {
        RUNTIME_PRINT(("STM.CHANNEL[3].CMP called\n")); 
        /* Simple write to the register */
        write_reg_with_mask(current_reg,data);

        /* If CMP==CNT and channel enable then set the interrupt */
        /*
        int current_channel_enable= get_bit_val(STM.CHANNEL[3].CCR.val,STM_CHANNEL_EN_BIT,1);
        int current_timer_val= STM.CT.val      
      
        if ( (current_channel_enable==0x1) && (current_timer==STM.CHANNEL[3].CMP.val) ) {
            set_interrupt(3);
        }
        */
        
    }
    else if(current_reg->addr==INTC.IACKR0.addr) {
        RUNTIME_PRINT(("INTC.IACKR0 called\n")); 
        /* Do nothing */
    }
    else if(current_reg->addr== MC_CGM.SC_DC2.addr) {
        RUNTIME_PRINT(("MC_CGM.SC_DC2 called\n")); 
        /* Simple Write */
        /* TODO) Check how is write impacted in if(current_reg->addr== of Divider Disabled */
        write_reg_with_mask(current_reg,data);
          
    }
  
    else if(current_reg->addr== PSEUDO_REG.WAIT.addr) {
        
        RUNTIME_PRINT(("WAIT called\n")); 
        /* TODO) Assuming data is the clock cycles wrt to SYS_CLK */
        int freeze_bit= get_bit_val(STM.CR.val,STM_FRZ_BIT,1);
        /* If in debug mode and FRZ bit set, do nothing */
        if( (STM_STATE.DEBUG_MODE==1) && (freeze_bit==1))
        {
        }
        else
        {
            /* If clock stopped or timer disabled, don't do anything */
            int divider_en =get_bit_val(MC_CGM.SC_DC2.val,MC_CGM_DIVIDER_EN_BIT,1);
            int timer_en =get_bit_val(STM.CR.val,STM_TIMER_EN_BIT,1);
            if((divider_en ==0x0) || (timer_en ==0x0))
            {
            }
            else
            {
                uint32_t previous_timer_val=(uint32_t)(STM.CNT.val);
                uint32_t prescaler= (uint32_t)(get_bit_val(STM.CR.val,STM_PRESCALER_BIT,STM_PRESCALER_BIT_SIZE));
                uint32_t clk_divider= (uint32_t)(get_bit_val(MC_CGM.SC_DC2.val,MC_CGM_DIV_BIT,MC_CGM_DIV_BIT_SIZE));
                /* Increment Timer Value */
                uint32_t new_timer_val= previous_timer_val + (uint32_t)(data)/(uint32_t)((clk_divider)*(prescaler));
                write_reg_with_mask(&STM.CNT,new_timer_val);

                int channel_no;
                for(channel_no=0;channel_no<4;channel_no++)
                {
                    int channel_en=get_bit_val(STM.CHANNEL[channel_no].CCR.val,STM_CHANNEL_EN_BIT,1);
                    if(channel_en==0x0)
                    {
                        continue;
                    }
                    uint32_t channel_cmp_val= (uint32_t)(STM.CHANNEL[channel_no].CMP.val);
                    /* If old_timer_val<cmp<newtimer_val , then set interrupt ( Need to take overflow into account also) */
                    /* No overflow */
                    if( new_timer_val>previous_timer_val) 
                    {
                        if( (channel_cmp_val >previous_timer_val) && (channel_cmp_val<new_timer_val))
                        {
                            set_interrupt(channel_no);
                        }
                    }
                    else
                    {
                        if( (channel_cmp_val >previous_timer_val) || (channel_cmp_val<new_timer_val))
                        {
                            set_interrupt(channel_no);
                        }
                    }
                }
            }
      
        }      
    }
    else if(current_reg->addr== PSEUDO_REG.DEBUG_ON.addr){
        RUNTIME_PRINT(("DEBUG_ON called\n")); 
        STM_STATE.DEBUG_MODE=1;  
    }
    else if(current_reg->addr== PSEUDO_REG.DEBUG_OFF.addr){
        RUNTIME_PRINT(("DEBUG_OFF\n"));
        STM_STATE.DEBUG_MODE=0;
    }
    else if(current_reg->addr== PSEUDO_REG.POR.addr){
        RUNTIME_PRINT(("POR called\n"));  
        init_reg_por();  
    }
    else /* Unknown Register selected*/
    {
      //assert(0);
        RUNTIME_PRINT(("Exit Unsuccessfully\n"));
        return -1;
    }
    return 0;  
}
