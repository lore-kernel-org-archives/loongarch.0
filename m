Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2971B27127C
	for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455258; cv=none; b=qbIJ9g7t/ugCfV/MOZHOoesE1sZDv8HPmuJvlJIDhoFBTyJNTgNmCatbJEuXn4ZqkSrkMkLXUZbTqkUg31gz2uPvuqp5cOWwR70es1TwPi/hcX+MO9J9Txwd/EopLbUo2owmVQmTrbzVBRsMTsh79p3hVyKQagdb0X6cJ7HhynA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455258; c=relaxed/simple;
	bh=zKjcSUryVoDbQCRZ2x8lBFB/w5Bku/XsU/5WIanvQhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1zrgdT61Gr71JlsQ2nWFhRU3fTsAAZUZaib+rOTxwqiMUrpZy7tgYewUOS0dbKkeMqipDdURZ8UuWZSFE7FYtA0GhvtygiH9NiYMajtnlzPQn3pwAQpUIIpoyhh3iS2KO8xA+rD1nRUkGkrm6CS0W1RJ/LAQhureRycr51TcJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Io6E9za4; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Io6E9za4"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220c92c857aso14349285ad.0
        for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 06:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455256; x=1740060056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+y6Ck4nUrrnZ5J/UDrnc3xAlfWqC0MtemaHjWH6P0w=;
        b=Io6E9za4VaecpXURwhfNEyl4yq2EC85bB7iZ6cA7hZ2OeqAs41FQN5KA9aKmWLGoUP
         7cj/ULOH4+xuzAK0+u2ZZFZbb0te3QP5VVDKPTaB4xUNK/7SaL5YoOuzucn0snOt0psb
         dabOONbCa3Sx8N3vl9TIQlGeYkTCBit1vx5dhLvW8eBTO3Te3SA46/VQo50J0Tbwa4BT
         VPEqJ06TUWNNExGhzB7hKAUJ+7vO9Do8YF2C4meDed1bYC2gUeqkmIDnEpH7amzJRV2k
         wfqhaQRayLxq5NnOtFgMVaxX0pEeb97ftz5418m6nkkh2pWPhPKj6hLVRed+3FectF8Q
         I8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455256; x=1740060056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+y6Ck4nUrrnZ5J/UDrnc3xAlfWqC0MtemaHjWH6P0w=;
        b=qXOa65eErmmsHyqytItzamnGVqajYwQwQQrDbbCGRlKy866BLkuI/a8VnR6PSNY+e9
         OWQdrWlZn5HMgGozcpmH9wns07F/dKAJAba1BtlWwMER+v8/uTWmA/7lvzHjXRrm4EPX
         /qZRkxQ77HptLHV3B15YpRmJfZxnlxMjO6l6U7X2QkyXcBOdhGK5Mpy2Avfnxq87WX8I
         izvHEVSaLqtUFaPAN8qn7dys6U5DFLHtTGY8b9ZsN6WXd75zvnV23SBP9RriaYlrO2xP
         scDdevLP7z97CTH1yWkE+sS35p2zEuLif1d0m1oSbxDa0hTzJ3D80l7zh4+jnNK9yT9t
         7sew==
X-Forwarded-Encrypted: i=1; AJvYcCWdXYuw8IqgLBKIhCo9bgOBAMeHclocS33szPNKGBQukO98ypsDg8qIoS3g6QgkteKCekkDk0tyzaU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIF1MUPZ9FyjWUL4ltvbpb2ERCvMcmG/c75XtWLuYv1fDTQN+k
	12Q9kdFPkl/XpwN4NFyI9cIi2aRqMBjYvyus+bXBvl2/37ypmDNO
X-Gm-Gg: ASbGnctT9+kykpC/A9kV1+BnaRH9MomceDkCTlo7cJehoTcX7Xehppt0nYvFKpuudW1
	N8pLZAtpzren1hxfZ0XdWh9rKDOTP3NZCdcyShkK/KqHJ3oIC3jZab19+wa4FQh5/7R+OkFN9AF
	vWjWf/1pyk415W5rKxTIDSjrAdlFeUPcaCzXO0NUdBYDce+UyzvFrisoARiIkZhHUvF6Kml97u1
	zxJ5JJQqNAY96eusT0Y4Op7sFSuXfs7vykCDiAj506kLmZlZTH7akpLe56DJSpAvMxpnH8OBxOt
	ICOFspEN8JthYwFnAo8XktI2GhjPPnbnk2/NUjyHDhWeXLBTl5Z3PWSkNXHIYxgLP5U=
X-Google-Smtp-Source: AGHT+IH1Zqo9tPEvVGN2+sG3MuJAeMqjgEOo7xAq67fk4VjOAgBOooytYfL4WucnOp0CvNreEK3WqQ==
X-Received: by 2002:a17:903:94b:b0:220:cfb7:56eb with SMTP id d9443c01a7336-220d376f061mr46259805ad.26.1739455256258;
        Thu, 13 Feb 2025 06:00:56 -0800 (PST)
Received: from mew.. (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm12565225ad.223.2025.02.13.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:00:55 -0800 (PST)
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
Subject: [PATCH v3 2/5] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Thu, 13 Feb 2025 22:57:56 +0900
Message-ID: <20250213135759.190006-3-fujita.tomonori@gmail.com>
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

