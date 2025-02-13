Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DF823A99D
	for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 14:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455274; cv=none; b=Jrzzl4gwjWNPwLuEmN0E4c9QumAahUguIXRbKxQnEJDehfFYRdIQPBV21sESDC6FSRNFQq7ky60L5+R4lXwrEXaueyLZdMYHyjrT/BUudIjAY5Oj5VaJjMqhyqF/f34lCry2W/KbkMluzmNH8NbmEcBH6sAdgIiGaoH2+DyCmG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455274; c=relaxed/simple;
	bh=Pc3gxOcC/v5C7xqsjNR+BS+knJ4bCgit2eFUJojWgkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=szNP6tlkvcl8YUiGIO4LCS2tKMGb2YJP365MBQcqWTy3FZ1nQ+9IvhO1D7ARI2UJiwX0PScdswSEN3kO4XnzxPejRVXYJFCO8qIFPrEpxTy3qdXw7nYCDWwx0HqrOvSgyq51BmcKZ4rD84Z3VSOocUA9YL+6LnLBgV78ocSth7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2HknyVJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2HknyVJ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220d601886fso9445745ad.1
        for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 06:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455272; x=1740060072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNM9wcMBMuP84PLY2t7KRndWObkL1hWNmjkX5I560RQ=;
        b=a2HknyVJCjF/xcOfOX1JTIaGPHGYT3kteDnRhrMUsCvdKXGedogkeV1dp7pO5011/v
         um0QV/baxwJBr0RGJIULKsdcR7/DB3Cp04STE35XaJfVCaYbRET+WNYs6KCf/Zgv8ELS
         HAk8wS+s28rmjg+eqTxy+7xICU2LS6SWXRC+2j7Cei0i7g5fkDymji4M8ytGT2ENL4Bb
         dP7dvzpA8uOe9yvi7cheEfeXtxE4CqmKXvmGSqQki+wLxM6gb6VBaMioQOLd3N2iFosL
         QugJQYkLG+a3pz/kOXDYMYvBoEShuyxnN4QI6ZoIxQJcp9RqkWY8t9mu2XHBiZAbUkmf
         KhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455272; x=1740060072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNM9wcMBMuP84PLY2t7KRndWObkL1hWNmjkX5I560RQ=;
        b=uQicF41b+q2Pb0Jg9FyM2mb4cxjtJ7R//kVOnzW85jQZMu74cV3V3P0u+yipTC88yO
         Hed9TQxiofhmcChLGBxF91RhE+s9DQUOVT1PAjpSb0al+87X0S0dzjUUfAVt29yPnoH4
         ZXOWwe9G/bu7FtzoPDf1JopwxfUid1/MP/LAhAjD25jRTKTyeedFSeVo22N9tuaLooQL
         Q1x2sRyCkziAxkk4pvhxaoh5e7i5/2Tlz+jvQWXIKonQi3IevHHlcoUFxrqrnPbMJv+W
         +J6TutOITVdldZyoZq0SD6YB9mpbfRs1lXQbv0MiXeexDp43U7YjSSK5NWt4JasdT6Wr
         WAZA==
X-Forwarded-Encrypted: i=1; AJvYcCUiozMeCXRkGritpQY4yehfI9LRMsGX0PTQ4JWChR+RXmhcGUzKPZKsBKHN5p9WgLMaaPwPzdYPR8A=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd/UxlBJ5gULQXN2+Qgehr79dVExoydvgJ993oe6ZGe3jNynlM
	HLPL274hKr3nxdz2FsyOBuG0RCxa2sV3GoLxFd+Wkf+A7VTPmuog
X-Gm-Gg: ASbGncttQ1mVUu4SjQeKfEnQ7rwks5EV6ffqXiEwHbpvMFiWpmBRtLcPUjX5+y95T88
	dL07CngGnS5JXQZho7IUClpgz3e0y43ceu100Fa+c4afnqXzLiJneBushUlscy0q1WgxP/POvP3
	dBLoDtXc8dkJT7b426PeNgTTnhV6la9c3LIFYB73pujcSwoZ7GI2yp/gjdCZtXQMzFHCC9Tu6eq
	ojplklPyCKJIMOmxOhnYA3VcWOo4+y+33RMPO8q4SdzEBI5i43SVUIgfDWr5q3rAzVIcPbmQ6KT
	pcGbjNaduBQ6jIFlNhFd2bX2uHdnEYD4upbsGlJCz75UbZUBSuQRCl4lzHP+2jOszO0=
X-Google-Smtp-Source: AGHT+IFfgCF1ArRZmNz2DsvrIgfU+ShH60hN/cRDjxK0gXLSiUzxtydzUB1xCTWoBREuB6sO6ZsxDg==
X-Received: by 2002:a17:902:f706:b0:21b:d2b6:ca7f with SMTP id d9443c01a7336-220d2110efcmr56668855ad.32.1739455271912;
        Thu, 13 Feb 2025 06:01:11 -0800 (PST)
Received: from mew.. (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm12565225ad.223.2025.02.13.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:01:11 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v3 4/5] loongarch/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Thu, 13 Feb 2025 22:57:58 +0900
Message-ID: <20250213135759.190006-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213135759.190006-1-fujita.tomonori@gmail.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
Rust to avoid the duplication.

No functional changes.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/loongarch/include/asm/bug.h | 35 ++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index f6f254f2c5db..06903aef1101 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -22,14 +22,21 @@
 #ifndef CONFIG_GENERIC_BUG
 #define __BUG_ENTRY(flags)
 #else
-#define __BUG_ENTRY(flags) 					\
+
+#define __BUG_ENTRY_START					\
 		.pushsection __bug_table, "aw";			\
 		.align 2;					\
 	10000:	.long 10001f - .;				\
-		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
-		.short flags; 					\
+
+#define __BUG_ENTRY_END						\
 		.popsection;					\
 	10001:
+
+#define __BUG_ENTRY(flags)					\
+		__BUG_ENTRY_START			\
+		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
+		.short flags;					\
+		__BUG_ENTRY_END
 #endif
 
 #define ASM_BUG_FLAGS(flags)					\
@@ -42,10 +49,12 @@
 	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags))		\
 			     extra);
 
+#define ARCH_WARN_REACHABLE	ANNOTATE_REACHABLE(10001b)
+
 #define __WARN_FLAGS(flags)					\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
+	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ARCH_WARN_REACHABLE);\
 	instrumentation_end();					\
 } while (0)
 
@@ -56,6 +65,24 @@ do {								\
 	unreachable();						\
 } while (0)
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_LOCATION_STRING(file, line)			\
+		".long " file "- .;"				\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(file, line)
+#endif
+
+#define __BUG_ENTRY_STRING(file, line, flags)			\
+		__stringify(__BUG_ENTRY_START)			\
+		__BUG_LOCATION_STRING(file, line)		\
+		".short " flags ";"				\
+		__stringify(__BUG_ENTRY_END)
+
+#define ARCH_WARN_ASM(file, line, flags, size)			\
+	__BUG_ENTRY_STRING(file, line, flags)			\
+	__stringify(break BRK_BUG) ";"
+
 #define HAVE_ARCH_BUG
 
 #include <asm-generic/bug.h>
-- 
2.43.0

