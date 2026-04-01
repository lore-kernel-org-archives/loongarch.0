Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA8F1BC2A
	for <loongarch@lists.linux.dev>; Wed,  1 Apr 2026 04:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775017024; cv=none; b=ZjmjuTqFRTOY5qEZEnb7QfGttmbw1kH3pLdwYIMKz3YgV4DhF83NKCydGDksr/4mzRqLfeMfLp5LlzvxxqhPnWQHKMlC2tWAU9uWaTH2gSR+BTQbh998bvqq7K4lmIFC2sm6FBdonUyAVd6bSp6zjzSSEOkSP2xsKi9oJ3VyBPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775017024; c=relaxed/simple;
	bh=l922fxZJdN52S5EP0tbBncX83A4BDpblw6Wg3p8iUu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CW5qWzAjw87+fcJxgO07U7TeaLUMXKUeVZDdD4Yv9heJKmwk//ToCedHvVq3ERycBFOKVHd6q25AZqEZBLYuL+jBc38tiQKNinjmnuTgOufrk7rA5NucAa9IgJFd5FIMxHosODL/l4nBkjRrD+H5xkx1ManZaptyeuwMGoUYk7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7eFu0mZ; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7eFu0mZ"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b6b0500e06so8678713eec.1
        for <loongarch@lists.linux.dev>; Tue, 31 Mar 2026 21:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775017022; x=1775621822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uvuJacAw3jMb0IWkn6pjnEJfWKbd9mokrTdkvUS1kE=;
        b=i7eFu0mZOMW/WX788kUwNTxaGeAthDldfYHnLzb64zYf5n+x6CAQVxULV2TJ1DM3tH
         BcYd2TD7EZ9g201n78oMPeskGFCpYUKY9k35OSLZVjHBZkbJYsL84tW8LjPVpoqvxwRx
         W0wIt03lC/bn6SsdnVM18xGwJtcJAX8jROb7xJiY9FPwXZfwdyE42w7NQWl18XKmCLsn
         TLuMuSYFK/wcC1WH9puN7KMc7VqLpDg/RkkifvDl/69cZ1qhk8q1OQLwoTZcRqNAcJS6
         iA6PhesJ5CoJ4DuM2Z15x4Aukk93K+9qQ2XXHzYP886gRqiTQculh4Io8hbVPN05Jj+C
         GP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775017022; x=1775621822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9uvuJacAw3jMb0IWkn6pjnEJfWKbd9mokrTdkvUS1kE=;
        b=RUxQ8Upq6PdDQGv2cxnGO+yiCJ9Ie8hi3yL7/1e58enoC1cRfLhguyprNETOKN7ihI
         PJW19/R0v5CagP2KfeVM7/uCYktlXRQKIERpokGuCZZOzxmMqzwvNmXNUMfpKUoLenKx
         bIgGp9grZFup0knXrcCjnYeYaLMJU1X3N5g4j2s6f3QUjSiLRv4rujXV0ek36FzwC5sp
         XtxG41z249k7fdOAC/HSq8uu3hz+HlyXATOiAuX1yqgNkFgilttP9VDS7fFPw1fVhGHZ
         W0IGwrIoJgL+zPGDNUEgbW2VzUDR3C6HwDJk1rA5JBPSjtdQUYKdVgc/ke3sIt0/oOPc
         KEdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkiuU6aeXgPn8nRRsCMUlDFd5XwN+4wk/mc7r3R0dK8ZnKNMyZLDsbBijojFKFm2iZhMcTNM4Gp/A=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhHPs1FREKoRXDVRzwUCRcn9qJggZDDqXCWYpk5WnWRMeGbTqW
	tPfFkwZIwLxkTfnC1pQoauiU34qedrabBcOvDgD+UNWBZ8WyLlIH1FpJ
X-Gm-Gg: ATEYQzzLq8ileADwKMuxkU3fQVioqHS6CrLnqn7APWu037N8YCezBG/OPeSOSdMZhWw
	Qy4EpywtDX5Uz65CQPpW74PPY8HciuEOsWYS06VRcz4kPI56upleXawxgtcXyLBD5OQHYjoY0wV
	qn0L23G5d2VpdAwM+kp8WRgWX8xdyHVZLgnQkAyWygVHmk4TXsK9z3HTA8FeVTKNtc/RKxYWSo+
	qdMBNn/OQp71O4n2OqjVirOCsRb1V0BZlBfswKnj5Rc9Lgzykz8tZ4/Gg8ULzyQLndKLnARqQ3e
	Ufp0L4Dp27GZQT+nC31kRt4dXX6HCKgJ3hw1n9pVeyub0OOErGaeC6ALRqfoz19pXMvHxMW1B9y
	9tWMoJfiA26wJ809dqi7k/yGD9Cupr05p7wi5stg9hM2ucAur88SWKDf/AXK1urAlN5W2NE25CL
	YRqUQWSkb/UGVoxa0=
X-Received: by 2002:a05:7300:2213:b0:2ba:6978:2b4 with SMTP id 5a478bee46e88-2c9321b5d9cmr1075299eec.20.1775017022050;
        Tue, 31 Mar 2026 21:17:02 -0700 (PDT)
Received: from gmail.com ([52.161.55.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c45dfcc95fsm9876945eec.29.2026.03.31.21.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:17:01 -0700 (PDT)
From: Ethan Yang <ethan.yang.kernel@gmail.com>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH v2] LoongArch: mm: fix FLATMEM ARCH_PFN_OFFSET for non-zero DRAM base
Date: Wed,  1 Apr 2026 04:17:00 +0000
Message-ID: <20260401041700.3260-1-ethan.yang.kernel@gmail.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <CAKeWACY11_1JL_OagfxUhQckW4rkAjhwXxUnVHNPdHF60Uc81w@mail.gmail.com>
References: <CAKeWACY11_1JL_OagfxUhQckW4rkAjhwXxUnVHNPdHF60Uc81w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_FLATMEM, pfn_to_page() is computed as:

  mem_map + (pfn - ARCH_PFN_OFFSET)

LoongArch currently derives ARCH_PFN_OFFSET from PFN_UP(PHYS_OFFSET),
while PHYS_OFFSET defaults to 0. On systems whose first DRAM range does
not start at physical address 0, ARCH_PFN_OFFSET becomes smaller than
the real RAM base PFN.

As a result, pfn_to_page() points past the intended mem_map base during
early memmap initialization. This causes struct page initialization to
touch wrong entries and can lead to early boot failures in the
memmap_init_range() path.

Fix this by deriving ARCH_PFN_OFFSET from min_low_pfn, and initialize/
recalculate min_low_pfn from memblock_start_of_DRAM() in LoongArch
memory init so PFN-to-page translation matches the actual DRAM base.

This change only fixes the FLATMEM PFN base and does not alter the
existing VA/PA linear mapping scheme.

Signed-off-by: Ethan Yang <ethan.yang.kernel@gmail.com>
---
v2:
  - Fixed tab-to-space formatting.
---
 arch/loongarch/include/asm/page.h | 3 ++-
 arch/loongarch/kernel/mem.c       | 1 +
 arch/loongarch/kernel/setup.c     | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/asm/page.h
index 327bf0bc9..80aea8b51 100644
--- a/arch/loongarch/include/asm/page.h
+++ b/arch/loongarch/include/asm/page.h
@@ -25,7 +25,8 @@
  * used in our early mem init code for all memory models.
  * So always define it.
  */
-#define ARCH_PFN_OFFSET	PFN_UP(PHYS_OFFSET)
+extern unsigned long min_low_pfn;
+#define ARCH_PFN_OFFSET	min_low_pfn
 
 extern void clear_page(void *page);
 extern void copy_page(void *to, void *from);
diff --git a/arch/loongarch/kernel/mem.c b/arch/loongarch/kernel/mem.c
index 8ab1ffedc..03835f8cb 100644
--- a/arch/loongarch/kernel/mem.c
+++ b/arch/loongarch/kernel/mem.c
@@ -46,6 +46,7 @@ void __init memblock_init(void)
 		}
 	}
 
+	min_low_pfn = PFN_UP(memblock_start_of_DRAM());
 	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
 	max_low_pfn = min(PFN_DOWN(HIGHMEM_START), max_pfn);
 	memblock_set_current_limit(PFN_PHYS(max_low_pfn));
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 839b23ede..625be2494 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -394,6 +394,7 @@ static void __init check_kernel_sections_mem(void)
 static void __init arch_mem_init(char **cmdline_p)
 {
 	/* Recalculate max_low_pfn for "mem=xxx" */
+	min_low_pfn = PFN_UP(memblock_start_of_DRAM());
 	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
 	max_low_pfn = min(PFN_DOWN(HIGHMEM_START), max_pfn);
 
-- 
2.47.3

