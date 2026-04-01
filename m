Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BCA361DBF
	for <loongarch@lists.linux.dev>; Wed,  1 Apr 2026 02:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775010827; cv=pass; b=kVSW0zqA7CgqXLUYF0BOziTsBKDRAUYs2ozdoy/1L/l72v4mZCOfIamX1QkKO5OiCuk2TrdJ6jRTcWZ8wxE5d01cC79Y2ZWEuFUhKW6YFsmLmY3B3wFXbE4Xeu0+TkiFuRJTUJv1iZUWT+rwfKujDgGmUkrEius1TlnDGzv4aMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775010827; c=relaxed/simple;
	bh=essh2sxorikDa1Eh63RIs85oK9LyJHLj/1JIi04CxUo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GdTzGXMQyg0NwZRlPMLThQu1cV7bFo+zbzJZLju86o6iu0BEivMWR2QHeqZsX9X+M/CPtqv1HGUokJV9Ou00eEZN3fDmww4jzgKBWiU6AQzoQ4KMl1OENQ2TCB1/9H0eo3I/qA1OPYWNzyYxJzKopWOzTUv6HqnbERH1DZhxCbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUNmaM6d; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUNmaM6d"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2b542cbaaso3297881e87.0
        for <loongarch@lists.linux.dev>; Tue, 31 Mar 2026 19:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775010812; cv=none;
        d=google.com; s=arc-20240605;
        b=K1vp2HD5eLAttcmlmXVwpA/dnVZx64jD/qCNlrsCC6DEb2qgBXmF59whv3+cL8RNZD
         aZMU2oDfNGC4alzZs3bOp0bntqgSZc3aNDhDdyDm1RR0xSBaThjLSWEfcSbXkfL1vPNG
         MQY8CGrpjBGODcaxa5EE5o6aMn81wKjaA2iCE9N06/i+l4XmbXEGPG4raIeWwuJnKUaJ
         KHOqYZPZ5kzYDUxONp1X6mIgz9im02sukslPwtdiBL7Axomz5VVooZyebqQfN3OOHS+2
         /rF70eHz5uOGJgwuLds82tqPWJuqPlGUnEx/nmEDTW3fkaV7Q17QDwsvwZLD0XbiCmDS
         A1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3oo7dkEhtHT7VYXAhK0i4yVbZSa70g5LexsTV6nJgOA=;
        fh=U0DohHTzBYwyJrgDlsZdVSdkxcnDp0eRyRI8QGRA0lc=;
        b=Gt+i9rAfQaTHD5OadN7Aa/Gs8ymj6rHWmdfttZigEOoFz2NPZ47MWJ0g7+w2frjUFL
         Ilzp0TlZ4Q2OkAJkDrUZLUDsSyBDjZe31+tWQPcbV0hP2sMnAZxPAssaUSwXzIFQU/CM
         icpW5/F4frwMp6V8tgSHRRQ29GgEAP3yCNLwXUEg/cHbqO8RpRDS81Rt0mNkor3sxZQo
         eqrr4Xd2umkEkTjgT2qBT6WW36nre8lBVsUI16fUyXggtgT7270SYPbN7DCjb4PcmOiw
         1bUR0PenEgLo/AyRNe+8en8Lm3t/Av9ysCpxz2aSm1LLQbaCxh9/uWIrOXE7GXhepgMp
         o/mw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775010812; x=1775615612; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3oo7dkEhtHT7VYXAhK0i4yVbZSa70g5LexsTV6nJgOA=;
        b=WUNmaM6dwqf9G4b6ubClVX8RwazperchvfLoInONeUXeyqdS088FfuqfzttWS6V9Ja
         SGngYDtNUr9ijzh8zUxPPD2QULHzk2npQHPurQloYrEVjyI3wGQ12W/5DKEx82BbpZLi
         LWnHcdOnid7rixTgn6kBJ6TbwII9rgfcLbWt2bnelwq8svDh6z0BmrW3aCgLywKd8VBQ
         0Sy8xltB7luk8puE0tJWFrM+CAMw1WQgXtTFz07pJMrKYyXAWtMW0g1Cb2GJ2pXSl5xo
         ZbRpDUa/Rc2ai3xUqqhMzlmFBLp6VANHTksua/xmNgYgMpv90GAMl7Ytjzd6WrUHGHfU
         ukow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775010812; x=1775615612;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3oo7dkEhtHT7VYXAhK0i4yVbZSa70g5LexsTV6nJgOA=;
        b=EpA2sD0pNmr2+FOCcIzDuS5GgRCBS/rlhIhjQfhAu6F4/FiVybrH8jsf6ZKACJcmMJ
         kJcUjKaCQi0Js3QD69oqV5OE7u92w8+14lzq5cjMUSEjlztB4JDOkgur3Mt4gFH1IrzK
         rXSgHjv3AQeOPeoEQTfZo7XUwnO3uk0gmcW9qGO96cp6wMdjjhvTr/jajx9q7FSSygCW
         BngONhsEZcUblGw0ECM6UygPK9l4ZnnQh0CfcBjL2gNvpELdrKjXLosUuQFqwyE83bSI
         e+DAVMbvyCtlh0pr5oJAWa5s9q6+BKdIo2nEJIJxnz9ECqgrsWJaB9HarAozJp3gXusG
         lyKg==
X-Forwarded-Encrypted: i=1; AJvYcCW/sUThHmaWl76g4FYW6bF+j/sA1brM/J+JKw++ji9wyLi4c3dfRtBpwCFnMkhs2/EazJt4xwap9A0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw58cGvE6QBMHkbLUWaI3yMBcnHvtOHJf91WFzKxwqEXY3YtFgN
	stDAWnLrqqt71UrYyGcK9S13DE89IkdmRjeQUPjG7JjvW6MQ8f9LlVushkZAmqSbhjsAMgO5TAE
	z4mJVj3kITfYAZYR7At9Iof1u2ulDUQQ=
X-Gm-Gg: ATEYQzyTqJt3tt+FSxFhPMzoI1xNc/fA5a/G7fUFCYATT0g0Oi0XJx1VinWZORsOyqE
	INUhCT1O3oC9dCgaqkrfyjbyewr96eF0hTG6KicPz1QLZKLe6W5p4T/uKRsm2a7MfpeeDbx/mBU
	ZNtM/XNkUKkpzyK8g0PfRkPOH3iokAHQ3edDn/MKaeeiMFRnXP3K5RAKhSUkRdOr1rJ987hb17l
	c6+sTWP2WGwUkourgmiEOZ4JzaVfCqpvYE+qD2ZY7DChEQz0xKUQoOyc+GZIxLai60=
X-Received: by 2002:a05:6512:2308:b0:5a2:c0cf:451c with SMTP id
 2adb3069b0e04-5a2c1f23dd0mr689913e87.24.1775010811374; Tue, 31 Mar 2026
 19:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ethan Yang <ethan.yang.kernel@gmail.com>
Date: Wed, 1 Apr 2026 10:33:19 +0800
X-Gm-Features: AQROBzA9KQDCoKz5kKkfvNz3IJ9AlhJH5Qkpot3vhbFR9ZDzxPncYWR5-rTeLmQ
Message-ID: <CAKeWACY11_1JL_OagfxUhQckW4rkAjhwXxUnVHNPdHF60Uc81w@mail.gmail.com>
Subject: [PATCH] LoongArch: mm: fix FLATMEM ARCH_PFN_OFFSET for non-zero DRAM base
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, akpm@linux-foundation.org, 
	Ethan Yang <ethan.yang.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Ethan Yang <ethan.yang.kernel@gmail.com>
Date: Tue, 31 Mar 2026 21:02:26 +0800
Subject: [PATCH] LoongArch: mm: fix FLATMEM ARCH_PFN_OFFSET for
non-zero DRAM base

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
 arch/loongarch/include/asm/page.h | 3 ++-
 arch/loongarch/kernel/mem.c       | 1 +
 arch/loongarch/kernel/setup.c     | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/page.h
b/arch/loongarch/include/asm/page.h
index 327bf0bc9..80aea8b51 100644
--- a/arch/loongarch/include/asm/page.h
+++ b/arch/loongarch/include/asm/page.h
@@ -25,7 +25,8 @@
  * used in our early mem init code for all memory models.
  * So always define it.
  */
-#define ARCH_PFN_OFFSET PFN_UP(PHYS_OFFSET)
+extern unsigned long min_low_pfn;
+#define ARCH_PFN_OFFSET min_low_pfn

 extern void clear_page(void *page);
 extern void copy_page(void *to, void *from);
diff --git a/arch/loongarch/kernel/mem.c b/arch/loongarch/kernel/mem.c
index 8ab1ffedc..03835f8cb 100644
--- a/arch/loongarch/kernel/mem.c
+++ b/arch/loongarch/kernel/mem.c
@@ -46,6 +46,7 @@ void __init memblock_init(void)
  }
  }

+ min_low_pfn = PFN_UP(memblock_start_of_DRAM());
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
+ min_low_pfn = PFN_UP(memblock_start_of_DRAM());
  max_pfn = PFN_DOWN(memblock_end_of_DRAM());
  max_low_pfn = min(PFN_DOWN(HIGHMEM_START), max_pfn);

-- 
2.47.3
