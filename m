Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D8C40D565
	for <loongarch@lists.linux.dev>; Sun, 21 Jun 2026 14:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782053981; cv=none; b=O/ss/fH37ByvD87rF7Us1Qkz9uEj+FpBbfKtnOct4LMkr5nanrbxjsgxI033bjJ3Drl4m/16fDs9zJ4yzFlJuGXCgCvY0xS3WvDBH67Qjr3YGY20NXObWyxyidDcTu5r5F40xu+qXZUylnMArrIGeU4BRXyODHBlbpzbC2Jtskc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782053981; c=relaxed/simple;
	bh=aQqhRl6DC318PkNPVd+rJLq/+T8kDSpLzI57MbCyrwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZA8JtAwFj4JhRUryW/KQyB3OqofM7H02gBjMRg7BvOuaJAYY2GXa3kw2l5xg4JX9LSI+0iPFGkTIcnci5iO1ecg3lox3nZbjMpBkC1f+eX+wLBDwmbvHVT5b6KXFw7XSxYr1Jb6ttX4Qqri7liMTOJVfTaVzERGrRPL8KB64S7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1HefO58; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1HefO58"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37d82f3a244so206610a91.2
        for <loongarch@lists.linux.dev>; Sun, 21 Jun 2026 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782053979; x=1782658779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7OKQThqi7Hj89gF3H1L/Hs7RTlLsRV5YLw83Frz+Dw=;
        b=A1HefO58rKKCBkan/4gHtBGb2B402EUoHCkOcCRhjBBwo78zbM7Ftkcxo3wP+exFNL
         IDsJwgpESffDzXgw0x5Wi5y4QDWfTH2lJryU9SvsedM4tQ5XKavtuEKyVlCHja6XZKsf
         fqG64+oi+6333S9iUmLq04O6fwOlrF1Iuq/fbC5A9cIKSVogR6ph+GXpPx12sIZvLATD
         zhCjISRFy6c9ERRrYRNjZNo5wzhbJZ4oFPJoJPhmBzcVFiUe4yrdYNkbwGmuCG82QB7U
         YeAu9dyNE5oBeUIr5N7Kt+TShJgB4cUv0XUr9hf80yQRzK4EntP8lZHbDFI4uwccGe92
         rCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782053979; x=1782658779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R7OKQThqi7Hj89gF3H1L/Hs7RTlLsRV5YLw83Frz+Dw=;
        b=XoueArIvO04u0bfy3ppfquShBeX8USZHFm4ZmQUwooxNiXb8UDRPHQus8Q65OanLj9
         N4yIKNUZOBILA2pS/KgAh7MgnQjuG9pp7Jl4RagOTvfKkQVNmeZtHi6cAJGIfOWISror
         SppC6JWnATIV4RjITKE1B3L9c1MaD+HtyQ1bDsERb5ux5blt0KNCCQji7ypQqL2pTUkl
         QMmVu3rfPBeGLLWAyWySF0tyeiRd0Ijeha9SNwPjA4bBoLRhsrkgNUI183mF3Yhv4H3t
         s7T+lhU04surUYrJnNIL08udpa9qM1NA9ia+fPY1+cGa5R/67v8CiL8VKPgK/tBS2FSr
         s8BA==
X-Forwarded-Encrypted: i=1; AHgh+Rro0JhxxtMzvgiCVkXh8enHcQsir4NPZdXos65EXoQ82GTVJ8EnCf09KzdHdXiNWohK1GjlS95GkOw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAG+7Yxy3qxzSzA48KjyTVmd+wyZN7abbtvGmkt7xsX5C7uqVT
	+fphUvj8dYyJhKJNtLDqReYJXdmYR60xMERrlCjQ3wgfsfo01fwLV0zm
X-Gm-Gg: AfdE7clb4egVVyv6ZgXPvoQaAhKaiXggSfkhmQvZM5aydwbH79hWomZgwQ3nWz+sMcf
	dD7XFq6c1aydo5shnL/0cymNoSMkrDU6kFoPJFtCN78aVBcJoHB8K4GZOzGbz+++gG5apCcIzmo
	uzOcJJPlTonijwh8bvdFiTIKJnq9/j2ulUGcg5GwxpNYJwLMFs1QoCHFPuD8J4Qa9SHZtq0TJzv
	x2tE7L/VeX5s/zFsFLmDdUny7tlaxrWZKqwzaXMy6d/7mv4COZRfAwdGYYBKIczGsl8DCBoxkAn
	/xBiJrw4FOnZ5/oo4RlhWs9kGy3o343RcP1xRotWC2O+hxar/iSoRYf3fdPOU5dcqfsmmNZ0Bxl
	Lg5a0nvGOSOVm6TIHHCmcOBrkYnpvfiwwexb0oLtbX5wp3rfngtqrA0UTJsJRr7ehTRUKmzw4L5
	MK1U5TILA=
X-Received: by 2002:a17:90b:1f91:b0:37c:83ec:1641 with SMTP id 98e67ed59e1d1-37d4d71d7d0mr7028714a91.5.1782053978967;
        Sun, 21 Jun 2026 07:59:38 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f225870sm4544896a91.8.2026.06.21.07.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:59:38 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	loongarch@lists.linux.dev,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH 2/6] LoongArch: remove unreachable invalid range check in kasan_init()
Date: Sun, 21 Jun 2026 23:59:12 +0900
Message-ID: <20260621145919.1453-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621145919.1453-1-ekffu200098@gmail.com>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kasan_init() populates the linear mapping shadow with for_each_mem_range()
and breaks the loop when start >= end. for_each_mem_range() never returns
an invalid range, so start < end always.

Therefore the start >= end check is unreachable, so remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/loongarch/mm/kasan_init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
index 0fc02ca06457..92ca0ba86406 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -305,9 +305,6 @@ void __init kasan_init(void)
 		void *start = (void *)phys_to_virt(pa_start);
 		void *end   = (void *)phys_to_virt(pa_end);
 
-		if (start >= end)
-			break;
-
 		kasan_map_populate((unsigned long)mem_to_shadow(start),
 			(unsigned long)mem_to_shadow(end), NUMA_NO_NODE);
 	}
-- 
2.43.0

