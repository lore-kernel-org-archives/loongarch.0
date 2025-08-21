Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABA01F3FEC
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 12:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778622; cv=none; b=EI9sYYb+7OP5XbK8PnFATsVNL7CFduPL0IatcK6qOcsj/Rh/aRHqjVeSQL0bbNtd+ViajGX/xR4a3bHal3vnB4tK+G3WjaqVTrWBMkB4Joh1eMg49nFjvXo3ip2NItd1d2qTSrOEOC7dYRr5UT+4YpveNivNKVXIj9DO73ga3gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778622; c=relaxed/simple;
	bh=YrjoTJI6JBY5AbzUyt1qMwTNNmqXTVMk5uzwMU1ycus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5zt52V/mnQvwvErcmrXY/shtYlVV2QUHHzhuGYtFHgr6Vg628l3lfQD0Yo9UY/xn9G+O2KPRiJ/xeRCPDefzNnsENxEf9OPYyZw+XrI1pJeFeW68ODj5ebUCxxN+LcyE7B7CqrtPB5zSYb0SmZSQHG2jMXjgzV4AirssIePpCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOczkdK9; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOczkdK9"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-321cfa7ad29so1544741a91.1
        for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 05:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755778620; x=1756383420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqamakcfwHFPLKt58TYCPYhTXg3ZUi1tEP08t5AyrIw=;
        b=YOczkdK9J+YNhBScrPc9E0guigFBvyLrAT1b/Ja+n3kp+gQcmjbEXOlMIK3ijMxuAn
         9MbxatUuLehzrlTwvL9J+t59jXozuc6BqPRX0zgAUIIX0I3Kkbq6nvJCp/g6lx+qJiBU
         DWAwTkOFPfkZDqEmp7LGJOYH7BiJuUsl/BN9taYGLHmJMyHLtclDfKurPTJPhoRGOTDJ
         gzvDcIC07LWEOItg3t0YbS/MFZovDDWFSz9C8QzXgs2t2ETzkWiA9ibULyrt9A+NFmi1
         bUXsprYiDWkvricj+pKD6bxmW7NXIZvo35hRU50Hscg2dfFYYJZVhzYeDaJOBWGz1X8O
         8M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755778620; x=1756383420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqamakcfwHFPLKt58TYCPYhTXg3ZUi1tEP08t5AyrIw=;
        b=EMUrw20bn8nrNXXJMU90L5CmcgZTzBrBbNseOTps9jZVeqYA4LkvfdAWdmVEDS3Dt6
         BxN7IL+CsJnsX2W1WKTSIi3AajC2cf0ni742AtY7pRSW/X2GiD4egOAH4QL6gb9KLhsm
         VnW2C4uaQ+TwE33yCujfY4vFo8vaeBKSQPqQp5imPQgczSKSWTpxB9OvDsT+/KeRVGbH
         7B7jZbzbFig7ZbsHo39DmHLGtLdXB40pcM28MObGhhYFg3vqyPlez8cKoV0BIuVdqYTI
         7wd6SalQqO14EeZjbL95aBiNgIXsbvDK9BeF40uHuVy8CJEVgrOFveswySN7CMFmCfzA
         0IFA==
X-Forwarded-Encrypted: i=1; AJvYcCWgDOab5pf23iCHY0wXxoK05x4Zyg5FaKOvXFgXpsKOmXrrDq8aKmWIfhzzs1/BLpNCOVWt//+XlAU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy65rJDX1v58HRyhIQbS1VwOS/Y90lYB/Tx8vDZR9Y6wmWa8yKa
	5k1kfQGk4MM+9gfjcHce/mf8DQAd3uDP8uAIgl5DvyLagoLHbSlqv6/S
X-Gm-Gg: ASbGnctPAObrNbatNV115UPmRWnrXEBq+h17nqYMN/yyAO+svkpMDy+nSBw7a3jfFPK
	s7h2mP1g4UTVBA+YTpZr4Af/IkRVOuQfhSzv14tmDnhX6JyRE8qpXAf7ReplYuQK7suoGyGwTMb
	kRQt23HwhQqae2zwyZfdVR6ixrFR/hWo9Qx+Z9ubkFkysqQr4odrI7Px2rXmpkjakLOvY3tLg3o
	bJtANkE6/hGMEzofidpVB5xpkl5rAwH/JqYdPDJVS+PpeKi2vKQD2JEqIGuWGqUav5Sj2LSXeX7
	fBYWH39TPWKOEv17cV3nuhcBaCXl+vyI5PVcD/549UYDrRsY/GTfCjyzFm5gTbhl4cfw6fHRhZm
	UdFGYgdXOACOpXTHOys8pu0EQOA57LMZDt6AsgQzw
X-Google-Smtp-Source: AGHT+IFioRcTnWkaN7vAuc6OYhbDDtjv9XBvPVRvGl/yn3M6ZYsZBYGGu9dMLWHG+nZcFAestbB/xQ==
X-Received: by 2002:a17:90b:3d09:b0:31e:f30f:6d3b with SMTP id 98e67ed59e1d1-324eecf9b08mr2759366a91.2.1755778620068;
        Thu, 21 Aug 2025 05:17:00 -0700 (PDT)
Received: from devbox.. ([43.132.141.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f2c48337sm1745442a91.25.2025.08.21.05.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:16:59 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	jianghaoran@kylinos.cn,
	duanchenghao@kylinos.cn,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	vincent.mc.li@gmail.com
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 3/3] LoongArch: BPF: No support of struct argument in trampoline programs
Date: Thu, 21 Aug 2025 09:10:03 +0000
Message-ID: <20250821091003.404870-4-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821091003.404870-1-hengqi.chen@gmail.com>
References: <20250821091003.404870-1-hengqi.chen@gmail.com>
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
index 6754e5231ece..a87f51f5b708 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1516,6 +1516,12 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
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


