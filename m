Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D40273FD
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 01:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756691762; cv=none; b=qoKKKwNG0v5QnERez7v9Keudc0teG/iFgU+p9zxpKFKwEYRk88KyIY1ZEqDhkmdwf2Q6Z9dAB0y45WaijsHKV3BElnglu+HkkNdiKOe3rMdNdYugbKqmir+k9NIKMYyGoS3o5e+bCVm/zK4aY2kVgn/oRo54fn1yGOkzyeAAlng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756691762; c=relaxed/simple;
	bh=Vv5nWDsBfvFh5gXENJb7BO8i7g3KvOQzZ19TXICzxUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJ8JHlnsFRDOhD96M0JV9Umsof4IdThUfEzavi+aJd9EP3X5yAZqyE8mEZj+ZAfJtG2xC17kGNEcQSshAEl9Zn3tzmtkmBfKjF8IMV4F9irqTisgz3lg7zBkMCnD+O95veCxmJ/WgVbOAwIkcjmgi0nQGDh98FC6VJX2gKS231k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCZ596Au; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCZ596Au"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b4df220483fso1276532a12.2
        for <loongarch@lists.linux.dev>; Sun, 31 Aug 2025 18:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756691760; x=1757296560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awqDGIOoJDBhXrLS6/xu0mzxP26rx/9/XArGDrUe23M=;
        b=CCZ596AuUU8X0EZa1ky2hv/3ENUzqF1EaP7tdu8xwQ2etyulJs5xnQSs6qHL07SnPB
         S3xaVGoKVW+gO4w0aygcWA4b+oHnDWVJQuPl14knhZCJTVpVJD+5ZJj3v2ITjAGNh26v
         Y2KzpO0504SffYcAV4+mxLWQA4istaYfDSi56udh227jytZK8Nf0DG2CYQLx4jR26Cmw
         j7tfjzLE0FxE6l0HnWvn/ibUbQJ3ICs5KvC9MKXX7W6otsl5mFd6zpBqINHjfLBPl3V1
         gKQsnuL9Z6sbovNc7+HvUvIU3usayh75ofNMzUSbC8jWPEDK+Qk/Vb5FxQJQ+23y9/qM
         kKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756691761; x=1757296561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awqDGIOoJDBhXrLS6/xu0mzxP26rx/9/XArGDrUe23M=;
        b=jJdxhOWZkxNA2LEbkWmVeFDICLKklRYqCSYKrwlZ4jPwkbgtATCY4Y4jZIIqb5+OJn
         kSwq+meJArnru1TZFSAg8OxgoGMUxbXyjwMs10smPA+M2427JXAoH8gxDyKQ1u7FEZmC
         oi5/+EB2CzqBQjvIuFcvIIahMn8lXbo2Xsy4X6WL0ayYVsVrn77wYi/kbE3jz7+iTAJn
         E1vUBRQ31Qw4fWhMOY5tyRxcJl1o2U+FF0rBp37so1Vk0OO7QCLHLWP1DBcSCTlx50eR
         hwr7ZeIu/8pso6ZMkLcg6XWk9u2V0kmH2Ri5RVOSSZ7bP9EMS5HR3WpVuwulqsLG+EDZ
         Xlmw==
X-Gm-Message-State: AOJu0Yy55Vyg3MuwxDum0BPC7J2sBUqRcXcpftfK4VtxwNMnUPtL1SZK
	ziXiKpDg7Y7dmFlsdv6dqpqa1Z2cKs9m83d1Lc4pzFQaF6iY5quhyybU+zsBy6qSHfk=
X-Gm-Gg: ASbGncug9/uAAnwo4cQk7fLluuHQYZcYup1NeD6S3l5aHhvH+fTN9y2IjcJ0OhAe3Qf
	w4ZS30NN3BElopAvWGC3viRvRpGgigCZLAMnK5BCcW7Q/JSAqIC80KJwGIWMM5VORQp43qsMZso
	nHUel1XBJ3BGLqT4k0zLf1j0X+StOOSrRCMEVXbOpOjhQOwg6kduAZ+STWfO3pMgwwNcnIEnnRB
	uW9YzNVHquNFK+tyR7eoKmzkzKPs4lDYImzlhI6u9Vv3vEXQGcSklRxK+JxTcKr1vd+rkrUviFh
	4u8cOu8sI9xepxEt9YPwVQaB3XBO9CmSkjNzl9F68cCWGYmY59hzgnSPzMkV7bU+60tJwPcQYsM
	S8PWBUB31rNSt6q8+F0RxhAkX2tAOUEhLBd00qHwOQJEit2eRJw==
X-Google-Smtp-Source: AGHT+IHNyloEYmmxNNx3OHK+FA5DOP/PABOQlUKljsqZxAF2YHPLIGYEmnsNLl3YKH8XO2lvdRLpLw==
X-Received: by 2002:a05:6a20:9183:b0:243:d209:cf86 with SMTP id adf61e73a8af0-243d6f42004mr7921998637.42.1756691760492;
        Sun, 31 Aug 2025 18:56:00 -0700 (PDT)
Received: from devbox.. ([43.132.141.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006c340sm8103034a12.1.2025.08.31.18.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 18:55:59 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v3 3/3] LoongArch: BPF: No support of struct argument in trampoline programs
Date: Sun, 31 Aug 2025 23:43:28 +0000
Message-ID: <20250831234328.22440-4-hengqi.chen@gmail.com>
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
Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 0e76a0958142..8de618ca8a4c 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1515,6 +1515,12 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
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


