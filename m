Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF5033064D
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 15:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831883; cv=none; b=RFG2HqLmGb7/H7d+P7Ie5L6sK+CfJjbK98bngzQmZfuW3K5YPI9g+zGtx20lvYVOeP2LOW5KVeP0O76Njs1v5B2jy9P1LAczMupA3sYvKE5PXXeq5GIDh59QdhYifl6rj6Vnr6W7uTRbapFY78jpsprsUvJMJeo58eE89OuJWbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831883; c=relaxed/simple;
	bh=tp+nqf2DUMuFDtMIt8NG1Uwm75QdQij8nQIbIElDjlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gaf4riOj1O51TPe08s1eKQdexO078X1m9nPcqLGx3YRtHZycEMbJJePQ+ymp2HuT1CzrfxLKY0V9rko9of8ZpmC0Lfl4zU7FRDf0gg83lj9ZrUWX/yS0ZQP4tt/Tu6KfdeWQg6ATYyuTqC4FVj3yuIH6eeDinz/JW+dYPtrwxZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p28a78zD; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p28a78zD"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ca11143dbbso11694725ad.2
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831881; x=1783436681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo8uO5n6psQwUEUWovccxe/ZWX+n25l9kiG0x3jxhi4=;
        b=p28a78zDaAU9WroOjbr0T43MLBZeboSY68FXy9Fw7WX0KcXXb9eBHe3FqSSvh4ME86
         0B0tRu8d8ARo/TZBQXacayMFtHhbvuCJaSeXMADTyXIgVWtqb5VNZgDe7523D4devAVE
         04DrhRNocmxj/Np9DxReyznS22P1hXL/CVkk8iS3qMT5Iwyj+OXxGEbAL8OxxcaWubBx
         AXL+HbrgwZG+3ozeeXQg0xC0PPgF7IDZF9IkeMNTlQ8ZPxlh+S8KX2yX7EB+7Grf7lWG
         9cxu46t20uCy9cn/w8CrES38cXncpKXCHwA9VPBDC4XwjDOFUtAgcu2zkP/L3zkkglir
         7Iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831881; x=1783436681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xo8uO5n6psQwUEUWovccxe/ZWX+n25l9kiG0x3jxhi4=;
        b=Sn81Xg5bLTb7Zz/3Se7uNW0DcUnORjbrhODG6XMzIvSwdvYNc7sg/+K/GJmpnVvxrT
         yOzRoHjDqcTF5cWkc47ykh6mlBf5j2+KnnZ3dSABaREjNs8UAQiTPiEGZRP06z6iW2K0
         QumdsYFd705H9lZ1jzGC+QuYXTOuG0lsfVQUbOREbLZgIJSP9ThLjSM2ffT035n7LG1P
         tYPfnNWo+zcuXbzcCHeb5HtsPo8uRv3GSjiKBufQuWfLojlRJiGUc61SkG49974XajYM
         vm2QLKvCglZgvfwCtnrlGIilJiMTSh9lWX1uXPD6Lfzr3b9dUJ8/lfKHSo2CfPLz/NEw
         OSYg==
X-Forwarded-Encrypted: i=1; AHgh+RoHEzqKdbuqHlARar/DiS3Sns2V6SlwtsqdUSSUunx7chQ7zsH3yL7qVESXLgZO89RDTgdVztIhC+k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOuiI9XqBHcOJqWtLHaEdFjgT9ClFpbfb/O18s0EVEitfb/iyD
	E5S6MjTjP4VE88cFMJDFdRXpiks3QHVlCCGOC9SKBfDh+0hBYTyEIwVm
X-Gm-Gg: AfdE7ckgtq1JjHjWM+JNg0zVB7GG6LQ1C/oNW18UJg0w/fNL7chYXycmuKLMTmaZORu
	9mG8KiK2eejTS7mfmc71KQZmu8bpk4eN7FhAIY63Xaf+8EIOz4SMHLx41+/JKxYl+oAVp1dKWXG
	7VTDT00MrDzrSfQFAaa1mH0B981FCVJMpf/jdYKWKBuPfy+SoGCVy9HPdgorjg9z+C5MBv46dKQ
	GtB8Oq1ndwg7CqptItOmSeNN5uK5LxGWs3ak4GyO+az7oMa//hV4dMKFhxdzmucUkNeKnrIpiiH
	RITYdYw395m4Uq9PjUgkk5VuvCWDuJliPrfVHyhwFzUg1aiICelHuPIUI00lSkcq3KvbNmDi4hV
	lTxJNeFIpVcv16eU5RsgzK2acl/9gWvig9dte4g6kLVK/FZdFIR3/mKLOEQbhXFYop4e1hkKrpV
	qB8ncNgis=
X-Received: by 2002:a17:902:f788:b0:2c9:d8c6:1dc3 with SMTP id d9443c01a7336-2ca5a449b1fmr7709675ad.0.1782831881138;
        Tue, 30 Jun 2026 08:04:41 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a70bc0sm16250465ad.10.2026.06.30.08.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:04:40 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH v3 2/8] LoongArch: remove unreachable invalid range check in kasan_init()
Date: Wed,  1 Jul 2026 00:04:07 +0900
Message-ID: <20260630150413.1718632-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630150413.1718632-1-ekffu200098@gmail.com>
References: <20260630150413.1718632-1-ekffu200098@gmail.com>
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
Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
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

