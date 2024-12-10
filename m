Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692BF41C79
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 00:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733789965; cv=none; b=q5ZRykeD9dIM9nglris4K8RvJdKz+DI/uMykavmUeb1CXjw53Ouc7Zv+E0gNUwa39Xr828T5SNjkd97TOcu7692A8rUAeQRs33pjv7AVKAeDf41yhTI2PUYlXU5gvgTx4lwvJ3UlosqAuS+nuqtUAhYqSPs1c0iqeoBEmQ5eq/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733789965; c=relaxed/simple;
	bh=PphfExRm9WK9LCNvRjMF7+BNzJn3sHB2vfQS0MOjRdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzsZgxtIR8DEITRn5TGk4ate0VlNZe/pHXgvyw8d/eP9hW7ym5ycYLWAjs+YxGk4JVfQTktmD9wOodUQ8dSfCW7laqD4Ja2bjv+lyg83d1S3oH5lKszRLOFuvNP4BcQa1f0iuEDz2FqvDc7sNA/0gtQZBubYK0WuvmdDfryYP0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0LxoFr2; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0LxoFr2"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-725f4025e25so1077522b3a.1
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 16:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789964; x=1734394764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uE1ozcM0HS04q9lZpGc37IxiI38s9WgqP3M8QOeasQ4=;
        b=W0LxoFr2eEgGfaBwvavFQ4FgmPHcPmGzAHQWqscdLs5nl2TwbA6DJwXFwtXONkxHiE
         O82I1Moc5TwLTC/p9GRE7cLsfYAOdjR/cHGCJEexBH8N/tzBIrQAYGYwlJ8i/HrSRdcq
         VnGcnt1+JHxjBReBxE8TNj3w1DPzl3aVHBk57bfwXsqoRgXoNRHNAXI6xJkyo2qlt8tu
         BXeLf10/P2CXVg9BpMnsYZ1XTMweYwyLRkx8xAMm/nAuw9CdG3lyBQss5NstwmXcLvDx
         NRb9TPLs43BkfXCM/RI80pw/x/SOL6nzxTGML1/aLMMGWYcSmbYSgLvEIEFTNnJcmxop
         7AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789964; x=1734394764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uE1ozcM0HS04q9lZpGc37IxiI38s9WgqP3M8QOeasQ4=;
        b=iwiAxsZ7TmxD9Lqy9AlOupqVRuG1g7poxE7WgPLqHLl+SQDVqx2P7r+f5CLclTGwiM
         rCK7TM7X+eSF4nl6ozOoAZiU5Ee5YpHMGGf6sIJaUIW12q15Z2V9+6kLgLBGm9vhhVkf
         05ezaHXvwdYu3MCcn6oKZxc8SCkHh2YTT9fqAZLZt7mnZAPsWUk3WND7YLa22L7F2mIt
         oXQ01rnJQBA/fIEAVsUksSMFm0tHfcjeyA/fVw5TmNh9/Zl2+iGsYNUi1ESehPbWjIpT
         X1TntTeqXAsiKpL0AvxTzZGmeWPnASa0i4Q3pCF9so2eJI5q7zpO5JSYAYz5F8C2p2ze
         Shhg==
X-Forwarded-Encrypted: i=1; AJvYcCWyYJeoYCQFgjoU1ubx6x/97SsmGlm5f+J1rliDI/CXydVte2g4TXzAynztq1HRt2uQHs42yb0IkqY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfVkD5y082287H+VFzQsL9JalGsBaTL3D56537s0NssnnNQ9Gk
	VyV7rFAfHzb4OEotVkxm1VfWkpNYkH6kVC/8H/v495ObizZ9ruvo
X-Gm-Gg: ASbGnctW+lqiydxhcx72XUQ32Qef2B040U0yZAwLY2DWgv+gRA7XphfvXYsVV0Z7YEE
	askAO/Jv+KX9KlrITe4FSAlC1dtV2oHUyCAU3ZZ7jYGr0IrInfqfP4SENUJJeQDvRFDggnv7Kis
	OOUrTSHbxuxmMFV0aW4Vp70cnFO7EqH339JjQo+9FOfZU+KFljDvgaU3MI8wrGYvcaaZ9JuAZo8
	LfbWPqqoWmWutnltyv9FTj2/XFoqSREwgAVKpsPDouFFbU0/vLVijA6r2ZyVRkUFjtBorMKqgln
	6BcN8N1emP1HPLtQqQttoQdzhKCP
X-Google-Smtp-Source: AGHT+IE0sO05jto/zLfmn6/T151S8aCpOvFIvTm7U8rW5Jtk2M587AQu6vur1sMtmKA/fHe5aWFjDA==
X-Received: by 2002:a05:6a00:3e1b:b0:727:3935:dc83 with SMTP id d2e1a72fcca58-7273935f820mr4927070b3a.10.1733789963629;
        Mon, 09 Dec 2024 16:19:23 -0800 (PST)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fba027sm2005005b3a.3.2024.12.09.16.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:19:23 -0800 (PST)
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
Subject: [PATCH v1 2/5] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Tue, 10 Dec 2024 09:17:58 +0900
Message-ID: <20241210001802.228725-3-fujita.tomonori@gmail.com>
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

