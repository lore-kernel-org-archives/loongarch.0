Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D1D31DDAB
	for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 08:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617731; cv=none; b=Z2g/EM8ygFeJbCUzEAVAOPwIqEZ8XdZKW0PP68PM9aA286csP9G1GLperhY8Ky8LntfyXOlhRsNxA9qu1JjR2aK+Iy/Z53qKsKISFsk9EvpUSMwxJFveQe8bf0viSDhgbT9toIJ+/U5wZ7J8RCmb03XoVeQfz3laZnNVfa3kazU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617731; c=relaxed/simple;
	bh=8WP3vGKTpNkLgKBGVZWckdjlzSNPc6ehdJKYmEIDm2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnKxnL3/6q51g0NoFphV6iRFidlExCR6M2O8Ws3nCJRB+skkJq1IKFTW2I6cLMy7SlsGqKn2umrX70N6ueRwyH2duhCf+zF8L3Dv17pccZc+pi/I3xdb4kqe0aBVFxhl3KpoRXB/4dIaM47rQwbSmSwjhd0zH0X9otEd+VgLoh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e73pL1DS; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e73pL1DS"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b54a588ad96so3971622a12.1
        for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758617729; x=1759222529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LmOe/TUC6dPxR+8IyjBUrGkE+9gj7B5GdhNTjS8ttc=;
        b=e73pL1DSLoc4Eg6LnaDh/q4c5qKjmaykcbw3YicH4sPSEZZht/RvnjuoeIUkMZLV4e
         241E946W21bdh/KKPXN12RP7GKJuGwcfuIvCu+MIb4zPOwmn22dq39JC+uvS37SLKilU
         JyQn/HZf2PfsLQ0WzbzaH3jnZRM2CiYoxH2+ClZiouFNoomUnOvB0T42rXEgECMpU1HP
         l8YOOxY7pcAloni/kjqJxyk40itelQOU3AiaumZxK43DWrP+UsSnFPVDvXJNzw62fIDS
         kdFNgihul6Jos7It1BEIGL88VvBE64qAkI8dpgEOPRR5zpCiCmd1jiakGWq+ryIqlv2R
         ulQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758617729; x=1759222529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LmOe/TUC6dPxR+8IyjBUrGkE+9gj7B5GdhNTjS8ttc=;
        b=wdH3clTGxApDiJZgfANZxDmM3syj1oL0zX0uHgC1SgcXvHFy8Jz9I7toJ+IG0RCPyq
         R1KgBlHHWRmwcfO/BCe2buQkoVOYwNkCvHstqUxu9Yq7Zw6of3NPqDmscB8R4whqmgBh
         ENfOGTHnn2w8VotR2/e19r0NyvRB1Uj6u9ucQWVeGY4TTUeFnk18/8X4DNTOzxYJx4Pt
         BGPHg//NJjfG5TvA4R3j8VwIXnLANOT9qr141Kq81RqdnXWKS0zyduWdol36K52yH1JI
         pMVO20VzEte/d/I0CL8Qyvq9V7B5a3o1SndDigIOFWQzcdi0ai5Re5caV60UyK7gLUGW
         galA==
X-Gm-Message-State: AOJu0YxmV//5yR7zOs2TsQNmgT6efQqrIuWoxLqZJYxsC5qZhdFhLKBB
	2BhQXRBKRfHgMuPR7sD/qulnaihuEeRcnfpVMFZ6BhayOFsT4ppZTBP4
X-Gm-Gg: ASbGncuzqabrrv48SVL2lxBUnvuQboBE+sC3PakO+OTII9M8ItzylLnGwWbNSKSorqE
	dojP93ksPCvv8v6Z0H5M1SM9gzptyoQZzbNfFYT6qYC/oSlln7cZ9avhVFiHOVR1gtuzuqa4w8B
	dazfSmWcsqE8+7ESUXPOLBxZLwNLn3d0e9eoOrdn2lvapwJlTHNIHzu+ZRi6R05Lt+K6ySddjM5
	fmmYgK6NxMh6FgzqBQqtEZnUfVVqTS36Be77MdRpSL24Y7MIzt24gZYd2Dk++axB70WEuxJaSfV
	2EzlMNvOhN2cLg7P+hkEHOMyMtwRQkXl2wE0msQUqi6tYeWltiKcm+MYkk0o4SEGMJduyTfnXzC
	JeI7GVXif10WrSfI4RuQQxZfzIjnsqg==
X-Google-Smtp-Source: AGHT+IHf3zEYXG5oEVu1N13RNRUNi0JeshmDH1L87WZMXFXOwHIxLOR7kJc1gwAS4OIzkosyVICAKA==
X-Received: by 2002:a17:902:fc47:b0:267:44e6:11d6 with SMTP id d9443c01a7336-27cd63d236bmr22337555ad.6.1758617729406;
        Tue, 23 Sep 2025 01:55:29 -0700 (PDT)
Received: from devbox.. ([120.229.24.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800531c6sm156676805ad.14.2025.09.23.01.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:55:29 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v6 3/8] LoongArch: BPF: No support of struct argument in trampoline programs
Date: Tue, 23 Sep 2025 08:54:44 +0000
Message-ID: <20250923085450.140602-4-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923085450.140602-1-hengqi.chen@gmail.com>
References: <20250923085450.140602-1-hengqi.chen@gmail.com>
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
Tested-by: Vincent Li <vincent.mc.li@gmail.com>
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

