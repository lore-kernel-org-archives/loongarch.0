Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31B2279DB6
	for <loongarch@lists.linux.dev>; Tue,  5 Aug 2025 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754403999; cv=none; b=spi12gGZZgudHbOGtsNIHEgANtMc+K/LZaBhl5Y4LxrRbC4bPZlFl/pmIASOPuEzVkjJ+DaTMJMXKZtgl+MXFBCE3hpNRqeOhyQ7o+N9IEyn6afxIXGiDl2KEQjELcV8JK1QhVqdXr2SyLe9kTaBmfEAI4rLSc4BRSF5vwEQFGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754403999; c=relaxed/simple;
	bh=YT0nUt8CdDH1RB0ycRej74uDxgOkaB3fmmbB8wGyJrM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U6GOx6snXEteUqtwm+/Z9LynGBF1EWg02pinl4k2dEYL6eaAPWZVpcIP+ab+AdZvUyL2egTiqWcncoPzElrArKJx7PiLL++EiHh/xKFvXwYeUZqpfhkmROkvYewfRa4RCbFRQHFcgOMtgeeBkZ4zumo4aj1L05HmE4AZEnCFNJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPai4LVD; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPai4LVD"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55b96b154bdso3368328e87.0
        for <loongarch@lists.linux.dev>; Tue, 05 Aug 2025 07:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754403996; x=1755008796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUUI2xKZlk5/jtNpSyx53EShjk/LU4/amvgKSzwK4wM=;
        b=nPai4LVDS0meP9ZUDgFZ+BNTqIEJVKL04+2IyMXNtW71eB37E79EQ2X7br0954c+7/
         rKrpmPf8bIhgUC76p11RzAjbG8wvow/aEAW+cR2yTsJ9jF/drD2ppxuY6hgOixXr5L3y
         kW4TXgHCx9Jjv0FWnpbygjmw2orGyV5JKTn8HU6TDINf6zGoBcoOzUwe8pQoPRlao69Q
         qbdv/jvPizgYduVfEMjdh6RWMammMhRS57rI4T0pXHtmY56DOm3l5nB1gjTtqwbrZBeC
         +pO+ZK/4VRDBVByYp64kh89B8y3i83wTNYG9hGMROCv45eBNg4WHTglwTnPCPao9nrQb
         sQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403996; x=1755008796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUUI2xKZlk5/jtNpSyx53EShjk/LU4/amvgKSzwK4wM=;
        b=qkbxqgArM3yQbTZaNMWxJn6aJVaf0a2WU5AfrZgNRf70G+X8NimdLX+AwhkN7fHYPj
         c6kEo5TSHuNsh/OlGIHtZcIFgmGUFcLUfBwUKPOpY52qGEzJ/GDgM2ZuNmnzR8zyI3Px
         kdbB5pMJvQOXjlnIspPaI/Zi0Z3jOGoc+Zu46qsZj2AjzAaUPrCY3f4s2UN+RorocgIy
         3WMeNwW/PS8D0FJjHKRLF1o6rpL3OjpdcLRZRhOWk7Yb76oYyW6pHELZl5gWK/Xa1jJr
         xun18kFd7CwbDZjZjpIKXBidLk3NSuSE/EpWhU3TuHem+w9l+JsQWwzktxmO6hObRVsJ
         fjVg==
X-Forwarded-Encrypted: i=1; AJvYcCVNl9wQ5u3eh+VF6BpK5F0RzfvOF7SVZGH8BrDwsQWdutSLbrf3BE9535f16QkA5bNjvA0JQq5p/Ac=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQasuT78/IlZICgEVxc8L7On2XP4PevWy1w71OJ5Y+WxSjjrQT
	HTWnPVC2x5MkjiXBcg1cbpJS/7krYVXcVP/tL+7IGGvuRmz7mceAgIEc
X-Gm-Gg: ASbGncvSZCFuUCTQKlPwucUm9s1ztFJhVPsnGgdafQJlZlsL6n0rycALb4cs06gal4J
	jibA9m3YHfBM6ctuYK0i91DFhKl+4lc40KkO8AvO1jP/E8FYvw0JeXZNFR/NhtDTMNEF1U+TK+c
	D8HaZ1DB8E36NJwN1o4JolyWVOr7dX4MmSLy1Z5HJKJtoROwwcdUivUdEbKFyMvBBpsJHfrm4hl
	ktoywUv9PX+Eoxu5vLb92rf6HVU6AVgfBgs+diX+jlkMspc4S5bOWdiaHcQs7rQ3TKCc0Kuk3U7
	istGaHcSceEnSX992CqtN+dyvYF7mue30WT1tm1VJQcXaE+uqNB8uS10CQoD2tMZZby15w5TtKh
	u7vCox+bxoHJY6DBTPrcTuLyClbRbI0qxFiZ+L8LP2Ua46gpONva87BvKQy9W5mPXTzjExw==
X-Google-Smtp-Source: AGHT+IEuyOphkquEE1TcD7oJ1sEAoZRW6geJFjdlevxIlBKJ8sCVOgd5wEIObFEm35WGh0DuMN4+1Q==
X-Received: by 2002:a05:6512:228a:b0:55c:ac98:edb6 with SMTP id 2adb3069b0e04-55cac98f040mr114526e87.12.1754403995715;
        Tue, 05 Aug 2025 07:26:35 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:35 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	trishalfonso@google.com,
	davidgow@google.com
Cc: glider@google.com,
	dvyukov@google.com,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v4 3/9] kasan/arm,arm64: call kasan_init_generic in kasan_init
Date: Tue,  5 Aug 2025 19:26:16 +0500
Message-Id: <20250805142622.560992-4-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805142622.560992-1-snovitoll@gmail.com>
References: <20250805142622.560992-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which handles Generic KASAN initialization.
Since arm64 doesn't select ARCH_DEFER_KASAN, this will be a no-op for
the runtime flag but will print the initialization banner.

For SW_TAGS and HW_TAGS modes, their respective init functions will
handle the flag enabling.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/arm/mm/kasan_init.c   | 2 +-
 arch/arm64/mm/kasan_init.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index 111d4f70313..c6625e808bf 100644
--- a/arch/arm/mm/kasan_init.c
+++ b/arch/arm/mm/kasan_init.c
@@ -300,6 +300,6 @@ void __init kasan_init(void)
 	local_flush_tlb_all();
 
 	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
-	pr_info("Kernel address sanitizer initialized\n");
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 }
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index d541ce45dae..abeb81bf6eb 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -399,14 +399,12 @@ void __init kasan_init(void)
 {
 	kasan_init_shadow();
 	kasan_init_depth();
-#if defined(CONFIG_KASAN_GENERIC)
+	kasan_init_generic();
 	/*
 	 * Generic KASAN is now fully initialized.
 	 * Software and Hardware Tag-Based modes still require
 	 * kasan_init_sw_tags() and kasan_init_hw_tags() correspondingly.
 	 */
-	pr_info("KernelAddressSanitizer initialized (generic)\n");
-#endif
 }
 
 #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
-- 
2.34.1

