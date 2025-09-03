Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8546C2F83D8
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901163; cv=none; b=EfMprDKd+GoxVI5z39wL27mAvsZZaIhWSyLAX4+FB0s3+M7jzHBeKwK8zuEnpxSHGnBTsZMJEzkB66y4+ZdzLf+/ocFLTPDJdplg99+ievb2Ba14ClIbErwCXUmuQ6Dv1ljQLXF5ylR2ztZvQGzHMVqKfi005TzXj9st+BK7uJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901163; c=relaxed/simple;
	bh=5dDbIvJNgmtx4IGzBLZg0NpC0MsewwgLgxb5EiPL5cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxIYynDveEs//m62gBUwt5+DAgJaQThnhznMNhPYqITun2MiLKiGRzENM4F9+Umuj/dRVnwM7dDcVoWtJZ7AqhzeSgVjMDQRz3rqqCHCLGxFMW4uCGORnfZAUuoRrUnGgAGsiG1ewFIDbIog6OclFvbhPuFCMdEkhfrtdNY42Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZtVUCkN; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZtVUCkN"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7728815e639so109677b3a.1
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 05:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901162; x=1757505962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqjAiWZ1cR1dST2aN/78MxdocUsZPL3/fjHVYRoFUN0=;
        b=KZtVUCkN8R4VOzQnXPlt76kx8SsUk2OQk9BErcWd0sFWBoAsvBDmp8lP8IK1as+u1Q
         EBR3QxlwVhfib+IGbrDMn0J/BXVq7cPebHDhdPdYGA4zwJ63AFW56/7moEKKGgJ4iqN/
         XppbIsCYVroyLbxqkyVwVkOl9cb2WyMJdORU9Su37JCZPMCj0RxFvsBzWi4tmmpWVOpe
         PwAfFSILMBHGXYY5wGvHGMChIQPABxKxmgwyYBeoj+052QnH694XZY/4xGmWVB+2LJ0C
         OfbXE1N0CeaQJEGfLE0EvEb24Ch+MkMMBoGevjvm/UJ5ZZtFPxHrGoZKCtwow0B4mLpk
         KNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901162; x=1757505962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqjAiWZ1cR1dST2aN/78MxdocUsZPL3/fjHVYRoFUN0=;
        b=B4PS4ZjVxD15skb0MAOSb26pJKIOaCDhL61pvWyqKjm5Ig4svGMJEr3MRJNxkQVVVi
         WAyVQ+Jy4uqtxQlsYO20FtGN+WW5/p9HCYCB4+VuXNbK6XzIJdv3zxHZWC5prANHpJw/
         f2XlDHopna8a4eJWgegPGsFZ+vt/Xsr5AdNyYvcbLSdffCQpsbzTrDtkApRefMqzsf6h
         QJAbCU7WRrjT0KqAmG6IGbv67YyoQCPuhHszcGBdrBKl0mGqPNIeofsHci1lR2VBy6Sx
         ojuddSU3YUOSKmh3Ts7GaOaoE3MHZimrq1yL+KfqcRxRaTebLZ9hH91zV+aZZDjFWcjE
         I2tQ==
X-Gm-Message-State: AOJu0YyCqunk3Y3n5cCjeG5e+kw6Ad/xOAb1OkBLvK+hxFle4bO3/uF9
	g2HZAv5HTQwTa+Ry/51iZ3E7vheQP6i660p8cO6uZLybPQ7j2ek7qcYA
X-Gm-Gg: ASbGncsU81H9rVW1G/hxy52gglKKEfTeSdNAnFyuXxrQ5uK3QPtzw3X3aIu+r+3P4KE
	9SlUmehLlsYbb4J+kwzh4YEauWw3HshLguAOj9A8yOxwdYTfOUlNuP+IthoW9MjbmlXhWjeCvGe
	8dC8SuvVGA9Ishjgb5T7aiqevrl9hiUpOmClqUBZiAkoHucxZq/rCjH/+XA6V3jdOnWQ+Eef7+X
	4iYptH6MxV4SznmDk2sC9D666ZbSKxmrxSA+QfVDMV7hUsvrRiakqztQjdFf6lrm1rILXHemn4H
	mBRqpGLOSIH/tQKTQhU4wo/5gq/ec+OpmeDRR02UOiIN96LFucOl+IUnATZ48koKFfRazl5Mfh5
	GHJLRd7buA1I07CWa8FczCUvwH3+MhVWHSy4S/WI6UqTDhAEo6HY=
X-Google-Smtp-Source: AGHT+IFvlMGO1VcR9tw6xoXSraCk/hiXxfzc5f5WoxegTxIO0L2E/JLNbw9ljWufdLXNDN5R3m/PgQ==
X-Received: by 2002:a05:6a00:3e04:b0:772:36b1:6352 with SMTP id d2e1a72fcca58-7723e36a2aamr20719726b3a.17.1756901160220;
        Wed, 03 Sep 2025 05:06:00 -0700 (PDT)
Received: from devbox.. ([43.132.141.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5014desm16615899b3a.92.2025.09.03.05.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:05:59 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v4 4/8] LoongArch: BPF: No text_poke() for kernel text
Date: Wed,  3 Sep 2025 07:01:09 +0000
Message-ID: <20250903070113.42215-5-hengqi.chen@gmail.com>
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

The current implementation of bpf_arch_text_poke() requires 5 nops
at patch site which is not applicable for kernel/module functions.
With CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y, this can be done
by ftrace instead.

See the following commit for details:
  * commit b91e014f078e ("bpf: Make BPF trampoline use register_ftrace_direct() API")
  * commit 9cdc3b6a299c ("LoongArch: ftrace: Add direct call support")

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 7b7e449b9ea9..35b13d91a979 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1294,8 +1294,11 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
 	u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
 	u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
 
-	if (!is_kernel_text((unsigned long)ip) &&
-		!is_bpf_text_address((unsigned long)ip))
+	if (!is_bpf_text_address((unsigned long)ip))
+		/* Only poking bpf text is supported. Since kernel function
+		 * entry is set up by ftrace, we reply on ftrace to poke kernel
+		 * functions.
+		 */
 		return -ENOTSUPP;
 
 	ret = emit_jump_or_nops(old_addr, ip, old_insns, is_call);
-- 
2.43.5

