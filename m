Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12C244DB7B
	for <loongarch@lists.linux.dev>; Mon, 29 Jun 2026 16:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751086; cv=none; b=NkTQe1Q33860/yfnkauyg1Q+goiFgr7vVap6NI6gvPuGmVZ+EsDBrZQV/H43HZjXdchzyHG4o/+TZsIQUvJ3IycBviCOULjRoqTALtkv52FCDBj1IK7c19st0s5zV5eW0+iI/68Puix3wJw76N7ZLHxFnNeDizfoMhD455+PwoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751086; c=relaxed/simple;
	bh=tp+nqf2DUMuFDtMIt8NG1Uwm75QdQij8nQIbIElDjlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+vXxI7VMSmO6Gwin0KhWYCFL+6RaVwc+dGsawJRTrMDQiRyGlTtsXwSkqPhVdo4E3PFkwdbTQNgBGMgXUEdJ5YIyTU5B6J2h/ahjZzJLfqB8G/FOwkt/eOcrU+pYninaFcwgQypyPUIJApmUbfdQxkP9iewgpBqYAQCwTed4gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsRI5U0n; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsRI5U0n"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8454160043aso2972190b3a.3
        for <loongarch@lists.linux.dev>; Mon, 29 Jun 2026 09:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751084; x=1783355884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo8uO5n6psQwUEUWovccxe/ZWX+n25l9kiG0x3jxhi4=;
        b=BsRI5U0nn6Te4v11anM3bfTwjAC7fIGGSb9SjJGRSwLhyxah0FYBF+Wm9YO0nT1mU0
         jExZK5eXGD0bPhpsRp7x32BadJ8AHmFpQWBE0zwX+ipSqDPEwpJ06W8xHH2Il6P5Ccfb
         290jk5nct8tDr1Morjie6HGHJ5zTVpGjXqlTzjwDgVIdBh4lMsTzvlCMvjub05pVHnOR
         NdKQPcLg6tK/VqFoEG1IHxVCo5UL37UpY2jLn4oBFn2NZDBK3hEnMZ7/JdpgW/iJhzQi
         g1R7ab2ViUo48KmigWEXamaE+LAV0dMV4WSC5js6RbRBrTAAH7GH+3wiML0uQeynUL1A
         EypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751084; x=1783355884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xo8uO5n6psQwUEUWovccxe/ZWX+n25l9kiG0x3jxhi4=;
        b=JFTsvo4fZccPv4YKyntpfd69vT860gXIS4gktC3zXdL5GzScYEKsSs5tZjlgH3dmqk
         NFx0oEqDsXlY2RUuecRG7dGmSF6iHCnNj47gWAPOApTD4E10l5JoIpo0CJ7A99n7KCq+
         Nq+S0GjYqdKng8vykqhhc7oo5tPISPlFuFl6676Bq4XC5vJDWxmfXwQKemoSwNJbuliW
         nxBL0EELGKlgB5fCleNxtbnUXpOdOJgOYZeW6QWNGNkL75U5hxKH6+vGC8DKDtYzPjQn
         wHY81y/TbJTDq92+mjzvJWLcCem1v3zm4CmVyy9xw0f09vg2Jo4QSfocZIxZwUfTKphz
         b/ww==
X-Forwarded-Encrypted: i=1; AHgh+RrqcW89Mec2ylcSyTkl27Q2p8jtRCb47jDAmPXpj3aNZE5un+eur1p/tOotqc6weuXzPDm7q9cucpU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+I4f+6fjlNKbLf4AnI8vT3Jtl0PKjcbbUAdlmGADp9wsfCrZD
	/GiMPsE6vfIuDogjNziq7vrKhlXTCljavleYQSLpzbBOFxAxlbCq0Dj7
X-Gm-Gg: AfdE7ckycQ+O4b44pIfpGsmkZVHJ9F4iYFcZH5gfaLtfc5tL1PZsFhPT4zMKU272qse
	vuzL0QApGplhh/GALZdXBH3q0E6T07Xv7/sHPAW5e62DOqt4bmvto8JSjp4yHw7GW0p5gkMOCRK
	dPWIegm+aRLOIA8F4oWO9NagL9g2YKTjPbNw7LmMkO3IiGiN0bJOPNrhj9ubgtup3QlLs8NqamR
	iKyHsq+BaVUTiqUHW16BH4UCojWzxRM0B5Q1f/wCnvsN4ROwyciYmi6hqQWS1xA2AHT5qnJdyfr
	eNz9RdwX6oH5hpPt4ZQ2lNxHMXbvJWd0antzgueMXPsviHXAc0aNWY4CC82IeZwqz+oGhPKn7xz
	cJIxsHINEax0K3orLcOQsmErGt4X3185bqzo0yHo21F0tYOFSrgWbbL1b5TlvjUfd4m2So4XV3n
	ZYnCMm7Mk=
X-Received: by 2002:a05:6a00:17a6:b0:845:36a0:9eb2 with SMTP id d2e1a72fcca58-8479f236947mr209923b3a.34.1782751083985;
        Mon, 29 Jun 2026 09:38:03 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm18474b3a.33.2026.06.29.09.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:38:03 -0700 (PDT)
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
Subject: [PATCH v2 2/8] LoongArch: remove unreachable invalid range check in kasan_init()
Date: Tue, 30 Jun 2026 01:37:30 +0900
Message-ID: <20260629163736.1606688-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629163736.1606688-1-ekffu200098@gmail.com>
References: <20260629163736.1606688-1-ekffu200098@gmail.com>
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

