Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B261103
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 05:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6k73q7C"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d0521554ddso4179425ad.2
        for <loongarch@lists.linux.dev>; Wed, 06 Dec 2023 21:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701928415; x=1702533215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOUWnKcYotLxi5ITaiugf6q+QgeuIIRKHzHIiQynJN4=;
        b=J6k73q7C75l8/efDPZhmTM4hsJsrPXcf6vnOvHdx/ijlB3l8tOUUGHQcIEU8y1e+0P
         DWQUS6GSeGlbG51DeUfujtG0KdWWanCLa0QjfYNcNCYAcZyLvpwiGXGV1GTiRIkzLPXI
         tS/N+yzH3aydrd9HLJvgWxOlBCMrvf6YGr8rYzMCwcktN/9vLpv+rOsJyaXOLODzNF5S
         q9+YdxaISJSminhdsERqSPAwEnYnk1V2alLCAuGo2e9Au92VStBO/ZNvoo5LuNQxnxe3
         3N/gU+JAltqDLZ6/e8Ad0O1G5oqUNAjmxEvARWcj4zXTkYReFFXsAxMSYTiYcoI/r0CO
         zJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701928415; x=1702533215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOUWnKcYotLxi5ITaiugf6q+QgeuIIRKHzHIiQynJN4=;
        b=rNo6mHr6nZgNXczRH96K+n1lG45maP49ntUK1s2lSS19wJEYvSyAgdmfK56WJvqAJx
         XFJL7UzNF0xAK02J/t3oufHA6MXyGpC9oCuVDe2liPN21X63wNE8lVZh5vIl+F3BRGGz
         3ixLJo7IBjhwpysnwwJvg2Bv9eyL8Cv0XIIiabCQOsPEBnjmlLvf7xIcX9W3R34wqbcm
         BK/u4XwDbixCIXkdyp+E8RAE4IqLO+XQ8axStrJ+in0mE0V+aRgVsNDCqyiU0lCz10iY
         0W4JcEnYpiNw5AEYSGAgXdPAcYaa25j/F//oqk82pNp6xq9h091WKbrfJI330GF1IcAs
         AD7g==
X-Gm-Message-State: AOJu0Yz/fojylUXCYXP7lZa8DDC5ZPDfw8lzWD0VEHKJEVJpzrkcUnzG
	3+GYn7L77EesPvh6aIHjMRIKTYUqIuv3wg==
X-Google-Smtp-Source: AGHT+IEQcgmpmLtDk2OVqc9FSIkXuHVVH625YX93u/83UCo0JZjHRNEspEW2jC56Oz9dxKypn6wocQ==
X-Received: by 2002:a17:903:11d0:b0:1d0:a720:1fd3 with SMTP id q16-20020a17090311d000b001d0a7201fd3mr1905639plh.99.1701928415282;
        Wed, 06 Dec 2023 21:53:35 -0800 (PST)
Received: from ubuntu.. ([43.132.98.107])
        by smtp.googlemail.com with ESMTPSA id p14-20020a170902780e00b001cfed5524easm438574pll.288.2023.12.06.21.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 21:53:34 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	hejinyang@loongson.cn,
	hengqi.chen@gmail.com
Subject: [PATCH 1/2] LoongArch: BPF: Don't sign extend function return value
Date: Wed,  6 Dec 2023 07:38:33 +0000
Message-Id: <20231206073834.9707-2-hengqi.chen@gmail.com>
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

The `cls_redirect` test triggers a kernel panic like:

  # ./test_progs -t cls_redirect
  Can't find bpf_testmod.ko kernel module: -2
  WARNING! Selftests relying on bpf_testmod.ko will be skipped.
  [   30.938489] CPU 3 Unable to handle kernel paging request at virtual address fffffffffd814de0, era == ffff800002009fb8, ra == ffff800002009f9c
  [   30.939331] Oops[#1]:
  [   30.939513] CPU: 3 PID: 1260 Comm: test_progs Not tainted 6.7.0-rc2-loong-devel-g2f56bb0d2327 #35 a896aca3f4164f09cc346f89f2e09832e07be5f6
  [   30.939732] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
  [   30.939901] pc ffff800002009fb8 ra ffff800002009f9c tp 9000000104da4000 sp 9000000104da7ab0
  [   30.940038] a0 fffffffffd814de0 a1 9000000104da7a68 a2 0000000000000000 a3 9000000104da7c10
  [   30.940183] a4 9000000104da7c14 a5 0000000000000002 a6 0000000000000021 a7 00005555904d7f90
  [   30.940321] t0 0000000000000110 t1 0000000000000000 t2 fffffffffd814de0 t3 0004c4b400000000
  [   30.940456] t4 ffffffffffffffff t5 00000000c3f63600 t6 0000000000000000 t7 0000000000000000
  [   30.940590] t8 000000000006d803 u0 0000000000000020 s9 9000000104da7b10 s0 900000010504c200
  [   30.940727] s1 fffffffffd814de0 s2 900000010504c200 s3 9000000104da7c10 s4 9000000104da7ad0
  [   30.940866] s5 0000000000000000 s6 90000000030e65bc s7 9000000104da7b44 s8 90000000044f6fc0
  [   30.941015]    ra: ffff800002009f9c bpf_prog_846803e5ae81417f_cls_redirect+0xa0/0x590
  [   30.941535]   ERA: ffff800002009fb8 bpf_prog_846803e5ae81417f_cls_redirect+0xbc/0x590
  [   30.941696]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
  [   30.942224]  PRMD: 00000004 (PPLV0 +PIE -PWE)
  [   30.942330]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
  [   30.942453]  ECFG: 00071c1c (LIE=2-4,10-12 VS=7)
  [   30.942612] ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
  [   30.942764]  BADV: fffffffffd814de0
  [   30.942854]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
  [   30.942974] Modules linked in:
  [   30.943078] Process test_progs (pid: 1260, threadinfo=00000000ce303226, task=000000007d10bb76)
  [   30.943306] Stack : 900000010a064000 90000000044f6fc0 9000000104da7b48 0000000000000000
  [   30.943495]         0000000000000000 9000000104da7c14 9000000104da7c10 900000010504c200
  [   30.943626]         0000000000000001 ffff80001b88c000 9000000104da7b70 90000000030e6668
  [   30.943785]         0000000000000000 9000000104da7b58 ffff80001b88c048 9000000003d05000
  [   30.943936]         900000000303ac88 0000000000000000 0000000000000000 9000000104da7b70
  [   30.944091]         0000000000000000 0000000000000001 0000000731eeab00 0000000000000000
  [   30.944245]         ffff80001b88c000 0000000000000000 0000000000000000 54b99959429f83b8
  [   30.944402]         ffff80001b88c000 90000000044f6fc0 9000000101d70000 ffff80001b88c000
  [   30.944538]         000000000000005a 900000010504c200 900000010a064000 900000010a067000
  [   30.944697]         9000000104da7d88 0000000000000000 9000000003d05000 90000000030e794c
  [   30.944852]         ...
  [   30.944924] Call Trace:
  [   30.945120] [<ffff800002009fb8>] bpf_prog_846803e5ae81417f_cls_redirect+0xbc/0x590
  [   30.945650] [<90000000030e6668>] bpf_test_run+0x1ec/0x2f8
  [   30.945958] [<90000000030e794c>] bpf_prog_test_run_skb+0x31c/0x684
  [   30.946065] [<90000000026d4f68>] __sys_bpf+0x678/0x2724
  [   30.946159] [<90000000026d7288>] sys_bpf+0x20/0x2c
  [   30.946253] [<90000000032dd224>] do_syscall+0x7c/0x94
  [   30.946343] [<9000000002541c5c>] handle_syscall+0xbc/0x158
  [   30.946492]
  [   30.946549] Code: 0015030e  5c0009c0  5001d000 <28c00304> 02c00484  29c00304  00150009  2a42d2e4  0280200d
  [   30.946793]
  [   30.946971] ---[ end trace 0000000000000000 ]---
  [   32.093225] Kernel panic - not syncing: Fatal exception in interrupt
  [   32.093526] Kernel relocated by 0x2320000
  [   32.093630]  .text @ 0x9000000002520000
  [   32.093725]  .data @ 0x9000000003400000
  [   32.093792]  .bss  @ 0x9000000004413200
  [   34.971998] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

This is because we signed-extend function return values.
When subprog mode is enabled, we have:

  cls_redirect()
    -> get_global_metrics() returns pcpu ptr 0xfffffefffc00b480

The pointer returned is later signed-extended to 0xfffffffffc00b480
at `BPF_JMP | BPF_EXIT`. During BPF prog run, this triggers unhandled
page fault and a kernel panic.

Drop the unnecessary signed-extension on return values like other
arches do.

With this change, we have:

  # ./test_progs -t cls_redirect
  Can't find bpf_testmod.ko kernel module: -2
  WARNING! Selftests relying on bpf_testmod.ko will be skipped.
  #51/1    cls_redirect/cls_redirect_inlined:OK
  #51/2    cls_redirect/IPv4 TCP accept unknown (no hops, flags: SYN):OK
  #51/3    cls_redirect/IPv6 TCP accept unknown (no hops, flags: SYN):OK
  #51/4    cls_redirect/IPv4 TCP accept unknown (no hops, flags: ACK):OK
  #51/5    cls_redirect/IPv6 TCP accept unknown (no hops, flags: ACK):OK
  #51/6    cls_redirect/IPv4 TCP forward unknown (one hop, flags: ACK):OK
  #51/7    cls_redirect/IPv6 TCP forward unknown (one hop, flags: ACK):OK
  #51/8    cls_redirect/IPv4 TCP accept known (one hop, flags: ACK):OK
  #51/9    cls_redirect/IPv6 TCP accept known (one hop, flags: ACK):OK
  #51/10   cls_redirect/IPv4 UDP accept unknown (no hops, flags: none):OK
  #51/11   cls_redirect/IPv6 UDP accept unknown (no hops, flags: none):OK
  #51/12   cls_redirect/IPv4 UDP forward unknown (one hop, flags: none):OK
  #51/13   cls_redirect/IPv6 UDP forward unknown (one hop, flags: none):OK
  #51/14   cls_redirect/IPv4 UDP accept known (one hop, flags: none):OK
  #51/15   cls_redirect/IPv6 UDP accept known (one hop, flags: none):OK
  #51/16   cls_redirect/cls_redirect_subprogs:OK
  #51/17   cls_redirect/IPv4 TCP accept unknown (no hops, flags: SYN):OK
  #51/18   cls_redirect/IPv6 TCP accept unknown (no hops, flags: SYN):OK
  #51/19   cls_redirect/IPv4 TCP accept unknown (no hops, flags: ACK):OK
  #51/20   cls_redirect/IPv6 TCP accept unknown (no hops, flags: ACK):OK
  #51/21   cls_redirect/IPv4 TCP forward unknown (one hop, flags: ACK):OK
  #51/22   cls_redirect/IPv6 TCP forward unknown (one hop, flags: ACK):OK
  #51/23   cls_redirect/IPv4 TCP accept known (one hop, flags: ACK):OK
  #51/24   cls_redirect/IPv6 TCP accept known (one hop, flags: ACK):OK
  #51/25   cls_redirect/IPv4 UDP accept unknown (no hops, flags: none):OK
  #51/26   cls_redirect/IPv6 UDP accept unknown (no hops, flags: none):OK
  #51/27   cls_redirect/IPv4 UDP forward unknown (one hop, flags: none):OK
  #51/28   cls_redirect/IPv6 UDP forward unknown (one hop, flags: none):OK
  #51/29   cls_redirect/IPv4 UDP accept known (one hop, flags: none):OK
  #51/30   cls_redirect/IPv6 UDP accept known (one hop, flags: none):OK
  #51/31   cls_redirect/cls_redirect_dynptr:OK
  #51/32   cls_redirect/IPv4 TCP accept unknown (no hops, flags: SYN):OK
  #51/33   cls_redirect/IPv6 TCP accept unknown (no hops, flags: SYN):OK
  #51/34   cls_redirect/IPv4 TCP accept unknown (no hops, flags: ACK):OK
  #51/35   cls_redirect/IPv6 TCP accept unknown (no hops, flags: ACK):OK
  #51/36   cls_redirect/IPv4 TCP forward unknown (one hop, flags: ACK):OK
  #51/37   cls_redirect/IPv6 TCP forward unknown (one hop, flags: ACK):OK
  #51/38   cls_redirect/IPv4 TCP accept known (one hop, flags: ACK):OK
  #51/39   cls_redirect/IPv6 TCP accept known (one hop, flags: ACK):OK
  #51/40   cls_redirect/IPv4 UDP accept unknown (no hops, flags: none):OK
  #51/41   cls_redirect/IPv6 UDP accept unknown (no hops, flags: none):OK
  #51/42   cls_redirect/IPv4 UDP forward unknown (one hop, flags: none):OK
  #51/43   cls_redirect/IPv6 UDP forward unknown (one hop, flags: none):OK
  #51/44   cls_redirect/IPv4 UDP accept known (one hop, flags: none):OK
  #51/45   cls_redirect/IPv6 UDP accept known (one hop, flags: none):OK
  #51      cls_redirect:OK
  Summary: 1/45 PASSED, 0 SKIPPED, 0 FAILED

Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 169ff8b3915e..0303c0094d38 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -911,8 +911,6 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext

 	/* function return */
 	case BPF_JMP | BPF_EXIT:
-		emit_sext_32(ctx, regmap[BPF_REG_0], true);
-
 		if (i == ctx->prog->len - 1)
 			break;

--
2.34.1
