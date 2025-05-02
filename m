Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C524922A4CD
	for <loongarch@lists.linux.dev>; Fri,  2 May 2025 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179225; cv=none; b=iKjVg//Blhuxwv+Zt8/8R0JMr/P6oju0OZSkaD1R+lZGqJMipQu2rCDshrIeJ86R1VGDmqv7quDITqzVn/qpscB0FHln4sE2cO3jvMSUK2uy2sY+dVcLG6hnuRqTy45S2fWyMhdjo8CWIRqEZQaYlNygsO9UV32RE0qaUEl7Fbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179225; c=relaxed/simple;
	bh=mdMjqDgKLmfSj3Eltmr/eklydzSfhT7tfE+JI7T4puc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+GH2HSG9f/eml35k/XyYoFG8foDWUd77HVL+veUhG77Zny/sDwcU413faUYR6ivP/EYQ85/dELuHH1V7r+j9aaDkS6+NWfUXORe6KcbbeTJf9gqjJjjIs6XyX96ALvKdhERxju4x+/qZUSR3722+DATgckcb2H7XlCgNKau9BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZazJ7g2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZazJ7g2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2295d78b45cso25131895ad.0
        for <loongarch@lists.linux.dev>; Fri, 02 May 2025 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179223; x=1746784023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=BZazJ7g24cpVw11oHS0HA7Qg8TS7CsVGHfquAUObxViZzaqah/eT8hgMjy6KhTKcet
         BlTqIwbe55ph+8eHRTe1moPmr4XPizmDwExW0C7skj4X7Q8n9tnAEkh1AV5QytrdEtre
         Ksj+QT/SwPCLKgkBGnIfHStJIGlbSwS391j+kBEbodVCyssh6il3/kLpiMemd0aeNCQ/
         TRyzMLWZM6WpbXreBxxO/WrPGy5qyUOL6Ls486jlf+ON2lJUbAUT4CvKd1NGwKSGzagR
         L/ZApS8mGnmkUXs/MLu9ib0ggSPgUb8jsGlZLltw6CKhR+L4yQLSqDIfkYlYhiQX8Kxh
         4Q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179223; x=1746784023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=cUw65xthvH4LdYdb1kr7Z7SPlFr3k58xvaYVLrmComkUvEPFZLRLYiQ2DJ23zwsUQk
         p5otRoiR50AZSZGuZ6fbIclbimDsKA2HRwS/0anI2As3JXOGfJ8N8QuhsQkyYwgfqZ1S
         l2eHXDCojTPyuNsNAkbOZxcnwZtQNr5dWKy0XsgIO4GXGAIikJwNYFWRq3+FmuIGcCnA
         1feePxk+g0x6l/LgRsbsJO7kE/YhHPcBlrJF3yZ2fFqWVpPWpKW0r5wCaa4jfYKfE2G3
         jZ2bnO2uU7vvvBGa77RTUvTitMW27wzW7e1Kjt+Lqpbcyv1hjaIhZbwC2JOooucUaavm
         wyew==
X-Forwarded-Encrypted: i=1; AJvYcCW06TywnG1yWtH41zgNAbmboANeWpUiUKzLNk0Gd37IWDbTx98dezLYqceHJ1jsBsNk5I2sFR8J+Vs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLN39OAZ0EsNRdz0YR2qceFxRcVqkPkqZrHrUGPbRrH+xlTvIM
	tmedSJR6H4GFloQr4+HRuYvPUx0PxQjcngRW4vqbgDS4lbz27x96
X-Gm-Gg: ASbGncu6shwq35akvTIC8NMRQOGEkZRpXdc0whGTaMq1cG4sSQIHFlUx5B3mZV40BZz
	8vMc8a5E0oc9wnXu/f79PI+9DjHUPMum6tu/8cGolHx6DcHnN0O9GNnCn1gdhdmC9wV3kjtiz3M
	Z+z7XLcTDY2aeEllOcUlgxMFBla2V4r+51S2jMathblALHJQs44lTe42TmR7M0v5UrcVY6SQocp
	9r0exIoyw0pu4RskPKB8DbgBGglOq7Puzov7jiFvBXWQJkShsL4kBm+9ZrubH3BaWexKO/eTqLS
	fXfXwoIGWMjZFGD4ICXGsUS3nyrXdTY/I0KuwIxTRSHyBWHZxh4u92sHxQ21Xpo+WilDOLoaR2W
	QwVhNSaBjjhwRRPvR6rB8pla+r2PK
X-Google-Smtp-Source: AGHT+IG7SpxC9CYERKlra1NSwOhm+ZnosVtJEMd3hhbHfc+fF/GyvZa2L0kJpSrWYrENqsswlrl6UQ==
X-Received: by 2002:a17:902:f70a:b0:22d:e4b8:7186 with SMTP id d9443c01a7336-22e102dc24bmr40114995ad.22.1746179222992;
        Fri, 02 May 2025 02:47:02 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:47:02 -0700 (PDT)
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
	tmgross@umich.edu,
	dakr@kernel.org
Subject: [PATCH v6 3/4] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Fri,  2 May 2025 18:45:35 +0900
Message-ID: <20250502094537.231725-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
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

