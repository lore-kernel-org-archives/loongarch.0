Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BCF214814
	for <loongarch@lists.linux.dev>; Wed,  9 Apr 2025 06:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181979; cv=none; b=OrcM9aV7nLjuUlQPc1lXD31m6tysqs0KRwFRgK1b0863xt7VyzYQ3sI+5hcoETjpZOWWS7E1k1chOnOlgnOXbdL1nzfX7mccsyd91FcY91Fwi/+hHlaOOFAw210MsDFYumHcPPUGqBUa3Ti9vIAxrrurnZXe91vh6yEJ9zZYXy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181979; c=relaxed/simple;
	bh=mdMjqDgKLmfSj3Eltmr/eklydzSfhT7tfE+JI7T4puc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBXzJZpCs9s9M1oHzElNR40R2vrZCPG7VAPGHgJYAKEYSE+h14DttSsEA4JRptfkjQYZWZzUzxAplMPhruOSx6SputT7DBOxGbwcmD9cWWsljSCsyXlNqTl8tjBoZa/g/BdsGKIvsQVMBexdap0v8Mj0+w1wixk/0nyukR9AAjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ym5PNBIE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym5PNBIE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2240b4de12bso85105375ad.2
        for <loongarch@lists.linux.dev>; Tue, 08 Apr 2025 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744181977; x=1744786777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=Ym5PNBIEANBPfVQJpDd+uv/7P1CzITHtpZEBFII0ZTYoTCYkzqnxzt2cMr+w7bhusO
         Yyc1VOpTuyYULYET1Q3TCNuMrk3Si9AZALU6/ViJFKd/Gfy0xzqooSJDoYE19UZ9Z/Lq
         7Z0I3ykIuTZL33eexAM+kS3tZrlfsWgCiepiw07uaW9cxaA1nQwW2XWm9nkYtPaMYqOw
         AFWRqm2Wvj/meyJ4Xv+Mlyo4SNkit6q7ctW38KwvQgp0NtdUo7WviyRn6nvTxfqwvxBW
         8itmaXJ2lHZZcqmp7gHXEfNgC/UJUXZWa5z1t2spKAIhwnxdKpCemK7KIKT4qblBVWL/
         1ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181977; x=1744786777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=OcKv5CCARCD+Ki+hMAM/Srb+CKV6aSNlpyZQ4inqrZo2XiMspn27VL1mkzyvbR20Pg
         KU4J3OZrdTAqr9IoSbLfDDG2ay+KyHH7smkF/KgEfPECBfv2+vf1PgukpmRmOak3LG6O
         ITmpyId15JKjQyaA32gDl8d4BgpEgcFSeMJ2eA//mqBG/LV32XTbA28iNuWq6oEJtAOF
         D6evAv5NgrokvTR0ex20sDuoQOPBCldOT8+oDc7cZolmFv/6yD/YprgkwMJjhGNM2CJ+
         pls/j904e5Y/WLtl9ZY6FEYc99F1nwAJkI65CD/dzlU5nGo1ayRrKeuHf/F3Rx+MAwb4
         Irow==
X-Forwarded-Encrypted: i=1; AJvYcCUBlv1CnKW/BZvvIpvB2mlTRBX0docIw6ns2Y1SvEq5Bi3aTOfD8/75U2Sl9hC9guKhcJOrkc3VOMA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdIVEHR5M/evNxZvKjoH5BMZjdlalelCwjZbivgnk73lj9VHJc
	ay489bRKRg0WuEWQ0v7bhaIBwmXD9jJLa3HIHe50hLiDnRpUVPtm
X-Gm-Gg: ASbGncsbYI43gp2aUyhKZh/KyaTmMjFVnrncnStcFcPMRLQ1OvlnigUqjAzmf/z3fDz
	B2T8PrIJcVeDwATEJyTYuXaK2ZFhwLClKdAfpW7UOpbvD5aWbi/ZJ6HvGiYxTqSMDHZPXl2Arw7
	mzbCYBIkvIYg0MTTri3cam2F+4lkzC+cGYvfMGHjlARcMUqgZ2shSt0zGMAGhv9TME1uJ7xgNhO
	sF8Wj2fjTl2/xFGVmBFhqlIFZM511utuBH+rOthwQid+STBA/SfxP3gaSykcJuyysEYH1zEG2rF
	Fbpve8Z/o6Zhus5Le3LutshReSBMo6qdHBucEAl/V8f52wswH3j6V3ujnx5zV3mR8Cz/aAShuIx
	FDbylXjDeeGtmBdQJ4g==
X-Google-Smtp-Source: AGHT+IF2Tbyqa8jlbF8mK3RKpXeeOmZUaQjjm5vh3ODXS1zPKWwm1EPLzxRklzhDHZPXhNC/FLbkog==
X-Received: by 2002:a17:902:db08:b0:220:be86:a421 with SMTP id d9443c01a7336-22ac3fe6feemr26628755ad.38.1744181977595;
        Tue, 08 Apr 2025 23:59:37 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm4407815ad.220.2025.04.08.23.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:59:37 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	x86@kernel.org,
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
Subject: [PATCH v5 3/4] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  9 Apr 2025 15:58:00 +0900
Message-ID: <20250409065802.136971-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409065802.136971-1-fujita.tomonori@gmail.com>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/arm64/include/asm/asm-bug.h | 33 ++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 6e73809f6492..a5f13801b784 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -21,16 +21,21 @@
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY_START				\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
-		.short flags; 				\
+
+#define __BUG_ENTRY_END					\
 		.align 2;				\
 		.popsection;				\
 	14471:
+
+#define __BUG_ENTRY(flags)				\
+		__BUG_ENTRY_START			\
+_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
+		.short flags;				\
+		__BUG_ENTRY_END
 #else
 #define __BUG_ENTRY(flags)
 #endif
@@ -41,4 +46,24 @@ _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
 
 #define ASM_BUG()	ASM_BUG_FLAGS(0)
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_LOCATION_STRING(file, line)		\
+		".long " file "- .;"			\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(file, line)
+#endif
+
+#define __BUG_ENTRY_STRING(file, line, flags)		\
+		__stringify(__BUG_ENTRY_START)		\
+		__BUG_LOCATION_STRING(file, line)	\
+		".short " flags ";"			\
+		__stringify(__BUG_ENTRY_END)
+
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+	__BUG_ENTRY_STRING(file, line, flags)		\
+	__stringify(brk BUG_BRK_IMM)
+
+#define ARCH_WARN_REACHABLE
+
 #endif /* __ASM_ASM_BUG_H */
-- 
2.43.0

