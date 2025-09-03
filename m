Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5542E5412
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901159; cv=none; b=VTb9bVU+qvoEGOn3x9dthTNk27lginKu1Cos+PFazK3QSTg2Ke6KjZAMAaDPdFD3q/50ZcWBj/5wsR57i2+VVhknh4doHmmKV7mhJY3X/4K3aYgGfNssNjb9G33RbJ8wYzYvrOVBT3mVJmsJKVatjJBqCcAQiYziCywfh0naM/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901159; c=relaxed/simple;
	bh=pvouYI3vmBVJiEH/fEoesdl+fmluw7ycvjYdCkdAWU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJ37e8UDch+QVHXN1sujEwNpbuIYQnE4JbREBPzZhGNkwJjZ5mZ4HyVCEL5SpHZS5cK87gGRmpt0SrRZ/5lAY6kFk1+qSLWBZNTxf/HVdOk8e+Z18Fb/GbFv+HUWLBmOL3TxQ4y9Ft2nXtd6M/a4RODM/En54zYsFamfQoHgKeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMLcv4w8; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMLcv4w8"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-772488c78bcso3784669b3a.1
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 05:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901157; x=1757505957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgWOdWZRtCDBRYSS9p3LugAEelK+NK48uslwvOCyM38=;
        b=eMLcv4w8cBaVcEdA+hXZqo79YRJHnsmzYO7Lliqi4VCSY5/pUVTzVR2Aifoxag3Erw
         9TgU0Lc7h7H0q8z4lQFdmxIgPKFsFOxsQ0uMC+C3RSAOdr/QYkpvPF4uTiYpBkwX6v1i
         fUtfNSpTfPToD+qtMxS8q7V3NAlDusewR4rFpqm8deo2r4tbkL14Z431Li7qG76UZFaB
         sxv672q24FKegkNyTYvtOq0a/3RmOFqWgc5yAkwxvpR2TYiqcFnLa5CpagfbeBWhS2Ce
         DSPSCaQd3CPWppxTIhBCFjqpeIyaFhcFV5fOqQFJjr2udFCKJNuCecZ05C5M1XG4Znrz
         LjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901157; x=1757505957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgWOdWZRtCDBRYSS9p3LugAEelK+NK48uslwvOCyM38=;
        b=nw/1MozQYP8jQB+/OwvG5IRZIdq/HyRfD5GW/kRqS8HcjuR4EJ1ROgKtiLN1bIcQ3g
         RCwa2b5D6pV0x7CZaCTJfGG+bpnrNupRYkMSTSOZJsQkdMoTVAeM9yjywU7VNNpow62Z
         hXzfz08OkkGz3JnJHRneDuHOMwmWvBXU+AZVcfhNeLenEAIQ0W8kTt5WQ/dq5/lwF0FJ
         LMEEzF3SIeOtdTZ4JcbLtl8x2buNrUP6W7O3DTJPEi3PMrO44PcgptUwA/fSX7jSQuxY
         ILDX34NhGUReyax8f2oJdL21LwwiGzyM6T80CE1buXbo79OLIE9MA80FEVR0VoX28Y7J
         BJ8g==
X-Gm-Message-State: AOJu0Ywp9vHpSagMtC6Dl2VPE8X525sw8e9bZTcX9LQPxrGBwxqgM2kX
	y3jU9v6Nq8clN0sZmsj9lsxyHZiKuJ+UfKmEsqGqvt9mI/q5+zThYNEp
X-Gm-Gg: ASbGncuUdBXzHYE9zq6NEs1RAotQXo8i9lYcQE5Q83FdPWmFvnmaSwrJnR8+vWVoeiC
	8RTUh2Y8XAdMSEoC7Orsdmj2D48pgLHHuR9jH+Gg9LgDXe0qDbYieE8DyoYvLn+1VpkByUCqg4w
	2ZwH8mJkZtsCqc2F8ThnyhRBcNyJOSVQ8mSwPR+f6Xf3NqtVE4EdfGkFNy2IYXaJb3FIm241OvY
	IizUgqds5bYL91q0kLLNQ4S1HsAVt/FZFQkPygvwsHTs3cJrXYLnX1r76L3Wj6VgNx2YF40KAp3
	YdSw4bgDp5ZK0fsfIy6VeZnR6NjYts/XzTBwRs2w1A8V2H+7/mQO9Kgk+qTYLIgBxrXedCOPIU7
	j8WSg+SCd62c20XevrK/M9xMmf12wptYIrqX/+Qom
X-Google-Smtp-Source: AGHT+IGXMQgIfSvZFnKEiRNmakR/wRDr7ldLgxMm4Dr58aazA38CdfMUR7OM+rxqXKBB0ERFrqOtPg==
X-Received: by 2002:a05:6a00:1495:b0:770:56bf:ab5a with SMTP id d2e1a72fcca58-7723e36b526mr16296049b3a.19.1756901156919;
        Wed, 03 Sep 2025 05:05:56 -0700 (PDT)
Received: from devbox.. ([43.132.141.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5014desm16615899b3a.92.2025.09.03.05.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:05:56 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v4 3/8] LoongArch: BPF: No support of struct argument in trampoline programs
Date: Wed,  3 Sep 2025 07:01:08 +0000
Message-ID: <20250903070113.42215-4-hengqi.chen@gmail.com>
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

The current implementation does not support struct argument.
This cause a oops when running bpf selftest:

    $ ./test_progs -a tracing_struct
    CPU -1 Unable to handle kernel paging request at virtual address 0000000000000018, era == 90000000845659f4, ra == 90000000845659e8
    Oops[#1]:
    CPU -1 Unable to handle kernel paging request at virtual address 0000000000000018, era == 9000000085bef268, ra == 90000000844f3938
    rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
    rcu:     1-...0: (19 ticks this GP) idle=1094/1/0x4000000000000000 softirq=1380/1382 fqs=801
    rcu:     (detected by 0, t=5252 jiffies, g=1197, q=52 ncpus=4)
    Sending NMI from CPU 0 to CPUs 1:
    rcu: rcu_preempt kthread starved for 2495 jiffies! g1197 f0x0 RCU_GP_DOING_FQS(6) ->state=0x0 ->cpu=2
    rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
    rcu: RCU grace-period kthread stack dump:
    task:rcu_preempt     state:I stack:0     pid:15    tgid:15    ppid:2      task_flags:0x208040 flags:0x00000800
    Stack : 9000000100423e80 0000000000000402 0000000000000010 90000001003b0680
            9000000085d88000 0000000000000000 0000000000000040 9000000087159350
            9000000085c2b9b0 0000000000000001 900000008704a000 0000000000000005
            00000000ffff355b 00000000ffff355b 0000000000000000 0000000000000004
            9000000085d90510 0000000000000000 0000000000000002 7b5d998f8281e86e
            00000000ffff355c 7b5d998f8281e86e 000000000000003f 9000000087159350
            900000008715bf98 0000000000000005 9000000087036000 900000008704a000
            9000000100407c98 90000001003aff80 900000008715c4c0 9000000085c2b9b0
            00000000ffff355b 9000000085c33d3c 00000000000000b4 0000000000000000
            9000000007002150 00000000ffff355b 9000000084615480 0000000007000002
            ...
    Call Trace:
    [<9000000085c2a868>] __schedule+0x410/0x1520
    [<9000000085c2b9ac>] schedule+0x34/0x190
    [<9000000085c33d38>] schedule_timeout+0x98/0x140
    [<90000000845e9120>] rcu_gp_fqs_loop+0x5f8/0x868
    [<90000000845ed538>] rcu_gp_kthread+0x260/0x2e0
    [<900000008454e8a4>] kthread+0x144/0x238
    [<9000000085c26b60>] ret_from_kernel_thread+0x28/0xc8
    [<90000000844f20e4>] ret_from_kernel_thread_asm+0xc/0x88

    rcu: Stack dump where RCU GP kthread last ran:
    Sending NMI from CPU 0 to CPUs 2:
    NMI backtrace for cpu 2 skipped: idling at idle_exit+0x0/0x4

Reject it for now.

Fixes: f9b6b41f0cf3 ("LoongArch: BPF: Add basic bpf trampoline support")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 9155f9e725a1..7b7e449b9ea9 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1492,6 +1492,12 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	if (m->nr_args > LOONGARCH_MAX_REG_ARGS)
 		return -ENOTSUPP;
 
+	/* don't support struct argument */
+	for (i = 0; i < m->nr_args; i++) {
+		if (m->arg_flags[i] & BTF_FMODEL_STRUCT_ARG)
+			return -ENOTSUPP;
+	}
+
 	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
 		return -ENOTSUPP;
 
-- 
2.43.5

