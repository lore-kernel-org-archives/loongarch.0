Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1956E286B3
	for <loongarch@lists.linux.dev>; Mon,  4 Dec 2023 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGhjxUY1"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ce387bcb06so714644b3a.0
        for <loongarch@lists.linux.dev>; Mon, 04 Dec 2023 06:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701699628; x=1702304428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/VOfFO7igPIGBRQk2PcpOP3vphx+Ab9quJLzTuvT7g=;
        b=IGhjxUY1kgYcMwGGzaVEtsjXJZtl8AVUwLOr4DgUVyHLhTkiEi2mNl21rUyblroXik
         VJKSO2zrihlmdpfWJyyuapETCJhquwPt5g47AcPlCxCBWo4A9exO208XcxmHbqQSSqu2
         IviBRb/X5XzD2o+vPxK8W704oKjIXOY84LNTHm5qzR3COua3jtWLwMlNPYCXACvMbFcH
         AS8AwfXW/DVWcS+kiHVq2fsKqObbX9VIENxHehNzBgUUUrXYIRRB8E4f7T5m2bTeMVsB
         E2vtktYaAjNH+HxP9cTpSESX/UZ65LAhBScxvys3tdg3JUuL1sxk64gTn/kXMBj0JNm3
         mdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699628; x=1702304428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/VOfFO7igPIGBRQk2PcpOP3vphx+Ab9quJLzTuvT7g=;
        b=bU7JtDkH46ArSbgI1ukM2+uR5hcRnrLJyXNY7M3FkSeBfmosZBDKqeRHF01eld3isY
         2ueN162bNTKmMfEA8efv1QkEjAxXcFD+ByXeNB+ZNWClQ6yi9YZDb0IRRN6/zVYXBC+x
         eRurWAPrko8xHSUsgiY5WCGII9o/1HLiHMY6I7j+eiQQrOz5ngseq3YSK5AVhvPEbZq3
         fRysBfIbZCADZQ67Uju6qkq2idrrVp6xIczbNI2ET8KlDXrUSqG9ctwkqbq/Iq3czduf
         HMvvL4dSZaMg58FlQRDxpeIaai8MOlX/RCP2ylEpI0TVxg6nhIEUkux7CoMtOz65/JVT
         QsrQ==
X-Gm-Message-State: AOJu0YxNTWqtF2EKVFyjAAXpxJfrQKyj9QuX+I58Ba7TDMMZ9ubfKuEw
	uAiKypBvG/tS03ijmzOz2htKvcMGcnk2Sff1
X-Google-Smtp-Source: AGHT+IGFLvpZxUsKSYMCtaqBpsPP4+EDQjmVuoAJ2s1OCZoJjZMYrHFcbBhCR8zL/ReNtGUjeTyYVA==
X-Received: by 2002:a05:6a20:938b:b0:18f:97c:8241 with SMTP id x11-20020a056a20938b00b0018f097c8241mr2194162pzh.75.1701699628102;
        Mon, 04 Dec 2023 06:20:28 -0800 (PST)
Received: from chenhengqi-x1.. ([223.74.104.112])
        by smtp.gmail.com with ESMTPSA id 4-20020a630804000000b005b856fab5e9sm7552389pgi.18.2023.12.04.06.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 06:20:27 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org,
	kernel@xen0n.name,
	yangtiezhu@loongson.cn,
	hengqi.chen@gmail.com
Subject: [PATCH] LoongArch: BPF: Remove fatal signed-extension instructions
Date: Mon,  4 Dec 2023 22:19:38 +0800
Message-Id: <20231204141938.7230-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported on mailing list ([0]), several BPF testcases could
triggered kernel panics like:

    # ./test_progs -t verifier_map_ptr_mixing
    Can't find bpf_testmod.ko kernel module: -2
    WARNING! Selftests relying on bpf_testmod.ko will be skipped.
    [   47.842279] CPU 0 Unable to handle kernel paging request at virtual address ffffffff9218d000, era == 9000000003573ff8, ra == ffff8000020dbc70
    [   47.843498] Oops[#1]:
    [   47.843870] CPU: 0 PID: 242 Comm: test_progs Not tainted 6.7.0-rc2+ #27
    [   47.844308] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
    [   47.844850] pc 9000000003573ff8 ra ffff8000020dbc70 tp 9000000097618000 sp 900000009761bad0
    [   47.845484] a0 ffffffff9218d000 a1 900000009761bad8 a2 0000000000000001 a3 900000009761bc20
    [   47.846097] a4 900000009761bc24 a5 ffffffff9218d000 a6 0000000000000021 a7 0000000000000118
    [   47.846643] t0 ffff8000020dbbd8 t1 9000000003573ff8 t2 900000009230dd00 t3 000c65d400000000
    [   47.847220] t4 ffffffffffffffff t5 000000012ea823f8 t6 0000000000000000 t7 0000000000000000
    [   47.847753] t8 000000000005b900 u0 900000009761ba88 s9 900000009761bb20 s0 ffff80001b278000
    [   47.848259] s1 0000000000000001 s2 900000009230dd00 s3 900000009761bc20 s4 900000009761bae0
    [   47.848796] s5 0000000000000000 s6 900000000438be20 s7 900000009761bb54 s8 9000000005b967c0
    [   47.849400]    ra: ffff8000020dbc70 bpf_prog_4ecec27f4a4ae8c7_pointers_for_lookup_hash_array+0x98/0xe4
    [   47.850543]   ERA: 9000000003573ff8 bpf_map_lookup_elem+0x0/0xc
    [   47.851180]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
    [   47.852203]  PRMD: 00000004 (PPLV0 +PIE -PWE)
    [   47.852592]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
    [   47.852964]  ECFG: 00071c1c (LIE=2-4,10-12 VS=7)
    [   47.853351] ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
    [   47.853706]  BADV: ffffffff9218d000
    [   47.854113]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
    [   47.854733] Modules linked in:
    [   47.855261] Process test_progs (pid: 242, threadinfo=0000000071b66eac, task=00000000aa177492)
    [   47.856344] Stack : 900000009761bb58 0000000000000000 0000000000000000 900000009761bc24
    [   47.857347]         900000009761bc20 900000009230dd00 0000000000000001 ffff80001b278000
    [   47.858064]         900000009761bb80 900000000438becc 0000000000000000 900000009761bb68
    [   47.858691]         ffff80001b278048 9000000005254000 90000000042ec12c 0000000000000000
    [   47.859332]         0000000000000000 900000009761bb80 0000000000000000 0000000000000001
    [   47.859832]         0000000b230f0ab8 0000000000000000 ffff80001b278000 0000000000000000
    [   47.860268]         0000000000000000 8dfb8454e0eb5b83 ffff80001b278000 9000000005b967c0
    [   47.860701]         9000000093c80000 ffff80001b278000 0000000000000040 900000009230dd00
    [   47.861190]         900000009393f400 9000000097863400 900000009761bd88 0000000000000000
    [   47.861650]         9000000005254000 900000000438d100 0000000000000001 0000000000000001
    [   47.862077]         ...
    [   47.862311] Call Trace:
    [   47.862568] [<9000000003573ff8>] bpf_map_lookup_elem+0x0/0xc
    [   47.863511] [<ffff8000020dbc70>] bpf_prog_4ecec27f4a4ae8c7_pointers_for_lookup_hash_array+0x98/0xe4
    [   47.864150] [<900000000438becc>] bpf_test_run+0x1e4/0x2f0
    [   47.864544] [<900000000438d100>] bpf_prog_test_run_skb+0x314/0x67c
    [   47.864934] [<900000000354cd18>] __sys_bpf+0x514/0x26d8
    [   47.865261] [<900000000354f4e8>] sys_bpf+0x18/0x28
    [   47.865596] [<90000000045b6c3c>] do_syscall+0x7c/0x94
    [   47.865932] [<90000000033e1b1c>] handle_syscall+0xbc/0x158
    [   47.866373]
    [   47.866549] Code: 00150317  53fe67ff  542c6841 <2600008c> 28c1818c  4c000180  2600008c  28c1a18c  4c000180
    [   47.867381]
    [   47.867749] ---[ end trace 0000000000000000 ]---
    [   47.868514] Kernel panic - not syncing: Fatal exception in interrupt
    [   47.870138] Kernel relocated by 0x31c0000
    [   47.870868]  .text @ 0x90000000033c0000
    [   47.871361]  .data @ 0x9000000004690000
    [   47.871777]  .bss  @ 0x9000000005a6e000
    [   47.872612] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

Take the `cls_redirect` case as an example:

    cls_redirect()
      -> get_global_metrics() returns pcpu ptr 0xfffffefffc00b480

The pointer is later signed-extended to 0xfffffffffc00b480 at
`BPF_JMP | BPF_EXIT`. During BPF prog run, this triggers unhandled
page fault and a kernel panic.

The `cgrp_ls_tp_btf` test reveals another kind of kernel panic
when handling memory load:

    ptr = bpf_cgrp_storage_get(&map_a, task->cgroups->dfl_cgrp, 0,
    				   BPF_LOCAL_STORAGE_GET_F_CREATE);

The expression `task->cgroups->dfl_cgrp` involves two memory load.
Since the field offset fits in imm12 or imm14, we use ldd or ldptrd
to perform memory load. But the ldd and ldptrd instructions both
have the side effect that it will signed-extended the imm operand.
Finally, we got the wrong addresses and result in kernel panics.

Let's get rid of those fatal signed-extension instrutions to fix
the issues. For the first case, no arches do a sext on function
return, the fix should be safe. For the second case, we fallback
to use a generic ldxd instruction.

  [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com/T/#m78408fe3db883f384406e30e6b2b1f1e3fd57c1c

Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 169ff8b3915e..d76281efc5b8 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -911,8 +911,6 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 
 	/* function return */
 	case BPF_JMP | BPF_EXIT:
-		emit_sext_32(ctx, regmap[BPF_REG_0], true);
-
 		if (i == ctx->prog->len - 1)
 			break;
 
@@ -988,14 +986,8 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			}
 			break;
 		case BPF_DW:
-			if (is_signed_imm12(off)) {
-				emit_insn(ctx, ldd, dst, src, off);
-			} else if (is_signed_imm14(off)) {
-				emit_insn(ctx, ldptrd, dst, src, off);
-			} else {
-				move_imm(ctx, t1, off, is32);
-				emit_insn(ctx, ldxd, dst, src, t1);
-			}
+			move_imm(ctx, t1, off, is32);
+			emit_insn(ctx, ldxd, dst, src, t1);
 			break;
 		}
 
-- 
2.34.1

