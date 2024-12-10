Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28E0111AD
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 00:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733789978; cv=none; b=pHQU/ULAn3k3o1Q4ghzeQUnM4B2cg4HAYbczPKwh2ZX6L2SXet8t9fAm5gW3Vvk70zrfzGYhymdHEEzCPs8fcEgHzGT6Y8Ee90tqZt0ouJb5wadFM7zFX6EUYi3iZQWYjQWrnxoqyjvtxqiewr5kbn0mSYNBVB+cHm88VQ2IYqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733789978; c=relaxed/simple;
	bh=tLULYhncvqXuSEEMkRa308bOiD43z3dLIb09npubBjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDOsn+/L/Nz5l5quxOXqgHNovsiXpfWPY5t1xp/mH1icHQnRbQbd0ZEq6Oxo6ktX5OEmz+D2W2ZfMEEsW7+1ilzqm6eKL87wQ3jLfOwWUbgVXDUhbpPaEU0LFPkMdn7KcKd0SIVA6FKF3buMI+k+41JAFI48RjSSguUhR0EkKYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUyFsNP0; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUyFsNP0"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-725c0dd1fbcso3605448b3a.0
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 16:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789976; x=1734394776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Og2RZIwk2Fmm4a1enxRaJzgczmbvkc80VyX2Z+HeAaA=;
        b=NUyFsNP0xjZ+4IMLd9PD2lZBuxxLo4Hn+aVu+DSd9dB/5ZhZ4FC7utLb+2XEM7WYu7
         oxMLWZwdWusD4z52RY2VOXdQXo172c3RRelG7DqsevSXi5iYvnWYqtcl+lp+ytLMc0IN
         WNoZHXzkF6U18ZD1zl2lmDOxm1IOskyCuPCKt9fjhuJ73kXvBDCBZNft4Wfu9RQLi5hh
         IqONahg74HKvQl27DSbXrUHNjePVXVfThzXT9fyDnutaSjVxyUrZEPTGvd1BtZNy2QJm
         mYYzyuPX5zSo0LGMbBmHeraLsfBb1gJyh8SeH0VGRRQgpvcVaSrtIwAWxgSUMWMPbUJh
         yyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789976; x=1734394776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og2RZIwk2Fmm4a1enxRaJzgczmbvkc80VyX2Z+HeAaA=;
        b=JDhuUah+BH9R0KyivtkEE1tPoErcNoc1uvVZ/tZ6VwjhBuEJyxiFib3oj2rIn5wast
         O2T+GzoCIe9IHlclmld3+eXVp6nyysWWMHvvht+F1DV1sVXIOuRkPJWCiLsdeSoG/3cg
         UIAjcrOluFvNDJ2lGdjI71MgtJIbzNiwX2WXbN2OBUh2Yy9R8fK7QWGJBuM+2tGASKLv
         fOziUEoDpsRpZ/72sNzRdi3Jtdoz1RiZ5S7zoJlmNopPx2EpTO7dBNWOtg0p8emST/op
         Iwjn0N+7ffAySscMptvAA7jF/0zvSlvT7M7Lo/yrsI0dDPNBRmfd6xBmfyJ4Y6FTNYde
         P3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfpF4y9ug4EOXx+m5hPn9AHwMsb9GhJBH3DPx69OrSwc6luyFQtFO/TeKj0wcGnXLAYImhERHSoc0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yygh8JFDMnBtkyw6KY2AvBgaqBUrlPB9Kusg4FkBmBjWbwK7k0p
	8UltnyWkGT4Tv36EN/H1wEPgSU43/3RSvSTCP+OFynXMR6owev1J
X-Gm-Gg: ASbGncvbv/0tQaDP5Zh0WZtEjdv6/pyNlS93eVG/bZPD5HbQt0Skd1HSYBI+urBGWEL
	VYxrbR/DSWmOtZyBindYLHl7xy0vSawN45V4gX4GmX4YpcIMgE+S584hsI8Lz7I1m1524LUxens
	MpiesTSy3uGQzqBJ5tf0On/W52AHtecmVwFJ/mbqtE5TLy983E/vEGqitAxUI3XWUwzPK/uJwbF
	BzxeF2UcI7V/WZ6yVpbSuf31QNpCZPyKBkC0Yg+H8t6pCyVBvQnnFFDwvaiB9WAaAGdyWcZ/z83
	snefhpZHTOsEm+RDc1UuENklHx1r
X-Google-Smtp-Source: AGHT+IFzrftQzGze1g0ifR+gfHYjdPe8pRM5le+6CFZEL33/9GPgGvUcXSJX0JYy+N5Of4n1uRZr/g==
X-Received: by 2002:a05:6a21:8cc7:b0:1d9:c78f:4207 with SMTP id adf61e73a8af0-1e1870bb625mr22034147637.11.1733789976324;
        Mon, 09 Dec 2024 16:19:36 -0800 (PST)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fba027sm2005005b3a.3.2024.12.09.16.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:19:36 -0800 (PST)
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
Subject: [PATCH v1 4/5] loongarch/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Tue, 10 Dec 2024 09:18:00 +0900
Message-ID: <20241210001802.228725-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210001802.228725-1-fujita.tomonori@gmail.com>
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
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
 arch/loongarch/include/asm/bug.h | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index 08388876ade4..2343c4226595 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -21,14 +21,21 @@
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
@@ -55,6 +62,24 @@ do {								\
 	unreachable();						\
 } while (0)
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_LOCATION_STRING(file, line)		\
+		".long " file "- .;"			\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(_file, _line)
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
+	__stringify(break BRK_BUG) ";"
+
 #define HAVE_ARCH_BUG
 
 #include <asm-generic/bug.h>
-- 
2.43.0

