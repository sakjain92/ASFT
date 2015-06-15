//#include "executioner_main.h"
#include "common.h"
//#include <klee/klee.h>

extern const int PSEUDO_REG_COUNT;
extern const int MC_CGM_REG_COUNT;
extern const int INTC_REG_COUNT;
extern const int STM_REG_COUNT;
extern const int ALL_REG_COUNT;
extern reg* ALL_REG[];
extern STM_tag STM;
extern INTC_tag INTC;
extern MC_CGM_tag MC_CGM;
extern PSEUDO_REG_tag PSEUDO_REG;

reg * get_register(int index) {
    switch(index) {
        case 0: return (reg *)(& STM.CR );
        case 1: return (reg *)(& STM.CNT );
        case 2: return (reg *)(& STM.CHANNEL[0].CCR );
        case 3: return (reg *)(& STM.CHANNEL[0].CIF );
        case 4: return (reg *)(& STM.CHANNEL[0].CMP );
        case 5: return (reg *)(& STM.CHANNEL[1].CCR );
        case 6: return (reg *)(& STM.CHANNEL[1].CIF );
        case 7: return (reg *)(& STM.CHANNEL[1].CMP );
        case 8: return (reg *)(& STM.CHANNEL[2].CCR );
        case 9: return (reg *)(& STM.CHANNEL[2].CIF );
        case 10: return (reg *)(& STM.CHANNEL[2].CMP );
        case 11: return (reg *)(& STM.CHANNEL[3].CCR );
        case 12: return (reg *)(& STM.CHANNEL[3].CIF );
        case 13: return (reg *)(& STM.CHANNEL[3].CMP );
        case 14: return (reg *)(& INTC.IACKR0  );
        case 15: return (reg *)(& MC_CGM.SC_DC2  );
        case 16: return (reg *)(& PSEUDO_REG.WAIT  );
        case 17: return (reg *)(& PSEUDO_REG.POR  );
        case 18: return (reg *)(& PSEUDO_REG.DEBUG_ON );
        case 19: return (reg *)(& PSEUDO_REG.DEBUG_OFF );
        default: return NULL;
    }

}
int main() {

    int i;
    uint32_t reg_selection[MAX_INSTR_COUNT];
    uint32_t reg_data[MAX_INSTR_COUNT];
    klee_make_symbolic(reg_selection,MAX_INSTR_COUNT*sizeof(uint32_t),"reg_selection");
    klee_make_symbolic(reg_data,MAX_INSTR_COUNT*sizeof(uint32_t),"reg_data");

    init_reg_por();
    RUNTIME_PRINT(("ALL_REG_COUNT is %d\n",ALL_REG_COUNT));
    RUNTIME_PRINT(("MAX_INSTR_COUNT is %d\n",MAX_INSTR_COUNT));
    //ALL_REG_COUNT=PSEUDO_REG_COUNT+ MC_CGM_REG_COUNT+ INTC_REG_COUNT+ STM_REG_COUNT;
    //for(i=0;i<MAX_INSTR_COUNT;i++) {
    //    klee_assume(reg_selection[i]<ALL_REG_COUNT);
    //}
    
    reg *current_reg;
    uint32_t data;
    for(i=0;i<MAX_INSTR_COUNT;i++) {
        RUNTIME_PRINT(("Executioner Loop: %d Started\n",i));
        int reg_index=reg_selection[i];
        klee_assume(reg_index<ALL_REG_COUNT);
        klee_assume(reg_index>=0);
        current_reg=get_register(reg_index);
        if(current_reg==NULL) {
            RUNTIME_PRINT(("Executioner Exit Unsuccessfully"));
            return -1;
        } 
        data=reg_data[i];
        model_write_reg(current_reg,data);
        RUNTIME_PRINT(("Executioner Loop %d Ended\n",i));

    }
    return 0;
}
