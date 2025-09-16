Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D49F21255E
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758074147; cv=none; b=hZglIxCwCM03ycceFcn40j/LeG+WmE2BOVQeJ23KnHzVtraApwAVzVP5qpnTBQ6QjPv8HVQR9KjIglcGRJ7hAZdTMKz+j8zy6v/V8xQNz+jC0F1vZlaokUqyvZ3Cb0oK7DtuQ+ghz0AxcjjcuwlCbnF3Aa9QpcPGYPgQYKLZ5wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758074147; c=relaxed/simple;
	bh=b+wlsoc73R3mzprzKm4ZB7lafVGRWjGUoe6b/4C9w/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lm0z7PN4e/2fC6lfMTPc6MerJRNp1S7M3ZSOnjgm3XsUnSN7Rys7o3PbUhZC6+GHhm0tuoRiRIOJgQLQtxx5DhT44NB625aaQzWf/zQb5KuL2RbXCWApIiyu+K1VufWkeQNGEntIpte4vbEYU9MZzAUFXKc/Gh680RRrBtoMIRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E59K80Tp; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E59K80Tp"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32e6f3ed54dso2331424a91.3
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758074146; x=1758678946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaLVuTdfin5vsSgq1O3WxZJeAJdQv1igaVbdE362rhY=;
        b=E59K80Tphu8QZT208ttGE6vAoRLdqFK+ak+sUooL58Sgusnk1/EZKhdHB4XTh2F2GQ
         r6okP4lgsrgEXaQ0Wdl/gw5vkuk2tpdrR5NmU/mzufreslgE4B4yFc282QygPY2Hl33g
         AoItqaLFpEGkcrPywQr5Nvs5FTXs7u1GFfD1sHERWUHbuHL4C6CbzhEhkvRMuagUORO3
         GzQI8pCwiIgd5E+Jyel9UHGH0S/iXzPoGSxGiRVEUvYzjDU+/zvr5LRVJiF0FGX46ZAe
         n8AejiWfdvD2RL7KsSlrfdCe0Ge5zJQlryyeTKDrms9Doo0tbGsD2qmGEj5a4jn8enC3
         VOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758074146; x=1758678946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WaLVuTdfin5vsSgq1O3WxZJeAJdQv1igaVbdE362rhY=;
        b=wypuMfPnks2Cr3taDqsrAIo5lB6SnEC4SsDpzSz/Yldm0vWkoTl0Aok8JL8r/nCV+o
         uzJvPBaSC8Pz9SHuQDC48lJySabWjd92ta6xBaEEPXgF4+j/iIWA5dZcPILtvB2sbLk7
         S3Xgwari8Bbt96tXHdxCYSMkgSpeQsrx8XDTozWe2HiSnHYwksDkamlPKs+07Jg1YhmX
         xSDOn6SJxe0ks0NDZ54dkC5gopyvY9i6n2xCoueOEKWrOMvBib1aHdSxiyQxasg4eKFz
         P1YbgR3dJXsNozrcDpCk3IB34XP10mrwG6jp/IvJWuf8CUDEpxw4dR53+obC/1c+J/XO
         oq+Q==
X-Gm-Message-State: AOJu0Yy3ONvhKZ7IqaDg+re5J5f0eckzkATZ4mv1Hi0VSM7GeR2Zh49E
	CWqc3JeqDVMj14ox/kmJap6n+RSVpxbgclG1BIJWdMe8qOYKb7rpL9mj
X-Gm-Gg: ASbGncs7p3RlkCsn/9NEgi8CWPpyJejO9bhTjetfl14mOFcLt3SFbpbaLxQLKeLR/1M
	hTvvjt+vbGkrDz5mH/x8cUM7jfdzaqt8z41OSpDgiZ18nyf6h5DmIKdhb2zVfQ9we2OpVvLk0Ep
	XP6/T9h3k7LDjbh17hKHCPI1Z+MSbENI3KWsrzo09SwqeGveIzOscOs0xIJ70C7ZBe6IKgpAN2K
	8FYN/LiunSK7Tm3yoP94Oyp91ZZEHVNFQHCmME6B+YOXKxUrqkUvbabVx4nDemFGK9mePFnK8HA
	bgq4JPoQPdCL6lM3FVDq0XfwKrL5jXZCFxxZJnx7YnS3DH0hrOFhQEGqTIUb16Kp9yB/i9xmJkS
	0eeZaxQ8djr/Qb5y4gK5PjciQl7c2PwlanWK/7Zk=
X-Google-Smtp-Source: AGHT+IGSYdxFeD4ODOuQZVmfOZ/CzicblPqwPj8c8vdYXNsXwUoinvebZZIQ4BXq9Q9mrGBhTz8+ZA==
X-Received: by 2002:a17:90b:5448:b0:32e:7270:94a0 with SMTP id 98e67ed59e1d1-32ee3fa63c6mr497170a91.33.1758074145741;
        Tue, 16 Sep 2025 18:55:45 -0700 (PDT)
Received: from devbox.. ([43.132.141.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed278b065sm839746a91.29.2025.09.16.18.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 18:55:45 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v5 1/8] LoongArch: BPF: Remove duplicated flags check
Date: Tue, 16 Sep 2025 23:56:20 +0000
Message-ID: <20250916235627.102831-2-hengqi.chen@gmail.com>
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

The check for (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY)
is duplicated in __arch_prepare_bpf_trampoline(). Remove it.

While at it, make sure stack_size and nargs are initialized once.

Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index abfdb6bb5c38..77033947f1b2 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1453,7 +1453,7 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 					 void *func_addr, u32 flags)
 {
 	int i, ret, save_ret;
-	int stack_size = 0, nargs = 0;
+	int stack_size, nargs;
 	int retval_off, args_off, nargs_off, ip_off, run_ctx_off, sreg_off, tcc_ptr_off;
 	bool is_struct_ops = flags & BPF_TRAMP_F_INDIRECT;
 	void *orig_call = func_addr;
@@ -1462,9 +1462,6 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
 	u32 **branches = NULL;
 
-	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
-		return -ENOTSUPP;
-
 	/*
 	 * FP + 8       [ RA to parent func ] return address to parent
 	 *                    function
@@ -1498,10 +1495,8 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
 		return -ENOTSUPP;
 
-	stack_size = 0;
-
 	/* Room of trampoline frame to store return address and frame pointer */
-	stack_size += 16;
+	stack_size = 16;
 
 	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
 	if (save_ret) {
-- 
2.43.5

