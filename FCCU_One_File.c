#include <stdint.h>
#include <stdio.h>
#include <string.h>

//-----------------------------------FUNCTION_DECLARATION----------------------------------------//
typedef struct  reg{//TODO:In some regs,only writing 0 has effect.Should that be taken into account?
	char name[100];
	uint32_t addr;
	int reg_size;
	uint32_t def;
	uint32_t rmask;
	uint32_t wmask;
	uint32_t w1c;//w1c and wmask are mutually exclusive
	uint32_t val;
}reg;


int model_write_reg(char *name,uint32_t data);
uint32_t change_bit_val(uint32_t reg_val,uint32_t new_val,int bit,int bit_size);
uint32_t get_bit_val(uint32_t reg_val,int bit,int bit_size);
void write_reg_with_mask(reg *Register,uint32_t data);
void init_reg();
void set_opr(int opcode);
void set_ops(const char *string);
void fault_created_at_source(int *fault_array,int no_of_faults);
void fault_cleared_at_source(int *fault_array,int no_of_faults);
void move_fsm_due_to_fault(void);
void before_write_reg(char *name);
void after_write_reg(char *name);
void destructive_reset(void);
void init_state(void);
void log_all_regs_val(FILE *fp);
void log_write(FILE *fp,char *name,uint32_t addr,uint32_t data);
void log_all_regs_change(FILE *fp_change);

//-----------------------------------REG_H-------------------------------------------------------//

#define FCCU_REGS_COUNT 41
#define FCCU_CONFIG_REGS_COUNT 23
#define MC_RGM_REGS_COUNT 2
#define MEMU_REGS_COUNT 1


#define FCCU_NCF_COUNT 3
#define FCCU_ADDR  0xFBF58000
#define MC_RGM_ADDR 0xFFFA8000
#define MEMU_ADDR 0xFFF50000



typedef struct fccu_tag{//TODO:Many flaws in reg description and implementation. Need to check this and change here.Those will be counted as defect founded by model
	uint32_t addr;
	reg CTRL;
	reg CTRLK;
	reg CFG;
	reg NCF_CFG0;
	reg NCF_CFG1;
	reg NCF_CFG2;
	reg NCFS_CFG0;
	reg NCFS_CFG1;
	reg NCFS_CFG2;
	reg NCFS_CFG3;
	reg NCFS_CFG4;
	reg NCFS_CFG5;
	reg NCF_S0;
	reg NCF_S1;
	reg NCF_S2;
	reg NCFK;
	reg NCF_E0;
	reg NCF_E1;
	reg NCF_E2;
	reg NCF_TOE0;
	reg NCF_TOE1;
	reg NCF_TOE2;
	reg NCF_TO;
	reg CFG_TO;
	reg STAT;
	reg N2AF_STATUS;
	reg A2FF_STATUS;
	reg N2FF_STATUS;
	reg F2A_STATUS;
	reg NCFF;
	reg IRQ_STAT;
	reg IRQ_EN;
	reg XTMR;
	reg TRANS_LOCK;
	reg PERMNT_LOCK;
	reg IRQ_ALARM_EN0;
	reg IRQ_ALARM_EN1;
	reg IRQ_ALARM_EN2;
	reg NMI_EN0;
	reg NMI_EN1;
	reg NMI_EN2;

	reg *NCF_CFG[FCCU_NCF_COUNT];
	reg *NCFS_CFG[2*FCCU_NCF_COUNT];
	reg *NCF_S[FCCU_NCF_COUNT];
	reg *NCF_E[FCCU_NCF_COUNT];
	reg *NCF_TOE[FCCU_NCF_COUNT];
	reg *IRQ_ALARM_EN[FCCU_NCF_COUNT];
	reg *NMI_EN[FCCU_NCF_COUNT];
}fccu_tag;

fccu_tag FCCU;
reg *FCCU_REGS[FCCU_REGS_COUNT];
reg *FCCU_CONFIG_REGS[FCCU_CONFIG_REGS_COUNT];

 typedef struct mc_rgm_tag{
	uint32_t addr;
	reg DES;
	reg FES;
 }mc_rgm_tag;

mc_rgm_tag MC_RGM;
reg *MC_RGM_REGS[MC_RGM_REGS_COUNT];

typedef struct memu_tag{
	uint32_t addr;
	reg DEBUG;
}memu_tag;

memu_tag MEMU;
reg *MEMU_REGS[MEMU_REGS_COUNT];



#define VARIABLES_COUNT 7
typedef struct variable{
    reg nmi_flag;//Incremented each time nmi/machine check
    reg config_irq_flag;//For CONFIG IRQ0-None.1-IRQ.Do not increment (As wll loop till flag of IRQ not cleared)
    reg alarm_irq_flag;//For ALARM IRQ.0-None.1-IRQ.Do not increment (As wll loop till flag of IRQ not cleared)
    reg nmi_source;//Machine ckeck or nmi. 0-None.1-Machine Check.2-NMI
    reg wait_stm;//Data is the stm count.STM is set to run at IRC or make equally change in data value so that timing of STM is same as IRC(But difference in IRC clk so bettter to change sys clk to IRC)
    reg por;//POR asserted
    reg exr;//External Functional Reset

}variable;

variable VARIABLE;
reg *VARIABLE_REGS[VARIABLES_COUNT];

#define ALL_REGS_COUNT (FCCU_REGS_COUNT+MC_RGM_REGS_COUNT+MEMU_REGS_COUNT+VARIABLES_COUNT)
reg *ALL_REGS[ALL_REGS_COUNT];
reg PREV_ALL_REGS[ALL_REGS_COUNT];

//-----------------------------------MODEL_H-------------------------------------------------------//
//#define FAULT_COUNT 128
#define FAULT_COUNT 96
#define FAULT_MAX 128
typedef struct state{
    char prev_reg[100];
    char fsm[100];

    uint32_t time;
    uint32_t time_alarm_upper;//Upper limit on time in irq
    uint32_t time_alarm_lower;//lower limit on time in irq
    uint32_t time_cfg_upper;//Upper limit on time in cfg
    uint32_t time_cfg_lower;//Lower limit on time in cfg
    uint32_t permanent_lock;
    uint32_t transient_lock;//Note:Default is 1.

    uint32_t fault[FAULT_MAX];//Fault latched at source.FAULT_MAX as set through NCFF
    uint32_t fault_existing[FAULT_COUNT];//Which faults are not reserved
    uint32_t ncfk_entered;//Key entered correctly or not
    uint32_t ctrlk_entered;

    uint32_t config_time_left;
    uint32_t alarm_time_left;
	uint32_t alarm_timeout;
	uint32_t cfg_timeout;

    uint32_t fault_status[FAULT_COUNT];//Fault latched in fccu regs
    uint32_t new_faults[FAULT_COUNT];//To find which are the new faults that were created


    uint32_t nafs;
    uint32_t af_src;
    uint32_t affs;
    uint32_t nffs;
    uint32_t nf_src;
    uint32_t fafs;


}state;
state STATE;
//-----------------------------------LOG_C-------------------------------------------------------//

void log_read(FILE *fp,char *name,uint32_t addr,uint32_t data)
{
    //Log of all registers value
    fprintf(fp,"READ: \tREG:%-40s  \t ADDR:0x%-10x  \t DATA:0x%-10x\n", name, addr,data );
}
void log_write(FILE *fp,char *name,uint32_t addr,uint32_t data)
{
    //Log of which registers are written with what value
    fprintf(fp,"WRITE:\tREG:%-40s  \t ADDR:0x%-10x  \t DATA:0x%-10x\n", name, addr,data );
}
void log_all_regs_val(FILE *fp)
{
    int loop_count;
    for(loop_count=0;loop_count<ALL_REGS_COUNT;loop_count++)
    {
        log_read(fp,ALL_REGS[loop_count]->name,ALL_REGS[loop_count]->addr,ALL_REGS[loop_count]->val);
    }
}

void log_all_regs_change(FILE *fp_change)
{
    int loop_count;
    for(loop_count=0;loop_count<ALL_REGS_COUNT;loop_count++)
    {
        if(PREV_ALL_REGS[loop_count].val!=ALL_REGS[loop_count]->val)
        {
            log_read(fp_change,ALL_REGS[loop_count]->name,ALL_REGS[loop_count]->addr,ALL_REGS[loop_count]->val);
        }
        PREV_ALL_REGS[loop_count].val=ALL_REGS[loop_count]->val;
    }
}
//-----------------------------------REG_C-------------------------------------------------------//
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

uint32_t set_bit(uint32_t value, int bit)
{
    return value | (uint32_t)(1<<(31-bit));
}

uint32_t clear_bit(uint32_t value, int bit)
{
    return value & ~(uint32_t)(1<<(31-bit));
}

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

void init_reg(void)
{
    int loop_count;
    FCCU.addr=FCCU_ADDR;
    FCCU.CTRL=(reg)(reg){"CTRL",0x0+FCCU.addr,32,0xC0,0xe00003df,0xe000021f,0x0};
	FCCU.CTRLK=(reg){"CTRLK",0x4+FCCU.addr,32,0x0,0x0,0xffffffff,0x0};
	FCCU.CFG=(reg){"CFG",0x8+FCCU.addr,32,0x0,0x01f0e7c0,0x01f0e7c0,0x0};
	FCCU.NCF_CFG0=(reg){"NCF_CFG0",0x1C+FCCU.addr,32,0xffffffff,0xffffffff,0xffffffff,0x0};
	FCCU.NCF_CFG1=(reg){"NCF_CFG1",0x20+FCCU.addr,32,0xffffffff,0xffffffff,0xffffffff,0x0};
	FCCU.NCF_CFG2=(reg){"NCF_CFG2",0x24+FCCU.addr,32,0xffffffff,0xffffffff,0xffffffff,0x0};
	FCCU.NCFS_CFG0=(reg){"NCFS_CFG0",0x4C+FCCU.addr,32,0x00002000,0xffffffff,0xffffffff,0x0};
	FCCU.NCFS_CFG1=(reg){"NCFS_CFG1",0x50+FCCU.addr,32,0x00000080,0xffffffff,0xffffffff,0x0};
	FCCU.NCFS_CFG2=(reg){"NCFS_CFG2",0x54+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.NCFS_CFG3=(reg){"NCFS_CFG3",0x58+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.NCFS_CFG4=(reg){"NCFS_CFG4",0x5C+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.NCFS_CFG5=(reg){"NCFS_CFG5",0x60+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.NCF_S0=(reg){"NCF_S0",0x80+FCCU.addr,32,0x0,0xffffffff,0x0,0xffffffff};
	FCCU.NCF_S1=(reg){"NCF_S1",0x84+FCCU.addr,32,0x0,0xffffffff,0x0,0xffffffff};
	FCCU.NCF_S2=(reg){"NCF_S2",0x88+FCCU.addr,32,0x0,0xffffffff,0x0,0xffffffff};
	FCCU.NCFK=(reg){"NCFK",0x90+FCCU.addr,32,0x0,0x0,0xffffffff,0x0};
	FCCU.NCF_E0=(reg){"NCF_E0",0x94+FCCU.addr,32,0x00080040,0xffffffff,0xffffffff,0x0};
	FCCU.NCF_E1=(reg){"NCF_E1",0x98+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.NCF_E2=(reg){"NCF_E2",0x9C+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.NCF_TOE0=(reg){"NCF_TOE0",0xA4+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.NCF_TOE1=(reg){"NCF_TOE1",0xA8+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.NCF_TOE2=(reg){"NCF_TOE2",0xAC+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.NCF_TO=(reg){"NCF_TO",0xB4+FCCU.addr,32,0x0000ffff,0xffffffff,0xffffffff,0x0};
	FCCU.CFG_TO=(reg){"CFG_TO",0xB8+FCCU.addr,32,0x6,0x7,0x7,0x0};
	FCCU.STAT=(reg){"STAT",0xC0+FCCU.addr,32,0x10,0x3f,0x8,0x0};
	FCCU.N2AF_STATUS=(reg){"N2AF_STATUS",0xC4+FCCU.addr,32,0x0,0xff,0x0,0x0};
	FCCU.A2FF_STATUS=(reg){"A2FF_STATUS",0xC8+FCCU.addr,32,0x0,0x3ff,0x3ff,0x0};
	FCCU.N2FF_STATUS=(reg){"N2FF_STATUS",0xCC+FCCU.addr,32,0x0,0x3ff,0x3ff,0x0};
	FCCU.F2A_STATUS=(reg){"F2A_STATUS",0xD0+FCCU.addr,32,0x0,0x1ff,0x0,0x0};
	FCCU.NCFF=(reg){"NCFF",0xDC+FCCU.addr,32,0x0,0x0,0x7f,0x0};
	FCCU.IRQ_STAT=(reg){"IRQ_STAT",0xE0+FCCU.addr,32,0x0,0x7,0x0,0x1};
	FCCU.IRQ_EN=(reg){"IRQ_EN",0xE4+FCCU.addr,32,0x0,0x1,0x1,0x0};
	FCCU.XTMR=(reg){"XTMR",0xE8+FCCU.addr,32,0x0,0xffffffff,0x0,0x0};
	FCCU.TRANS_LOCK=(reg){"TRANS_LOCK",0xF0+FCCU.addr,32,0x0,0x0,0x1ff,0x0};
	FCCU.PERMNT_LOCK=(reg){"PERMNT_LOCK",0xF4+FCCU.addr,32,0x0,0x0,0x1ff,0x0};
	FCCU.IRQ_ALARM_EN0=(reg){"IRQ_ALARM_EN0",0xFC+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.IRQ_ALARM_EN1=(reg){"IRQ_ALARM_EN1",0x100+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.IRQ_ALARM_EN2=(reg){"IRQ_ALARM_EN2",0x104+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.NMI_EN0=(reg){"NMI_EN0",0x10C+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.NMI_EN1=(reg){"NMI_EN1",0x110+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};
	FCCU.NMI_EN2=(reg){"NMI_EN2",0x114+FCCU.addr,32,0x0,0xffffffff,0xffffffff,0x0};

    for(loop_count=0;loop_count<FCCU_REGS_COUNT;loop_count++)
    {
        //FCCU_REGS[loop_count]=(&FCCU +sizeof(uint32_t) +loop_count*sizeof(reg));//Address of reg
        //FCCU_REGS[loop_count]=(&FCCU.CTRL +loop_count*sizeof(reg));//CTRL is the first FCCU Reg
        FCCU_REGS[loop_count]=(&FCCU.CTRL +loop_count);//CTRL is the first FCCU Reg
        FCCU_REGS[loop_count]->val=FCCU_REGS[loop_count]->def;//Initializing Value of reg to default
    }
    FCCU_CONFIG_REGS[0]=&FCCU.CFG;
    FCCU_CONFIG_REGS[1]=&FCCU.NCF_CFG0;
    FCCU_CONFIG_REGS[2]=&FCCU.NCF_CFG1;
    FCCU_CONFIG_REGS[3]=&FCCU.NCF_CFG2;
    FCCU_CONFIG_REGS[4]=&FCCU.NCFS_CFG0;
    FCCU_CONFIG_REGS[5]=&FCCU.NCFS_CFG1;
    FCCU_CONFIG_REGS[6]=&FCCU.NCFS_CFG2;
    FCCU_CONFIG_REGS[7]=&FCCU.NCFS_CFG3;
    FCCU_CONFIG_REGS[8]=&FCCU.NCFS_CFG4;
    FCCU_CONFIG_REGS[9]=&FCCU.NCFS_CFG5;
    FCCU_CONFIG_REGS[10]=&FCCU.NCF_E0;
    FCCU_CONFIG_REGS[11]=&FCCU.NCF_E1;
    FCCU_CONFIG_REGS[12]=&FCCU.NCF_E2;
    FCCU_CONFIG_REGS[13]=&FCCU.NCF_TOE0;
    FCCU_CONFIG_REGS[14]=&FCCU.NCF_TOE1;
    FCCU_CONFIG_REGS[15]=&FCCU.NCF_TOE2;
    FCCU_CONFIG_REGS[16]=&FCCU.NCF_TO;
    FCCU_CONFIG_REGS[17]=&FCCU.IRQ_ALARM_EN0;
    FCCU_CONFIG_REGS[18]=&FCCU.IRQ_ALARM_EN1;
    FCCU_CONFIG_REGS[19]=&FCCU.IRQ_ALARM_EN2;
    FCCU_CONFIG_REGS[20]=&FCCU.NMI_EN0;
    FCCU_CONFIG_REGS[21]=&FCCU.NMI_EN1;
    FCCU_CONFIG_REGS[22]=&FCCU.NMI_EN2;

	//FCCU.NCF_CFG=(reg *[FCCU_NCF_COUNT]){&FCCU.NCF_CFG0,&FCCU.NCF_CFG1,&FCCU.NCF_CFG2};
	//FCCU.NCFS_CFG=(reg *[2*FCCU_NCF_COUNT]){&FCCU.NCFS_CFG0,&FCCU.NCFS_CFG1,&FCCU.NCFS_CFG2,&FCCU.NCFS_CFG3,&FCCU.NCFS_CFG4,&FCCU.NCFS_CFG5};
	//FCCU.NCF_S=(reg *[FCCU_NCF_COUNT]){&FCCU.NCF_S0,&FCCU.NCF_S1,&FCCU.NCF_S2};
	//FCCU.NCF_E=(reg *[FCCU_NCF_COUNT]){&FCCU.NCF_E0,&FCCU.NCF_E1,&FCCU.NCF_E2};
	//FCCU.NCF_TOE=(reg *[FCCU_NCF_COUNT]){&FCCU.NCF_TOE0,&FCCU.NCF_TOE1,&FCCU.NCF_TOE2};
	//FCCU.IRQ_ALARM_EN=(reg *[FCCU_NCF_COUNT]){&FCCU.IRQ_ALARM_EN0,&FCCU.IRQ_ALARM_EN1,&FCCU.IRQ_ALARM_EN2};
	//FCCU.NMI_EN=(reg *[FCCU_NCF_COUNT]){&FCCU.NMI_EN0,&FCCU.NMI_EN1,&FCCU.NMI_EN2};
	for(loop_count=0;loop_count<FCCU_NCF_COUNT;loop_count++)
    {
        FCCU.NCF_CFG[loop_count]=(&FCCU.NCF_CFG0 +loop_count);
    }
    for(loop_count=0;loop_count<2*FCCU_NCF_COUNT;loop_count++)
    {
        FCCU.NCFS_CFG[loop_count]=(&FCCU.NCFS_CFG0 +loop_count);
    }
    for(loop_count=0;loop_count<FCCU_NCF_COUNT;loop_count++)
    {
        FCCU.NCF_S[loop_count]=(&FCCU.NCF_S0 +loop_count);
    }
    for(loop_count=0;loop_count<FCCU_NCF_COUNT;loop_count++)
    {
        FCCU.NCF_E[loop_count]=(&FCCU.NCF_E0 +loop_count);
    }
    for(loop_count=0;loop_count<FCCU_NCF_COUNT;loop_count++)
    {
        FCCU.NCF_TOE[loop_count]=(&FCCU.NCF_TOE0 +loop_count);
    }
    for(loop_count=0;loop_count<FCCU_NCF_COUNT;loop_count++)
    {
        FCCU.IRQ_ALARM_EN[loop_count]=(&FCCU.IRQ_ALARM_EN0 +loop_count);
    }
    for(loop_count=0;loop_count<FCCU_NCF_COUNT;loop_count++)
    {
        FCCU.NMI_EN[loop_count]=(&FCCU.NMI_EN0 +loop_count);
    }

    MC_RGM.addr=MC_RGM_ADDR;
    MC_RGM.DES=(reg){"DES",0x0+MC_RGM.addr,32,0x1,0x0380077b,0x0,0x0380077b};
    MC_RGM.FES=(reg){"FES",0x300+MC_RGM.addr,32,0x0,0x0180046d,0x0,0x0180046d};

    for(loop_count=0;loop_count<MC_RGM_REGS_COUNT;loop_count++)
    {
        //MC_RGM_REGS[loop_count]=(&MC_RGM +sizeof(uint32_t) +loop_count*sizeof(reg));//Address of reg
        MC_RGM_REGS[loop_count]=(&MC_RGM.DES +loop_count);//DES is first MC_RGM reg
        MC_RGM_REGS[loop_count]->val=MC_RGM_REGS[loop_count]->def;//Initializing Value of reg to default
    }

    MEMU.addr=MEMU_ADDR;
    MEMU.DEBUG=(reg){"DEBUG",0xC+MEMU.addr,32,0x0,0x001f1f1f,0x001f1f1f,0x0};

    for(loop_count=0;loop_count<MEMU_REGS_COUNT;loop_count++)
    {
        //MEMU_REGS[loop_count]=(&MEMU +sizeof(uint32_t) +loop_count*sizeof(reg));//Address of reg
        MEMU_REGS[loop_count]=(&MEMU.DEBUG +loop_count);//DEBUG is first MEMU reg
        MEMU_REGS[loop_count]->val=MEMU_REGS[loop_count]->def;//Initializing Value of reg to default
    }

    VARIABLE.nmi_flag=(reg){"nmi_flag",0x0,32,0x0,0xffffffff,0xffffffff,0x0};
    VARIABLE.config_irq_flag=(reg){"config_irq_flag",0x4,32,0x0,0xffffffff,0xffffffff,0x0};
    VARIABLE.alarm_irq_flag=(reg){"alarm_irq_flag",0x8,32,0x0,0xffffffff,0xffffffff,0x0};
    VARIABLE.nmi_source=(reg){"nmi_source",0xC,32,0x0,0xffffffff,0xffffffff,0x0};
    VARIABLE.wait_stm=(reg){"wait_stm",0x10,32,0x0,0xffffffff,0xffffffff,0x0};
    VARIABLE.por=(reg){"por",0x14,32,0x0,0xffffffff,0xffffffff,0x0};
    VARIABLE.exr=(reg){"exr",0x14,32,0x0,0xffffffff,0xffffffff,0x0};


    for(loop_count=0;loop_count<VARIABLES_COUNT;loop_count++)
    {
        VARIABLE_REGS[loop_count]=(&VARIABLE.nmi_flag +loop_count);//DES is first MC_RGM reg
        VARIABLE_REGS[loop_count]->val=VARIABLE_REGS[loop_count]->def;//Initializing Value of reg to default
    }
    for(loop_count=0;loop_count<ALL_REGS_COUNT;loop_count++)
    {
        if(loop_count<FCCU_REGS_COUNT)
            ALL_REGS[loop_count]=FCCU_REGS[loop_count];
        else if(loop_count<FCCU_REGS_COUNT+MC_RGM_REGS_COUNT)
            ALL_REGS[loop_count]=MC_RGM_REGS[loop_count-FCCU_REGS_COUNT];
        else if(loop_count<FCCU_REGS_COUNT+MC_RGM_REGS_COUNT+MEMU_REGS_COUNT)
            ALL_REGS[loop_count]=MEMU_REGS[loop_count-FCCU_REGS_COUNT-MC_RGM_REGS_COUNT];
        else
            ALL_REGS[loop_count]=VARIABLE_REGS[loop_count-FCCU_REGS_COUNT-MC_RGM_REGS_COUNT-MEMU_REGS_COUNT];
    }
    for(loop_count=0;loop_count<ALL_REGS_COUNT;loop_count++)
    {
        PREV_ALL_REGS[loop_count].val=ALL_REGS[loop_count]->val;
    }
}

uint32_t read_reg_addr(uint32_t addr)
{
    int loop_count;
    for(loop_count=0;loop_count<ALL_REGS_COUNT;loop_count++)
    {
        if(ALL_REGS[loop_count]->addr==addr)
        {
            return ALL_REGS[loop_count]->val;
        }
    }
    //return 0xDEADBEEF;
    //read_invalid_address(addr);//TODO:Machine check? For accessing invalid address?
    return 0x0;
}

int write_reg_addr(uint32_t addr,uint32_t data)
{
    int loop_count;
    for(loop_count=0;loop_count<ALL_REGS_COUNT;loop_count++)
    {
        if(ALL_REGS[loop_count]->addr==addr)
        {
            return model_write_reg(ALL_REGS[loop_count]->name,data);
        }
    }
    return 0;
}
//-----------------------------------MODEL_FUNCTION_C-------------------------------------------------------//
void move_fsm_due_to_fault(void);
void init_state(void);
void init_reg(void);
void set_ops(const char *string);

void functional_reset(void)//Needs to set FES before calling this function
{
    int loop_count;
    for(loop_count=0;loop_count<VARIABLES_COUNT;loop_count++)
    {
        VARIABLE_REGS[loop_count]->val=VARIABLE_REGS[loop_count]->def;//Initializing Value of reg to default
    }
    //MEMU.DEBUG.val=0x0;//Assumption that MEMU not effected by functional reset
    //Is transient and permanent lock effected by functional reset?(I don't think so.)
    //move_fsm_due_to_fault();

}
void destructive_reset(void)//Needs to set DES before calling this function
{
    init_reg();
    init_state();
    //move_fsm_due_to_fault();
}

void cfg_to(void)
{
	int i;
	FCCU.IRQ_STAT.val=change_bit_val(FCCU.IRQ_STAT.val,0x1,31,1);
	if(get_bit_val(FCCU.IRQ_EN.val,31,1)==0x1)
	{
		VARIABLE.config_irq_flag.val=1;
	}
	for(i=0;i<FCCU_CONFIG_REGS_COUNT;i++)
	{
		FCCU_CONFIG_REGS[i]->val=FCCU_CONFIG_REGS[i]->def;
	}
	strcpy(STATE.fsm,"NORMAL");
	STATE.cfg_timeout=0;
	set_ops("SUCCESS");
	//move_fsm_due_to_fault();//No need.Already called after calling this function.
}

void move_fsm_due_to_fault(void)
{
    int i;
	int en[FAULT_COUNT]={0};
	int reset[FAULT_COUNT]={0};
    int nmi[FAULT_COUNT]={0};
    int irq[FAULT_COUNT]={0};
    int to_e[FAULT_COUNT]={0};
    int ncf_fault_count=0;
    int ncf_alarm_count=0;
    int ncf_fault_nmi=0;
    int ncf_alarm_nmi=0;
    int ncf_fault_short_reset=0;
    int ncf_fault_long_reset=0;
    int ncf_alarm_short_reset=0;
    int ncf_alarm_long_reset=0;
    int ncf_alarm_irq=0;
    int ncf_alarm=0;
    int ncf_fault=0;
    for(i=0;i<FAULT_COUNT;i++)
    {
    	int reg_sel;
    	int bit_sel;
    	reg_sel=(int)((int)(i)/(int)(32));
        bit_sel=i%32;
        en[i]=get_bit_val(FCCU.NCF_E[reg_sel]->val,31-bit_sel,1);
        nmi[i]=get_bit_val(FCCU.NMI_EN[reg_sel]->val,31-bit_sel,1);
        irq[i]=get_bit_val(FCCU.IRQ_ALARM_EN[reg_sel]->val,31-bit_sel,1);
        to_e[i]=get_bit_val(FCCU.NCF_TOE[reg_sel]->val,31-bit_sel,1);
        reg_sel=(int)((int)(i)/(int)(16));
        bit_sel=i%16;
        reset[i]=get_bit_val(FCCU.NCFS_CFG[reg_sel]->val,31-2*bit_sel,2);
    }
    for(i=0;i<FAULT_COUNT;i++)
	{
		if((en[i]==1)&&(STATE.fault_status[i]==1))
		{
			if(to_e[i]==0)
			{
				ncf_fault_count=ncf_fault_count+1;
				ncf_fault=i;
				if(nmi[i]==1)
				{
					ncf_fault_nmi=1;
				}
				if(reset[i]==0x1)
				{
					ncf_fault_short_reset=1;
				}
				else if(reset[i]==0x2)
				{
					ncf_fault_long_reset=1;
				}
			}
			else
			{
	 			ncf_alarm_count=ncf_alarm_count+1;
	 			ncf_alarm=i;
				if(nmi[i]==1)
				{
					ncf_alarm_nmi=1;
				}
				if(irq[i]==1)
				{
					ncf_alarm_irq=1;
				}
				if(reset[i]==0x1)
				{
					ncf_alarm_short_reset=1;
				}
				else if(reset[i]==0x2)
				{
					ncf_alarm_long_reset=1;
				}
			}
		}
	}
    //------------------------------------//
     if(strcmp(STATE.fsm,"CONFIG")==0)
    {
        //Do nothing if fault in config state.
        //TODO:FOSU?
        //Check for timeout
        if(STATE.cfg_timeout==1)
        {
        	cfg_to();
        	move_fsm_due_to_fault();
        	return;
		}
    }
    //------------------------------------//
    if(strcmp(STATE.fsm,"NORMAL")==0)
    {
    	if(ncf_fault_count!=0)
    	{
    		strcpy(STATE.fsm,"FAULT");

    		if(ncf_fault_count==1)
			{
				STATE.nffs=ncf_fault+1;
				STATE.nf_src=0x2;
			}
			else
			{
				STATE.nffs=0xFF;
				STATE.nf_src=0x3;
			}


		}
		else if(ncf_alarm_count!=0)
		{
			strcpy(STATE.fsm,"ALARM");
			STATE.alarm_time_left=FCCU.NCF_TO.val;

			if(ncf_alarm_count==1)
			{
				STATE.nafs=ncf_alarm+1;
			}
			else
			{
				STATE.nafs=0xFF;
			}

		}
		if(strcmp(STATE.fsm,"NORMAL")!=0)//State changed
        {
            move_fsm_due_to_fault();
        }
        return;

    }
    //------------------------------------//
    if(strcmp(STATE.fsm,"ALARM")==0)
    {
    	if(ncf_fault_count!=0)
    	{
    		strcpy(STATE.fsm,"FAULT");

    		if(ncf_fault_count==1)
			{
				STATE.affs=ncf_fault+1;
				STATE.af_src=0x2;
			}
			else
			{
				STATE.affs=0xFF;
				STATE.af_src=0x3;
			}

		}
		else if(STATE.alarm_timeout==1)
		{
		    //STATE.alarm_timeout=0;//Clear alarm_timeout in fault state
			strcpy(STATE.fsm,"FAULT");


    		if(ncf_alarm_count==1)
			{
				STATE.affs=ncf_fault+1;
				STATE.af_src=0x2;
			}
			else
			{
				STATE.affs=0xFF;
				STATE.af_src=0x3;
			}

    		if(ncf_alarm_long_reset!=0)
    		{
    			MC_RGM.FES.val=change_bit_val(MC_RGM.FES.val,0x1,26,1);
    			functional_reset();
			}
			else if(ncf_alarm_short_reset!=0)
			{
    			MC_RGM.FES.val=change_bit_val(MC_RGM.FES.val,0x1,25,1);
    			functional_reset();
			}
			else if(ncf_alarm_nmi!=0)
			{
			    VARIABLE.nmi_source.val=0x2;
				VARIABLE.nmi_flag.val=VARIABLE.nmi_flag.val+1;
				FCCU.IRQ_STAT.val=change_bit_val(FCCU.IRQ_STAT.val,0x1,29,1);
			}

		}
		else if((ncf_fault_count==0)&&(ncf_alarm_count==0))
		{
			strcpy(STATE.fsm,"NORMAL");
		}

		if(strcmp(STATE.fsm,"ALARM")!=0)//State changed
        {
            VARIABLE.alarm_irq_flag.val=0;
			FCCU.IRQ_STAT.val=change_bit_val(FCCU.IRQ_STAT.val,0x0,30,1);//Assuming that on moving out of Alarm state IRQ is no longer asserted even if moving to fault state
            move_fsm_due_to_fault();
        }
        else if(ncf_alarm_irq!=0)
		{
			VARIABLE.alarm_irq_flag.val=1;
			FCCU.IRQ_STAT.val=change_bit_val(FCCU.IRQ_STAT.val,0x1,30,1);
		}
		else
        {
            VARIABLE.alarm_irq_flag.val=0;
			FCCU.IRQ_STAT.val=change_bit_val(FCCU.IRQ_STAT.val,0x0,30,1);
        }
        return;
    }
    //------------------------------------//
    if(strcmp(STATE.fsm,"FAULT")==0)
    {
        if((ncf_fault_count!=0)||((ncf_alarm_count!=0)&&(STATE.alarm_timeout==1)))//Do nothing till TOE disabled faults are existing or if alarm faults exist and timeout happened
    	{
    	    ncf_fault_long_reset=0;
    	    ncf_fault_short_reset=0;
    	    ncf_fault_nmi=0;

    	    for(i=0;i<FAULT_COUNT;i=i+1)//Fot case of new faults latched.Incase no new faults but transition to fault due to alarm state, reactions are already covered in alarm state
            {

                if(STATE.new_faults[i]==1)
                {
                    int reg_sel;
                    int bit_sel;
                    int en_f,nmi_f,irq_f,to_e_f,reset_f;
                    STATE.new_faults[i]=0;//As it has been taken into account, it is reset
                    reg_sel=(int)((int)(i)/(int)(32));
                    bit_sel=i%32;

                    en_f=get_bit_val(FCCU.NCF_E[reg_sel]->val,31-bit_sel,1);
                    nmi_f=get_bit_val(FCCU.NMI_EN[reg_sel]->val,31-bit_sel,1);
                    irq_f=get_bit_val(FCCU.IRQ_ALARM_EN[reg_sel]->val,31-bit_sel,1);
                    to_e_f=get_bit_val(FCCU.NCF_TOE[reg_sel]->val,31-bit_sel,1);
                    reg_sel=(int)((int)(i)/(int)(16));
                    bit_sel=i%16;
                    reset_f=get_bit_val(FCCU.NCFS_CFG[reg_sel]->val,31-2*bit_sel,2);

                    if((en_f==1)&&(STATE.fault_status[i]==1))
                    {
                        if(to_e_f==1)
                        {
                            if(nmi_f==1)
                            {
                                ncf_fault_nmi=1;
                            }
                            if(reset_f==0x1)
                            {
                                ncf_fault_short_reset=1;
                            }
                            else if(reset_f==0x2)
                            {
                                ncf_fault_long_reset=1;
                            }
                        }
                    }
                }
            }
            if(ncf_fault_long_reset!=0)
            {
                MC_RGM.FES.val=change_bit_val(MC_RGM.FES.val,0x1,26,1);
                functional_reset();
            }
            else if(ncf_fault_short_reset!=0)
            {
                MC_RGM.FES.val=change_bit_val(MC_RGM.FES.val,0x1,25,1);
                functional_reset();
            }
            else if((ncf_fault_nmi!=0)&&(get_bit_val(FCCU.IRQ_STAT.val,29,1)==0))//Increment nmi_flag only if NMI is not already asserted
            {
                VARIABLE.nmi_source.val=0x2;
                VARIABLE.nmi_flag.val=VARIABLE.nmi_flag.val+1;
                FCCU.IRQ_STAT.val=change_bit_val(FCCU.IRQ_STAT.val,0x1,29,1);
            }
    	}
    	else if(((ncf_alarm_count!=0)&&(STATE.alarm_timeout==0)))
        {
            strcpy(STATE.fsm,"ALARM");
        }
        else
        {
            strcpy(STATE.fsm,"NORMAL");
        }
        if(strcmp(STATE.fsm,"FAULT")!=0)//State changed
        {
            STATE.alarm_timeout=0;//Clear alarm timeout in case moving out of fault state
			FCCU.IRQ_STAT.val=change_bit_val(FCCU.IRQ_STAT.val,0x0,29,1);
            move_fsm_due_to_fault();
        }
        return;
    }
    //------------------------------------//

}

int is_fccu_reg(char *name)
{
    int i;
    for(i=0;i<FCCU_REGS_COUNT;i++)
    {
        if(strcmp(FCCU_REGS[i]->name,name)==0)
            return 1;
    }
    return 0;
}
void before_write_reg(char *name)
{
    if(is_fccu_reg(name))//Assumption that if any other module than fccu is accessed, then the key entered before retains
    {
        if(strcmp(STATE.prev_reg,"CTRLK")!=0)
        {
            STATE.ctrlk_entered=0;
        }
        if(strcmp(STATE.prev_reg,"NCFK")!=0)
        {
            STATE.ncfk_entered=0;
        }
    }
}
void after_write_reg(char *name)
{
    strcpy(STATE.prev_reg,name);
}
void set_ops(const char *string)//Idle is not supported by Model
{
    if(strcmp(string,"SUCCESS")==0)
    {
        FCCU.CTRL.val=change_bit_val(FCCU.CTRL.val,0x3,25,2);
    }
    else if(strcmp(string,"ABORT")==0)
    {
        FCCU.CTRL.val=change_bit_val(FCCU.CTRL.val,0x2,25,2);
    }
    else if(strcmp(string,"CLEAR")==0)
    {
        FCCU.CTRL.val=change_bit_val(FCCU.CTRL.val,0x0,25,2);
    }
    //else
    //{
    //      debug("OPS invalid setting");
    //}
}

void set_opr(int opcode)
{
    FCCU.CTRL.val=change_bit_val(FCCU.CTRL.val,0x0,31,5);//Currently OPR is cleared by the end of call to this function
    switch(opcode)
    {
    case 0:
        {
            break;
        }
    case 1:
        {
            //TODO:What if transition from CONFIG to CONFIG
            if((strcmp(STATE.fsm,"NORMAL")==0)&&(STATE.transient_lock==0)&&(STATE.permanent_lock==0)&&(STATE.ctrlk_entered==1))
            {
                set_ops("SUCCESS");
                strcpy(STATE.fsm,"CONFIG");
                STATE.config_time_left=FCCU.CFG_TO.val;
                move_fsm_due_to_fault();//Fault could have occurred in config state.
            }
            else
            {
                set_ops("ABORT");
            }
            break;
        }
    case 2:
        //TODO:What if transition from NORMAL to NORMAL
        {
            if ((strcmp(STATE.fsm,"CONFIG")==0)&&(STATE.ctrlk_entered==2))
            {
                set_ops("SUCCESS");
                strcpy(STATE.fsm,"NORMAL");
            }
            else
            {
                set_ops("ABORT");
            }
            break;
        }
    case 3:
        {
           //TODO:Ignore Errorpin state while comparing STAT register
            if(strcmp(STATE.fsm,"CONFIG")==0)
            {
                FCCU.STAT.val=change_bit_val(FCCU.STAT.val,0x1,31,4);
            }
            else if(strcmp(STATE.fsm,"NORMAL")==0)
            {
                FCCU.STAT.val=change_bit_val(FCCU.STAT.val,0x0,31,4);
            }
            else if(strcmp(STATE.fsm,"ALARM")==0)
            {
                FCCU.STAT.val=change_bit_val(FCCU.STAT.val,0x2,31,4);
            }
            else if(strcmp(STATE.fsm,"FAULT")==0)
            {
                FCCU.STAT.val=change_bit_val(FCCU.STAT.val,0xB,31,4);
            }
            set_ops("SUCCESS");
            break;
        }
    case 4:
        {
            FCCU.N2AF_STATUS.val=change_bit_val(FCCU.N2AF_STATUS.val,STATE.nafs,31,8);
            set_ops("SUCCESS");
            break;
        }
    case 5:
        {
            FCCU.A2FF_STATUS.val=change_bit_val(FCCU.A2FF_STATUS.val,STATE.affs,31,8);
            FCCU.A2FF_STATUS.val=change_bit_val(FCCU.A2FF_STATUS.val,STATE.af_src,23,2);
            set_ops("SUCCESS");
            break;
        }
    case 6:
        {
            FCCU.N2FF_STATUS.val=change_bit_val(FCCU.N2FF_STATUS.val,STATE.nffs,31,8);
            FCCU.N2FF_STATUS.val=change_bit_val(FCCU.N2FF_STATUS.val,STATE.nf_src,23,2);
            set_ops("SUCCESS");
            break;
        }
    case 7:
        {
            FCCU.F2A_STATUS.val=change_bit_val(FCCU.F2A_STATUS.val,STATE.fafs,31,9);
            set_ops("SUCCESS");
            break;
        }
    case 8:
        {
            //TODO:Not implementing SCFS
            set_ops("SUCCESS");
            break;
        }
    //case 9: //TODO:Not implementing as reserved
    //case 11:
    //case 16:
    //case 18:
    //case 20:
        //{
            //TODO:Not implementing SCFS
        //    set_ops("ABORT");
        //    break;
        //}
    case 10:
        {
            int i,j;
            for(i=0;i<FCCU_NCF_COUNT;i++)
            {
                for(j=0;j<32;j++)
                {
                    FCCU.NCF_S[i]->val=change_bit_val(FCCU.NCF_S[i]->val,STATE.fault_status[i*32 +j],31-j,1);
                }
            }
            set_ops("SUCCESS");
            break;
        }
    //case 12://TODO:Not implementing as forbidden by RM
        //{

        //}
    case 13:
        {
            STATE.nafs=0;
            STATE.affs=0;
            STATE.af_src=0;
            STATE.nffs=0;
            STATE.nf_src=0;
            STATE.fafs=0;
            FCCU.N2AF_STATUS.val=change_bit_val(FCCU.N2AF_STATUS.val,STATE.nafs,31,8);
            FCCU.A2FF_STATUS.val=change_bit_val(FCCU.A2FF_STATUS.val,STATE.affs,31,8);
            FCCU.A2FF_STATUS.val=change_bit_val(FCCU.A2FF_STATUS.val,STATE.af_src,23,2);
            FCCU.N2FF_STATUS.val=change_bit_val(FCCU.N2FF_STATUS.val,STATE.nffs,31,8);
            FCCU.N2FF_STATUS.val=change_bit_val(FCCU.N2FF_STATUS.val,STATE.nf_src,23,2);
            FCCU.F2A_STATUS.val=change_bit_val(FCCU.F2A_STATUS.val,STATE.fafs,31,9);
            set_ops("SUCCESS");
            break;
        }
    //case 14://TODO:Not implementing as forbidden by RM
        //{

        //}
    case 15:
        {
            set_ops("CLEAR");
            break;
        }
    //case 17://TODO:Not implementing as currently not implementing XTMR
        //{

        //}
    //case 19://TODO:Not implementing as currently not implementing XTMR
        //{

        //}

    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
        {
            set_ops("ABORT");
            break;
        }
    //case 31://TODO:Not implementing as NVM currently not part of model
       // {

       // }
    default:
        break;
    }
}

void fault_created_at_source(int *fault_array,int no_of_faults)//Multiple faults can be cleared together
{
    int i;
    for(i=0;i<no_of_faults;i++)
    {
        if(STATE.fault_existing[fault_array[i]]==1)//To stop reserved faults from being set up.
        {
            STATE.fault[fault_array[i]]=1;
            STATE.fault_status[fault_array[i]]=1;
        }
    }
}

void fault_cleared_at_source(int *fault_array,int no_of_faults)//Multiple faults can be cleared together
{
    int reg_sel,bit_sel;
    int i;
    for(i=0;i<no_of_faults;i++)
    {
        reg_sel=(int)((int)(fault_array[i])/(int)(32));
        bit_sel=fault_array[i]%32;
        STATE.fault[fault_array[i]]=0;
        if(!(FCCU.NCF_S[reg_sel]->val & (uint32_t)(1<<bit_sel)))//Hardware Mode
        {
            STATE.fault_status[fault_array[i]]=0;
        }
    }
}
//-----------------------------------MODEL_C-------------------------------------------------------//
void init_state(void)
{
    int i;
    int reg_sel;
    int bit_sel;
    strcpy(STATE.fsm,"NORMAL");
    STATE.time=0;
    STATE.time_alarm_upper=FCCU.NCF_TO.def;
    STATE.time_alarm_lower=FCCU.NCF_TO.def;
    STATE.time_cfg_upper=0x1FFFF;
    STATE.time_cfg_lower=0x1FFFF;
    STATE.permanent_lock=0;
    STATE.transient_lock=1;//Note:Transient is 1 initially.

    STATE.ncfk_entered=0;
    STATE.ctrlk_entered=0;

    STATE.config_time_left=0;
    STATE.alarm_time_left=0;
    strcpy(STATE.prev_reg,"");
    STATE.alarm_timeout=0;
    STATE.cfg_timeout=0;

    for(i=0;i<FAULT_COUNT;i++)
    {
        reg_sel=(int)((int)(i)/(int)(32));
        bit_sel=i%32;
        STATE.fault[i]=get_bit_val(FCCU.NCF_S[reg_sel]->def,31-bit_sel,1);//Incase some faults are latched at reset due to bugs in SoC.Though they will not be reflected in NCF_S until opcode 10 is ran.Replace here if needed.
        STATE.fault_status[i]=get_bit_val(FCCU.NCF_S[reg_sel]->def,31-bit_sel,1);
        STATE.new_faults[i]=get_bit_val(FCCU.NCF_S[reg_sel]->def,31-bit_sel,1);
    }
    for(i=0;i<FAULT_COUNT;i++)
    {
        if((i==12)||(i==16)||(i==18)||(i==31)||(i==46)||(i==54)||(i==59)||(i==61)||(i>=96))
        {
            STATE.fault_existing[i]=0;
        }
        else
        {
            STATE.fault_existing[i]=1;
        }
    }
    STATE.nafs=get_bit_val(FCCU.N2AF_STATUS.def,31,8);
    STATE.affs=get_bit_val(FCCU.A2FF_STATUS.def,31,8);
    STATE.af_src=get_bit_val(FCCU.A2FF_STATUS.def,23,2);
    STATE.nffs=get_bit_val(FCCU.N2FF_STATUS.def,31,8);
    STATE.nf_src=get_bit_val(FCCU.N2FF_STATUS.def,23,2);
    STATE.fafs=get_bit_val(FCCU.F2A_STATUS.def,31,9);
}





int model_write_reg(char *name,uint32_t data)
{
    int i,j;
    before_write_reg(name);
    //------------------------------------//
    if(strcmp(name,"DES")==0)
    {
        write_reg_with_mask(&MC_RGM.DES,data);
    }
    //------------------------------------//
    if(strcmp(name,"FES")==0)
    {
        write_reg_with_mask(&MC_RGM.FES,data);
    }
    //------------------------------------//
    if(strcmp(name,"wait_stm")==0)
    {
        if(strcmp(STATE.fsm,"CONFIG")==0)
        {
        	STATE.time=STATE.time+FCCU.CFG_TO.val;
        	STATE.cfg_timeout=1;
        	STATE.config_time_left=0;
        	move_fsm_due_to_fault();

		}
		if(strcmp(STATE.fsm,"ALARM")==0)
        {
        	STATE.time=STATE.time+FCCU.NCF_TO.val;
        	STATE.alarm_time_left=0;
        	STATE.alarm_timeout=1;
        	move_fsm_due_to_fault();
		}
    }
    //-----------------------------------//
    if(strcmp(name,"por")==0)
    {
        MC_RGM.DES.val=change_bit_val(MC_RGM.DES.val,0x1,31,1);
        destructive_reset();
        move_fsm_due_to_fault();
    }
    //------------------------------------//
    if(strcmp(name,"exr")==0)
    {
        MC_RGM.FES.val=change_bit_val(MC_RGM.FES.val,0x1,31,1);
        functional_reset();
        move_fsm_due_to_fault();
    }
    //------------------------------------//
    if(strcmp(name,MEMU.DEBUG.name)==0)
    {
    	int fault_set_array[9]={0};
    	int fault_cleared_array[9]={0};
    	int fault_set_count=0;
    	int fault_clear_count=0;
    	uint32_t prev_debug=MEMU.DEBUG.val;
    	write_reg_with_mask(&MEMU.DEBUG,data);
    	if((get_bit_val(MEMU.DEBUG.val,27,1)==0)&&(get_bit_val(prev_debug,27,1)==1))
    	{
    		fault_cleared_array[fault_clear_count]=22;
    		fault_clear_count++;
		}
		else if((get_bit_val(MEMU.DEBUG.val,27,1)==1)&&(get_bit_val(prev_debug,27,1)==0))
		{
			fault_set_array[fault_set_count]=22;
			STATE.new_faults[22]=1;
			fault_set_count++;
		}

		if((get_bit_val(MEMU.DEBUG.val,28,1)==0)&&(get_bit_val(prev_debug,28,1)==1))
    	{
    		fault_cleared_array[fault_clear_count]=23;
    		fault_clear_count++;
		}
		else if((get_bit_val(MEMU.DEBUG.val,28,1)==1)&&(get_bit_val(prev_debug,28,1)==0))
		{
			fault_set_array[fault_set_count]=23;
			STATE.new_faults[23]=1;
			fault_set_count++;
		}

		if((get_bit_val(MEMU.DEBUG.val,29,1)==0)&&(get_bit_val(prev_debug,29,1)==1))
    	{
    		fault_cleared_array[fault_clear_count]=24;
    		fault_clear_count++;
		}
		else if((get_bit_val(MEMU.DEBUG.val,29,1)==1)&&(get_bit_val(prev_debug,29,1)==0))
		{
			fault_set_array[fault_set_count]=24;
			STATE.new_faults[24]=1;
			fault_set_count++;
		}

		if((get_bit_val(MEMU.DEBUG.val,11,1)==0)&&(get_bit_val(prev_debug,11,1)==1))
    	{
    		fault_cleared_array[fault_clear_count]=25;
    		fault_clear_count++;
		}
		else if((get_bit_val(MEMU.DEBUG.val,11,1)==1)&&(get_bit_val(prev_debug,11,1)==0))
		{
			fault_set_array[fault_set_count]=25;
			STATE.new_faults[25]=1;
			fault_set_count++;
		}

		if((get_bit_val(MEMU.DEBUG.val,12,1)==0)&&(get_bit_val(prev_debug,12,1)==1))
    	{
    		fault_cleared_array[fault_clear_count]=26;
    		fault_clear_count++;

		}
		else if((get_bit_val(MEMU.DEBUG.val,12,1)==1)&&(get_bit_val(prev_debug,12,1)==0))
		{
			fault_set_array[fault_set_count]=26;
			STATE.new_faults[26]=1;
			fault_set_count++;
		}

		if((get_bit_val(MEMU.DEBUG.val,13,1)==0)&&(get_bit_val(prev_debug,13,1)==1))
    	{
    		fault_cleared_array[fault_clear_count]=27;
    		fault_clear_count++;

		}
		else if((get_bit_val(MEMU.DEBUG.val,13,1)==1)&&(get_bit_val(prev_debug,13,1)==0))
		{
			fault_set_array[fault_set_count]=27;
			STATE.new_faults[27]=1;
			fault_set_count++;
		}

		if((get_bit_val(MEMU.DEBUG.val,19,1)==0)&&(get_bit_val(prev_debug,19,1)==1))
    	{
    		fault_cleared_array[fault_clear_count]=28;
    		fault_clear_count++;

		}
		else if((get_bit_val(MEMU.DEBUG.val,19,1)==1)&&(get_bit_val(prev_debug,19,1)==0))
		{
			fault_set_array[fault_set_count]=28;
			STATE.new_faults[28]=1;
			fault_set_count++;
		}

		if((get_bit_val(MEMU.DEBUG.val,20,1)==0)&&(get_bit_val(prev_debug,20,1)==1))
    	{
    		fault_cleared_array[fault_clear_count]=29;
    		fault_clear_count++;
		}
		else if((get_bit_val(MEMU.DEBUG.val,20,1)==1)&&(get_bit_val(prev_debug,20,1)==0))
		{
			fault_set_array[fault_set_count]=29;
			STATE.new_faults[29]=1;
			fault_set_count++;
		}

		if((get_bit_val(MEMU.DEBUG.val,21,1)==0)&&(get_bit_val(prev_debug,21,1)==1))
    	{
    		fault_cleared_array[fault_clear_count]=30;
    		fault_clear_count++;
		}
		else if((get_bit_val(MEMU.DEBUG.val,21,1)==1)&&(get_bit_val(prev_debug,21,1)==0))
		{
			fault_set_array[fault_set_count]=30;
			STATE.new_faults[30]=1;
			fault_set_count++;
		}

        fault_created_at_source(fault_set_array,fault_set_count);
        fault_cleared_at_source(fault_cleared_array,fault_clear_count);
        move_fsm_due_to_fault();
    }
    //------------------------------------//
    if(strcmp(name,"CTRL")==0)
    {
        write_reg_with_mask(&FCCU.CTRL,data);
        set_opr(data & (uint32_t)(0x1F));
    }
    //------------------------------------//
    if(strcmp(name,"CTRLK")==0)
    {
        switch(data)
        {
            case 0x913756AF:
                {
                    STATE.ctrlk_entered=1;
                    break;
                }
            case 0x825A132B:
                {
                    STATE.ctrlk_entered=2;
                    break;
                }
            //case //TODO:Not implementing 3rd key as no NVM
        }
    }
    //------------------------------------//
    //TODO:Not implemented CFG
    //------------------------------------//
    for(i=0;i<3;i++)
    {
        if(strcmp(name,FCCU.NCF_CFG[i]->name)==0)
        {
            if(strcmp(STATE.fsm,"CONFIG")!=0)
            {
                VARIABLE.nmi_source.val=0x1;
                VARIABLE.nmi_flag.val=VARIABLE.nmi_flag.val+1;
            }
            else
            {
                write_reg_with_mask(FCCU.NCF_CFG[i],data);
            }
        }
    }
    //------------------------------------//
    for(i=0;i<6;i++)
    {
        if(strcmp(name,FCCU.NCFS_CFG[i]->name)==0)
        {
            if(strcmp(STATE.fsm,"CONFIG")!=0)
            {
                VARIABLE.nmi_source.val=0x1;
                VARIABLE.nmi_flag.val=VARIABLE.nmi_flag.val+1;
            }
            else
            {
                write_reg_with_mask(FCCU.NCFS_CFG[i],data);
            }
        }
    }
    //------------------------------------//
    for(i=0;i<3;i++)
    {
        int fault_not_cleared;
        int key_not_entered;
        fault_not_cleared=0;
        key_not_entered=0;
        if(strcmp(name,FCCU.NCF_S[i]->name)==0)
        {
            if((STATE.ncfk_entered!=1)&&(data!=0x0))//TODO:Is there a need for data not be no equal to zero for OPS=ABORTED
            {
                key_not_entered=1;
            }
            for(j=0;j<32;j++)
            {
                if(get_bit_val(data,31-j,1))
                {
                    if(STATE.fault_status[i*32 +j]==1)
                    {
                        if(STATE.fault[i*32 +j]==1)
                        {
                            fault_not_cleared=1;//TODO:Is this not an issue if trying to clear a Hardware fault
                        }
                        else
                        {
                            if(key_not_entered!=1)
                            {
                                FCCU.NCF_S[i]->val=change_bit_val(FCCU.NCF_S[i]->val,0,31-j,0);
                            }
                        }
                    }//TODO:Should there be a condition .If fault is not latched but I try to clear it,is that an issue
                }
            }
            if((key_not_entered==1)||(fault_not_cleared==1))
            {
                set_ops("ABORT");
            }
            else
            {
                set_ops("SUCCESS");
            }

            STATE.fault_status[i*32 +j]=get_bit_val(FCCU.NCF_S[i]->val,31-j,1);
            move_fsm_due_to_fault();//In the end cause multiple faults can be cleared together.
        }
    }
    //------------------------------------//
    if(strcmp(name,FCCU.NCFK.name)==0)
    {
        if(data==0xAB3498FE)
        {
            STATE.ncfk_entered=1;
        }
    }
    //------------------------------------//
    for(i=0;i<3;i++)
    {
        if(strcmp(name,FCCU.NCF_E[i]->name)==0)
        {
            if(strcmp(STATE.fsm,"CONFIG")!=0)
            {
                VARIABLE.nmi_source.val=0x1;
                VARIABLE.nmi_flag.val=VARIABLE.nmi_flag.val+1;
            }
            else
            {
                write_reg_with_mask(FCCU.NCF_E[i],data);
            }
        }
    }
    //------------------------------------//
    for(i=0;i<3;i++)
    {
        if(strcmp(name,FCCU.NCF_TOE[i]->name)==0)
        {
            if(strcmp(STATE.fsm,"CONFIG")!=0)
            {
                VARIABLE.nmi_source.val=0x1;
                VARIABLE.nmi_flag.val=VARIABLE.nmi_flag.val+1;
            }
            else
            {
                write_reg_with_mask(FCCU.NCF_TOE[i],data);
            }
        }
    }
    //------------------------------------//
    if(strcmp(name,FCCU.NCF_TO.name)==0)
    {
        if(strcmp(STATE.fsm,"CONFIG")!=0)
        {
            VARIABLE.nmi_source.val=0x1;
            VARIABLE.nmi_flag.val=VARIABLE.nmi_flag.val+1;
        }
        else
        {
            write_reg_with_mask(&FCCU.NCF_TO,data);
        }
    }
    //------------------------------------//
    if(strcmp(name,FCCU.CFG_TO.name)==0)
    {
        if(strcmp(STATE.fsm,"CONFIG")==0)
        {
            //TODO:No Nmi occurs if try to write this is config state?
        }
        else
        {
            write_reg_with_mask(&FCCU.CFG_TO,data);//TODO:Should I add an offset to this data to avoid accidental timeout
        }
    }
    //------------------------------------//
    //TODO:EINOUT not implemented as it is not implemented in current model
    //TODO:Stat not implemented as it has no effect of write in current model
    //TODO:N2AF,A2FF,N2FF,F2A, not implemented as no effect of write
    //TODO:SCFS not implemented as not part of the model
    //------------------------------------//
    if(strcmp(name,FCCU.NCFF.name)==0)
    {
        int fault_array[1];
        fault_array[0]=(data & (uint32_t)(0x7F));
        fault_created_at_source(fault_array,1);
        STATE.new_faults[fault_array[0]]=1;
        move_fsm_due_to_fault();
        fault_cleared_at_source(fault_array,1);
        move_fsm_due_to_fault();
    }
    //------------------------------------//
    if(strcmp(name,FCCU.IRQ_STAT.name)==0)
    {
        if(get_bit_val(FCCU.IRQ_STAT.val,31,1))
        {
            if(get_bit_val(data,31,1))
            {
                VARIABLE.config_irq_flag.val=0;
            }
        }
        write_reg_with_mask(&FCCU.IRQ_STAT,data);
        //TODO:In placing interrupts priority place NMI at highest (already) then interrupt (IRQ) and then CFG(it is last as it could be that with cfg timeout alarm timeout occurs)
        //TODO:Take care of case where both cfg anf alarm timeout and when in alarm timeout cfg timeout cleared.
    }
    //------------------------------------//
    if(strcmp(name,FCCU.IRQ_EN.name)==0)
    {
        if(get_bit_val(FCCU.IRQ_STAT.val,31,1))
        {
            if(get_bit_val(data,31,1))
            {
                if(get_bit_val(FCCU.IRQ_EN.val,31,1)==0)
                {
                    VARIABLE.config_irq_flag.val=1;
                }
            }
            else if(get_bit_val(data,31,0))
            {
                if(get_bit_val(FCCU.IRQ_EN.val,31,1)==1)
                {
                    VARIABLE.config_irq_flag.val=0;
                }
            }
        }

        write_reg_with_mask(&FCCU.IRQ_EN,data);
    }
    //------------------------------------//
    //TODO:XTMR not implemented as not in model
    //TODO:MCS not implemented as not in model
    //TODO:DELAT_T not implemented as not in model
    //TODO:EOUT_SIG_EN not implemented as not in model
    //------------------------------------//
    if(strcmp(name,"PERMNT_LOCK")==0)
    {
        //write_reg_with_mask(FCCU.PERMNT_LOCK,data);//This is not needed.But for checking read/write?
        if(data==0xFF)
        {
            STATE.permanent_lock=1;
        }
    }
    //------------------------------------//
    if(strcmp(name,"TRANS_LOCK")==0)
    {
        //write_reg_with_mask(FCCU.TRANS_LOCK,data);//This is not needed.But for checking read/write?
        if(data==0xBC)
        {
            STATE.transient_lock=0;
        }
        else
        {
            STATE.transient_lock=1;
        }
    }
    //------------------------------------//
    for(i=0;i<3;i++)
    {
        if(strcmp(name,FCCU.NMI_EN[i]->name)==0)
        {
            if(strcmp(STATE.fsm,"CONFIG")!=0)
            {
                VARIABLE.nmi_source.val=0x1;
                VARIABLE.nmi_flag.val=VARIABLE.nmi_flag.val+1;
            }
            else
            {
                write_reg_with_mask(FCCU.NMI_EN[i],data);
            }
        }
    }
    //------------------------------------//
    for(i=0;i<3;i++)
    {
        if(strcmp(name,FCCU.IRQ_ALARM_EN[i]->name)==0)
        {
            if(strcmp(STATE.fsm,"CONFIG")!=0)
            {
                VARIABLE.nmi_source.val=0x1;
                VARIABLE.nmi_flag.val=VARIABLE.nmi_flag.val+1;
            }
            else
            {
                write_reg_with_mask(FCCU.IRQ_ALARM_EN[i],data);
            }
        }
    }
     //------------------------------------//
    after_write_reg(name);
    return 0;
}
//-----------------------------------MAIN_C-------------------------------------------------------//
FILE *fp;//Pointer to file were logging
FILE *fp_change;
FILE *fp_writes;
FILE *fp_test;
char file_path[100]="testing.log";
char file_path_change[100]="changes.log";
char file_path_writes[100]="writes.log";
char file_path_test[100]="simple_writes_from_test.log";


char regs_name[][100]=
{
    {"CTRL"},//FCCU//0
    {"CTRLK"},//1
    {"NCF_CFG0"},//2
    {"NCF_CFG1"},//3
    {"NCF_CFG2"},//4
    {"NCFS_CFG0"},//5
    {"NCFS_CFG1"},//6
    {"NCFS_CFG2"},//7
    {"NCFS_CFG3"},//8
    {"NCFS_CFG4"},//9
    {"NCFS_CFG5"},//10
    {"NCF_S0"},//11
    {"NCF_S1"},//12
    {"NCF_S2"},//13
    {"NCFK"},//14
    {"NCF_E0"},//15
    {"NCF_E1"},//16
    {"NCF_E2"},//17
    {"NCF_TOE0"},//18
    {"NCF_TOE1"},//19
    {"NCF_TOE2"},//20
    {"NCF_TO"},//21
    {"CFG_TO"},//22
    {"STAT"},//23
    {"N2AF_STATUS"},//24
    {"A2FF_STATUS"},//25
    {"N2FF_STATUS"},//26
    {"F2A_STATUS"},//27
    {"NCFF"},//28
    {"IRQ_STAT"},//29
    {"IRQ_EN"},//30
    {"TRANS_LOCK"},//31
    {"PERMNT_LOCK"},//32
    {"IRQ_ALARM_EN0"},//33
    {"IRQ_ALARM_EN1"},//34
    {"IRQ_ALARM_EN2"},//35
    {"NMI_EN0"},//36
    {"NMI_EN1"},//37
    {"NMI_EN2"},//38
    {"DES"},//MC_RGM//39
    {"FES"},//40
    {"DEBUG"},//MEMU//41
    {"wait_stm"},//VARIBALES//42
    {"por"},//43
    {"exr"}//44
};//To enter only those registers that needs to be modeled
int regs_count=sizeof(regs_name)/sizeof(regs_name[0]);

#if 0
void get_data_from_compiler(int *reg,uint32_t *data,int *stop)
{
    //To fill;Get from KLEE
    //stop!=0 means that no further values will be taken for writing on registers.Hard-code stop as 1 if only want to write to one register.
    //reg is any random value. Based on it a reg is selected on which a value will be written
    printf("Enter the reg number(Int):");
    scanf("%d", reg);
    //printf("DEBUG:Value of reg is %d\n",*reg);
    printf("Enter the data(Hex):");
    scanf("%x", data);
    //printf("DEBUG:Value of data is 0x%x\n",*data);
    printf("Enter zero to continue (Int):");
    scanf("%d", stop);
    //printf("DEBUG:Value of stop is %d\n",*stop);
#else
void get_data_from_compiler(uint32_t *addr,uint32_t *data,int *stop)
{
	fscanf(fp_test,"%x %x",addr,data);

	if(feof(fp_test))
	{
		*stop=1;
	}
	else
	{
		*stop=0;
	}
#endif
}

int main(int argc, char *argv[])
{
    int reg;
    uint32_t data;
	uint32_t addr;
    int stop;
    int loop_count;
    int found_reg;
    char reg_name[100];
    fp = fopen(file_path, "w");
    fp_change = fopen(file_path_change, "w");
    fp_writes= fopen(file_path_writes,"w");
	fp_test=fopen(file_path_test,"r");

	printf("DEBUG: STARTING TEST\n");
    init_reg();//Initialize regs and variables to default value
    init_state();//Initialize internal state

    stop=0;
    log_all_regs_val(fp);//To check default values.
    while(1)//Change this if using Random as strategy as otherwise can lead to quite long process.
    {
        found_reg=0;
#if 0
        get_data_from_compiler(&reg,&data,&stop);
		if(stop!=0)
		{
			break;
		}
		
		strcpy(reg_name,regs_name[reg%regs_count]);//Based on reg value, one of the regs which can be written is chosen.In this way, reg can take any value.
        for(loop_count=0;loop_count<ALL_REGS_COUNT;loop_count++)
        {
            if(strcmp(ALL_REGS[loop_count]->name,reg_name)==0)
            {
                printf("DEBUG: WRITE->REG:%s ADDR:%x DATA:%x\n",ALL_REGS[loop_count]->name,ALL_REGS[loop_count]->addr,data);
                log_write(fp,ALL_REGS[loop_count]->name,ALL_REGS[loop_count]->addr,data);//Log register which is written with the value.
                log_write(fp_change,ALL_REGS[loop_count]->name,ALL_REGS[loop_count]->addr,data);
                log_write(fp_writes,ALL_REGS[loop_count]->name,ALL_REGS[loop_count]->addr,data);
                found_reg=1;
            }
        }
#else
		get_data_from_compiler(&addr,&data,&stop);
		if(stop!=0)
		{
			break;
		}
        for(loop_count=0;loop_count<ALL_REGS_COUNT;loop_count++)
        {
            if(ALL_REGS[loop_count]->addr==addr)
            {
				strcpy(reg_name,ALL_REGS[loop_count]->name);
                printf("DEBUG: WRITE->REG:%s ADDR:%x DATA:%x\n",ALL_REGS[loop_count]->name,ALL_REGS[loop_count]->addr,data);
                log_write(fp,ALL_REGS[loop_count]->name,ALL_REGS[loop_count]->addr,data);//Log register which is written with the value.
                log_write(fp_change,ALL_REGS[loop_count]->name,ALL_REGS[loop_count]->addr,data);
                log_write(fp_writes,ALL_REGS[loop_count]->name,ALL_REGS[loop_count]->addr,data);
                found_reg=1;
            }
        }
#endif

        if(found_reg==0)
        {
            printf("DEBUG:%s not found.Skipping writing on it.\n",reg_name);
        }
        else
        {
            model_write_reg(reg_name,data);//Write to reg and move fsm
            log_all_regs_val(fp);//To log effect of writing to reg
            log_all_regs_change(fp_change);
        }

    }
    fclose(fp);//Closing file pointer.
	fclose(fp_change);
	fclose(fp_writes);
	fclose(fp_test);
    return 0;
}

//Process should be  (Core 1 Should be doing this.Core 0 handles all IRQ and  NMI) before beginning each new test case (Even any type of reset should trigger this process. In case of reset due to test case, shouldn't wait for debugger_done=1.Gate using checking DES/FES value)
//0)Reset the silicon to bring to initial state.Change the default value of DES/FES correspondingly to the source of RESET.
//  0.1)Reset all variables like nmi flag to zero.
//  0.2)Make sure core 1 is not handling irqs or nmi
//  0.3)Sys_clk>>than IRC clock.so that reg read write operations happen fast.Don't change sys clk to IRC
//1)Execution - The data for test case will be written by degguger in some array in sram. After debugger is done, it writes degger_done=1.
//  Main code then reads address,opcode,data from array and correspondingly executes function. This process of writing and reading by main doe needs to be done very quickly.
//  To Enable this, do all decoding of the array before hand (Before starting executing the test case)
//  1.1)Write reg.(Avoid writing to varibales like nmi flag)
//  1.2)Put lower limit on writing to NCFG_TO (To avoid transition to fault while reading regs)and to CFG_TO(I think not needed for CFG_TO as it is itself putting a lower limit)
//2)Check
//  2.1)Read all varibles
//  2.2)read all Reg (Proper way.I.e.through OPR)
//  2.3)Decide which to read first variable or reg.(Minor point if lower limit on NCFG_TO ).
//      2.3.1)I think it should be read registers first then variables. Core0 will update variables.
//3)On reset, all variables are reset to their original value

//Core 0 does the following:
//1) It handles alarm irq and config irq and nmi.
//  1.1)In each irq, it simply makes alarm ir and config irq flags=1.
//  1.1.1) Make common irq function for both.In the irq, depending on the value that FCCU flag shows, change the flag
//         i.e. if FCC shows that config interupt, then config interrupt.If both interrupt asserted,then both flags
//  1.2)In nmi it just increments the nmi flag
//  1.3)In main, it just makes all irq flag=0.It doesn't reset nmi flag in main

//To find:
//0)Imp:Check that Registers doesn't change values until OPR is written.It shouldn't  change on it's own
//1)Assumption:Disabling either IRQ or IRQ stat will bring the core back from IRQ
//2)Fake Fault:Are they single clock cycle? Current Assumption:Yes
//3)NMI and reset together then NMI after mode change.--Assumption No NMI if nmi and reset comes together.But NMI STAT set
//4)Are MEMU debug registers effected by reset?Assumption:No.
//5)FCCU in Fault state due to a fault for which NMI is asserted. After NMI comes, another fault comes with RESET on. Will reset happen?
//Assumption:All reactions occur only when state transition happens.Not while inside same state.
//6)Fault comes.Goes to alarm. Timeout.While in Fault State, another alarm comes.After the fault is cleared, moves back to alarm state.Will Timer start again.Assumption:Yes
//7)To clear status of faults,after writing to key reg, do i need to immediately write to clear status reg or can there be any gap.:Assumption:There can be no gap (with regard to only FCCU registers)
//8)In case clearing status reg, without writing NCFK key, then is failed status written in OPS:Assumption :Yes
//9)In case clearing status reg, clearing a fault which is still latched, a failed status written:Assumption:Yes

//Issues:
//1)Example:I haven't written the consequence of writing to XTMR because there will not be any consequence of writing to that reg.
//  But how will executer know to make a test to check the effect of writing to this reg
//2)XTMR reg? Reading its value?Comparision?

//Points:
//Reduce test case count as much as possible (Also the length of test cases).Can claim that mover coverage in less test cases
//Meaning less debugging to be done by user and user can quickly glide through the test cases

//To Add:
//1)Way to be able to assert functional/destructive reset without FCCU as source
//2)While writing to silicon make sure that certain restriction stated in RM are maintained e.g. OPCODE 12 is stated not to be used.
//3)FOSU not implemented. It is in effect only when alarm timeout>FOSU timeout and irq is not asserted within this time.
