Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3A7145B3E
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 06:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502871; cv=none; b=hIAF+X0GGEMTgNdlU1xN1BTdjKcfkTzLCTi+IKu7Nci1vUuzlqAZsBBtceaPIJjguB37uAkWwo5U+ix+GuwVSFI2ulIOIrTyPRnlBo35oXc1cLZDMHW3mhUr0Ym5AFedqdo4J1E06qAA1lMfg/nls7ld8/0A5ZDgrtAa7vVJJUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502871; c=relaxed/simple;
	bh=Dcj41wgoErpyvv6rMccASWdZmCVr+BwsDARBxcvPC6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrYe17KyGLm3rN4nxHSOMlFmsNIfawX2xp/l+AF0gJzCzURkfwHzCbXZCVnpMGzMeij9N1RQiHw4Zuf5ezyLdZLMa+qEHP0BcexcQc963t8fJD0pZgIml+7h3GTrDGj0enQE78eDuF0fFDdoyKjo3DnOe/wtT3GoYG+MpUMG/2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnK3mmIG; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnK3mmIG"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-725ed193c9eso5241083b3a.1
        for <loongarch@lists.linux.dev>; Tue, 17 Dec 2024 22:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502869; x=1735107669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvYxXwvEnjyqSBQUdMwEVvz9hfO5O8pSiGSR6Ept2V0=;
        b=CnK3mmIGv+4UAKPrp7Nw4tPz17JiUBEGbV9jt10vjeUTmktxwyOghhE3oQWrN1UNkt
         S+y2M8sh+aTWsv1gtrgFsewze8qOaa+/ZP3rv2jfpmR/5uoGxC3yFwUg37zKZbFBU2pd
         5VIFEPusf8RYI277KlqvfrYHc6qG1Cc6+TU6nph0/Tm9K4AGVeO9Smp9LngafmkO6go4
         v9bpodWa63C5cHb5soT1X99H3nXZ/8/uLMQLHRw94WjhKgveHzsAeSwqsgvM4hdHENfV
         8a+GUrfg7WQG6/7YPmIvRoKBPS7Mx4jbEVoFRQqL0JuxTL1qbRsm1KN+eIhPbpl0ovaM
         YIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502869; x=1735107669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvYxXwvEnjyqSBQUdMwEVvz9hfO5O8pSiGSR6Ept2V0=;
        b=CwVoarG73ppN/0Fek3EGZ9+7AF9FzBV5cZ8AwRPByNk6mxpVhM2wsMqdzS9oiBp3Ul
         LVrqxCn9xMaMl/BhnxJoDsol0mKsznKvIdT3SXqHO8FxdQiX9lBzbnhhsQoERF4La5qo
         JvSlmc8pamGJKsuyTjdZqJ1JE70hhut71U1MTM5aIWAJllvO46YVyZyeF+yQ387CGYCr
         /zS7CEr9zzOniMgwaRu7eG1Fj8zj2qMo+jsxmJ/cA4oIXmKG2EJQWQ84Dy043Z8FBzop
         c1I3Wlz9z75PxzmS4PJ6DZPdzWZPhcBRaCO5G5M6qQzsWrlMoSFI6aEsANUM0qwX7m0k
         9jLA==
X-Forwarded-Encrypted: i=1; AJvYcCVYO1KCeNZj9Hpg/CHZcmnt2l6z85t/BZzY5h1OApMJfpVi8hCCu5WUfE35AksEOKTLiYfXdb8TUzE=@lists.linux.dev
X-Gm-Message-State: AOJu0YylYZI5YN9kaTo9V1mshQq6R51KkKQLNrjXeQ/WIiH7pQnJjjLS
	LEVZXdqjPFasqKFtG0MKxqHCpg4Y0e0tU6msYbWESMlF9bowEpV1
X-Gm-Gg: ASbGncv0ec73lOQdxi7wwco5Xo98YAfjA4iKlJLbq1pJHLiH0WM9MnpiQ7MvmThlQ75
	F9NLb5wLoysJeYXGogBdnO8p1I1TU0ZUIBtOnjYM+snHt19cJeo85DClitLkOzahwoo0i8PuhAt
	/xmVJaqnW7hEF7GaDVOHDp2yu7IPkF4T9zYrZ2gYMQStDce+/4l1yjWDlkk1352ErMP9pkokPLN
	0GZu9sUThFlDXue1oSHhuFVQe/IUHsfkV9HOVi4JEjs0W6NKo4StwfsZUDgHj4upxBk6oxJ86ne
	X6kxZRb7FG/CGotRkw==
X-Google-Smtp-Source: AGHT+IH3lAAsImJoXUaublLviIawcjfOTs7NtBTxEZSyuiwkLzPj5BCveefFa5Kl5C1+gqt2KTHhiQ==
X-Received: by 2002:a05:6a00:130e:b0:725:f4c6:6b71 with SMTP id d2e1a72fcca58-72a8d2a0d11mr3266430b3a.20.1734502868748;
        Tue, 17 Dec 2024 22:21:08 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:08 -0800 (PST)
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
Subject: [PATCH v2 1/5] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed, 18 Dec 2024 15:20:05 +0900
Message-ID: <20241218062009.2402650-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
References: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
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
 arch/x86/include/asm/bug.h | 51 ++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index 806649c7f23d..71df68e2a731 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -28,45 +28,42 @@
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
 
-- 
2.43.0

