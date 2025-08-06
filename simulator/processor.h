#include <stdint.h>

#define INTEGER_LIMIT 65536
#define REG_COUNT 16

typedef struct {
    uint16_t program_mem[INTEGER_LIMIT];
    uint16_t data_mem[INTEGER_LIMIT];
    uint16_t reg[REG_COUNT];
    uint16_t pc;
} Processor;
