Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112D719DF66
	for <loongarch@lists.linux.dev>; Fri,  2 May 2025 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179212; cv=none; b=Am8L/42nyJjnO8RReWUUn+2kCtJlFPagJNp0NFfiJr6/zky6xQ8eAuawKfwpSse+uiGSy+xoTvpOxOnPSwsP2V153jsSAbxpSewFWC64M8KWj6oxPp6XUdIyXqnIkGT9Qy+ty9AhtyWkoijkTKvFezyvIdqQzXD4vS5Aglj9QAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179212; c=relaxed/simple;
	bh=bS8Ebl8McHMwQRP2b9+9bPhRqECSzCU5b02fcngqsqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glhil5KrY9K33y/KbTs56rvpyeCOHK7ElBnFQ/wAjUWBVyOaXmRrC9pIYg3XJr2q8aXz444CBM3Uf31OkFctS2WtzY44EPl9SO/vjtM24YHr3PyBQ9vLMx1mZF0E3zGWE+TXSS9oU6DSoeoNYH+IYjBYmdA2qvcqSEFX8HTz++k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5j0UXdm; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5j0UXdm"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22435603572so21227465ad.1
        for <loongarch@lists.linux.dev>; Fri, 02 May 2025 02:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179210; x=1746784010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIfDOjq9qhHckyXryae5MbYL+xPZ6FAVHhgspJGsYWI=;
        b=Z5j0UXdmoIChX6tX2ujIVxKlM43LuXEtspEAS7DilJKKKQv/2+gt6+uulcQWSkVZf9
         8Oe+jof4IcRgoLHsNNcrXKeK5eCKaSI20a7Y2Hlw+3AqkpkWm2nlX+a0VK7KFEqKcJur
         LV2q2TKpuoKNm8vbCOA8seZ1kxZP5OVbWKp1mnPVPGJPC4wlgyAMm1MxU0iceiNV7Pov
         UVMOF7Pq3vks0ErHtqFTrFVe7A1nhgTcAztD9ggDqT3V0z/614d2AyBUIBDJ7JuG9pD7
         KS1PgiHlfyLOmmPnyep26ihZxN/LoFcQiY1q3Xg/0C8IKKCQuxfcWGihxPWUCiok3sqU
         3t2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179210; x=1746784010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIfDOjq9qhHckyXryae5MbYL+xPZ6FAVHhgspJGsYWI=;
        b=M8CRH//FUAONXXl8BjiyYlsxmVHwGMlXlh0h3een31KZZlEk0HerQbayrz3Hrvf/xk
         UsKMB/d7J76RG0JGr2irWHm+T/8JNcpgVsgrr90500mqLf14aPpl+6UhxIhzZUq0wMmL
         qipuCgCF8jjgGSsnUoIyB6di6l9UBqmvcw4V8XsHGZJkI14t8G7futMVBvPtCbAJxaC5
         T+5Dhbl1mFhO429LBSjtyhL/zsHCuSPQlL4X3YvdDcr95AuS49HNqkXMB2bGT3cOiWhL
         6xRs/yJdWONw6ORKVk5WYYFX1qyGcNhYZbLst/qPNKqD8uPdZpE9p5LBbfzwH3BNe1mA
         kMPw==
X-Forwarded-Encrypted: i=1; AJvYcCWnDGStSfIhs/jn8FEJPyTb4YhFaCA1BMJLSmiysms6TAoaBR2G9HiWriBlWJ0IEDtIm6zJ/NYTeSc=@lists.linux.dev
X-Gm-Message-State: AOJu0YytJSyseGm2oFKigViI6hSEy7xG1xJEG2ygKHsoUETP0GmZKC7S
	qSE/DX6JnpCiHiz6LkI4MbKBdwrAVibIVYOres5V34+SHjobneEP
X-Gm-Gg: ASbGncvXrbja3YXwoIrd8eBGD9olWEDhjjJTlv4po46s/lzJSj3uEhlrYtRhdZTMZiL
	zoJTTDddDkFWFEjDmRzCp5TBY/kl0MiJcb9mixwq11rR5+kFkmMWHsUYZWtSG2Q4b5q4YAhS9ZT
	ZIQnnDHg//+Q+iGAg3MBT5HPYAr8MqH+s0A4GzI+0XSkF55EOn/0GJkYEBuUnW6eLcRr6XhAhAf
	0btxBRI5fpEZEEcov5VyrpdyENTSWDKGT9lsEi8cTJOCYOmUtJMi76vdp+VevezPS5VmnX+su8/
	wS32cFkn+u0EPKyLpJMtShaATLErEmXWmt16GMafXbkhiZhf+gd28KlPZeAH+bOFUwE0RalZW3u
	tcesBBBX+uPoTZamorg==
X-Google-Smtp-Source: AGHT+IGNrYRWFIFxS/SMvu1kN7DhVaABG7vkSf2FsbbxwbcCnEdTvQrlp1ORF1H2Cyveec3KLO5zKw==
X-Received: by 2002:a17:902:f608:b0:223:432b:593d with SMTP id d9443c01a7336-22e1039ef34mr38688315ad.42.1746179210153;
        Fri, 02 May 2025 02:46:50 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:46:49 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
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
Subject: [PATCH v6 1/4] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Fri,  2 May 2025 18:45:33 +0900
Message-ID: <20250502094537.231725-2-fujita.tomonori@gmail.com>
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

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/x86/include/asm/bug.h | 56 +++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index f0e9acf72547..be5aef1aff9e 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -32,45 +32,42 @@
 #ifdef CONFIG_GENERIC_BUG
 
 #ifdef CONFIG_X86_32
-# define __BUG_REL(val)	".long " __stringify(val)
+# define __BUG_REL(val)	".long " val
 #else
-# define __BUG_REL(val)	".long " __stringify(val) " - ."
+# define __BUG_REL(val)	".long " val " - ."
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_ENTRY(file, line, flags)					\
+	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+	"\t" __BUG_REL(file)   "\t# bug_entry::file\n"			\
+	"\t.word " line        "\t# bug_entry::line\n"			\
+	"\t.word " flags       "\t# bug_entry::flags\n"
+#else
+#define __BUG_ENTRY(file, ine, flags)					\
+	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+	"\t.word " flags       "\t# bug_entry::flags\n"
+#endif
+
+#define _BUG_FLAGS_ASM(ins, file, line, flags, size, extra)		\
+	"1:\t" ins "\n"							\
+	".pushsection __bug_table,\"aw\"\n"				\
+	__BUG_ENTRY(file, line, flags)					\
+	"\t.org 2b + " size "\n"					\
+	".popsection\n"							\
+	extra
 
 #define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
-		     ".popsection\n"					\
-		     extra						\
+	asm_inline volatile(_BUG_FLAGS_ASM(ins, "%c0",			\
+					   "%c1", "%c2", "%c3", extra)	\
 		     : : "i" (__FILE__), "i" (__LINE__),		\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
 
-#else /* !CONFIG_DEBUG_BUGVERBOSE */
-
-#define _BUG_FLAGS(ins, flags, extra)					\
-do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t.word %c0"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c1\n"					\
-		     ".popsection\n"					\
-		     extra						\
-		     : : "i" (flags),					\
-			 "i" (sizeof(struct bug_entry)));		\
-} while (0)
-
-#endif /* CONFIG_DEBUG_BUGVERBOSE */
+#define ARCH_WARN_ASM(file, line, flags, size)				\
+	_BUG_FLAGS_ASM(ASM_UD2, file, line, flags, size, "")
 
 #else
 
@@ -92,11 +89,14 @@ do {								\
  * were to trigger, we'd rather wreck the machine in an attempt to get the
  * message out than not know about it.
  */
+
+#define ARCH_WARN_REACHABLE	ANNOTATE_REACHABLE(1b)
+
 #define __WARN_FLAGS(flags)					\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
+	_BUG_FLAGS(ASM_UD2, __flags, ARCH_WARN_REACHABLE);	\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.43.0

