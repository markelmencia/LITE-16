#include "processor.h"
#include <stdint.h>

void i_add(int s1, int s2, int rd, Processor *p);
void i_or(int s1, int s2, int rd, Processor *p);
void i_xor(int s1, int s2, int rd, Processor *p);
void i_and(int s1, int s2, int rd, Processor *p);
void i_sl(int s1, int amm, int rd, Processor *p);
void i_srl(int s1, int amm, int rd, Processor *p);
void i_sra(int s1, int amm, int rd, Processor *p);
void i_syscall(int s1, int s2, int rd, Processor *p);
void i_je(int a, int b, int roff, Processor *p);
void i_jl(int a, int b, int roff, Processor *p);
void i_jg(int a, int b, int roff, Processor *p);
void i_fn(int rd, int roff, Processor *p);
void i_ld(uint16_t addr, int rd, Processor *p);
void i_st(uint16_t addr, int s, Processor *p);
void i_mv(int lo, int hi, int rd, Processor *p);
void i_mvu(int lo, int hi, int rd, Processor *p);