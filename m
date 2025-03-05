Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D3323373A
	for <loongarch@lists.linux.dev>; Wed,  5 Mar 2025 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741173022; cv=none; b=ACgMqiYhShkQ5qY361A4jaFXglXG2nQEiuGKGQhk1zFDkNhDjwWY3pTQqjKxtq8aO8Pw4Tu+kHC2xTkPaIIZy8dOyzEKLSl+AJEEXaGRDpAITZHluN810Vn6766ancDH6UhnxfidMu6SCJuIaL4mLa7aKBIrSbqpWhNrHUBLiC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741173022; c=relaxed/simple;
	bh=+7XITjewWSl80gT0zr6uyJXg8p1d67Yg7lRhbz4DBTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZn3twSmRSCkciQfZQS8gfowCH5i0dxmpqWFgoRQnG4Qy5ansYhB3f0Js7K/g7JzGROp5aS0Y9P9fiAsO/g2aGJIKAZcH/R+WGJPTJtuES7z9dJA6rZkXXsFASmunTo4/Gwv6cco5RtvtdRG7j64/ZpWWG8f9C9/PayVs1QB3Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJJStb2e; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJJStb2e"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fea47bcb51so13276437a91.2
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 03:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741173020; x=1741777820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=HJJStb2e6fLDY2R4WJ0fYtCB2FjpgLFBqgjz069mNbkPDsfZKQIANBvrQNFDevyDtl
         wPT0efxkGgt2Lg1lI+1bGqsD8HeOz0wMHFzlf9jd6Pp53wcygXaswJ4uCrB2EbQeiFFE
         1yeUFa5IPDMPy0WC4p9AqRTy1HJIGgxInkYE8UF5M2BYHYwXJX2SZyWqtKphPWJtQqf3
         qtOf0EuQPB2NCr6mTZB3oO0zmQ8jwDiV0iUGupN+hTsPvC3vLHCMgczWuh6LER29YYXn
         5SWtLK9aoqvlc7MG2pkltONUz3JUOgyrDO1IwXABgW2OLrhO3by23i9lnwcXc7vLtjOS
         4RTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173020; x=1741777820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=WkgUjlx31a8HLbm51cprx5l8JFCrw8N/atNgcXHZWXn1UD2WDHNlCs033InlrwuTfg
         8XmyVBnPImsRtflY/OZLiFrH2BP47CjmpBZHsolNyR+XbCjPiKtUzkRjKG+yxdY7zdLY
         NsWEPdXsYK8lFM/gpIj6aSlxzZ6DfpVJKZB4OVn279gRwfbPOObmDXDpcveQxrLxP+9N
         en6mF9MQ0fqIjKrhbigkGeNcEk193ZMqA9hU+YXd+urcEDueu/XiL0HpgOFHALkuKGKz
         S1SswXfWC/BxNUdhtJ1xA7sdj2kTyLIxXKNQEQ7cfapR9D1ugaFRep4Ul0d6Bnfb2hZC
         vAyw==
X-Forwarded-Encrypted: i=1; AJvYcCU2F8NMcRTty6LutT9weOLqHncamgo09RKifOVZl33hTx+e85w+XlULjX/QCqGlOE+RLFgJIfHJKv4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBY6cTZ9xqdAEE/lhtpwBhECHi6p4+t6n8g25qX9c317ikYnCB
	YUMSUmZWQv5Pf29dHeVvA1JeFjjG5huP5DDuqr9uGV2n+AC3ttr8
X-Gm-Gg: ASbGncu5+IKWuiDZmrOgUCSWtASdrPpwjRd9jsh/NE+F4DSY0yexYa5+nZqWzDGHmu1
	0K7RBw4mmyoqkToxnUkqxXYF3du7JFoWf+i7YNYb03cKC/xllXj/T/Qnw/6bYJc0HIVYUqGAlKo
	5LSmEma74jDD98+0rHc0J7R+e9pzb+DgL4bpiDkEmfneE9qT9BqW6wD1FAai0fhfMSM8qllQhlJ
	uoRcjXCEPdsckJLfVJVY51Qhj56+QOEjunO+DolDpiy593gw9+YlorrhFQYHJn6gBAPdR+1y+mB
	omhgtRZdTgSswNKlF4mmGP3l3x9A9CxGj64cVrs0fNkv0HF6aymp6ORcqZo0BbKZIhYxUlAe6M1
	vXaA0wn13V52B1rWerLvIrA==
X-Google-Smtp-Source: AGHT+IH2eSO5dVRpZfQrO0mycl+1zvAZDwU3KlrIDKDzNpcS47TGnHWji2K5rHzupBDupL/ugdamUQ==
X-Received: by 2002:a17:90b:524f:b0:2fe:ba82:ca5 with SMTP id 98e67ed59e1d1-2ff497283aamr4865930a91.11.1741173020419;
        Wed, 05 Mar 2025 03:10:20 -0800 (PST)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7737a5sm1060925a91.13.2025.03.05.03.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 03:10:20 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
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
Subject: [PATCH v4 2/4] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  5 Mar 2025 20:08:12 +0900
Message-ID: <20250305110814.272792-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305110814.272792-1-fujita.tomonori@gmail.com>
References: <20250305110814.272792-1-fujita.tomonori@gmail.com>
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

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/riscv/include/asm/bug.h | 37 +++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..6ab13b56feb0 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -31,40 +31,45 @@ typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 #define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
+#define __BUG_ENTRY_FILE(file)	RISCV_INT " " file " - ."
 #else
 #define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
+#define __BUG_ENTRY_FILE(file)	RISCV_PTR " " file
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define __BUG_ENTRY			\
+#define __BUG_ENTRY(file, line, flags)	\
 	__BUG_ENTRY_ADDR "\n\t"		\
-	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_ENTRY_FILE(file) "\n\t"	\
+	RISCV_SHORT " " line "\n\t"	\
+	RISCV_SHORT " " flags
 #else
-#define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	RISCV_SHORT " %2"
+#define __BUG_ENTRY(file, line, flags)		\
+	__BUG_ENTRY_ADDR "\n\t"			\
+	RISCV_SHORT " " flags
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-#define __BUG_FLAGS(flags)					\
-do {								\
-	__asm__ __volatile__ (					\
+
+#define ARCH_WARN_ASM(file, line, flags, size)			\
 		"1:\n\t"					\
 			"ebreak\n"				\
 			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
-			__BUG_ENTRY "\n\t"			\
-			".org 2b + %3\n\t"                      \
-			".popsection"				\
+		__BUG_ENTRY(file, line, flags) "\n\t"		\
+			".org 2b + " size "\n\t"                \
+			".popsection\n"				\
+
+#define __BUG_FLAGS(flags)					\
+do {								\
+	__asm__ __volatile__ (					\
+		ARCH_WARN_ASM("%0", "%1", "%2", "%3")		\
 		:						\
 		: "i" (__FILE__), "i" (__LINE__),		\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
+
 #else /* CONFIG_GENERIC_BUG */
 #define __BUG_FLAGS(flags) do {					\
 	__asm__ __volatile__ ("ebreak\n");			\
@@ -78,6 +83,8 @@ do {								\
 
 #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
 
+#define ARCH_WARN_REACHABLE
+
 #define HAVE_ARCH_BUG
 
 #include <asm-generic/bug.h>
-- 
2.43.0

