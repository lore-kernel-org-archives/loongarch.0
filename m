Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D382FD7A7
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901176; cv=none; b=B/hgF8HjQRid+4SFFDCJo0n1aIJjmU7D8AB7LTRkj/EiQVh3T8NGtKozPu04tzprs/UISTbrC7QqyHdHe6HMqzi3IR/ynmBAgMpZ4lGf2KU3KNWi6FMpehzAy3wCsdZHutN4XE1RnhRQDwpwccD9qTvVR37gnYFCpF5zkxHzrcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901176; c=relaxed/simple;
	bh=i/cGLH1uq/UafzJ6JgsIw+BcbLxPPp8ARJILGja/g+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBklFGiRDOfD2sHnRIfJnzUHAz1YhJSRbWXcGq8LMO6rH21uWMxnEJq2N5y8hDyolzcsdUgHIIkrvipxG3KHPnk9mFSnf/ymRAfuWG5H9iwJ2pn88jPibidlUQYeG+0bobwlrhkp1rI1pz0fDh7ijVaINvy/b0Bzjnsbjf2NLSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot5pwCU5; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot5pwCU5"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77256200f1bso2546467b3a.3
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 05:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901174; x=1757505974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDw1E1z/FlfgNIxQZyKYv0LpcZi6UtUYL8AOcxGMX2w=;
        b=Ot5pwCU5blwtiZLDjPAEVW8Myt7auCF8oMMrNCo6jjr6u3nY9rSmsfN+FJ02XgF+nL
         ydYvbosi4NkHMutLwGcM5ip6kmlazQh2pmktWwwNRdzuRnagmTRO8dmSwfqPQX+MhG6U
         jgzNllrvZ0bfka2ZMXaH8t0Z+xTvsl/OyMwqP7bCPIfntgNh1i4HjmvV3GCMWny0n6vZ
         DXUAVgorB1wxcmi2GYtNiEMHyLNjyalUiLLF8gKtDT6Vpvmz8xRg6rmXF/whdMFBxKUl
         9bhB3YhNBSj89BiSfzizm/DeFRxcSFn1DpuRvB5Y7AWVKIOTZ6DpXzQOO4018xulMIzv
         0Jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901174; x=1757505974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDw1E1z/FlfgNIxQZyKYv0LpcZi6UtUYL8AOcxGMX2w=;
        b=BnvpwfTpLYXTh6ee0LP/+I3QMxgKiI/gol12VGv+/cqn1IKfme7kmVijOPMQSJLglW
         ETRrNYfnmZ7CyjQuTHGuAwebJNl48myubhHUMKQJy9WHQi1JJicNvaDOefK+JVrS2mDz
         C9LTObUsyaLywnJsuzTS+2GkrDFV1lYU3OPrLr1okhwdF0tBCH2iFn7c8mwaS4k8jabT
         /AZSBrQDH9AyKi6MZIoviXiZuqE1O43q7pn+0lWCtAE2zmtkCtoHQiZOkP5EfmVRn5yo
         6LAZ5Sca3KcAslYjPgQo7VmDpuoQh01c0wzyAX6fuduRlYU1zW/XVUPjNn4wl2p49Cz9
         YBzg==
X-Gm-Message-State: AOJu0YyuVeiYE3yTQrWyjOusK2gVsVDcKlNn6tp0vG4LwAiXyhwNrMeq
	ql2Bhc6rre8Ein/A3TKm4iNh5IjSEfBUvuMtXYPjlUIustghtqOQOcIt
X-Gm-Gg: ASbGnctRxWPK4LYKPSKf+Qq4ZxbiiQVYIyz9+9j97/Hzv7U2dxNR87Cn5fP5KAfABFQ
	s2RAAEhby5ChJSI3UMHaIrDstIbzlgOJjm6JBv0qXCQ4IM9MpoTGsJAjMTOddMu+TkGYukT2FWK
	9C0w4CsGMXwfnFOLVjU6PfNqi4G9l6idOCqJf8/hniXSZO5BACwakbKOZAuCD5ZySPxWIHkXOXP
	E1YFCJgEj0/43io46eacukjedZIfHUcBKwMsUvVtaUMK1bkNjY2gqNJiTgvOOQ5Sam97/jCIspR
	Jh6U1R3Ak2G1BI8VLVyNdRQ34U/m05Ks1DCySw4nwtcTSKqark/7478WiC150E/nU6utPE+BCA1
	hpRop2bSved0q+B9fnAEbnynl6tbrqeEvZ1XGgGB/G4Lb7e4qKvlQ2Vz7VdtIbQ==
X-Google-Smtp-Source: AGHT+IEPYWws7h8Ojv8b8CgrnGne71pr0CQ548eTgFlMz21JEoWksXMEmjy+AWKFDcVbJHVXJxM4RQ==
X-Received: by 2002:a05:6a20:258f:b0:243:d26c:4807 with SMTP id adf61e73a8af0-243d6dcab42mr23218355637.8.1756901174289;
        Wed, 03 Sep 2025 05:06:14 -0700 (PDT)
Received: from devbox.. ([43.132.141.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5014desm16615899b3a.92.2025.09.03.05.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:06:13 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v4 8/8] LoongArch: BPF: Sign extend struct ops return values properly
Date: Wed,  3 Sep 2025 07:01:13 +0000
Message-ID: <20250903070113.42215-9-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903070113.42215-1-hengqi.chen@gmail.com>
References: <20250903070113.42215-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ns_bpf_qdisc selftest triggers a kernel panic:

    CPU 0 Unable to handle kernel paging request at virtual address 0000000000741d58, era == 90000000851b5ac0, ra == 90000000851b5aa4
    Oops[#1]:
    CPU: 0 UID: 0 PID: 449 Comm: test_progs Tainted: G           OE       6.16.0+ #3 PREEMPT(full)
    Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
    Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
    pc 90000000851b5ac0 ra 90000000851b5aa4 tp 90000001076b8000 sp 90000001076bb600
    a0 0000000000741ce8 a1 0000000000000001 a2 90000001076bb5c0 a3 0000000000000008
    a4 90000001004c4620 a5 9000000100741ce8 a6 0000000000000000 a7 0100000000000000
    t0 0000000000000010 t1 0000000000000000 t2 9000000104d24d30 t3 0000000000000001
    t4 4f2317da8a7e08c4 t5 fffffefffc002f00 t6 90000001004c4620 t7 ffffffffc61c5b3d
    t8 0000000000000000 u0 0000000000000001 s9 0000000000000050 s0 90000001075bc800
    s1 0000000000000040 s2 900000010597c400 s3 0000000000000008 s4 90000001075bc880
    s5 90000001075bc8f0 s6 0000000000000000 s7 0000000000741ce8 s8 0000000000000000
       ra: 90000000851b5aa4 __qdisc_run+0xac/0x8d8
      ERA: 90000000851b5ac0 __qdisc_run+0xc8/0x8d8
     CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
     PRMD: 00000004 (PPLV0 +PIE -PWE)
     EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
     ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
    ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
     BADV: 0000000000741d58
     PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
    Modules linked in: bpf_testmod(OE) [last unloaded: bpf_testmod(OE)]
    Process test_progs (pid: 449, threadinfo=000000009af02b3a, task=00000000e9ba4956)
    Stack : 0000000000000000 90000001075bc8ac 90000000869524a8 9000000100741ce8
            90000001075bc800 9000000100415300 90000001075bc8ac 0000000000000000
            900000010597c400 900000008694a000 0000000000000000 9000000105b59000
            90000001075bc800 9000000100741ce8 0000000000000050 900000008513000c
            9000000086936000 0000000100094d4c fffffff400676208 0000000000000000
            9000000105b59000 900000008694a000 9000000086bf0dc0 9000000105b59000
            9000000086bf0d68 9000000085147010 90000001075be788 0000000000000000
            9000000086bf0f98 0000000000000001 0000000000000010 9000000006015840
            0000000000000000 9000000086be6c40 0000000000000000 0000000000000000
            0000000000000000 4f2317da8a7e08c4 0000000000000101 4f2317da8a7e08c4
            ...
    Call Trace:
    [<90000000851b5ac0>] __qdisc_run+0xc8/0x8d8
    [<9000000085130008>] __dev_queue_xmit+0x578/0x10f0
    [<90000000853701c0>] ip6_finish_output2+0x2f0/0x950
    [<9000000085374bc8>] ip6_finish_output+0x2b8/0x448
    [<9000000085370b24>] ip6_xmit+0x304/0x858
    [<90000000853c4438>] inet6_csk_xmit+0x100/0x170
    [<90000000852b32f0>] __tcp_transmit_skb+0x490/0xdd0
    [<90000000852b47fc>] tcp_connect+0xbcc/0x1168
    [<90000000853b9088>] tcp_v6_connect+0x580/0x8a0
    [<90000000852e7738>] __inet_stream_connect+0x170/0x480
    [<90000000852e7a98>] inet_stream_connect+0x50/0x88
    [<90000000850f2814>] __sys_connect+0xe4/0x110
    [<90000000850f2858>] sys_connect+0x18/0x28
    [<9000000085520c94>] do_syscall+0x94/0x1a0
    [<9000000083df1fb8>] handle_syscall+0xb8/0x158

    Code: 4001ad80  2400873f  2400832d <240073cc> 001137ff  001133ff  6407b41f  001503cc  0280041d

    ---[ end trace 0000000000000000 ]---

The bpf_fifo_dequeue prog returns a skb which is a pointer.
The pointer is treated as a 32bit value and sign extend to
64bit in epilogue. This behavior is right for most bpf prog
types but wrong for struct ops which requires LoongArch ABI.

So let's sign extend struct ops return values according to
the LoongArch ABI ([0]) and return value spec in function model.

  [0]: https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-EN.html

Fixes: 6abf17d690d8 ("LoongArch: BPF: Add struct ops support for trampoline")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 6dba407c202f..583a540ff7f5 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1451,6 +1451,32 @@ void arch_free_bpf_trampoline(void *image, unsigned int size)
 	bpf_prog_pack_free(image, size);
 }
 
+/*
+ * Sign-extend the register if necessary
+ */
+static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u8 size, u8 flags)
+{
+	if (!(flags & BTF_FMODEL_SIGNED_ARG) && size != 8)
+		return;
+
+	switch (size) {
+	case 1:
+		emit_insn(ctx, extwb, rd, rj);
+		break;
+	case 2:
+		emit_insn(ctx, extwh, rd, rj);
+		break;
+	case 4:
+		emit_insn(ctx, addiw, rd, rj, 0);
+		break;
+	case 8:
+		move_reg(ctx, rd, rj);
+		break;
+	default:
+		pr_warn("bpf_jit: invalid size %d for sign_extend\n", size);
+	}
+}
+
 static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 					 const struct btf_func_model *m, struct bpf_tramp_links *tlinks,
 					 void *func_addr, u32 flags)
@@ -1659,8 +1685,12 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 		restore_args(ctx, m->nr_args, args_off);
 
 	if (save_ret) {
-		emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off);
 		emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, -(retval_off - 8));
+		if (is_struct_ops)
+			sign_extend(ctx, LOONGARCH_GPR_A0, regmap[BPF_REG_0],
+				    m->ret_size, m->ret_flags);
+		else
+			emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off);
 	}
 
 	emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off);
-- 
2.43.5

