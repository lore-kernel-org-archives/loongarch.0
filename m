Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3338621255E
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 01:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758074153; cv=none; b=hkn7TlCajVpGbShejRQuTqD/tGdP7oMGvnMKLvlFcJRN1DTqHfIz+U7dnqCr78Ji6GrEcj2D5iBCUWg5/1zCm9KRgX7QdtsItOTmZLiBUIVU1oJpFczJCV7Kp/V/KhUhnIAM8+6D46iRze4LEljF1NxkWfKQO7QxdCXKwcBixh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758074153; c=relaxed/simple;
	bh=8WP3vGKTpNkLgKBGVZWckdjlzSNPc6ehdJKYmEIDm2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5XeyVIVNq4IqdX8JtGWUH4NPxckJ7ZaVFYRa5/sg5XD5UDmsx4KmF02zyo9Oz9hfPAo8tX2YgltdK2RUowYeQucFpdEgtbVllnzWV7hPp7uRhTe3p4t/6jgrKELwdgENSawlkMwvGXmrHo8qwj0ZlaLRZYUkmHsB6YsUoo23Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVLG/xRK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVLG/xRK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32e60fa6928so2816470a91.1
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 18:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758074151; x=1758678951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LmOe/TUC6dPxR+8IyjBUrGkE+9gj7B5GdhNTjS8ttc=;
        b=OVLG/xRKBT2/oVBnB7LlNU3oD9E8+j9G7oZYoBLKTWMB2Mfzeb5fXkZXf9xIkY1y1h
         0eTujtW3sM9v19xzZ9/B+e/mUVPVXcuUiy0RHeWbN3xY147I1QTU2IXsuiSWXXtGrodQ
         4gP79XxkuuX+Y9wsMl1lNcXkUJiQww5WdR4/VHytlOMgTtL2MhSRTQZLaXQI/8s3CzCj
         syTC8F1STbXtcUNBxPONHOBLxNDfHPS+U8SRcVi3vlVJh2JrDLTKbl+lTMBhP2pKqcLc
         5+hk6fgnaRzaWE1fwCZx8cNbbXWlFwExGIZN+Q/xOd2R06gyIXft7gC8auE5XpMnjBpf
         vC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758074151; x=1758678951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LmOe/TUC6dPxR+8IyjBUrGkE+9gj7B5GdhNTjS8ttc=;
        b=lwxFHBp21bQfoTXFu0ZwxEJ3lFN3zacwlVc0wkT3Y1ywQXQ8ZH1IGFX6jt6Ln8cGWS
         kXvaZrefvnGJDcmpzO6WRRUp8rPy6GkuPBKhYZH9Sh0zWqXhixPgR7Wn2J33xs7sAI0x
         cHedKOgsv9LYtRiHd72B+3LFE4msnAhx3vgpigR5InCI9fZJabYTdiqJwNiDtkNiTXR1
         c9R08/3F9G5wUWZPSE/LMhknMM/GKreBXh9cvBYiMjjTPeAP/B7ec2QPVBWX3Vx3yzd3
         1+oZxCm1Z1uPXmW/dQED93S4JG2tIC9lijYjTmxxP4NLRTzNMV0BijnndtMNZ+9nTHBg
         3t6w==
X-Gm-Message-State: AOJu0YwVnBoPNMnR9/GgUzhnUZMB4Wsg1JMvl3AQQpMZ7c9RJ6ZYgkgR
	3U56TN9BPMKfKTF/vERmQNgy9X9L1w0/Ihpz/Zl9Yw5XRUazuvfFvKeY
X-Gm-Gg: ASbGnctvaOBhcE5cN7kLjBWmPcdJXsAH5E7bTSA+XFOMN2N1Y4hOGWdXC+BIe6LtUEe
	xr0UbsUPp0AIv7n6MqgmJV0D/SJtyK04EKHfg5HimKW7BZV0+C6TCsr+Ka5LftYbgftWBnX4FbD
	YWxbL2K2tElhn9EsQIT2IQLqRXlDzhfqBvSejOnl0FZZT5XlIxS29ezxPYDUDQaNvWno5kzOE+p
	DWm9UNGO8ix5QU4A9cTt3VEm5pQlss2D1sJR7Ck29XgYbOfDp11REU0lU6LmZyfAmMppbQoo/md
	JtL2lGQ2DGoS1HR3JH6IzrYXnyzlfLpABRRkv5zuanpoUTN2gtMOVCzEapA1Cf0Scylh6BM+Qy1
	4dYN6M7rOecIwkL4BV+P3s7nCGW9AZv/0H4+1jYQ=
X-Google-Smtp-Source: AGHT+IFZmjSC2h5RaZpElFva36VdAoALL0hizqP/lKQv+/DsxgLe+zgKQr9/rlIk3XruR3e5vyKtjg==
X-Received: by 2002:a17:90b:2707:b0:32b:d089:5c12 with SMTP id 98e67ed59e1d1-32ee3f52889mr597522a91.33.1758074151520;
        Tue, 16 Sep 2025 18:55:51 -0700 (PDT)
Received: from devbox.. ([43.132.141.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed278b065sm839746a91.29.2025.09.16.18.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 18:55:51 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v5 3/8] LoongArch: BPF: No support of struct argument in trampoline programs
Date: Tue, 16 Sep 2025 23:56:22 +0000
Message-ID: <20250916235627.102831-4-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916235627.102831-1-hengqi.chen@gmail.com>
References: <20250916235627.102831-1-hengqi.chen@gmail.com>
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

