Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8721DB127
	for <loongarch@lists.linux.dev>; Fri,  2 May 2025 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179218; cv=none; b=Xv01NLfJRAxlSyf/ILZyUhqra5n6qKMT0khOUaT9jREihXpODBSbIuZ2V1cmgK2qywIEo5kCnaQ56CxVDcte4Wh3zjOTaKOgjGr1MaB6xq3owECThrygPfKNNQ073BUWC1cE1i/UAABfHQhxtNw1WtEOpYEyIpMQoEz1unmpSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179218; c=relaxed/simple;
	bh=+7XITjewWSl80gT0zr6uyJXg8p1d67Yg7lRhbz4DBTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uy2pHc1TOJJF6pSItWVZpqVtrTVZJvbW/CMLiv098rjVmOwiVAI1ZI+L7IlxY7bRol6iKKiVXZe4dibFQswpVMaFacauH3BmlNjSPa1TcVeokx+COGv+yvpHx4Mtefc0YS7dC1kovS/V50D4p9GT6+sexg8FwMBMfQg3jDQ7gBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFHgBCMC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFHgBCMC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2295d78b45cso25130285ad.0
        for <loongarch@lists.linux.dev>; Fri, 02 May 2025 02:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179217; x=1746784017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=LFHgBCMCakgNcXTsVpdT+4ObjTKbRiiPjf/2FBpyVgliiLhCAkcbkkUfU3R77R72fg
         M0BZJFsOZslP9ZGMZLOxvIpuihyeUEjscy+7LBw3dDcjUP0FO4ah78mRo7VqgBDtPuK9
         JoPKam9G+KI8ci2Z+nyyFQDb7wvEdxvabY/wuqwfn2FQyVLFRHA9AB7Rbo6J6/JxDGOt
         v9aYmwyzyXLOZzvfy/3kknjGZwKI0saTxGvTC01yqy48pmRk5N5J9n/Ek/FSFqsLTA4P
         9AG1sR/6zY8Zxiu81ASfF5IDDG9vgU1eEP4SS9Hg20gPK3A+qI52joBGZt5oa1O6n/MH
         nl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179217; x=1746784017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=MMOoHNX8I+PO+GNQW3s4y6eZk0OSjezmnW/Qq7q4jgOBiYgtvWcuLiLjzfcCv1sgdR
         /N4a6mYGPUE9VoO2AsTTcxxw3lPBZXIY0a3/gOfc3lsC4QvDOruozq4RIB4yh9V+b112
         /3CH+iJPyKE/2wGH6U1zDUBNMnknOjkR+p33h14/090tOJypdN8gfxl0nEjaWW0KLVTy
         gBV0Lb5s81vpRlPr9y9vWAoStULnSlNYANhD9J/iMR2CBdKh0ykzpJag631o9DChvNQa
         uXuKZpsJtRgkjNooGBbxcDavm/pjZMmDPQ7P1F8R7XzwOoPsQSqsm8Zopxr7mjPwPE1F
         MyYw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Evlo4wFAEbCkQt/zTv61+jzsh7+i2ydiiKPGN68sYJNA0QjixHi1QziQvo0Bt75++6ZibFuSTRg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1zrfFyBgcU3Bq6G/gLDqQluDsywiQj2FVLgNzLGS843ua49o7
	cki/ve6Bw7rcqSC9/KgmS4MO6jPYy/ALEyrI+cLw0L6QN9Q41YVc
X-Gm-Gg: ASbGncvgaTa1diovCEAhaah/PwHyhPltyX8xgulq0sbaCx6mQd6Opg+8i/mFvNALIDM
	uIW8JWgq4LGLlnpDWOzoM6oAodtI3/Fab9k+58wfohzuLM33GKPMcsDpuFd13GbaNgNHiauMj10
	EhJB2+6lngCllgYum4RLHSYczPlKbEcPTh3ntTk9WBa0yNLXyVkPtGp6lCTzNJ7ZIsp1xiNtO3C
	URwluT58IgHRIk4x+McMJ1GZGdF/Yjlxe9sn6M7UXGIlwX0v88cti/FaZi6ZZ26tPHR5INXyLNb
	FvVcXQbH9GOl+l3ioyXr8Ro+UQA3e6RFZ54rzBC8s9Ia2Ix9j1g6NMoWepxiEjE3FAwhf0GWIkD
	DX1tMmerI79sQirqTeA==
X-Google-Smtp-Source: AGHT+IEhuS4VGYIBGVglTshr93vZldL1f6oYsKTf904LeEzffsUEpPtdIRnpOF3hALskrUWmu2hnrQ==
X-Received: by 2002:a17:902:cec8:b0:223:fabd:4f76 with SMTP id d9443c01a7336-22e102f707dmr33312405ad.30.1746179216668;
        Fri, 02 May 2025 02:46:56 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:46:56 -0700 (PDT)
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
	tmgross@umich.edu,
	dakr@kernel.org
Subject: [PATCH v6 2/4] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Fri,  2 May 2025 18:45:34 +0900
Message-ID: <20250502094537.231725-3-fujita.tomonori@gmail.com>
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

