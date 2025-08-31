Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7605A273FD
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 01:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756691756; cv=none; b=LryHld8kWMF+RUss4ZsAI6q0VqxSvAPrnvHHJo5+LnYgTZg+7RHHqnq638LBUEItp+MvBSOHKiFpu8YD8RMsPuh5wx8RQopGectO2j9nslU5BppDPw02ByPlJ67nDnVkM2FCryMXzlnJX5czbz7ISaQACKCs+o329SVrx64vq4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756691756; c=relaxed/simple;
	bh=e1os7ILzdL3QY9xy37HdWtA9JBwjsWt7shFuBIlr5Do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GyPVdYV2afu6d8rzJULzYRbNs1KDLPTqj+QSQdThshGMxZNBB0ykj065LYdVMIlJ6d3mFlcuBMgVs5dyLIn2/7lzn67TNCYKdVSawFqwJJsDR7djwNgidlV8UxwwAcTdAIxqvmAvAuP/JUyJpGnZduiKXd7pbArGiVOvBhrg1mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5kyTf6f; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5kyTf6f"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b49cf21320aso4212680a12.1
        for <loongarch@lists.linux.dev>; Sun, 31 Aug 2025 18:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756691754; x=1757296554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE0QLDXgorSNrcZMya/EIeYHiWe+PQdlAZrJuFQrEwA=;
        b=l5kyTf6fOIagsvuvwevrvhZLk9h+/BMLQmEDrW+OGWrAqit26Ldf2Y+NI5uOXm08bg
         Hd4MdGaMmVmutytADkn2cNs0+j6HGrwDXbpr1n3ecUDm+gFnddBlG4go71E4Ovcaapyz
         T7nY4p4D6HetUStQ+mmgE99JaQ05Nq6PMkEpmwUu85gLZWovnXsGZHkm/gXmxZNkprE5
         FtkF9UCe/Cd3DAczFiXnsai2at+9xrPY4fTGXkhSCjZvKatL81MKr9zC9kZDyWyfn9g9
         2Uhe7Mn6UkAwhFjm9rKZCEfKA/TwPJyUo59QH98dfurTm0rAAHnYUAHV5vBi/hIXXFyP
         f6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756691754; x=1757296554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YE0QLDXgorSNrcZMya/EIeYHiWe+PQdlAZrJuFQrEwA=;
        b=o6UIxpUTCTilKPzb/O7SUCnkE0qDO2gtO4YsiukmWWb18Vt2UpeTN0duDgboL1ol5M
         hNQ33XjUn79USZTrwodjogM6VRDJbLNXb7dXhxp0W90k02ylQJJwOkpcVe3yE3a45DyH
         r8i1vrwR3aUVAmj+bP95hJWlNtxUBiYBm/ERUxADl3pk9/o/dZQyqwzQ1gLgG24ptXOx
         DYwCfzYI48BsXTxFaCVHaFhd9rDepmNFDibihZjNNG/jqu46z5P13vzyAyVHLtCk376S
         t+qBppQtue65U6ELWAIJwpwvADMmoBrxNH1FpU05n5esbtL9V+vTbM6OckTUBIB/clLj
         CAzw==
X-Gm-Message-State: AOJu0YzfqQB4t2HGwTJi8oXxwkicBsBsViA6swEPlnu8G4UtOEOOPTjh
	coJFr+U9sXvwhUdC5KyB/rqNLOZZRF8usBnWyN93nT6/736Q+RA4vy6g65IhmWVDues=
X-Gm-Gg: ASbGncvgPzf9XNf5EADA3eXQdeIF8e/m2r48pkdBZRCLkO4Z+IddMS55P0jpYBLrw63
	rud75mue5+oTageLiCgDWQKQyIXRJgiUv2sUtHw9+Zuu+Z2JpwP7qwz50WcJjG+I+9QVGk+CVSr
	TRYs5SJVSCwBmPX/9raK3+TcGwdtGOLCUeKI9fBWgm4B8Q7lepogY2oEPbMHU6XPM/vhTS9X2dr
	0fv275S9w1g09XGe4o38PtkCDUCCCXlx+ibSE/ORWVS0cwcPsXMk7aLetXeh92s2w3MBkZr0rx4
	q1rmbzJ/VScqW9vaOgIXlxnXei6745/yRF/TQCgUZeKpmEMzc4qeUP1DuR4iydMDak/aLPdnFyf
	4FztGHF33hryu2V5tHttsRjbcQN1Awf04IXDX7pY=
X-Google-Smtp-Source: AGHT+IEnRBQFTcAtItWZqsC250n+wAEknie0fwYKm6nE3CQziz9y25I7nAKR2zx+cceGCDXQcv3/5Q==
X-Received: by 2002:a05:6a20:3d84:b0:243:c36b:becb with SMTP id adf61e73a8af0-243d6dd4df7mr9235130637.8.1756691754177;
        Sun, 31 Aug 2025 18:55:54 -0700 (PDT)
Received: from devbox.. ([43.132.141.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006c340sm8103034a12.1.2025.08.31.18.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 18:55:53 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v3 2/3] LoongArch: BPF: Sign extend struct ops return values properly
Date: Sun, 31 Aug 2025 23:43:27 +0000
Message-ID: <20250831234328.22440-3-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250831234328.22440-1-hengqi.chen@gmail.com>
References: <20250831234328.22440-1-hengqi.chen@gmail.com>
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
the return value spec in function model.

Fixes: 6abf17d690d8 ("LoongArch: BPF: Add struct ops support for trampoline")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index b646c6b73014..0e76a0958142 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1448,6 +1448,29 @@ void arch_free_bpf_trampoline(void *image, unsigned int size)
 	bpf_prog_pack_free(image, size);
 }
 
+/*
+ * Sign-extend the register if necessary
+ */
+static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u8 size)
+{
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
@@ -1654,6 +1677,8 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	if (save_ret) {
 		emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off);
 		emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, -(retval_off - 8));
+		if (is_struct_ops)
+			sign_extend(ctx, LOONGARCH_GPR_A0, regmap[BPF_REG_0], m->ret_size);
 	}
 
 	emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off);
-- 
2.43.5


