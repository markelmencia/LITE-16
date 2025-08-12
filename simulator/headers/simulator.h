#ifndef SIMULATOR_H_
#define SIMULATOR_H_

#include "processor.h"

#define CODEOP_MASK 0x000F
#define I4_7_MASK   0x00F0
#define I8_11_MASK  0x0F00
#define I11_15_MASK 0xF000

int run(Processor *p);

#endif