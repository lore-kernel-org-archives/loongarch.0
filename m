Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939BE158538
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 06:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502877; cv=none; b=RbOEQheEh9479Xrb4II42K75TyiaTeW+N3n6uilkYI/w22vtSnW6qFQB7SwCUJlWirVxKRsUKrNnbPAZBHIiopn5vo0rFmsGVolRqky10FayPKjUaQT6jVMqc7yJZT6T1sg26rw3B4+hGhON9u7vHi2TzIATU5UE0gWS7A0sqFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502877; c=relaxed/simple;
	bh=PphfExRm9WK9LCNvRjMF7+BNzJn3sHB2vfQS0MOjRdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yt8pClVMgk9VRl/MBBpjbyGX1m5r5eHWzv5BMpVf0gvP8eAx+KF1VvDU5GNRDYbOsiqI/gJOpfxRjDyj5mljQGsCkUnWJqJ6IY5bgY5c/uJ24jh+wVe+k+gFIFVzwtgZ/KzDx3+muWCCRLkA4y2K0TqpZtonQjOlvyvh7y7jGVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmJU73YT; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmJU73YT"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7242f559a9fso7797185b3a.1
        for <loongarch@lists.linux.dev>; Tue, 17 Dec 2024 22:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502875; x=1735107675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uE1ozcM0HS04q9lZpGc37IxiI38s9WgqP3M8QOeasQ4=;
        b=SmJU73YTLirxM+ZWki46b+Mcx8z+IXqgsL94IN5loNIsmXEYRnI7MTUR1qmhN12gjI
         5oilbnkdJKov30ArRxpKCpQQGR0nrZJ/wMvhJixSGSw2REL23/tkr7ItWn721bv4Nua7
         oEo5OTF49uP9j5FggwhSe9NhDvlXx9As1ebr09+keRmM+nYYYLjuTa0hGzlQQo4dIQp3
         MfJN+7WLVk+Dd5MNRLyfyWIcXVgQkIPAMW0Yr7b8Nf5AvPbaeyQrDthCIIlw3XJyTZ9q
         C2DOowAStGINTeSfVXwsQUCvwk62l7vBZiaFKtf1/wMOrQsl8TOKo3ZfhV1F2KUHEcVm
         ZEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502875; x=1735107675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uE1ozcM0HS04q9lZpGc37IxiI38s9WgqP3M8QOeasQ4=;
        b=LeXw4VG4wjZHQP6OuGztMAz2yfhIU9nWYvyFO0NUnIUaeIoGfBcE8GhIwPcsCR65qA
         yZqgZwCRkf+QTInXRqiveOlTzaszEyTOhWdq+peZa1mBSh6Dhi9v6gpPsNcufd2MeAkQ
         7sxTcBTeRzpit35egYCkEQstE/RpXYgYLZjWoFxSMVSkaMBwRAK6nX98wmD8tiEV+287
         f8q8Cg+P94SNKY/qNlihPOLNxOG2K15zZlUThKW0kChIuNidrm0IPlezDSB4fauzKZRQ
         8BDvcTvxc8m0CTeCBCayYU2pBFlb9ihqWdcEawXgERiA8Lad5/ZSp7hTtZxcczBL64WB
         rCZg==
X-Forwarded-Encrypted: i=1; AJvYcCUX4HaZ6VAzjpkN/+K7eoJZbGBFjzwqmbkxMgTZQKbWIlq0mxZOnjUb7g1a0G2qeoRJRr9XSyhUAhc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGz4z8jy1p5/+LM7ipf1WuD5yyhOJuk0qRvmrDHr6Da/Uiufiy
	mY1Sn4WmeUJap0IK2MyJzqyNDji5NisS4XlrZEnoAdqDh8e+h7KZ
X-Gm-Gg: ASbGnctFVxZi70FmcvD7eJVn4yZrD16267CWQBLPQZMD4KZXP6DnIG7zzu3dfOO3Scq
	8BRPs9DD0+7xBQsmCOLysTvGsfuiRo5v0mZxPxgYkSCLD/41LzQv0LTuyPOIJqzpx4ZnZv1Ae7z
	0ixIMXP/7kwSlAK8e1Syjqa4z5RMKyeQBAV5+rH7YcUDoEq5Ec6FrSpnjmR4wp1eIdICh5l/auu
	JljRxLqRtCCqo0Nk7+WwjnqnC39pvaKC6MFc/H5R7ZENVSN12N3PcXW7ViDEqMaOE50mg384FG0
	+GKZYbQRJVl8h8K+0w==
X-Google-Smtp-Source: AGHT+IE8Ef54dNMtI5iw0XGR0f6dNrZGSBFn2rHI6W1DYE3F710PsI3NNNPfVvjoBn7Wi42XdgnDdw==
X-Received: by 2002:a05:6a21:3382:b0:1e1:d22d:bc01 with SMTP id adf61e73a8af0-1e5b48831e7mr2645443637.30.1734502874926;
        Tue, 17 Dec 2024 22:21:14 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:14 -0800 (PST)
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
Subject: [PATCH v2 2/5] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed, 18 Dec 2024 15:20:06 +0900
Message-ID: <20241218062009.2402650-3-fujita.tomonori@gmail.com>
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
 arch/riscv/include/asm/bug.h | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..ee6b9b787e46 100644
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
-- 
2.43.0

