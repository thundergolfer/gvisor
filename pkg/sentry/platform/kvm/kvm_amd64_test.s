// Copyright 2021 The gVisor Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "textflag.h"

// stmxcsr reads the MXCSR control and status register.
TEXT ·stmxcsr(SB),NOSPLIT|NOFRAME,$0-8
	MOVQ addr+0(FP), SI
	STMXCSR (SI)
	RET

TEXT ·vmcall(SB),NOSPLIT,$0-16
	MOVQ $ax+0(FP), AX
	BYTE $0x0F; BYTE $0x01; BYTE $0xC1; // vmcall
	MOVQ AX, ret+8(FP)
	RET

TEXT ·vmmcall(SB),NOSPLIT,$0-16
	MOVQ $ax+0(FP), AX
	BYTE $0x0F; BYTE $0x01; BYTE $0xD9; // vmmcall
	MOVQ AX, ret+8(FP)
	RET
