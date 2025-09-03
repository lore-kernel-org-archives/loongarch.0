Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AF227A12B
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 12:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901151; cv=none; b=sBUcUdG1BHwmM5Wyv1NNqsT/L1BKJ2vHRSshI6dMEHyMltiUjmOgP8YQ+ZVDT4CQ1FK2MrkJnOeY5YqftRD63Ju3qvOk1FNiTeEcIpLCNAsF7nzIdfBL5hJL9O8T011LK8AS+VDrXbyaHyhBL9hg9ez3KLoTTsDtykFNC/S6WII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901151; c=relaxed/simple;
	bh=jtB0lg4+UxGfKcVnXtonmLXk9WpPXLrO8CmyZwEGNVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uEmgrvNKd7qwxriXZHo5M1hs0UqxjAyzRdkOvavdjIa/GWjMj92ziCbjJReQJKDL8n46/qyEaHHooo46OLg8gh7TwlIvIvsUpOQKCfIvV31dEJYqX/D6V6u6XN/C2JNpthatdC3FuiOPWIq4uLx9hjn+3okm6zADiB/2YNZgE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5XZvr/S; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5XZvr/S"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-324e6daaa39so6225228a91.0
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 05:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901150; x=1757505950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaPFkpRKUnfmHG1h2XpW/23dJvc07ZUJRoXsS06YXxc=;
        b=j5XZvr/S0LK0HZNmtVbRBnv7zO1nmWV88RW7ED+Wg3TOreBs0Qmn6+0WnTf3XVw+ht
         nA+TkQ8mQp0AyM5rEG7oPJNUQJyaheN5ID9F5OeBxi99LLKOD4G1qHljfcsGP/oax6tp
         gNDSfQ6ITvM1V+uivpv5U468qzH+pQWtpBLVhhvrmikpWwolGjbzvoonWW5TLrrtyEgZ
         7mnXHevW+SaW0A/NADg18ps83+uxiHutrS8h2XIHvI/ruHI54bnYqlIHarXlsiNkiQ+2
         jYBbDuK4BG1iV5d6tAas4fLZytBHJks2YEh/WvTJJJ7Hjb9xKwmpowPdkRaV3PlCKolC
         7DUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901150; x=1757505950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaPFkpRKUnfmHG1h2XpW/23dJvc07ZUJRoXsS06YXxc=;
        b=vg3PbkoszRd7zFoCv30v0Vld3cnrBONU+AdpzpAdpATkwT8K+cBmt8TgnjwjqG+pc5
         c3AF8ygcgbZChuxyMxV3eZm6suGXUK3PrlWcMySXE6sbnB6bR9W/CWv3XWkxj8lW3Og1
         14oY64tvpEX2VZaf9Iz4LWSfUPvmuM0NB8dCe8CcVpR7Pbs0xE/wfnrG00fH/sOATuND
         L0m6Mz6aJ1RsP800ZZcghElRLccymIJE9lx2N1XCwJQRZEH16oN91DqeZ43TGqHCds4Q
         rjG+GAXYv8eLcck6ADDdFUknGMdvrnWMO1ttJ2blgIGB1vxHKtpuygigKLI5Ws/eaekR
         mkpQ==
X-Gm-Message-State: AOJu0Yxgk57v4ETRCIQZTcbaUyXIrifjFm2abTcOWr/YJJTeNEC7G5R0
	5IXKAlkhbgEuQaLO06DMRH/rFBLangULVSUbmJ60VTWqRJXvt3Mx1o13
X-Gm-Gg: ASbGncvHp1wdkhpBhvNqoJYB9IXWQLeCurLS78sBBODSoK41WAlp8dVzbG+sf5taCCj
	+tFPAYlpPQHKc2wdjTjqwhiOWIOUlJRVrygnZnUQwMZloVb07mJSBOn6MgtiwviUq+lDBNJLYgO
	4XMJ9TuLCfQGZG6cOg8Qm9pfafhJWa5HwFnWxX9/WOKLk9ZEy2D1374BoxgnFQUuGhylgpktWxP
	2QlLwIg171gExvyi48Q6LM1eCXwZ6jL5YHbg5yPJijYwF/lTZfdUI12wRZnTjDQ28GQunmT6G45
	EcE6E2ccOiAvXfE7lYuVIv7HXYnR5oKHNNkPiUsRTVydesXVfytRdIl3m/tG8YvXpJ9vaEvbudN
	w3kPuIoaDezAOdINnSFy4dedlphs7NDmsOU7HFHfJcXJzKkzCT74=
X-Google-Smtp-Source: AGHT+IFbmpMARNy0bQl+OCKbkvIceYcRiqKcNI1sC/X9AoyWJsP6W3vcuWyE+o1vVvKLBk5bL0xfzg==
X-Received: by 2002:a17:90b:1dc1:b0:327:8c05:f8a4 with SMTP id 98e67ed59e1d1-328154140a1mr17793434a91.1.1756901149471;
        Wed, 03 Sep 2025 05:05:49 -0700 (PDT)
Received: from devbox.. ([43.132.141.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5014desm16615899b3a.92.2025.09.03.05.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:05:49 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v4 1/8] LoongArch: BPF: Remove duplicated flags check
Date: Wed,  3 Sep 2025 07:01:06 +0000
Message-ID: <20250903070113.42215-2-hengqi.chen@gmail.com>
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

The check for (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY)
is duplicated in __arch_prepare_bpf_trampoline(). Remove it.

While at it, make sure stack_size and nargs are initialized once.

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

