Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABD72EAB6F
	for <loongarch@lists.linux.dev>; Sat,  4 Apr 2026 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775305302; cv=none; b=tSkdBOzLuTnvgVEQw9x2HhHjD5zDX2MDJukF0yBoHAMChXZTWy5971GJ5oSIFbSzphwVUWjrWHvoBlTBVGE3JV7nYAXWvf+YG19lW4eggKaCh5LfbJUR75KKJMGT8HWRwp8U2kjFDhSmNjsEPSw47TIh8v9eGJNXLewojby5C7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775305302; c=relaxed/simple;
	bh=xZcCH0/3zgi/uN6QHzZXXAJ3GhTwW+RyqtUwgedxB88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eg6p/+UlMyCFh/GVwsJXVJPkeczetSmXceSXmrpGohj5fJ3GZUEgt1Pd23BPp1kvr2PcOevS8g64G32tJJLK7Jq/KKyxioBoCcg+BhgacUa3dEwDZU3q28E+nosCOd8fzYWlRHQvDxibrAd4XkWSSR+iySrxwufYnHrUrQRU0TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=j+0giU+1; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="j+0giU+1"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-827270d50d4so2456241b3a.3
        for <loongarch@lists.linux.dev>; Sat, 04 Apr 2026 05:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775305300; x=1775910100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWhZ8riqXkPi9FKF5J+KPNzIU+feG9TnbkhlqmMtCM=;
        b=j+0giU+1PyrIDA2hP69Do6koeYJ9SJ5zGyIBei+mUnGd6IRyUk9JxZlNX+RTGJgMh/
         PkrvtfuqmY/C0w1ttTdDjcm3b4ty4BeCekntboI/96ZY8mWF3/XMSdfNT1pl3W2vbBJh
         6cCLZtWbBdZFSqq53lAK0qXyg7+rl0SKbKpGxGjEjv0O2YM1L3AtLIEcZ4ITdRQNWAM+
         8DfYHWKd/V9fhSx9ZHEsQrYi4GQd2KDMglOWWro8IACyU/WHYS9L7B1/13xbv5NjphdZ
         x9NuZjnT+sj8iGWPRvVmrp9dhL2CIH1U6+RLrtMYKY5y60BuD7qUMC/xXTJkOknc1Utu
         Aq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775305300; x=1775910100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWhZ8riqXkPi9FKF5J+KPNzIU+feG9TnbkhlqmMtCM=;
        b=sTerQaUGgiNofodwF+VK3JT1YZA9BpHV8PIidjBfm1QQmKL/D3cYAqMI24DJxCiqH3
         SuCQy/KPDdhazjxQj62Yf/4zyLrFmYKcLOkznrRjxk+0hMSFQwlZxcJrwurzpR2rlgDU
         yx94jSFADl3boqJeOjWetdIS5TKruH5jj//1pqKOmt5tubh8pg4sqBb+5sgmuupDEoFC
         qr7sJE0kgHchMnuwYWjdwtyuQxQfV7hFgUMPH92DnLyk4+EDBYcy9rWqE9/987Ga9FcN
         GlF9hpKdj2EOC6gfrJBXSuT8alfthEL8ro/+8DVY0hk/GKeK+zoNZOsZkkRBLuzJUQEy
         DmRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpZEFG/lmULHfPnnSV9ndkdXqPuRdtF4klLuJcLX70N3VYUv8l0cTGssdKgcwNck3ZIelBhgy/hQY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxfULhO4p5RcWsOhzVCA7DdxGZCk5YfQa7HahEE0WqgfJbpxZs
	GS7AGuVqrk4gBTDd6ySBBqzjiRp1t/4J1jjO1GkUYYa+43BuILrUGml9K99DKvSR2T4=
X-Gm-Gg: AeBDieunHgf8nwkz9o0yDH2SYO1oWUbSLdsVFTbBhCXA2kU//cls21wiK4QQz1r0mm6
	2pUSViMsChXOa3OmPsPUbXI8Vb6Lf35UCdbqV/nr4b3khYGqnkqkQJuOnbbuOZ35IEwuNzquV5x
	vR3bvaeTncSto88kVgbseal7/EWm8FHrKN5zdMg1c2mBjJtWaq+a6/B2UWBVhSo3aeuNfTjNHSE
	sZgquEm0HpPCc5WR0VgNvpd83zikBd2Sh/967s56ja9EraTVW3QlHR+A/Kd5DI/yKtO1r81JLtk
	DCmfeC3JsJQJ29YTmQ0iPOzObccod1n/PryZ+KrZt9JDc80kjVGSmMs/vijZCM1auhhxjJx8O+7
	4ZuXHsIDZxIMhtAuDJzrbhozPBmYUJnl26G5zrieb4Ea3HQjLA1aEATTgzs1EIi2UJYh9YyhqOr
	E9Ty1dVEkl9XJirUDhTl2oSVEeKQb5SFkycmIhGZFJFf4=
X-Received: by 2002:a05:6a00:1ca4:b0:82c:d861:3caf with SMTP id d2e1a72fcca58-82d0db7e9f3mr5730138b3a.36.1775305300317;
        Sat, 04 Apr 2026 05:21:40 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cfebe5b23sm8327063b3a.59.2026.04.04.05.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:21:39 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>,
	WANG Xuerui <kernel@xen0n.name>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Petr Tesarik <ptesarik@suse.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] loongarch/mm: drop vmemmap_check_pmd helper and use generic code
Date: Sat,  4 Apr 2026 20:20:57 +0800
Message-Id: <20260404122105.3989557-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260404122105.3989557-1-songmuchun@bytedance.com>
References: <20260404122105.3989557-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic implementations now suffice; remove the loongarch copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/loongarch/mm/init.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 00f3822b6e47..7356d4eea140 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -110,17 +110,6 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 	set_pmd_at(&init_mm, addr, pmd, entry);
 }
 
-int __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
-				unsigned long addr, unsigned long next)
-{
-	int huge = pmd_val(pmdp_get(pmd)) & _PAGE_HUGE;
-
-	if (huge)
-		vmemmap_verify((pte_t *)pmd, node, addr, next);
-
-	return huge;
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap)
 {
-- 
2.20.1

