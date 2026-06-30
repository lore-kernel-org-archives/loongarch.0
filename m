Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6263C5832
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805661; cv=none; b=PvysWvrqhzIewhRru8I4oz34bW9iON2hk9YArkqItAvgvs2L6F1ufZKiMIw94XHa/B6IeUG5r251dFDxs/skHBo+UzygVpAPGUcocsHhmfKShKOq/3I5JzU4Flub3P/F/v0Xp90LAacAqdwCc4r8rnoORY1na0d2INehhMMfiqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805661; c=relaxed/simple;
	bh=ILe8sZYbhc1aPGHkfBxgnEvKOHpdfl8WUXOCF6YnUmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z6nzrogpiPY4tz4d/5HxROEzqy3ADeJzyfVs88oWgzBEkfu2dZij1GB3yUUC+tGdTVQVk0BAwXQYHVrzCnhlt1qpHqFwilc36XRAacFt8Zczjqyvr3NQNkX5o1v+scxPs7iL6eSblvuqiXiEtzkL7lgELdefySIqs5Q/b2UrUSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzSMIRHl; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzSMIRHl"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-37f7a5a217fso1818005a91.0
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 00:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805659; x=1783410459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=CzSMIRHlkWSB7m/G2ONVrhqhzbRLj2NnJTxOi+b4ao0ZenSCMkqM4JSlboeNoQPq9s
         QVYolRYpgERfXLDh9B8IftR/b/UwmQlwCgSCNlwPiLGFmiMoQb4sbhsINTNGnqw3S5hK
         kF4yoOrMzlwDjNclCjKzNukY6BtWyNWwOehj9xY0QBOPHc+Igy/yGsZt0j9wgUv08tvG
         yNKm3DpFkWJu9vvRZ9gqMlFLDvj3zHBXXKbIHlImZNhEETAgOzu09PEXNf6ABoj7I4tx
         9U4RBUGeEnK5hAuyvZWQ9Nkf2EUFuvFRm88H9oPX2cHNot62VXSv9RcG/VqIGnK+UkU3
         IOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805659; x=1783410459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=smHtXZeyPxOdv/PdmfEzuvjcN2c8fird3EXGfzCoT1fhmDwW5OAKqkA1yZdsycQsGx
         3p3aGmPVTaG0TW0l0Ce+cLpRoyhEmhrJqAKWi84WZScg2OSjLxI7Mxazc5uzAEZDpqiO
         2J8VhwmBJI+LKDUSq0IxMPJIEHf1otYu3vW1nfTu7By/IMGOXzssWG3SppNzd888vcc4
         r9g4kySuslOn/ssSDdQpVN+BA+yNGyzx/TnUVursyRWQaztzJfaxc+7N6bJ61yhaCurH
         LoqfHsMwdVMcX6rZivO8uz5/qoNccBIP4K4mM4w05GtUW1fiFYe05byXrYX0bZ7prJVa
         s+HQ==
X-Forwarded-Encrypted: i=1; AHgh+RpeFSIo9MFoBtqJtxN0x7+1F76P/eqfSjuPTp//pDQKWw8DESjEbRxzC1JmErrxeIWMD4NlUddlKZI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqcivnAX/m7Dh3vXZgKOLy4I4i9NkUegM0Xui3ACsD5M9FpoO0
	oVhkloHUrlN9vS4ryE/uNSpV4drOfMtMU8Xc01bdccIOQwvI+I5CsOux
X-Gm-Gg: AfdE7cmEXu3a+WPGJZLUHy9S8jqonEYS30/YH8EEPOhDtLtGermCLtGABExD4El67ZG
	xcJxN/7i1j5RylYPKXsTAa9sgSXNPblVzVylEiw6i2ogVQxNwUB/PZb9zJZs+qS8qP+Pr48DoXA
	b4fFNprIArjmiNg5YkdtR8sFWjNzKdfQXhCql18JhXzZMVGpBMzqN9Js/9YpbSzTB4xYPi5h9Kg
	K3MAvB66YWTPymeP2O/234M6l5dYB4x4N9OpILGC1pEX1ZUb0vh0Csn64kzjgKpqvZyTn85B46X
	lnRrjJ/6x+eAzJXTbWJiVblrG/C9kPUXEEXOgokYPjMzKRG4UVz0Rz6HzHCTOov3lGs1aRAAU8v
	k3UjczBDd6VsbH+7+4mVoxmbMbHfFtJ8uWUU7el9cItkBAWBboZY2P4TEKpGjp3ZdMvqo6EQ10e
	YnncIzzC07f2fWmzEg9HUa/NxNhA==
X-Received: by 2002:a17:902:d58f:b0:2c9:fa31:850c with SMTP id d9443c01a7336-2ca2ea33e96mr19629385ad.39.1782805659205;
        Tue, 30 Jun 2026 00:47:39 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:47:38 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 01/10] kexec/crash: provide crash_exclude_mem_range() stub when CONFIG_CRASH_DUMP=n
Date: Tue, 30 Jun 2026 15:47:05 +0800
Message-ID: <20260630074715.4126796-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for an upcoming change that excludes non-dumpable reserved
regions from the kdump vmcore and will call crash_exclude_mem_range()
from generic, non-arch code.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 include/linux/crash_core.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index c1dee3f971a9..0033d4777648 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -87,6 +87,12 @@ static inline int kexec_should_crash(struct task_struct *p) { return 0; }
 static inline int kexec_crash_loaded(void) { return 0; }
 static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
 static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
+static inline int crash_exclude_mem_range(struct crash_mem *mem,
+					  unsigned long long mstart,
+					  unsigned long long mend)
+{
+	return 0;
+}
 #endif /* CONFIG_CRASH_DUMP*/
 
 #ifdef CONFIG_CRASH_DM_CRYPT
-- 
2.43.0

