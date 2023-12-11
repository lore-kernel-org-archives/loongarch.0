Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BA14A9AC
	for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/mmBclo"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-286f8ee27aeso4757064a91.3
        for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702307489; x=1702912289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c3JABnZhA0zMciwZVkprtDbLZcHqHR6qPu6rtcafCI8=;
        b=m/mmBclofCaaw9CWgrZeNftDAnpshPZ/ebpneN4DVR27oS/hNSdheceY57YvSK0fhu
         T7AR59ngWxQPgHVmZqbOl42dL27QEElsw+1p+C21QOt+aX5vEguCKb93zxkWsQ38KV2G
         kx+AwKMrw3n87eiNXNZs/7FGEgWPEUSPJoxN3MZRtL1EdDoqOqSluwqrV2ErtqKbwpM1
         xr12e4eSgZ1dpwsU1zZtZFNsZqDgY8/IQXmrIfBKrt7q++yTfd+VJuiV+60sxInnRYJk
         XnYKOiNMLsBjtv83pKNqIyey0QZhQsUffJBe4FVoJ+0UbqoIJkfpEN9DQ5ee+/nesMuU
         WtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702307489; x=1702912289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3JABnZhA0zMciwZVkprtDbLZcHqHR6qPu6rtcafCI8=;
        b=MkgbwVeEFqsrnhkKyfka8RfCHKNi8TqkwyWmLKrFBHzSEDqDC1xoDAbTQ/r8/WeMQz
         iGGgHwm8L9ZPfTAQERz+xz0WU2h2jpfZj9j4L+kdCllhGtXlLJd3Bxk73PTtrgSN6oOQ
         ielxlPSsZYLlRmtv+ftca3uNvpNbSlb/c7eancH6oRV7GNZ+F+rN60aPtM1BOIk2/qsE
         cM4mbUbuGnqc++FUD7cA9JmA3oNA6xGvml+sJBH3Z8ik/7tiTUdjy8ydW5eged9vW1tJ
         U+JfB+ZWv1EzQjgCBLKnBb9esHV9KuBP0QAiPNVIyY1qksHuy5pJnGjI8Gdm1u8nj/zE
         wlEg==
X-Gm-Message-State: AOJu0YzEbty6W/0RGXTaXQHBF6aN2tpGhBMFd/6Zccx3Xq3TqzIfEHS3
	EBK7k13iGzgKmeHHdwyXbMdqNagCvLY2zA==
X-Google-Smtp-Source: AGHT+IGyG8jsR51bcLx3rwe7aF1NJ3DZ8vtbntaPe+wBc39wZLm/CyISM5ypInBvBiDypjknMlXjxw==
X-Received: by 2002:a17:90a:ad85:b0:286:ab9d:c6be with SMTP id s5-20020a17090aad8500b00286ab9dc6bemr3409842pjq.16.1702307489259;
        Mon, 11 Dec 2023 07:11:29 -0800 (PST)
Received: from chenhengqi-x1.. ([120.229.73.40])
        by smtp.gmail.com with ESMTPSA id rr13-20020a17090b2b4d00b00263f41a655esm7147692pjb.43.2023.12.11.07.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:11:28 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	hengqi.chen@gmail.com
Subject: [PATCH] LoongArch: BPF: Prevent out-of-bounds memory access
Date: Mon, 11 Dec 2023 23:11:05 +0800
Message-Id: <20231211151105.7473-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test_tag test triggers an unhandled page fault:

  # ./test_tag
  [  130.640218] CPU 0 Unable to handle kernel paging request at virtual address ffff80001b898004, era == 9000000003137f7c, ra == 9000000003139e70
  [  130.640501] Oops[#3]:
  [  130.640553] CPU: 0 PID: 1326 Comm: test_tag Tainted: G      D    O       6.7.0-rc4-loong-devel-gb62ab1a397cf #47 61985c1d94084daa2432f771daa45b56b10d8d2a
  [  130.640764] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
  [  130.640874] pc 9000000003137f7c ra 9000000003139e70 tp 9000000104cb4000 sp 9000000104cb7a40
  [  130.641001] a0 ffff80001b894000 a1 ffff80001b897ff8 a2 000000006ba210be a3 0000000000000000
  [  130.641128] a4 000000006ba210be a5 00000000000000f1 a6 00000000000000b3 a7 0000000000000000
  [  130.641256] t0 0000000000000000 t1 00000000000007f6 t2 0000000000000000 t3 9000000004091b70
  [  130.641387] t4 000000006ba210be t5 0000000000000004 t6 fffffffffffffff0 t7 90000000040913e0
  [  130.641512] t8 0000000000000005 u0 0000000000000dc0 s9 0000000000000009 s0 9000000104cb7ae0
  [  130.641641] s1 00000000000007f6 s2 0000000000000009 s3 0000000000000095 s4 0000000000000000
  [  130.641771] s5 ffff80001b894000 s6 ffff80001b897fb0 s7 9000000004090c50 s8 0000000000000000
  [  130.641900]    ra: 9000000003139e70 build_body+0x1fcc/0x4988
  [  130.642007]   ERA: 9000000003137f7c build_body+0xd8/0x4988
  [  130.642112]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
  [  130.642261]  PRMD: 00000004 (PPLV0 +PIE -PWE)
  [  130.642353]  EUEN: 00000003 (+FPE +SXE -ASXE -BTE)
  [  130.642458]  ECFG: 00071c1c (LIE=2-4,10-12 VS=7)
  [  130.642554] ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
  [  130.642658]  BADV: ffff80001b898004
  [  130.642719]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
  [  130.642815] Modules linked in: [last unloaded: bpf_testmod(O)]
  [  130.642924] Process test_tag (pid: 1326, threadinfo=00000000f7f4015f, task=000000006499f9fd)
  [  130.643062] Stack : 0000000000000000 9000000003380724 0000000000000000 0000000104cb7be8
  [  130.643213]         0000000000000000 25af8d9b6e600558 9000000106250ea0 9000000104cb7ae0
  [  130.643378]         0000000000000000 0000000000000000 9000000104cb7be8 90000000049f6000
  [  130.643538]         0000000000000090 9000000106250ea0 ffff80001b894000 ffff80001b894000
  [  130.643685]         00007ffffb917790 900000000313ca94 0000000000000000 0000000000000000
  [  130.643831]         ffff80001b894000 0000000000000ff7 0000000000000000 9000000100468000
  [  130.643983]         0000000000000000 0000000000000000 0000000000000040 25af8d9b6e600558
  [  130.644131]         0000000000000bb7 ffff80001b894048 0000000000000000 0000000000000000
  [  130.644276]         9000000104cb7be8 90000000049f6000 0000000000000090 9000000104cb7bdc
  [  130.644423]         ffff80001b894000 0000000000000000 00007ffffb917790 90000000032acfb0
  [  130.644572]         ...
  [  130.644629] Call Trace:
  [  130.644641] [<9000000003137f7c>] build_body+0xd8/0x4988
  [  130.644785] [<900000000313ca94>] bpf_int_jit_compile+0x228/0x4ec
  [  130.644891] [<90000000032acfb0>] bpf_prog_select_runtime+0x158/0x1b0
  [  130.645003] [<90000000032b3504>] bpf_prog_load+0x760/0xb44
  [  130.645089] [<90000000032b6744>] __sys_bpf+0xbb8/0x2588
  [  130.645175] [<90000000032b8388>] sys_bpf+0x20/0x2c
  [  130.645259] [<9000000003f6ab38>] do_syscall+0x7c/0x94
  [  130.645369] [<9000000003121c5c>] handle_syscall+0xbc/0x158
  [  130.645507]
  [  130.645539] Code: 380839f6  380831f9  28412bae <24000ca6> 004081ad  0014cb50  004083e8  02bff34c  58008e91
  [  130.645729]
  [  130.646418] ---[ end trace 0000000000000000 ]---

On my machine, which has CONFIG_PAGE_SIZE_16KB=y, the test failed at loading
a BPF prog with 2039 instructions:

  prog = (struct bpf_prog *)ffff80001b894000
  insn = (struct bpf_insn *)(prog->insnsi)ffff80001b894048
  insn + 2039 = (struct bpf_insn *)ffff80001b898000 <- end of the page

In build_insn(), we are trying to access next instruction unconditionally,
i.e. `(insn + 1)->imm`. The address lies in the next page and is not owned
by the current process, thus an page fault is inevitable and then segfault.

So, let's access next instruction only under `dst = imm64` context.

With this fix, we have:

  # ./test_tag
  test_tag: OK (40945 tests)

Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 4fcd6cd6da23..5c634de4ee36 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -465,7 +465,6 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	const u8 dst = regmap[insn->dst_reg];
 	const s16 off = insn->off;
 	const s32 imm = insn->imm;
-	const u64 imm64 = (u64)(insn + 1)->imm << 32 | (u32)insn->imm;
 	const bool is32 = BPF_CLASS(insn->code) == BPF_ALU || BPF_CLASS(insn->code) == BPF_JMP32;
 
 	switch (code) {
@@ -923,8 +922,12 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 
 	/* dst = imm64 */
 	case BPF_LD | BPF_IMM | BPF_DW:
+	{
+		const u64 imm64 = (u64)(insn + 1)->imm << 32 | (u32)insn->imm;
+
 		move_imm(ctx, dst, imm64, is32);
 		return 1;
+	}
 
 	/* dst = *(size *)(src + off) */
 	case BPF_LDX | BPF_MEM | BPF_B:
-- 
2.34.1

