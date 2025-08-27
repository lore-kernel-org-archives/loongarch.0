Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BCB1C860B
	for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 11:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293593; cv=none; b=WCw66uLqebdPcuJs4vV49WgeJpInudpStGPzh4VLmrY11x8AJoOkXBLj1gE3e1oyDUW/GQwC7Qj0JcnK2L4HlrvMXewl8VHNHtTZOXV6fF2gTv7qs6p8wSX9DbZM89dpumFWNe9BO0uFeqxNCZMkYXqlqIsAqOnZI2nBybsuJHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293593; c=relaxed/simple;
	bh=yHSDgi1Qf9GLhybcnjVhZnbU0unpf2VgIN/ZDmjE2EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HA5bpNxHLRSBnsXVYWlVLnpQOsdLvCr/wH2MSQBbI+Hi+33uGJziIlJ3KoEon8Cse0Sm8Gaygm/d+i0xOOLT+5xn+gMkdRUcguo3uJy3LuPulnnWFJpx7ScSiVxr+u6tbqRWSpcsXZtEIlY0acgoh2i2uN7Le0fdZryRhasbSoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cG/r5+eU; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cG/r5+eU"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32783de3e87so252991a91.0
        for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 04:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293592; x=1756898392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV5B7+M1QeZLHSg/ECAdc/Y6fwTVPknY3WPmdEU6CxY=;
        b=cG/r5+eUYR9NM5B9hpDM9D9nBE2v9NeG/ZKlGvCkFfQSsyaxQ0DHPVTfnODhSX3j9Q
         ydInBzArXQSWinhSxFkKq8ZDuFj/Yobqa3egRNCc4CzUbf1V9WPSzYtJaiOgydZuuf0Q
         3qFcNXaDzWv7Y8y/LhGhFxFGZC2Wwa4JiilCCD9sp4AbR3wTdmExwM0Zs8XiiRoxSo7J
         WFSL+np47apHxkSUdkLz7uGCJurTF0rdnf4HcrQcmwaNOGEPW3tvb2Apm1DZbao9KnmX
         /pmyI/q//nctkv3iREWNCnPzRptMiseL270d48gYsudKQY/d9bI509cKr846DISv3lA4
         GcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293592; x=1756898392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WV5B7+M1QeZLHSg/ECAdc/Y6fwTVPknY3WPmdEU6CxY=;
        b=STeufn+Hz5FzCTWdsXxjF31jxDWV1/f7wdQ9uhx+Q69lugIs5Ar/i0oDrW/mMB2r1j
         RO7bdv+/JIxtDNXo7B04CxKBO1q3a1Qe51R+CG4utytZ2BVehVblfZATpZ1H7o/Sf9oS
         UcdA+MbRfVtGiuuf+BTwYfnPRl0QL1C8H+uBYB5U7RgK2sHbv6Aru4ZoyY08nN5VEFMo
         JKtcdXCZDyNxS1jQcpAxDDOtEUSIbRZDl6uzKYuNxezUSBkzJ2l4JPGi5KKSRGd7XmKv
         bCfQ250Aj24vI6z82ccVKS+0XyRpMz3uYgQ//uxiApYbWcCAEgL9MdMg/Ci+dTbb8OT3
         3Msw==
X-Forwarded-Encrypted: i=1; AJvYcCUrCjBlUqbrDLAoyrtOfPLmseW4ml73etfpIS7njPlW1CrZNF+eQo9AIdkFphfCQXgyiYYYQzXhupA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTeFhzOnOg1fAvhB6gUJgu7qdoDSgmwMGg6NYwEnqvE/9wwzv6
	P0XUcYs/3ueZapNqn4nSi3soy+dbyph2dLCebJ3g8w6TxlYrwrZLAtUxSDLEkLHi+mI=
X-Gm-Gg: ASbGncuhZf/oJsGERfsV4rKplU+Db8i/IS0hEPsaMTUJa2YinwiJ0RJ9QjCbFHZCjBw
	66EHfI0J+QQMzwR0gj2FEEWKrx/xHo3r8O7Xqo5U25Eyay6Em6z6VhfucD5AgrbmGzfzMpMrvWy
	LFbzRerMz55zrF3aTxQMkh3q36eVQ3VW8JhtJVGUBLzVLiFHmoVWe7uHIlW0a809C3Yl0xZZp9O
	GEW6SYnLkgLvaHMb9DPFbCm5ggbV9lhKvuZvhP+PfqIxBxAuXqsl+RePfMUxK6HeXWKgTQutVLp
	HtF2N5chuHFShdI449ljO97PO48hbOAb6K70ZbyE8j2oyoGoEmYMQhlZtEy0RzAuS3MUTwHZJlh
	mnf3kVWXMHKU4tZs9BEGA+ZGQ3u4VoH8qXu0b3ASG
X-Google-Smtp-Source: AGHT+IGfxF9cJ3Lkj2hZ2O+9EnfpctZUJ6j5jfuIKVnEwz51XZgAfdOFoqHud7kKXEwN2KBfHWMkPw==
X-Received: by 2002:a17:90b:5350:b0:315:9624:37db with SMTP id 98e67ed59e1d1-3275085eab1mr5869532a91.3.1756293591401;
        Wed, 27 Aug 2025 04:19:51 -0700 (PDT)
Received: from devbox.. ([43.132.141.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f8a3335sm1829729a91.13.2025.08.27.04.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:19:51 -0700 (PDT)
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
Subject: [PATCH v2 3/3] LoongArch: BPF: No support of struct argument in trampoline programs
Date: Wed, 27 Aug 2025 09:47:33 +0000
Message-ID: <20250827094733.426839-4-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827094733.426839-1-hengqi.chen@gmail.com>
References: <20250827094733.426839-1-hengqi.chen@gmail.com>
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
index c239e5ed0c92..66b102ed9874 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1514,6 +1514,12 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
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


