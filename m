Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5542F39BC
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 01:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758074159; cv=none; b=VVDy4jqkqrqactaYJkQ4tLJYbt8HKxM014NPsxz8ZP4ZvL1hcYKcdMtiSpmrbCxgp5jn7VCkbG5kEuZURf7hcZ8JpdWCPGFz6v8up/86OcveZhXIBQoQ/mhaVpn0CXUJF5m2/8hVYqprA+eZ4J88I5Q8h9GBor++Q/zrpBzvS4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758074159; c=relaxed/simple;
	bh=U5ankppA0Fbik10WvbYgQWOpgplXW08aiBpb2I9wzTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BF8Rb07AuLz/vA3g1jjgZR9nsuG4EHc64RBJ3Th2NsYO6fk1vxK2TTaMC4TEjm2ev6j+DR2UP8CdlKlLokWwjuGQ7i4Nvwq1GLhE8c0YcXj0OC59oUUifN5Yzn92mxsStUwztjCY7k6BdT64g3f7oHJpOo0j1v9RkfpU2wFRQmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhoufAt2; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhoufAt2"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-26488308cf5so25064525ad.0
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 18:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758074157; x=1758678957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdOzmDyOFs4IOwQK3P0d4e7en1vFeF0HoaLHdpopSlg=;
        b=WhoufAt27iIZOxS5msc7UsKm0qVMgb+PDknKosDx7Qo/WzzXXVxm84YBbylDhxcLp/
         azaSm34TKObdwp8VA6M1oL5WHbeR5a9z85XeGGfVi4aLlE7txemK+ADZwnb/e2bKXDEg
         URE2xx+TSEt+zoXcN4RCi9+Meo72meTOFK02D3CAleBeUL9v7tAa3PjZFZCoG7kScz3Q
         sdFMC71RkTMbZew60c5NOfurJln1PdMkewH8X82x4mmEr9cEAKm8QivgW7wE+S3AnXU7
         +HzuaMXcriYp6BqhjiJN5xdyDtNrKFHW8lTb8mEKA1UG/6Y4FtHA3MTysVev5bb+oSWk
         ISqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758074157; x=1758678957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WdOzmDyOFs4IOwQK3P0d4e7en1vFeF0HoaLHdpopSlg=;
        b=G3fKBMGmBVp0F2/qOJEXVjuPYWfDF8eW4eUrlBmOjmED8pM4jeCsmsOS/CYPNk8eXV
         bZZyTQw2VaJbFzQnaEV2GHwQJujd8mk8bHTAXoxpDutCaVPuNNUn7NsgyWvJcwyD7Fc9
         nlciv7gha+OjYEcPnHIJi1NSoTHFRSyEJewPt0rJ4Xx/wLmUOvw5S/iVCRV7GtksSqpV
         wxBrmuXGSL3AyD91UzW90n3tLSCOaz0Tbp966psBNpaoFp1TkXmug71cnEyMNz2Yb1x3
         rNqUGW5nvN+fxkibbcX7dL8i1+qAZRUr9Km6BaZZKWs9c0CocMEKbEEea/kmg6xSCG5+
         6KeQ==
X-Gm-Message-State: AOJu0YxHqNHYFnr29oVUeiIAAyoDpiVIbC94AbogMBvKfMNb5igsKFm7
	1ErZsij1YwqzVQBaR+NIyPOdgQu0Man6dvyAmISOS1cFb/uT/ZY8humb
X-Gm-Gg: ASbGncswtK1HlWUkOAtmIi+vmY9njX+hvLW6heGVqj0SLEQKkjtV3zVXG6lSbMMJoma
	5oVATKt1VN+JgMQO3PER4v5Spqajh6gQN38TZ6UmvO9gL8qq3QTFWhZ/gSXy1ZRH0y5QxiuBpmM
	NABsL1yjVIBDdcYntlf6Tl7fuX5i7Fi6KIsVFWjAZPXxoV4oFj6D2Udwd4AhS7+yFd7ZRlSlcAW
	Z8ofsmtI6CUv/5DP3ZmgraUCiPHPpYNqpvvislt7UAliaUHB4Xo3Vgw6pcNnszR0lp3aE01Gqow
	uGWq85sdoZrsImG6X9ot/+P8JF7fm1FXcfzDnUgtzWp+8gndwklbpQZ5qtJf1iyw0koFcQcVrqC
	Plqg72zMO3Yz/0YP1iSG8UQvf5RR+yavU+kLNzOs=
X-Google-Smtp-Source: AGHT+IGQChHSLAXacI7RmuCFpIkU55D6O1PlyZKsWH1IwfveXET1q/ZrCXyzD1H78dBxG6J+bQw8Zw==
X-Received: by 2002:a17:902:f603:b0:24c:ea1c:1176 with SMTP id d9443c01a7336-268138fdac7mr4404545ad.38.1758074156985;
        Tue, 16 Sep 2025 18:55:56 -0700 (PDT)
Received: from devbox.. ([43.132.141.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed278b065sm839746a91.29.2025.09.16.18.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 18:55:56 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v5 5/8] LoongArch: BPF: Don't assume trampoline size is page aligned
Date: Tue, 16 Sep 2025 23:56:24 +0000
Message-ID: <20250916235627.102831-6-hengqi.chen@gmail.com>
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

