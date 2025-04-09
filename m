Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C51213245
	for <loongarch@lists.linux.dev>; Wed,  9 Apr 2025 06:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181973; cv=none; b=NFYw9E4jF16/ntzrUFfu5uUd6UaC70GM2ncyCsEKFUfLrlBWT9eMqExBTOdLVF65g+8aewx6eyhP753/LPE9GjWE1agF3tpSajqiALuqdoAVTGjPRUkk+zHgJeYJp+Gtp3ffLQCplZOjnaJNPTWKN5cMKPa4xDk++yACJI0g/hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181973; c=relaxed/simple;
	bh=+7XITjewWSl80gT0zr6uyJXg8p1d67Yg7lRhbz4DBTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMNRhTOR5AHgYwEOzlwvP0yDC9ZTTy0Lrtz7E4vxMdjivmteZb+HMYg9omYYPYVdkine633rILHWprMFr+AHzqaEVUD4p1yr2LMoDdx5/zdOBmwt2x3r1R6eD7cv1sw5bZX0ftI49EKCZDGeWH1IyRYCKhKKN/0FPo9BBK5zjCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjcOh+nD; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjcOh+nD"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2254e0b4b79so80024535ad.2
        for <loongarch@lists.linux.dev>; Tue, 08 Apr 2025 23:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744181971; x=1744786771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=AjcOh+nD2PoYZwcWz1m8n+2lsu2gAABJcOAXkzngalsyyXnezs4ebY/FhKNhCa5eYt
         co7EqL6c4ztMc1Jd1AU1d6ixO1IDztLkbOXQQn4Z5WjT5sQunLJw+dFXg0IJEd+n+Spo
         f4k43OI0q1PRqyW9pYqhNR3CZBEqmvW9wHk4qGYXfIHRWjhvbuPNM+qjTY5s0Vac4MCV
         l6ICPnwVWIoodRmjXjGkTSKGS3Jd6LkiR/VERU2YocaCfdzVd90nustR5Ti/x/yAusKq
         xJytjOfyer39//3kzqVmvXuegRXBoD8p880kle9gEk2RPBRG+5r8IFHSQfDi4xB5x6G7
         SlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181971; x=1744786771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=A5D8A/hWRALIF2YTLEUzsyP+XAqtKoZAHOCgXkQCPDOJqUg3UKAAelKDPC8il1w2PB
         3sIt7/Bvc8SdmilQEVcLpq3+1pM3GRijRCScSjtS/jz4JPD85uAoxMdp520EThuy35xq
         AaBHCfTqLVdNibZQxh7FBnk6SOYIUCQs7UBQfG7pOPh/zylZPYv38LXWdvH38Ee6rjCQ
         51iG/7x0q274x+dcFhMEn+6CJg6Tkb+ZtQ9IwxoJM80wndkHyfM4qzHCXwHB4Sjmw0co
         s1L0seEpjsdZymB1Mk5giwzoTaAH5ds1rtpsXQMP6K90+GRK1wYRBkXAqzkiwQhcX4sG
         042w==
X-Forwarded-Encrypted: i=1; AJvYcCU6JmbO91U6ODpr6a1jR1g/Fb+dPTLln1r61zdfiKrg7VNR3z9Lk+0fyhOdlaRvlprlrD36cbt0j2Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZryrQaZwiEZh0JmkoPoLl8Nf4iEld8hDjbV9gqLid169eyn9e
	jdw/w12S9fhzlSXCYaCG8LlNqlH67jNCgdBnvW+IIYI6Y5+D65a6
X-Gm-Gg: ASbGnctwgnxQQ+QfWxsBpsvt0GOhEffUxz/qHoxgZo4VRrB5u8ACfC4jvHqrveRqgfo
	DfFFucdxlmrRlHPN9TgLT4MaSTXxhOCMjxnblMtqOSn926WvX9Zb+U01EaDn0nPJDfFhUN+0GaI
	OC0vTe2G4B70c5XymRwk+YdxsAShNfPUSUU0uwmc1C/Ik+KPiy8yMYJF+/4vfxx4gDTSGxHqYjF
	agBz/k/GA8mDPzBBkul0Nx37D5Z3vWIt5zWytIoN10M8+WAA9ZKiaR3x9q/xL3RX095ED81uaXJ
	Uta6172wrdcxL/CPkfTlLPSK/U/EZ7qZ3Cqrl7oH1J1tXP9UChF0Ue/ErEXUt+TgeDfHlgNbUXM
	JvksQkcwndj/W7+tOiA==
X-Google-Smtp-Source: AGHT+IEZwYUbsTySsEIFtv1t72KELbYqxAXDutiQgzwO8B7QSQ1bxP4LPNczP+kdX8pWrESjGbTSiA==
X-Received: by 2002:a17:903:2b0c:b0:223:52fc:a15a with SMTP id d9443c01a7336-22ac2a1a9c8mr28742785ad.33.1744181971392;
        Tue, 08 Apr 2025 23:59:31 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm4407815ad.220.2025.04.08.23.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:59:31 -0700 (PDT)
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
Subject: [PATCH v5 2/4] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  9 Apr 2025 15:57:59 +0900
Message-ID: <20250409065802.136971-3-fujita.tomonori@gmail.com>
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

