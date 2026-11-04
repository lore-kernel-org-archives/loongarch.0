Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776791;
	b=TVclX6HqI/Q5UAyVENPALBpaYVvD9HEYWmw4bvWtgYtU24cxX/B8SYitT1ASWsmp/Mpk
	 8SNGM78q5X2u9/4WlMPW/FMb/jp7CW+w1onHgi9K7WSH85PF789C7YyhslHEzwyxWSfxU
	 mTeLOZaNm0FrOlyB08SQQPL8e1bonMYMLwTfOrtC+V/bUtXHT9wdAvSJ5QZvYzCtJ9BdK
	 rU2sjvVg8SHI9gmV6dkgqzFmS/q6mluNAjHmbbWYzmol9I/+h7VBhTfWe//7b4pVzSM7J
	 Xg15ziX3mivnd07nqeeTM3HXmlLzFj5eI9KP+ThhL+1cLL5BAmao8j/wEHRtpVveODQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rrzBvJUH0m6X73oGrOP8Fx5drxVGiUnw51WPWWQEE/8=;
	b=RcEvRSwXnSmNLQPGGj5yby72xld2jm2R3hjqMkIOnRyPXF9rnw+10vHfcVHtFwpcrVSc
	 0nHRki8Cxlv6Mz/0GmW0afEJgkrm2C+Xv1nHXOQTDz3cbWYhQeXk+JDjyWCzRRUonf2ZA
	 gz6zJY0II/+iETzJF/dnbabS2xY4ypn8tEZ7Q7Plw/oto5kRE9vn5CkMk2MiGzKfhT17U
	 IPtu6oIS4A+DYhM9VDhx8Jsz74xcNLDAqk7MiVhHxoASf1YCVw8/qAfkm4xo6yyfns3db
	 exD+GFJN7FQwj6hw+fR2N8iNs9wv9R4PU18kcdEOEc3ht4r5rUCqXyyMLKF6qEmU2lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jZFlqzq9;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF1606A31B
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 07:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5DF1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jZFlqzq9
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso303408a91.3
        for <loongarch@lists.linux.dev>; Tue, 03 Nov 2026 23:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793776789; x=1794381589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rrzBvJUH0m6X73oGrOP8Fx5drxVGiUnw51WPWWQEE/8=;
        b=jZFlqzq9Bbr2TrToRYAsrK5nTDzHwQDYcr+9dFkQGvhMeG8Q4qwcC7hIMUG1P0DBLS
         NWSi8tiCXKNDYKHUZywEB/4f6ZvXQrhwbqOMSgdzA/shXEULFOhE9GeymwM/GbUl4BDO
         YFiRCTzCLiSi2pNcf8dM3CumhOQDVNmGe3NxnT4g4eQP++Qbt8qpj26SkFbAbv0z2Qrg
         cYaqDNtDxMxPpFQ25H5k2vJnx3O9Wvad9WDmwCODKjfU6EXWxcsr/AP8JTgrpUGOFy+k
         JM33v5YDu4UFUmXhnNcc7Chjw5FXQ/iSRblgJsZaFs+M4RNo/lECevqAR52U/7lwnl/9
         GsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776789; x=1794381589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrzBvJUH0m6X73oGrOP8Fx5drxVGiUnw51WPWWQEE/8=;
        b=d7PAZZN1ZVuMkSAh9OEyTm9p0Zou24Xl2cjddrQzCLIa/GF74OGBOZrkxSW2MW6UFL
         LanH4iExpHMJCLooQ4SGvuZcUjPdWkcVmPkphExczTaxzBznT7a5wPoQl2sKMsJwbFXn
         vlXWcmeGtC39Q49d4/4zX6s1bAZL5V/5wqVTOUVUMPG5QTztsSKPs1d1SlvtmE9iV8dm
         wH63D/YE1vS8fbgL4NgUoAkjeoaXcsgjxsat23xGGdaNoxs1C2/nWm0sgUT8Ua1PBI5e
         VjBNsIQmA4RE4Tm9NdBu8kwNTDGPsla76BxP9jvxEi4SS7f9PNXkCs6P/T8QsxsHcJIm
         LJvA==
X-Forwarded-Encrypted: i=1; AKwUvByOgh20FPU4c/YwLCmeg7/uY5SkMShUfvFPUPgBtYljYy9qyCff/l4hAiwgrPbS6CIWUo+dxu/l508=@lists.linux.dev
X-Gm-Message-State: APuU4Z9kaav/TyVOVyFTjFDjfU0z3q7tydYg0/6Eujm3Vjvoj0qRpUZw
	FIM/BfBbqfKiy5u/TWJQKkUR4Rmqe6BarZiBH53sAKwD+Qli8qDK6xFJ9dLnVXmvuNM=
X-Gm-Gg: AYBFou0SR/j5+fKZqSJ18I8gQEVqVA5pRrxmeEgAGOPYvFcuCYmJa2hL3ac2FYdamzy
	55n+mOMGAmC9Ska4Ewn30KptZirpqhTJY3lQKDHwAg34iQ9z1r9DXcACiu43rTvPxR00D8LrWuJ
	zZpOEc6/kHWJf9tTuDRhTrLz7Get5qczxQItkSDbLI3JoXVCkC8x322453zdT4dEqUf/7UX7QJy
	v0XJBRIYypyVuNFb9NaBAw0DPDnN96wD88bo9640j8N1Z5e9wftcizBilXkE5intnQIfyMBTPpY
	roh2UDzIlXit6qxqcmoPK5N/eBLXUCIvSi0hvgcFVAHSQjFA/Wjt45pJ424+dKFPAWEQIDhr2eA
	QNQ9NxsTDXkAOncIJeym12i/162ug1rC9OrSTmhslDs/WuexTNfVVkUpm1JE/UbYbj93Ieu3ro6
	OVEiv4WB3JqosTfBgdrpo3owMNHRDuMQKSNfNMr8QmHEdDDzIYRZlkReB3GdSPwUtoQCdHQ2zZJ
	PDMmpV5/q0XE2dahS9gnUYTnDfYmexkaNMHvG8txcUm3zABbzjL0puE3iE+jBVSa85Vq2F505aK
	B/i9dTVGzJJPtKiGHDNOGkR46qBjc+quoeAfoecaVXt2AHUtr0RrZjDciRVqnO6E2ojHs11k
X-Received: by 2002:a17:90b:2691:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ae89776111mr11952482a91.39.1793776788793;
        Tue, 03 Nov 2026 23:19:48 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b099189fb6sm1027403a91.2.2026.11.03.23.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:19:48 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Sashiko <sashiko-bot@kernel.org>,
	linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2] mm/hugetlb: fix validation of unsupported HugeTLB orders
Date: Wed,  4 Nov 2026 15:18:57 +0800
Message-ID: <20261104071858.757793-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7ce6048d3a7d ("loongarch: drop ranges for definition of
ARCH_FORCE_MAX_ORDER") removed the ARCH_FORCE_MAX_ORDER ranges for
LoongArch. Besides dropping unreasonable upper limits, this allowed
values below the architecture defaults.

With 16KB pages, LoongArch defaults ARCH_FORCE_MAX_ORDER to 11,
matching HUGETLB_PAGE_ORDER. Forcing it to 10 while enabling HugeTLB
permits order-11 HugeTLB folios even though MAX_FOLIO_ORDER is 10.
LoongArch does not select ARCH_HAS_GIGANTIC_PAGE, so this violates the
generic MM assumption that folios cannot exceed MAX_PAGE_ORDER.

This invalid configuration is accepted by Kconfig.
BUILD_BUG_ON_INVALID() does not reject it either because it only checks
whether the expression is valid and never evaluates the comparison.
Detection is left to the runtime warning in hugetlb_add_hstate(), after
earlier boot paths may already have used the invalid configuration.

When an invalid HugeTLB order can be identified at build time, reject it
there. Otherwise, reject it at runtime before the mismatch propagates
further. Use MAYBE_BUILD_BUG_ON() so constant violations fail the build
while dynamically determined orders are checked at runtime.

Fixes: 7ce6048d3a7d ("loongarch: drop ranges for definition of ARCH_FORCE_MAX_ORDER")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/sashiko-outbox-192874@kernel.org/
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Suggested-by: Huacai Chen <chenhuacai@kernel.org>
---
v2:
- Move the order check after hugepages_supported() to avoid a false
  PowerPC BUG_ON() (suggested by Sashiko)
---
 mm/hugetlb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 779b1de33c78..b49130eb7ad8 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4197,7 +4197,6 @@ static int __init hugetlb_init(void)
 
 	BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
 			__NR_HPAGEFLAGS);
-	BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
 
 	if (!hugepages_supported()) {
 		if (hugetlb_max_hstate || default_hstate_max_huge_pages)
@@ -4205,6 +4204,8 @@ static int __init hugetlb_init(void)
 		return 0;
 	}
 
+	MAYBE_BUILD_BUG_ON(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
+
 	/*
 	 * Make sure HPAGE_SIZE (HUGETLB_PAGE_ORDER) hstate exists.  Some
 	 * architectures depend on setup being done here.

base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282
-- 
2.54.0

