Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673523;
	b=hgZyyhcSegUa191a2KJqK0n2Iy4j4hIwVsMm30aSMFGIv+Z7FQSKXLXWi6VUhvDpx7eB
	 Vc6L5P8zoCPKAeeRf2JgBffrnVau3bLDSed34M8WBehGyRwet8wG/J2C1cCYsW/4yi0Tk
	 WDYniUTlF+ruq4pmGtYFUrnd6o+0t3zY9+Hyh8PlOdP5fObFEvwKNygzCUai61CpuEzFq
	 kYrDzzDkPX9aOmr3i3yECLwZunUqpzRvskOwvwGfa1EKGUjJz7P0A15vxXf1Y0ZoIAUNL
	 E526dJ0mBJE9gi0UrG1434JeZM1ssxlG8tlGHbtYGjWsgzdIGuqWGMPlqX4Oly7uUIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rd65ofZ2aECwr5oPP9wkqS7GgVjXVfKOSh6kNluRLhU=;
	b=If+2py96hiB7FK4u675G+mrUN1duhgEVY2bjX0aJgc3KvRCxrRUf8DhGG7xJkjvOzA4z
	 5ORHtoLtEGTpaOuXfOWrFHMQjcqMjXxicO3ITsg/2dEKx/8qP7QVDuEGnBliBXVMm1oLt
	 QuBW+jlvh0bWOtNY08uHeQNd0ylfvqy1gIC9vVjU93vgZznr/+c+MfY6QQJugwubtONkx
	 ihpnM/oU08pbDq0PnLW4qU/ClfIjSuN6yGqcJwqx8aqReXSFP44U3tDKjaMKt9NKWtlPO
	 NK38ywJ1SWBQvV/KXb7lpMjgRCvvojjvzhWMJQu3YxOOR8qhS+8W16qVJ0k/5xjB0NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=lT1YqnWQ;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAEF606A32E
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 02:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CAEF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=lT1YqnWQ
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso22328165ad.0
        for <loongarch@lists.linux.dev>; Mon, 02 Nov 2026 18:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793673522; x=1794278322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rd65ofZ2aECwr5oPP9wkqS7GgVjXVfKOSh6kNluRLhU=;
        b=lT1YqnWQ+syxpOGYK1mwbmcMTn/zxBqf5jy+ImNXWiEvL8hSlVMGOeA73SsooIW5bw
         XG8BdZ8SNUJXq7deyglDvhGl2Wn6hKdUki6KVchgFiGQ9jcl2QPUa+FTPLcg/2B4al9q
         CJopArdSDj1GYF0K8epnVvTfwJzdzc/tiqjUfg1nVnRAgwXJeXgQqEEf0PDoYMcAz7xH
         kL8LebBpRd27kwphjFhrMWHEAW1m+mJatNqEcmorY5ouM+pZ9khIzLtqRh4UrOtjtRDB
         lKdJA/krjymaGsGSwchXMx/R5PyYlulZC7HClvHFfvElKYoF/sTYQErvzyePp3eh6kdK
         aNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673522; x=1794278322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rd65ofZ2aECwr5oPP9wkqS7GgVjXVfKOSh6kNluRLhU=;
        b=OhrZ5B4mcT0IcoLNcwwvHqNsptarg8ejuASgyoSiCgxz45bBiDl4NHFTjF82Zv2Cdc
         5pss+74IphT8A6wZPcGNFKwf8wFGydRWM/E/BA+JiIIxQ7tr8Zcv0yc8Q/i49gE8aImo
         6lRgESPPx9v8HtEG7BOVuTGH7cBY30auTRVSMrY8kXMF9UgDE8K+q2LSxsrADV6iAzxo
         9oUru1zl5jlMQsn0xeoJLIPFLX8Av0TKbN2G8QvAltTOXxDHduNk8Arc/nJDBw+EHNP+
         t9zIGGI+5sSChGcWSoRXkXkynXv8WcYFpWwp/AEfej/hWVoK/YDOSRrwnpjCiavR3OZh
         VnZg==
X-Forwarded-Encrypted: i=1; AKwUvBzgHrO1WPLaYNvRr6qivBA4KaolmN7t6yvmZXG2XCsQytWu7YLDL91Z0pqTywVBqoefLz2EEKB9m0g=@lists.linux.dev
X-Gm-Message-State: APuU4Z9wQLKayqPCzA1X8RiPlnGXQ/tdlSam4DKwFH2ieTWqMzntrjjs
	dGmVjQWPPvWmGxsgvTuC7tkk0kny5vyrZJGh1sYdsLF4D/fYqTnjp6sXpsMYYFpMYDQ=
X-Gm-Gg: AYBFou1lKYp8xgTeKr7xgluH8RKTpAEDv+3m+Q2v8cnqSRsesYIneyMcRlyrgy3NO6O
	S2mC+iow/4q47GYI5F9+S2Dxdu6E87ExIfkNrevI0/sZButki3bGLFV9kExKt99NhZzBECqPLGx
	qeS3aHasbeVswOfsbOYNShwjC+oCQOL91z2ePMNEzJtVfS1VESKm5/phyuUd3RiGVHKAo9qY1fM
	AeyjOXYcfERVm8FO5AIp5IUaMMIBKfI2uKaMr11LJU+30KIFx3+iaB84vFh6h93LWmprXJeH8M7
	wXxtwnIpUJQSpXHQoc0xWhIb0zfqB18VJm8pXi1JWdFclAN3w/FM2M9Dm4uH2wKpJXrM7WQLG/D
	GdHbA837FD8GmY4PNuZQRbKUrk2CuYI4GzuyOpFp7ZSDpu5tkRLwacRbxfXdjGXRKvpv/nor28S
	ALe2lJbxDSC5tZ/JghgDWrmv2yH/D15mwZkOKUXYqVztotADXol0uEkqqw/dvBP/xBS1lqSEkt3
	HcWz7vq2Rwy6RXyCZIO00B79A5W8oYRuT8Dd/HWkxV5e32JyYox7dNntl04OyTB17BIuL+tO6Cc
	7vUQVUD1202GG4G7+JgevMBloweDMeM8xCGQs/gZycejH5fMNw==
X-Received: by 2002:a17:903:1cc:b0:2e5:6158:b9c1 with SMTP id d9443c01a7336-2eb364e0730mr116286165ad.47.1793673521548;
        Mon, 02 Nov 2026 18:38:41 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298329sm33194135ad.61.2026.11.02.18.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:38:40 -0800 (PST)
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
Subject: [PATCH] mm/hugetlb: fix validation of unsupported HugeTLB orders
Date: Tue,  3 Nov 2026 10:38:31 +0800
Message-ID: <20261103023831.1805473-1-songmuchun@bytedance.com>
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
Suggested-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ff9dbfbc7a96..e21ac667694b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4181,7 +4181,7 @@ static int __init hugetlb_init(void)
 
 	BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
 			__NR_HPAGEFLAGS);
-	BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
+	MAYBE_BUILD_BUG_ON(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
 
 	if (!hugepages_supported()) {
 		if (hugetlb_max_hstate || default_hstate_max_huge_pages)

base-commit: d42dfde37af766d1c272467352c0a56d3169ee58
-- 
2.54.0

