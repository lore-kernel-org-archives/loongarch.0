Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE0B30EF7C
	for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617722; cv=none; b=A3s0iZdcbnb4WAR7Tl5dZeb80Ho+d4cAb2GN9dufV6h4D5bvz89Mw9dh4mngoF0BSia7tfZqUaFnGPVlmjfrPbhiNV2MQTnofPtwTsy4+hHstpnACOwOA7dlvIy+zo/N6RYmpBQmKv598FQfmkX476inNCkbYG9An5v6EoTrRJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617722; c=relaxed/simple;
	bh=b+wlsoc73R3mzprzKm4ZB7lafVGRWjGUoe6b/4C9w/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeG5NjmaXITqqhJoGqY3Z/OuGswqjg3OINR9n8rbxazls+to+NHN5V6efY45mtanBsZaWqi3HzLxyxB8scEMdu8rfG8VVOPu34BDDNK4i+SNrqoK6GEFcACuLT9FaBc2JJUlOjN5HxjnHPeLJnChcGycK7wGFydQVER83szYsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z37yL3+D; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z37yL3+D"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b54a74f9150so3909539a12.0
        for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 01:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758617720; x=1759222520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaLVuTdfin5vsSgq1O3WxZJeAJdQv1igaVbdE362rhY=;
        b=Z37yL3+Dye17/ebGO8d9zQCqi/VXhYC45HBuYKjhsCMm8xftwZ2KIY7VgS2ml68/se
         39BDiE1BHFfBsuHp9tzCVMfWvvRNZ6vkNS9x8BTNIe8rLu1E6Ixsxej2fY+ggWANCzfo
         r/JfmOneUF340CUXPeouPUAO1if+mg6rQvDSHs8FatV5AX1dCveBAewDHRSKXbjTu6KQ
         XoUYs/ZGyZeTr43lzH/GRU3Y+8mHzTAByNdQ6ppyrFZ6TMQ3VHOc5iA+dWGkPFdXrUzT
         bNReELWbv+FCAmlxdKG9ikR6K3M4bstFHDTrEharFpEPbjAbeiTrxOTpdSZHr5eVw/Ci
         AJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758617720; x=1759222520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WaLVuTdfin5vsSgq1O3WxZJeAJdQv1igaVbdE362rhY=;
        b=lO2ouQlGMosYA6V5pQJ2y/uaTp8JqcLRqZ7Bh8EijIliPD4SofOtvYMxFFc7LqnffQ
         rhUIVq7WxIxT4uJaqUCOe8TfU04Qil7IRSMc7K9AAY+3kBNPw2AnnQDZboIIPUVV13Ms
         x5Yo5hMkW1aqaR2Gur6Jtbvykd1zqpgL0nA3jte05DgQA022tdhwCtQ3XIDHVhe0rMEm
         e4VytKZLWYBvfcv3OajdQnfzBcpOmC77OWLk4/zj2VtRTxvc4A0F/fowprV47+2JvyJm
         Cfe8Ct2mcjdDH90tJh/PdBiM1l1JX8bujfok1WJLWScdT2pMmB4y33IdfEMNS7N11k7K
         55AA==
X-Gm-Message-State: AOJu0YygsDAnYJGy9NzeYIz36oCZY8TujPoYUgd1E8Mbm4E1a3tyS5Gk
	2kDyM3QvLN4/u3vHfF24G8RKiUmDLgrp69iBrv2hkuxq37D9lzHTl/Si
X-Gm-Gg: ASbGnctGz69BUSqFjU7xLzueytuFfwXQIsUuYT8FboHgZN6ejCRTcX5SBIj4Vb8YVaX
	XaiiutFLRSR989o0fPqvP0+LAmhgrTLS2TG3l5rwZiwdIEztilqzmA2npGslTNHDxKQudwtTFyP
	phbhRiwcaEPriqeuhwPv8dS26SiOsgWIqrLHB+mw6UTXFKO8W0c7HN8h+DNRZJ3Ny+2AoQwzTcL
	JqZ3JhrYJhLioX6JdI9V91JFJm7qUwoONy5vSBRKEAQpDWZvDM8/FsWUA1TjE8Qr+NyezYAshfU
	ntt9RO0gVUQFXM05GAiZx5g9Xzzv/+qyDV8Wt3z0krUiCpCdKtFCgDZQKwxZdaamtQ03BSxkgYH
	rm+hXvd8Kno9GxacfiRjUAbNstNMdmg==
X-Google-Smtp-Source: AGHT+IFkGnLhStBr8cq2BL8mJ/9HkVGRtgI1yDd0iuuIRVTzQJpzbkuw1jdi/9SyFZ3N+K37PDo/gw==
X-Received: by 2002:a17:903:8c6:b0:25c:ae94:f49e with SMTP id d9443c01a7336-27cc5bf416cmr25109515ad.37.1758617719932;
        Tue, 23 Sep 2025 01:55:19 -0700 (PDT)
Received: from devbox.. ([120.229.24.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800531c6sm156676805ad.14.2025.09.23.01.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:55:19 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v6 1/8] LoongArch: BPF: Remove duplicated flags check
Date: Tue, 23 Sep 2025 08:54:42 +0000
Message-ID: <20250923085450.140602-2-hengqi.chen@gmail.com>
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

