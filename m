Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E75E1103
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 05:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXGK2lXt"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d0bb7ff86cso12300585ad.1
        for <loongarch@lists.linux.dev>; Wed, 06 Dec 2023 21:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701928419; x=1702533219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYbOTvcc8mCS8rVI9TY9WfqFkGwhLpQ7nxEHIk0jDNM=;
        b=dXGK2lXtY88ppZR1+q1Rv+xEPwvisdMMKCbxtWWwTPk/F24I4UT+m4eKp4keMcFf3T
         W20vSfsuFk7nFMBmkYtFV2f8cIDoKTD/aFGGfo/Kd/8mRkpBjV6dqW6hvnQ05NHUhq93
         p4m5nKgaJhlhDWZoik2KN8cW4hNw3eqE/5Mf41BwORAVVqAdzYxYceIPjqzksIYqXh1T
         iTPO6b73CQtvi4L/hs3D0VB/kQa+O2Jf8Yftk4HwnrWiL4+UN6bV+Ois4wVeZOtaTUbF
         pOCzSibUsaCe4BTpXowWLPdgesZ1otrydfODM8vc3uGK5XKlDHLX3n8ZAYHdb6KmKBUV
         VFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701928419; x=1702533219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYbOTvcc8mCS8rVI9TY9WfqFkGwhLpQ7nxEHIk0jDNM=;
        b=Le3IgBatKSk7ZpNNKsBL2+LdAHtK2XNHMt7WkcJyb4zFSNZaa5d3MvY5S98ngcrmZQ
         /PEbvfAGn0oKWfuuD/SRwUydJYt2vsXk4GOTSxz5WU/5w1ToJI6ffTyrdAaU2K0BJomG
         IA7YjOo8w1kDcLh4wAwOw8tS/DbhTReYHc3BZNF32pdIxyGhMioZGHCP53UDcQ2ms45d
         9VoKutVE6HTymjSGha89aKzPmNVRiNyTzN/SGy8vqRmXlADQgGyc83SkTg0Vmeo+GQoJ
         SkK1ZOiJ0KR1CiTaapqQG4W/9SZhCaXYv3YFwqNaJzJ3HoNFi99ptlB0StAa9wgoAw5k
         NnvQ==
X-Gm-Message-State: AOJu0YyOTC2ADrB7Q10cRRm4/lEbRAtfT+ztHWnh6mUtoiT3R22e03kF
	wNiS8FH350iWTD7zz6tY7Wk10SCQgEAYxA==
X-Google-Smtp-Source: AGHT+IF9555SbPjtHr/K1R8QBDbgvXFK61wFi0elVfBklSmZZaqtW8kJgVbIGFTW4y7zRcqQ0Kfqxw==
X-Received: by 2002:a17:903:228e:b0:1d0:a8bb:96a8 with SMTP id b14-20020a170903228e00b001d0a8bb96a8mr3016973plh.28.1701928418743;
        Wed, 06 Dec 2023 21:53:38 -0800 (PST)
Received: from ubuntu.. ([43.132.98.107])
        by smtp.googlemail.com with ESMTPSA id p14-20020a170902780e00b001cfed5524easm438574pll.288.2023.12.06.21.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 21:53:38 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	hejinyang@loongson.cn,
	hengqi.chen@gmail.com
Subject: [PATCH 2/2] LoongArch: BPF: Don't sign extend memory load operand
Date: Wed,  6 Dec 2023 07:38:34 +0000
Message-Id: <20231206073834.9707-3-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206073834.9707-1-hengqi.chen@gmail.com>
References: <20231206073834.9707-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `cgrp_local_storage` test triggers a kernel panic like:

  # ./test_progs -t cgrp_local_storage
  Can't find bpf_testmod.ko kernel module: -2
  WARNING! Selftests relying on bpf_testmod.ko will be skipped.
  [  550.930632] CPU 1 Unable to handle kernel paging request at virtual address 0000000000000080, era == ffff80000200be34, ra == ffff80000200be00
  [  550.931781] Oops[#1]:
  [  550.931966] CPU: 1 PID: 1303 Comm: test_progs Not tainted 6.7.0-rc2-loong-devel-g2f56bb0d2327 #35 a896aca3f4164f09cc346f89f2e09832e07be5f6
  [  550.932215] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
  [  550.932403] pc ffff80000200be34 ra ffff80000200be00 tp 9000000108350000 sp 9000000108353dc0
  [  550.932545] a0 0000000000000000 a1 0000000000000517 a2 0000000000000118 a3 00007ffffbb15558
  [  550.932682] a4 00007ffffbb15620 a5 90000001004e7700 a6 0000000000000021 a7 0000000000000118
  [  550.932824] t0 ffff80000200bdc0 t1 0000000000000517 t2 0000000000000517 t3 00007ffff1c06ee0
  [  550.932961] t4 0000555578ae04d0 t5 fffffffffffffff8 t6 0000000000000004 t7 0000000000000020
  [  550.933097] t8 0000000000000040 u0 00000000000007b8 s9 9000000108353e00 s0 90000001004e7700
  [  550.933241] s1 9000000004005000 s2 0000000000000001 s3 0000000000000000 s4 0000555555eb2ec8
  [  550.933379] s5 00007ffffbb15bb8 s6 00007ffff1dafd60 s7 000055555663f610 s8 00007ffff1db0050
  [  550.933520]    ra: ffff80000200be00 bpf_prog_98f1b9e767be2a84_on_enter+0x40/0x200
  [  550.933911]   ERA: ffff80000200be34 bpf_prog_98f1b9e767be2a84_on_enter+0x74/0x200
  [  550.934105]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
  [  550.934596]  PRMD: 00000004 (PPLV0 +PIE -PWE)
  [  550.934712]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
  [  550.934836]  ECFG: 00071c1c (LIE=2-4,10-12 VS=7)
  [  550.934976] ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
  [  550.935097]  BADV: 0000000000000080
  [  550.935181]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
  [  550.935291] Modules linked in:
  [  550.935391] Process test_progs (pid: 1303, threadinfo=000000006c3b1c41, task=0000000061f84a55)
  [  550.935643] Stack : 00007ffffbb15bb8 0000555555eb2ec8 0000000000000000 0000000000000001
  [  550.935844]         9000000004005000 ffff80001b864000 00007ffffbb15450 90000000029aa034
  [  550.935990]         0000000000000000 9000000108353ec0 0000000000000118 d07d9dfb09721a09
  [  550.936175]         0000000000000001 0000000000000000 9000000108353ec0 0000000000000118
  [  550.936314]         9000000101d46ad0 900000000290abf0 000055555663f610 0000000000000000
  [  550.936479]         0000000000000003 9000000108353ec0 00007ffffbb15450 90000000029d7288
  [  550.936635]         00007ffff1dafd60 000055555663f610 0000000000000000 0000000000000003
  [  550.936779]         9000000108353ec0 90000000035dd1f0 00007ffff1dafd58 9000000002841c5c
  [  550.936939]         0000000000000119 0000555555eea5a8 00007ffff1d78780 00007ffffbb153e0
  [  550.937083]         ffffffffffffffda 00007ffffbb15518 0000000000000040 00007ffffbb15558
  [  550.937224]         ...
  [  550.937299] Call Trace:
  [  550.937521] [<ffff80000200be34>] bpf_prog_98f1b9e767be2a84_on_enter+0x74/0x200
  [  550.937910] [<90000000029aa034>] bpf_trace_run2+0x90/0x154
  [  550.938105] [<900000000290abf0>] syscall_trace_enter.isra.0+0x1cc/0x200
  [  550.938224] [<90000000035dd1f0>] do_syscall+0x48/0x94
  [  550.938319] [<9000000002841c5c>] handle_syscall+0xbc/0x158
  [  550.938477]
  [  550.938607] Code: 580009ae  50016000  262402e4 <28c20085> 14092084  03a00084  16000024  03240084  00150006
  [  550.938851]
  [  550.939021] ---[ end trace 0000000000000000 ]---
  [  552.231492] note: test_progs[1303] exited with preempt_count 1
  [  552.233328] ------------[ cut here ]------------
  [  552.233789] Voluntary context switch within RCU read-side critical section!
  [  552.234047] WARNING: CPU: 0 PID: 1303 at kernel/rcu/tree_plugin.h:320 rcu_note_context_switch+0x52c/0x58c
  [  552.234480] Modules linked in:
  [  552.234688] CPU: 0 PID: 1303 Comm: test_progs Tainted: G      D            6.7.0-rc2-loong-devel-g2f56bb0d2327 #35 a896aca3f4164f09cc346f89f2e09832e07be5f6
  [  552.234941] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
  [  552.235953] pc 9000000002904304 ra 9000000002904304 tp 9000000108350000 sp 9000000108353900
  [  552.236201] a0 000000000000003f a1 90000000040f5198 a2 9000000108353728 a3 90000000040f51a0
  [  552.236360] a4 90000000040f5198 a5 9000000108353720 a6 0000000000000001 a7 0000000000000001
  [  552.236508] t0 d07d9dfb09721a09 t1 d07d9dfb09721a09 t2 0000000000000001 t3 0000000000000001
  [  552.236646] t4 0000000000000004 t5 0000000000000000 t6 0000000000000030 t7 0000000000000000
  [  552.236788] t8 0000000000038f70 u0 90000000039b3db0 s9 90000001083539f0 s0 900000009002a100
  [  552.236969] s1 90000001004e7700 s2 90000000036f2100 s3 90000001004e7700 s4 900000000417f530
  [  552.237149] s5 0000000000000000 s6 9000000108353a28 s7 9000000004005000 s8 0000000000000001
  [  552.237371]    ra: 9000000002904304 rcu_note_context_switch+0x52c/0x58c
  [  552.237582]   ERA: 9000000002904304 rcu_note_context_switch+0x52c/0x58c
  [  552.237755]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
  [  552.237994]  PRMD: 00000000 (PPLV0 -PIE -PWE)
  [  552.238169]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
  [  552.238347]  ECFG: 00071c1c (LIE=2-4,10-12 VS=7)
  [  552.238540] ESTAT: 000c0000 [BRK] (IS= ECode=12 EsubCode=0)
  [  552.238689]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
  [  552.238841] CPU: 0 PID: 1303 Comm: test_progs Tainted: G      D            6.7.0-rc2-loong-devel-g2f56bb0d2327 #35 a896aca3f4164f09cc346f89f2e09832e07be5f6
  [  552.239108] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
  [  552.239365] Stack : 0000000000000256 0000000000000000 9000000002844000 9000000108350000
  [  552.243185]         9000000108353550 9000000108353558 0000000000000000 9000000108353698
  [  552.243351]         9000000108353690 9000000108353690 90000001083534b0 0000000000000001
  [  552.243500]         0000000000000001 9000000108353558 d07d9dfb09721a09 90000001002d2100
  [  552.243707]         0000000000000001 0000000000000004 0000000000000000 0000000000000030
  [  552.243857]         0000000000000000 000000000003a604 000000008c938000 90000001083539f0
  [  552.244017]         0000000000000000 0000000000000000 90000000039e08b8 9000000004005000
  [  552.244206]         9000000002904304 0000000000000140 9000000108353a28 9000000004005000
  [  552.244376]         0000000000000001 0000000000000000 9000000002844018 9000000002904304
  [  552.244593]         00000000000000b0 0000000000000000 0000000000000000 0000000000071c1c
  [  552.244847]         ...
  [  552.244981] Call Trace:
  [  552.245119] [<9000000002844018>] show_stack+0x64/0x188
  [  552.245463] [<90000000035dbf94>] dump_stack_lvl+0x60/0x88
  [  552.245575] [<9000000002862400>] __warn+0x8c/0x16c
  [  552.245665] [<900000000359b858>] report_bug+0x1a4/0x20c
  [  552.245762] [<90000000035dd090>] do_bp+0x1f0/0x308
  [  552.245919] [<9000000004751924>] exception_handlers+0x1924/0x10000
  [  552.246110] [<9000000002904304>] rcu_note_context_switch+0x52c/0x58c
  [  552.246278] [<90000000035e454c>] __schedule+0xa4/0xa88
  [  552.246381] [<90000000035e4f68>] schedule+0x38/0xe0
  [  552.246502] [<9000000002901354>] synchronize_rcu_expedited+0x400/0x84c
  [  552.246637] [<9000000002b7777c>] namespace_unlock+0xcc/0x16c
  [  552.246803] [<9000000002b7cf9c>] put_mnt_ns+0xbc/0xfc
  [  552.247004] [<900000000288f65c>] free_nsproxy+0x24/0x1c4
  [  552.247132] [<90000000028688d4>] do_exit+0x31c/0x914
  [  552.247283] [<9000000002868f80>] make_task_dead+0x94/0x164
  [  552.247428] [<900000000284426c>] die+0x110/0x134
  [  552.247523] [<90000000035edc38>] do_page_fault+0x1e0/0x394
  [  552.247624] [<900000000285601c>] tlb_do_page_fault_0+0x118/0x1b4
  [  552.247931] [<ffff80000200be00>] bpf_prog_98f1b9e767be2a84_on_enter+0x40/0x200
  [  552.248192] [<90000000029aa034>] bpf_trace_run2+0x90/0x154
  [  552.248328] [<900000000290abf0>] syscall_trace_enter.isra.0+0x1cc/0x200
  [  552.248459] [<90000000035dd1f0>] do_syscall+0x48/0x94
  [  552.248640] [<9000000002841c5c>] handle_syscall+0xbc/0x158
  [  552.248861]
  [  552.249017] ---[ end trace 0000000000000000 ]---

Further investigation shows that this panic is triggered by memory
load operations:

  ptr = bpf_cgrp_storage_get(&map_a, task->cgroups->dfl_cgrp, 0,
                             BPF_LOCAL_STORAGE_GET_F_CREATE);

The expression `task->cgroups->dfl_cgrp` involves two memory load.
Since the field offset fits in imm12 or imm14, we use ldd or ldptrd
instructions. But both instructions have the side effect that it
will signed-extended the imm operand. Finally, we got the wrong
addresses and panics is inevitable.

Use a generic ldxd instruction to avoid this kind of issues.

With this change, we have:

  # ./test_progs -t cgrp_local_storage
  Can't find bpf_testmod.ko kernel module: -2
  WARNING! Selftests relying on bpf_testmod.ko will be skipped.
  test_cgrp_local_storage:PASS:join_cgroup /cgrp_local_storage 0 nsec
  #48/1    cgrp_local_storage/tp_btf:OK
  test_attach_cgroup:PASS:skel_open 0 nsec
  test_attach_cgroup:PASS:prog_attach 0 nsec
  test_attach_cgroup:PASS:prog_attach 0 nsec
  libbpf: prog 'update_cookie_tracing': failed to attach: ERROR: strerror_r(-524)=22
  test_attach_cgroup:FAIL:prog_attach unexpected error: -524
  #48/2    cgrp_local_storage/attach_cgroup:FAIL
  test_recursion:PASS:skel_open_and_load 0 nsec
  libbpf: prog 'on_lookup': failed to attach: ERROR: strerror_r(-524)=22
  libbpf: prog 'on_lookup': failed to auto-attach: -524
  test_recursion:FAIL:skel_attach unexpected error: -524 (errno 524)
  #48/3    cgrp_local_storage/recursion:FAIL
  #48/4    cgrp_local_storage/negative:OK
  #48/5    cgrp_local_storage/cgroup_iter_sleepable:OK
  test_yes_rcu_lock:PASS:skel_open 0 nsec
  test_yes_rcu_lock:PASS:skel_load 0 nsec
  libbpf: prog 'yes_rcu_lock': failed to attach: ERROR: strerror_r(-524)=22
  libbpf: prog 'yes_rcu_lock': failed to auto-attach: -524
  test_yes_rcu_lock:FAIL:skel_attach unexpected error: -524 (errno 524)
  #48/6    cgrp_local_storage/yes_rcu_lock:FAIL
  #48/7    cgrp_local_storage/no_rcu_lock:OK
  #48      cgrp_local_storage:FAIL

  All error logs:
  test_cgrp_local_storage:PASS:join_cgroup /cgrp_local_storage 0 nsec
  test_attach_cgroup:PASS:skel_open 0 nsec
  test_attach_cgroup:PASS:prog_attach 0 nsec
  test_attach_cgroup:PASS:prog_attach 0 nsec
  libbpf: prog 'update_cookie_tracing': failed to attach: ERROR: strerror_r(-524)=22
  test_attach_cgroup:FAIL:prog_attach unexpected error: -524
  #48/2    cgrp_local_storage/attach_cgroup:FAIL
  test_recursion:PASS:skel_open_and_load 0 nsec
  libbpf: prog 'on_lookup': failed to attach: ERROR: strerror_r(-524)=22
  libbpf: prog 'on_lookup': failed to auto-attach: -524
  test_recursion:FAIL:skel_attach unexpected error: -524 (errno 524)
  #48/3    cgrp_local_storage/recursion:FAIL
  test_yes_rcu_lock:PASS:skel_open 0 nsec
  test_yes_rcu_lock:PASS:skel_load 0 nsec
  libbpf: prog 'yes_rcu_lock': failed to attach: ERROR: strerror_r(-524)=22
  libbpf: prog 'yes_rcu_lock': failed to auto-attach: -524
  test_yes_rcu_lock:FAIL:skel_attach unexpected error: -524 (errno 524)
  #48/6    cgrp_local_storage/yes_rcu_lock:FAIL
  #48      cgrp_local_storage:FAIL
  Summary: 0/4 PASSED, 0 SKIPPED, 1 FAILED

No panics any more. (The test still failed because lack of BPF trampoline
which I am actively working on.)

Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 0303c0094d38..d76281efc5b8 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -986,14 +986,8 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
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
