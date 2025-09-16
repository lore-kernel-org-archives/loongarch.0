Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047A621255E
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 01:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758074156; cv=none; b=uDbvDWGnIGy36w0PsnoGJDpbQt4tA9uJYmAx2qf51VuabbTeHC5YsHiTAbqhrOq6ZXE63Xe5IHFtWzQwexHD++JV9XRdJSOM9D9S5QHKcakSGUWklzYEHA4c2aKnbRhV7fY2YP32wng+pOe6hkI4w9ZcbAQCg3PRsopeZHw0F3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758074156; c=relaxed/simple;
	bh=LUemA4N08X5oDb4xxfSMdr2TmHBXwmyKrepX1+wihzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cEjtXVfbje+lUsKrzwUqt3NcAPvCjHpcdqo+UUeAV7eX14sLml/sheNP3n2GcFsz08jvFYF7Qtcwlf1AnRVOH1MdxpHEai6F3MdinlM0JJc+7UgPDWmnNMxlx34V4QSphGsvARIP9aBsdOQ5IatpiaeWqQGmuaVRcPVCYWTjyps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXLixQwR; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXLixQwR"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32e74ae0306so367003a91.1
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 18:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758074154; x=1758678954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaoQaQg2GZ4ysBsECGEcp1W6hQwHJZzYlnTF1RhwwV8=;
        b=cXLixQwR7SbCnhJThHxxMxqCH6/audYH33Xubb+Ok4RhXOxl+JBsiAiVnCQPy212II
         RIGe4xYSc+HDV72AFUlYFF+0G3X6LqtKrd1+Lrr9EnXAIdWcLsd8i2iUgzUJHA/4MwwE
         SPa+oK86tH6uDcEinHgtgmJBwJCvoLLk0Wc+5l4QUfYWfTwlFzoJFEVaV66OHWFM2zSv
         JA9QcKcEByvP1OoWxB+4Y4CcQd4Elv7Rl8ZfosWTisIy27RHXGIOKZKpXaUtJEpVa+H0
         el+AYq9M3EK7r91QmDzyenHepvCw2vCXYA975twLU1r37F/hNVh47wFoBdW22P/rthvr
         I39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758074154; x=1758678954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaoQaQg2GZ4ysBsECGEcp1W6hQwHJZzYlnTF1RhwwV8=;
        b=JllkjbaIYGxFaioROk9kkvWaamImEtZsMbHGxt8NltxdbJSYA3HaR7+GyZ7sHcEvsO
         msdws+ZQg5GVa34GsnNOFIOx5oFlYtQKzrex1JAUYjqb+4YtU+wh794FaZ1fy6JQtPZk
         AR5WwMEBZfHDyf3AAJSjSOxSpAfxdcEqAa7cWhBb7wsuV2sIhxMFf6kSx59g8Cv4mB/w
         noDcNxPDAOKVNSVADGdDWQR3d/1UgoYioP1xwM7oSU0w9pevJzaA62TZm19KRx13qCzZ
         gN/tAPKXGQcdLkXDsYFWwP8igiADjHoksKXtWGsF8QRB4StO/BOeYgjTvDN688xky2Ze
         h28g==
X-Gm-Message-State: AOJu0Yx6G6D+cvkttsHdWJBZCu6DhXTxY1p4NogSvpYVVosN3YfG7ux+
	WMc2QjGr9nmOfQzTuwczQhTcyRFk3R3PhLzzInNRKyczc5M3lJux0DbI6KYJ+fV1
X-Gm-Gg: ASbGncut/1po4J1w1s7qQgEfvYQRV6Tu+k1j5nNoAqvmjoYbw4lhCvdW98R+ye1hGYy
	vthus6rzEjeD0tDEpnqiVef6cZARaP7dHnKR6A96yjIMpJf1p8wfWCrxmJh5hHvi3A6jioxXWdU
	x8C13IgtAXOc20tniNMjFBm9J40GgMjj8J6Kb71Azx/AP9WuDXI1r++HSPD/0gxmLjYsgmsjVol
	77D/7yL+3/ZI/5rh7/nglAlinU9c3oVIGUVlkuvB+TnJO6eM/VPoxE0ycJ0sAQ2bOG+grzb4U/w
	+o55R1X4XCiGsMkaugg2M6jyYvMhLcVE9LPZN38IWx+zJF8xnWYJReSaswhUiCFL1Ia+vBrq5Jr
	/FGu4BbcfVAe4drE4KKO7Uw/gg19oWCIx2yGnCzw=
X-Google-Smtp-Source: AGHT+IEoOiZMF1fa+aBzUXPK70/O0+Rt2f4TIXypvljNqmA5ICTBNExAOPPN5HiGjjLHS34T3jRQqw==
X-Received: by 2002:a17:90b:33cd:b0:32b:d8a9:8725 with SMTP id 98e67ed59e1d1-32ea631cd58mr4826726a91.18.1758074154248;
        Tue, 16 Sep 2025 18:55:54 -0700 (PDT)
Received: from devbox.. ([43.132.141.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed278b065sm839746a91.29.2025.09.16.18.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 18:55:54 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v5 4/8] LoongArch: BPF: No text_poke() for kernel text
Date: Tue, 16 Sep 2025 23:56:23 +0000
Message-ID: <20250916235627.102831-5-hengqi.chen@gmail.com>
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

The current implementation of bpf_arch_text_poke() requires 5 nops
at patch site which is not applicable for kernel/module functions.
Because LoongArch reserves ONLY 2 nops at function entry.
With CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y, this can be done
by ftrace instead.

See the following commit for details:
  * commit b91e014f078e ("bpf: Make BPF trampoline use register_ftrace_direct() API")
  * commit 9cdc3b6a299c ("LoongArch: ftrace: Add direct call support")

Tested-by: Vincent Li <vincent.mc.li@gmail.com>
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

