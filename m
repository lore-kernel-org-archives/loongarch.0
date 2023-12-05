Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EAC1375
	for <loongarch@lists.linux.dev>; Tue,  5 Dec 2023 01:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8BxpPD9em5lZ+o+AA--.60170S3;
	Tue, 05 Dec 2023 09:21:02 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxvi_3em5lifhUAA--.56801S3;
	Tue, 05 Dec 2023 09:20:57 +0800 (CST)
Subject: Re: [PATCH] LoongArch: BPF: Remove fatal signed-extension
 instructions
To: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org, kernel@xen0n.name, yangtiezhu@loongson.cn
References: <20231204141938.7230-1-hengqi.chen@gmail.com>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <3db2436e-1f17-3e6a-2523-9090e2135b88@loongson.cn>
Date: Tue, 5 Dec 2023 09:20:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231204141938.7230-1-hengqi.chen@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8Dxvi_3em5lifhUAA--.56801S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW3XF1UGw47Gr17ur43XrWxXwc_yoWxuF45pr
	W5Jr4rGr4kAryUJa1UCF1UGry0y3y7A3W8Jry8try8Gr1UWr1UAryqqrWUJrn0yr45Ary7
	Jr1DAr45tF1UG3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UU
	UUU==


On 2023-12-04 22:19, Hengqi Chen wrote:
> As reported on mailing list ([0]), several BPF testcases could
> triggered kernel panics like:
>
>      # ./test_progs -t verifier_map_ptr_mixing
>      Can't find bpf_testmod.ko kernel module: -2
>      WARNING! Selftests relying on bpf_testmod.ko will be skipped.
>      [   47.842279] CPU 0 Unable to handle kernel paging request at virtual address ffffffff9218d000, era == 9000000003573ff8, ra == ffff8000020dbc70
>      [   47.843498] Oops[#1]:
>      [   47.843870] CPU: 0 PID: 242 Comm: test_progs Not tainted 6.7.0-rc2+ #27
>      [   47.844308] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
>      [   47.844850] pc 9000000003573ff8 ra ffff8000020dbc70 tp 9000000097618000 sp 900000009761bad0
>      [   47.845484] a0 ffffffff9218d000 a1 900000009761bad8 a2 0000000000000001 a3 900000009761bc20
>      [   47.846097] a4 900000009761bc24 a5 ffffffff9218d000 a6 0000000000000021 a7 0000000000000118
>      [   47.846643] t0 ffff8000020dbbd8 t1 9000000003573ff8 t2 900000009230dd00 t3 000c65d400000000
>      [   47.847220] t4 ffffffffffffffff t5 000000012ea823f8 t6 0000000000000000 t7 0000000000000000
>      [   47.847753] t8 000000000005b900 u0 900000009761ba88 s9 900000009761bb20 s0 ffff80001b278000
>      [   47.848259] s1 0000000000000001 s2 900000009230dd00 s3 900000009761bc20 s4 900000009761bae0
>      [   47.848796] s5 0000000000000000 s6 900000000438be20 s7 900000009761bb54 s8 9000000005b967c0
>      [   47.849400]    ra: ffff8000020dbc70 bpf_prog_4ecec27f4a4ae8c7_pointers_for_lookup_hash_array+0x98/0xe4
>      [   47.850543]   ERA: 9000000003573ff8 bpf_map_lookup_elem+0x0/0xc
>      [   47.851180]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
>      [   47.852203]  PRMD: 00000004 (PPLV0 +PIE -PWE)
>      [   47.852592]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
>      [   47.852964]  ECFG: 00071c1c (LIE=2-4,10-12 VS=7)
>      [   47.853351] ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
>      [   47.853706]  BADV: ffffffff9218d000
>      [   47.854113]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
>      [   47.854733] Modules linked in:
>      [   47.855261] Process test_progs (pid: 242, threadinfo=0000000071b66eac, task=00000000aa177492)
>      [   47.856344] Stack : 900000009761bb58 0000000000000000 0000000000000000 900000009761bc24
>      [   47.857347]         900000009761bc20 900000009230dd00 0000000000000001 ffff80001b278000
>      [   47.858064]         900000009761bb80 900000000438becc 0000000000000000 900000009761bb68
>      [   47.858691]         ffff80001b278048 9000000005254000 90000000042ec12c 0000000000000000
>      [   47.859332]         0000000000000000 900000009761bb80 0000000000000000 0000000000000001
>      [   47.859832]         0000000b230f0ab8 0000000000000000 ffff80001b278000 0000000000000000
>      [   47.860268]         0000000000000000 8dfb8454e0eb5b83 ffff80001b278000 9000000005b967c0
>      [   47.860701]         9000000093c80000 ffff80001b278000 0000000000000040 900000009230dd00
>      [   47.861190]         900000009393f400 9000000097863400 900000009761bd88 0000000000000000
>      [   47.861650]         9000000005254000 900000000438d100 0000000000000001 0000000000000001
>      [   47.862077]         ...
>      [   47.862311] Call Trace:
>      [   47.862568] [<9000000003573ff8>] bpf_map_lookup_elem+0x0/0xc
>      [   47.863511] [<ffff8000020dbc70>] bpf_prog_4ecec27f4a4ae8c7_pointers_for_lookup_hash_array+0x98/0xe4
>      [   47.864150] [<900000000438becc>] bpf_test_run+0x1e4/0x2f0
>      [   47.864544] [<900000000438d100>] bpf_prog_test_run_skb+0x314/0x67c
>      [   47.864934] [<900000000354cd18>] __sys_bpf+0x514/0x26d8
>      [   47.865261] [<900000000354f4e8>] sys_bpf+0x18/0x28
>      [   47.865596] [<90000000045b6c3c>] do_syscall+0x7c/0x94
>      [   47.865932] [<90000000033e1b1c>] handle_syscall+0xbc/0x158
>      [   47.866373]
>      [   47.866549] Code: 00150317  53fe67ff  542c6841 <2600008c> 28c1818c  4c000180  2600008c  28c1a18c  4c000180
>      [   47.867381]
>      [   47.867749] ---[ end trace 0000000000000000 ]---
>      [   47.868514] Kernel panic - not syncing: Fatal exception in interrupt
>      [   47.870138] Kernel relocated by 0x31c0000
>      [   47.870868]  .text @ 0x90000000033c0000
>      [   47.871361]  .data @ 0x9000000004690000
>      [   47.871777]  .bss  @ 0x9000000005a6e000
>      [   47.872612] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
>
> Take the `cls_redirect` case as an example:
>
>      cls_redirect()
>        -> get_global_metrics() returns pcpu ptr 0xfffffefffc00b480
>
> The pointer is later signed-extended to 0xfffffffffc00b480 at
> `BPF_JMP | BPF_EXIT`. During BPF prog run, this triggers unhandled
> page fault and a kernel panic.
>
> The `cgrp_ls_tp_btf` test reveals another kind of kernel panic
> when handling memory load:
>
>      ptr = bpf_cgrp_storage_get(&map_a, task->cgroups->dfl_cgrp, 0,
>      				   BPF_LOCAL_STORAGE_GET_F_CREATE);
>
> The expression `task->cgroups->dfl_cgrp` involves two memory load.
> Since the field offset fits in imm12 or imm14, we use ldd or ldptrd
> to perform memory load. But the ldd and ldptrd instructions both
> have the side effect that it will signed-extended the imm operand.
> Finally, we got the wrong addresses and result in kernel panics.
>
> Let's get rid of those fatal signed-extension instrutions to fix
> the issues. For the first case, no arches do a sext on function
> return, the fix should be safe. For the second case, we fallback
> to use a generic ldxd instruction.
>
>    [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com/T/#m78408fe3db883f384406e30e6b2b1f1e3fd57c1c
>
> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>   arch/loongarch/net/bpf_jit.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 169ff8b3915e..d76281efc5b8 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -911,8 +911,6 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
>   
>   	/* function return */
>   	case BPF_JMP | BPF_EXIT:
> -		emit_sext_32(ctx, regmap[BPF_REG_0], true);
> -
>   		if (i == ctx->prog->len - 1)
>   			break;
>   
> @@ -988,14 +986,8 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
>   			}
>   			break;
>   		case BPF_DW:
> -			if (is_signed_imm12(off)) {
> -				emit_insn(ctx, ldd, dst, src, off);
> -			} else if (is_signed_imm14(off)) {
> -				emit_insn(ctx, ldptrd, dst, src, off);

I suspect there are some bugs with other ldptr.{w,d} and stptr.{w.d}.
Because their offsets are 4-bytes aligned 16-bit signed numbers.

[1] 
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#_ldptr_wd_stptr_wd


Thanks.

> -			} else {
> -				move_imm(ctx, t1, off, is32);
> -				emit_insn(ctx, ldxd, dst, src, t1);
> -			}
> +			move_imm(ctx, t1, off, is32);
> +			emit_insn(ctx, ldxd, dst, src, t1);
>   			break;
>   		}
>   

