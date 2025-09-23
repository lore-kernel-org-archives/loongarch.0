Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD8231E0F0
	for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617740; cv=none; b=rBg369Zd/quTeENinlWz6C9zRXxgaBTjmAVbZz13TlwVbvoyNoBeN6zrmDHtxwNm4Xw+7jrZk8c9D5wJyDOuG89SvDZIaMG4kLiQSKSUXOE4KAAUgSoKvGFCJ1V/mVwUvVkc0vxroTqZUo43KwnuWqreqf2795cHqJGBtZFKWSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617740; c=relaxed/simple;
	bh=U5ankppA0Fbik10WvbYgQWOpgplXW08aiBpb2I9wzTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYfZhHC9az8OZujN4wfBZclc29meVCTvzpWUnrP5mnbffiItZsOjAVVfg+x/nSpkNv4rQu+ct7htBmXH/WLZiCSOV8TsbJLgKA/Jcy6lg1sz1uI0FkuQFGiZbc3IaGXN7ccx17KGdKFunPnPWggxibLXEQhl6DrvyhVqobJypw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2bcwvTC; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2bcwvTC"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-271067d66fbso28931275ad.3
        for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758617738; x=1759222538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdOzmDyOFs4IOwQK3P0d4e7en1vFeF0HoaLHdpopSlg=;
        b=F2bcwvTCVsqlzEHnPltEcKBfxUPKF63jQp4kXUKMDrtinuLqyBUSbPewFW4qamGfC0
         9lC7jt6SiHLy3k2dHqyPY5QtB/LBXQFQo1rlRvUuG0x96C6hnR6rtgdP3kHbsDbNryom
         xdrhCtJy1Lr09yPxmn3XQITtQNJlUJkssHa/3zCwLtMYJjfEMlEOriMJGAawBjz5Tl7h
         UvUnT9odphLC/n6hKsu0DfPLqikyomWXE5+79pl6kSBDR7u7v0NArrqWuJVZbVExIFkp
         5992B1H0+zm1hTWpTj95mOlDECseh0vFCgquLRwlEHUEb3fFghlNAtZ0UxbjfSDAi3j0
         WYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758617738; x=1759222538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WdOzmDyOFs4IOwQK3P0d4e7en1vFeF0HoaLHdpopSlg=;
        b=KS+iHKtxEgzNZkYSrs3/n89gWHOS3eo632yG16B59f1WdTDpOtyjtRq8BmAW3xRk7U
         ae22qpGujkRzibrLzWEAHssJ0jSl3br/HM9tBw6VmULHJ5396yq6IqmGJ3UU9C+w/+5G
         Yz6HOIUpV4PHFnOmnT4QQkLsNBQc/h+3NaZ+LUbbhw+nTWhSSHOR3fcTUUKdk8tivSuZ
         hf0mWxarawpMX8/zilT/R3svHV+SfCSF7UKaXBaNAe0weT3GtsgttFwlKFWUYG7U/Oum
         1uFvs5hBRRaMX3NpEAfCuDPyLyXJg0e+ab+1Pt1y47E59aYwDPjGD/UoR5rmnKY1fKWF
         W80Q==
X-Gm-Message-State: AOJu0Yw3Kqiz0cL4fOvV23R+Bcebox0tPCZ/hkqxyQFRNSYOoC2/sE39
	/VdtRPrscju0n5g2UBcLsx76F56FmW0Np0a6UuI9AH3fNf2Pr9e+6/uR
X-Gm-Gg: ASbGncu8+2oAgqqCQ/x0FHrlry8e20ye/nv6Qs3voOILEIdrx1O7DONU9td32kTzUtd
	TZ6MRKwOv1as63T4lKAaM7ceqcTpm4odBPkemsFBzLXdRMPkKAKx2vF1sdKujvxVrX/ApMk+Uys
	tSMlhha8YUm8bP4+MD1cAb3CWlW0k6lnDSRTvP3H2UIe/SgNb0F+w3gtRseZl2LmLiC/MScwIeN
	4VE2x5IpQ36ZT9TlKKJrGwkUxlJE4RqaCvOVrZb67Z2AqMIjQUn/+tHyH4E1nMiUiMoLB24t5pR
	cRfxz/Ne1ZGc4XIe00E25WVAzkTGIuWdWclmWyOl3YIqovhhFI2vkXY8zlINokgnBqrXBpayr09
	Tmg39qJSIgSF62eSN5FhBsAfifFzzow==
X-Google-Smtp-Source: AGHT+IGuPePWDh+DoX3cn9enLSeO6395/bp+zFtzn1hNnPVvAgQ8UbjkCOLg6ypL4xo3Kpyp21WTcw==
X-Received: by 2002:a17:903:3884:b0:24e:95bb:88b1 with SMTP id d9443c01a7336-27cc5434ce7mr21455645ad.34.1758617738154;
        Tue, 23 Sep 2025 01:55:38 -0700 (PDT)
Received: from devbox.. ([120.229.24.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800531c6sm156676805ad.14.2025.09.23.01.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:55:37 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v6 5/8] LoongArch: BPF: Don't assume trampoline size is page aligned
Date: Tue, 23 Sep 2025 08:54:46 +0000
Message-ID: <20250923085450.140602-6-hengqi.chen@gmail.com>
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

Currently, arch_alloc_bpf_trampoline() use bpf_prog_pack_alloc()
which will pack multiple trampolines into a huge page. So no need
to assume the trampoline size is page aligned.

Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 35b13d91a979..43628b5e1553 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1747,8 +1747,7 @@ int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
 
 	ret = __arch_prepare_bpf_trampoline(&ctx, &im, m, tlinks, func_addr, flags);
 
-	/* Page align */
-	return ret < 0 ? ret : round_up(ret * LOONGARCH_INSN_SIZE, PAGE_SIZE);
+	return ret < 0 ? ret : ret * LOONGARCH_INSN_SIZE;
 }
 
 struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
-- 
2.43.5

