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

void i_srl(int s1, int amm, int rd, Processor *p) {
    p->reg[rd] = p->reg[s1] >> amm;
    p->pc++;
}

void i_sra(int s1, int amm, int rd, Processor *p) {
    int msb = p->reg[s1] & 0x8000;
    p->reg[rd] = p->reg[s1] >> amm | msb;
    p->pc++;
}

void i_syscall(int s1, int s2, int rd, Processor *p) {}

void i_je(int a, int b, int roff, Processor *p) {
    if (p->reg[a] == p->reg[b]) {
        p->pc = p->pc + p->reg[roff];
    } else {
        p->pc++;
    }
}

void i_jl(int a, int b, int roff, Processor *p) {
    if (p->reg[a] < p->reg[b]) {
        p->pc = p->pc + p->reg[roff];
    } else {
        p->pc++;
    }
}

void i_jg(int a, int b, int roff, Processor *p) {
    if (p->reg[a] > p->reg[b]) {
        p->pc = p->pc + p->reg[roff];
    } else {
        p->pc++;
    }
}

void i_fn(int rd, int roff, Processor *p) {
    p->reg[rd] = p->pc + 1;
    p->pc = p->pc + p->reg[roff];
}

void i_mv(int lo, int hi, int rd, Processor *p) {
    int v = hi << 4 | lo;
    p->reg[rd] = p->reg[rd] + v;
    p->pc++;
}