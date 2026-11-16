Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839235;
	b=xZCxGVaKEo6QgA+8FWynYB57azR3rgsCZp88nG9KkLbaQxqtO0A3v2QAGvoCY2fji2ed
	 +ZE9pjYwpDFQ5Xi5A+qV2fCEh5Nm7+1qF+eoXaUVYfXlRnr66VMwCZU7yvs2emxX8S4nI
	 ID1Ldb3KYEB7MvbjtjN2Qf2xguYcvVtw1ChUCdBAQ8446yvWxx/ASvnfRJ/9o/vlqoRBs
	 +yUrpPIfL3cIKArY/Y8LyFLVDMq1DtrvchlGhb+aU+LSDvUynOmCkIl9+KR0V22sGb9hG
	 HYgBQu3KzPo28vtJA3F8UqW1aMMz+4ax3qXQXiuvInQtsAXThdyJ8eOVPAsBHi67IsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=90r0f+b5kRu0Uic25PAyXOgLnJJKMJ4pyDwq3qDyCYw=;
	b=vQF5IDdS/Rv316RYudHJYgBI4NzHXHP7PD4CdhfeNzd2xFesRumVa1Qqp7wgRhW/dWN7
	 j5byVdGOc4StBgmP1qUzyNvzjB1PEnI+2ttYjLegr5Xlybjf9Td3RAyTlLpSC/Mb0NpKk
	 UTwUIDMh9u5OFgUfmQIjDcy90YEwYHJYpkOHmJhVVuGMteCR80pPTUAwVUwMj6NQIuaRP
	 Y22KxVyabGyPVIDK25zkkYQT7ynQoE5GMo5sXQUp0c4a8A7eRB8Gmv4J7s8eYTjntXKo/
	 yNMa4Qn1Qs7B7aS4V4tt6kjL1VJwMT1nb8R8etAzIyRgwxirWcAogyLMg8h2VFYCScQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LADL3hSh;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BE1606A32A
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 14:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0BE1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LADL3hSh
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c50a8e37286so268879866b.3
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 06:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839233; x=1795444033; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90r0f+b5kRu0Uic25PAyXOgLnJJKMJ4pyDwq3qDyCYw=;
        b=LADL3hShJXWCp9sMJVv8jbE5Y0OzGdT/MSh5A7ur0ewYbypFQq3KT2vQ6wORJmsozI
         ETMMM+vslPQ1szf+MuN0+Fua2iv3XWvamzr2996MpgQJNdn2o8O4nqrC1aTNghzdqlrX
         0xfMGxEp5w/wzwZg+qf74wT33stPfas96sS77DqsvwIFq6GjumWYRhKgpToRd/n9Hzdh
         uNzQpga6YSxwtEYj22cT1AULJNOqi7QHUd1U28xsSBGhXDqZpU2LkzB4uVWnun90xdtJ
         Zr4sZtbLO26KTkcDyv3L1gKJ1teOKhWrTCaNVHDkF3YyH1yMxzWRLi1btV0rWOaFF+DA
         klyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839233; x=1795444033;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90r0f+b5kRu0Uic25PAyXOgLnJJKMJ4pyDwq3qDyCYw=;
        b=gAQ1NrcBus5J8YB1PLt+w/wicBGgIJRo2d5sPU0Q5k/JWLClbXUTGPwvCVoTn/FwLB
         MTY5PLxCtK1hqLTzaU/eLkQSNeihpqmO3UURqA+te/yiQEebgybazPE4UFrdY4XwFn6C
         rOqbRC3mFy5fZRphiMCFfFML90pLuN3cd6THRSq5rdxrJ2Wc5VZ9/vRds5X7iN0tkTCZ
         qj1pA3WGKbQpMAQ1eP1b9eWPRbZkz0eWI4psOf2HEdULRz+CNimOfKTna3rxwB3BDg4l
         x/JaXcEN4emQo29xbegNb/2rh5fCcrtB3xpvGjpouwGokSBuvpmaoUSuW6jCLeJyorij
         v9Eg==
X-Forwarded-Encrypted: i=1; AL+hErFm4Vk85C5SzVgJm4AIgvPGnEznAd5OkymPqJjJrQqiCYnn4TV7cWki4G9ys8Y6WfYIJ5rZrFRLq84=@lists.linux.dev
X-Gm-Message-State: APuU4Z+hKtw+eBZu8ZAxXf8+uwbdriKM5JaXsbq0CuvtQVZ+z4yokU3q
	QmPTIVFU8n2RKyNWgaeNAmLkK8pGpkFBC51CApfBfuFMxkJPbNOmIJmpIsVDq+5OqSmxN/tDdQ=
	=
X-Received: from ejbm16.prod.google.com ([2002:a17:906:2590:b0:c31:b9d1:9418])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3f93:b0:c50:4a71:cb5
 with SMTP id a640c23a62f3a-c5096325a62mr886143966b.15.1794839232899; Mon, 16
 Nov 2026 06:27:12 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:20 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=ardb@kernel.org;
 h=from:subject; bh=iJCrUIisab7JCQVRK3E8zIw6kz1I277eBbn3gnc4d2w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu3UG90+Yzl1rc013y9ZXnQWS/H/X/bfbaiq8UBCq2FN
 gdPX+bsKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPh2cPwh6dmke6e8uL/z2ad
 mSb4JvW/NQNDXmW2/c78Vb+e+jD+jmP4X6y5KONutmDPSvfWR4F7GjZoFLxQSRbMnznVJfniZ95 cXgA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-18-ardb+git@google.com>
Subject: [PATCH v3 01/15] efi/zboot: arm64: Add missing barrier after cache maintenance
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Prevent the I-cache from fetching stale data by issuing a barrier after
the data cache maintenance completes but before performing the I-cache
maintenance.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index e57cd3de0a00..d35c6dd76601 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -109,6 +109,7 @@ void efi_cache_sync_image(unsigned long image_base,
 		} while (size >= lsize);
 	}
 
+	dsb(ish);
 	asm("ic ialluis");
 	dsb(ish);
 	isb();
-- 
2.56.0.611.g1030f0b940-goog

