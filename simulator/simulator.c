#include "headers/simulator.h"
#include "headers/instructions.h"

// Starts executing instructions sequentially,
// until an empty instruction is found.
int run(Processor *p) {
    uint16_t instruction;

    while (instruction != 0) {
        instruction = p->program_mem[p->pc];

        int codeop = instruction & CODEOP_MASK;
        int i4_7 = instruction & I4_7_MASK;
        int i8_11 = instruction & I8_11_MASK;
        int i12_15 = instruction & I11_15_MASK;

        switch (codeop)
        {
        case 0b0000:
            i_add(i4_7, i8_11, i12_15, p);
            break;

        case 0b0001:
            i_or(i4_7, i8_11, i12_15, p);
            break;

        case 0b0010:
            i_xor(i4_7, i8_11, i12_15, p);
            break;

        case 0b0011:
            i_and(i4_7, i8_11, i12_15, p);
            break;

        case 0b0100:
            i_sl(i4_7, i8_11, i12_15, p);
            break;

        case 0b0101:
            i_srl(i4_7, i8_11, i12_15, p);
            break;

        case 0b0110:
            i_sra(i4_7, i8_11, i12_15, p);
            break;

        case 0b0111:
            i_syscall(i4_7, i8_11, i12_15, p);
            break;

        case 0b1000:
            i_je(i4_7, i8_11, i12_15, p);
            break;

        case 0b1001:
            i_jl(i4_7, i8_11, i12_15, p);
            break;

        case 0b1010:
            i_jg(i4_7, i8_11, i12_15, p);
            break;

        case 0b1011:
            i_fn(i8_11, i12_15, p);
            break;

        case 0b1100:
            i_ld(i8_11, i12_15, p);
            break;

        case 0b1101:
            i_st(i8_11, i12_15, p);
            break;

        case 0b1110:
            i_mv(i4_7, i8_11, i12_15, p);
            break;

        case 0b1111:
            i_mvu(i4_7, i8_11, i12_15, p);
            break;

        default:
            return -1;
        }
    }
    return 0;
}
