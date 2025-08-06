#include "headers/processor.h"

void i_add(int s1, int s2, int rd, Processor *p) {
    p->reg[rd] = p->reg[s1] + p->reg[s2];
    p->pc++;
}

void i_or(int s1, int s2, int rd, Processor *p) {
    p->reg[rd] = p->reg[s1] | p->reg[s2];
    p->pc++;
}

void i_xor(int s1, int s2, int rd, Processor *p) {
    p->reg[rd] = p->reg[s1] ^ p->reg[s2];
    p->pc++;
}

void i_and(int s1, int s2, int rd, Processor *p) {
    p->reg[rd] = p->reg[s1] & p->reg[s2];
    p->pc++;
}

void i_sl(int s1, int amm, int rd, Processor *p) {
    p->reg[rd] = p->reg[s1] << amm;
    p->pc++;
}