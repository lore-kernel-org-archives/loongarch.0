Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46EA2144C4
	for <loongarch@lists.linux.dev>; Wed, 30 Oct 2024 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730304309; cv=none; b=GpTLRZGmCJq/JCRLncHrG/L3zjcfTKII3EKp1Q3oh2x8Y29vrFiGonoDBETqgYUNn/seRHsqjGsawDIBL9SLrmi8+WPbgXOTAPAXLlOAa3JtqQTy6eJfbirearxUyiwSL2LqEHQ8GSOBqXnq6W9HKtc8vrmwX7cclZJ/CdPfhYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730304309; c=relaxed/simple;
	bh=vyyYul6wy7jKaMGtrgdBnkT/egAvdduh9xveUZb63Jc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pLr5VkQqRB/W0pyFySGwkjQZd1sE0akksXT4TG50d4T4VTqMHyJ1163EfRn6FsRvZwZhWrCG8VcbVaxscqQh4ME5Idp92XoGxbD9e9WkUHKTpq4NPKnwDaBrHOa/VoqGcdXV7kKUkWt4obIorsh/2XTZrMKy67ybCEhSUpd4z8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ljGLoQoE; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ljGLoQoE"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43164f21063so45372915e9.2
        for <loongarch@lists.linux.dev>; Wed, 30 Oct 2024 09:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730304305; x=1730909105; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aPKiYiMZSv/wKH/IY2uWJCz4bmXKvljXWgWXOs9047A=;
        b=ljGLoQoEBxR8g3dcjctcmXqa6n+PbmLjiGIN4XGGSawq+uQ5X3z6iSv1q/G65TAl8I
         g12yFGrhDYrrl1JfSkhKh9afVl5VzQGYThNVtlzv2gLMEk2nA8pyLYJTPMiHJfhAV6Hy
         PMs/xQSvvThDsNPfV1KpvkVVI0+vYZCcs6VGiQIT/QEC2dAU6ziWfZeQ2WVl6/hhBFev
         mrGNshz4LpMW7uHGLQKolBo7c/DzDAOBfTc+pA8Gp7OxagoyFLa6mp4lE6pmkVXiscme
         XU0YIXYOl32icHIJx8fCNfd0y9B/xF01Qq6u/zntZRI3jSBgI3y6l6/xeJ8R7rZK4FKA
         FK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730304305; x=1730909105;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPKiYiMZSv/wKH/IY2uWJCz4bmXKvljXWgWXOs9047A=;
        b=XPZ0oAhFMgQRD9vYMh0NG9rmunKuYXMSRoe7JuRjFXigODNs85bA4qlo9g6k0KsKvc
         Chwynqa9NsCBDaRnGG+8WKs+bOmoo8M5wYqIQgEaLTkglnsxQsZnkEAI4DghorKbtq6g
         uPWn503fu0T5UZvDDZyeyxuKxKaLgK8Q9fDZwuLVl7kanTQp8cN+Acn89xvh853spCYk
         9HhrnS8LHP0uWjNWbIb19u/+5+aFr8d2Qhv41sq3qvEik/vzCdhOe6GrwgYrKoJ/rw6R
         tM01ee5v6MXmkVNIeUIIxj3jhVaTUbjdj6sq6yUSrRgK/CD0nWex/NF5Gm+EZ8I6erY+
         P/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+TSAPnUtmCvD52qyMrZWe9GL2lO/UIUe1tzp6FkQ1UnTSVX47Fwb4RwEV15QjdMI7HPrq9XZEf+k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+wwW0680krpNvMCiEeDtZlQ6Ud2tnxxgMHSKolTnjPZzVVGWO
	p0IZbOvnxjr0SrRANmOom/gEe60qLen4BDSA9QdxGDpCK4pY8CV90q5SdD6KPY5pX+x5m+wS7ud
	FG06leM8UkwThNA==
X-Google-Smtp-Source: AGHT+IG/v66X5/sNRf0N46LwSlUWGFX5ZXleN+ktqgGoUyfaArdYbWLHHKWwb2NH1SWWJLhii4RCDid8Ewha+T0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:499a:b0:431:47fc:92ab with SMTP
 id 5b1f17b1804b1-431bb9778d9mr40575e9.1.1730304304891; Wed, 30 Oct 2024
 09:05:04 -0700 (PDT)
Date: Wed, 30 Oct 2024 16:04:27 +0000
In-Reply-To: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9457; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vyyYul6wy7jKaMGtrgdBnkT/egAvdduh9xveUZb63Jc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnIlkjbodLH5bNx0hTlA6MfMQ91BcxuqHvIYjmG
 IvSEx9d2tGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZyJZIwAKCRAEWL7uWMY5
 RsXDD/0bATrvOML+C3wKiReydF6ngt8WuAWiWyT/iX2SO6bmWxevBm8AmGLMMK1yvo2x4CjezNB
 /8LN7KPzVQHI8KFi1l9i6mNZjoL506Hafo6/tHAGaPX4Mox/7sIpkhyxsV9z67YAfvGMwgM0Ovn
 uKcayN1MqVxUGirVSwkep6HjDlohBXcGmRESXdTFLLMajgsi3WVdYvc0uotTlCEWykt9TcsG0uA
 +KmN0G0TT3+/a5FNvLjnkFnOvuBtHMngQ2fAy8v8I8OJzlGECjdqkkSt37Ix9y4ZzjpKrQGT7QH
 Uckq6N6MWMIQ2DYO+5yW5Tsd/YfBItVvq9nJKscaalKNrzbYRQzc1LXgxnl/2dueWpalDamhzvu
 4YOvfSZaX6KiaEbZD5ErPYzWTL6NRA+rgmtiCGSyJuCRdoGzDH8SXfZlOfQaWcmcg0FTq0TEDgh
 S1nGCgLav4ydlteSpC9w1H1ts9tMiajjxTXbIwoJDO0CxyaB3dUSnl6Cb0KvTw4/j5FDYKa8Ys+
 +nbC5RO0huA81UyPZ87wPm/Qcxq1wa9Gm/F5rGm+j7utiSpKDB0T9XYr98aZu2EdSAPbWVvch8w
 2GU4Zq620iSxN+26x4YiLGQFAEcSYlh80Ksbz9r6fzIHirOXIJ+0CQ/YXrtdnf+8h2bgGBVtl5y Sp1we2VNV3c67nQ==
X-Mailer: b4 0.13.0
Message-ID: <20241030-tracepoint-v12-4-eec7f0f8ad22@google.com>
Subject: [PATCH v12 4/5] jump_label: adjust inline asm to be consistent
From: Alice Ryhl <aliceryhl@google.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="utf-8"

To avoid duplication of inline asm between C and Rust, we need to
import the inline asm from the relevant `jump_label.h` header into Rust.
To make that easier, this patch updates the header files to expose the
inline asm via a new ARCH_STATIC_BRANCH_ASM macro.

The header files are all updated to define a ARCH_STATIC_BRANCH_ASM that
takes the same arguments in a consistent order so that Rust can use the
same logic for every architecture.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/arm/include/asm/jump_label.h       | 14 +++++----
 arch/arm64/include/asm/jump_label.h     | 20 ++++++++-----
 arch/loongarch/include/asm/jump_label.h | 16 +++++++----
 arch/riscv/include/asm/jump_label.h     | 50 ++++++++++++++++++---------------
 arch/x86/include/asm/jump_label.h       | 35 +++++++++--------------
 5 files changed, 73 insertions(+), 62 deletions(-)

diff --git a/arch/arm/include/asm/jump_label.h b/arch/arm/include/asm/jump_label.h
index e4eb54f6cd9f..a35aba7f548c 100644
--- a/arch/arm/include/asm/jump_label.h
+++ b/arch/arm/include/asm/jump_label.h
@@ -9,13 +9,17 @@
 
 #define JUMP_LABEL_NOP_SIZE 4
 
+/* This macro is also expanded on the Rust side. */
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:\n\t"					\
+	WASM(nop) "\n\t"				\
+	".pushsection __jump_table,  \"aw\"\n\t"	\
+	".word 1b, " label ", " key "\n\t"		\
+	".popsection\n\t"				\
+
 static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
 {
-	asm goto("1:\n\t"
-		 WASM(nop) "\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".word 1b, %l[l_yes], %c0\n\t"
-		 ".popsection\n\t"
+	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) :  : l_yes);
 
 	return false;
diff --git a/arch/arm64/include/asm/jump_label.h b/arch/arm64/include/asm/jump_label.h
index a0a5bbae7229..424ed421cd97 100644
--- a/arch/arm64/include/asm/jump_label.h
+++ b/arch/arm64/include/asm/jump_label.h
@@ -19,10 +19,14 @@
 #define JUMP_TABLE_ENTRY(key, label)			\
 	".pushsection	__jump_table, \"aw\"\n\t"	\
 	".align		3\n\t"				\
-	".long		1b - ., %l["#label"] - .\n\t"	\
-	".quad		%c0 - .\n\t"			\
-	".popsection\n\t"				\
-	:  :  "i"(key) :  : label
+	".long		1b - ., " label " - .\n\t"	\
+	".quad		" key " - .\n\t"		\
+	".popsection\n\t"
+
+/* This macro is also expanded on the Rust side. */
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:	nop\n\t"				\
+	JUMP_TABLE_ENTRY(key, label)
 
 static __always_inline bool arch_static_branch(struct static_key * const key,
 					       const bool branch)
@@ -30,8 +34,8 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
 	char *k = &((char *)key)[branch];
 
 	asm goto(
-		"1:	nop					\n\t"
-		JUMP_TABLE_ENTRY(k, l_yes)
+		ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
+		:  :  "i"(k) :  : l_yes
 		);
 
 	return false;
@@ -43,9 +47,11 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
 						    const bool branch)
 {
 	char *k = &((char *)key)[branch];
+
 	asm goto(
 		"1:	b		%l[l_yes]		\n\t"
-		JUMP_TABLE_ENTRY(k, l_yes)
+		JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
+		:  :  "i"(k) :  : l_yes
 		);
 	return false;
 l_yes:
diff --git a/arch/loongarch/include/asm/jump_label.h b/arch/loongarch/include/asm/jump_label.h
index 29acfe3de3fa..8a924bd69d19 100644
--- a/arch/loongarch/include/asm/jump_label.h
+++ b/arch/loongarch/include/asm/jump_label.h
@@ -13,18 +13,22 @@
 
 #define JUMP_LABEL_NOP_SIZE	4
 
-#define JUMP_TABLE_ENTRY				\
+/* This macro is also expanded on the Rust side. */
+#define JUMP_TABLE_ENTRY(key, label)			\
 	 ".pushsection	__jump_table, \"aw\"	\n\t"	\
 	 ".align	3			\n\t"	\
-	 ".long		1b - ., %l[l_yes] - .	\n\t"	\
-	 ".quad		%0 - .			\n\t"	\
+	 ".long		1b - ., " label " - .	\n\t"	\
+	 ".quad		" key " - .		\n\t"	\
 	 ".popsection				\n\t"
 
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:	nop				\n\t"	\
+	JUMP_TABLE_ENTRY(key, label)
+
 static __always_inline bool arch_static_branch(struct static_key * const key, const bool branch)
 {
 	asm goto(
-		"1:	nop			\n\t"
-		JUMP_TABLE_ENTRY
+		ARCH_STATIC_BRANCH_ASM("%0", "%l[l_yes]")
 		:  :  "i"(&((char *)key)[branch]) :  : l_yes);
 
 	return false;
@@ -37,7 +41,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
 {
 	asm goto(
 		"1:	b	%l[l_yes]	\n\t"
-		JUMP_TABLE_ENTRY
+		JUMP_TABLE_ENTRY("%0", "%l[l_yes]")
 		:  :  "i"(&((char *)key)[branch]) :  : l_yes);
 
 	return false;
diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 1c768d02bd0c..87a71cc6d146 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -16,21 +16,28 @@
 
 #define JUMP_LABEL_NOP_SIZE 4
 
+#define JUMP_TABLE_ENTRY(key, label)			\
+	".pushsection	__jump_table, \"aw\"	\n\t"	\
+	".align		" RISCV_LGPTR "		\n\t"	\
+	".long		1b - ., " label " - .	\n\t"	\
+	"" RISCV_PTR "	" key " - .		\n\t"	\
+	".popsection				\n\t"
+
+/* This macro is also expanded on the Rust side. */
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"	.align		2		\n\t"	\
+	"	.option push			\n\t"	\
+	"	.option norelax			\n\t"	\
+	"	.option norvc			\n\t"	\
+	"1:	nop				\n\t"	\
+	"	.option pop			\n\t"	\
+	JUMP_TABLE_ENTRY(key, label)
+
 static __always_inline bool arch_static_branch(struct static_key * const key,
 					       const bool branch)
 {
 	asm goto(
-		"	.align		2			\n\t"
-		"	.option push				\n\t"
-		"	.option norelax				\n\t"
-		"	.option norvc				\n\t"
-		"1:	nop					\n\t"
-		"	.option pop				\n\t"
-		"	.pushsection	__jump_table, \"aw\"	\n\t"
-		"	.align		" RISCV_LGPTR "		\n\t"
-		"	.long		1b - ., %l[label] - .	\n\t"
-		"	" RISCV_PTR "	%0 - .			\n\t"
-		"	.popsection				\n\t"
+		ARCH_STATIC_BRANCH_ASM("%0", "%l[label]")
 		:  :  "i"(&((char *)key)[branch]) :  : label);
 
 	return false;
@@ -38,21 +45,20 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
 	return true;
 }
 
+#define ARCH_STATIC_BRANCH_JUMP_ASM(key, label)		\
+	"	.align		2		\n\t"	\
+	"	.option push			\n\t"	\
+	"	.option norelax			\n\t"	\
+	"	.option norvc			\n\t"	\
+	"1:	j	" label "		\n\t" \
+	"	.option pop			\n\t"	\
+	JUMP_TABLE_ENTRY(key, label)
+
 static __always_inline bool arch_static_branch_jump(struct static_key * const key,
 						    const bool branch)
 {
 	asm goto(
-		"	.align		2			\n\t"
-		"	.option push				\n\t"
-		"	.option norelax				\n\t"
-		"	.option norvc				\n\t"
-		"1:	j		%l[label]		\n\t"
-		"	.option pop				\n\t"
-		"	.pushsection	__jump_table, \"aw\"	\n\t"
-		"	.align		" RISCV_LGPTR "		\n\t"
-		"	.long		1b - ., %l[label] - .	\n\t"
-		"	" RISCV_PTR "	%0 - .			\n\t"
-		"	.popsection				\n\t"
+		ARCH_STATIC_BRANCH_JUMP_ASM("%0", "%l[label]")
 		:  :  "i"(&((char *)key)[branch]) :  : label);
 
 	return false;
diff --git a/arch/x86/include/asm/jump_label.h b/arch/x86/include/asm/jump_label.h
index cbbef32517f0..3f1c1d6c0da1 100644
--- a/arch/x86/include/asm/jump_label.h
+++ b/arch/x86/include/asm/jump_label.h
@@ -12,35 +12,28 @@
 #include <linux/stringify.h>
 #include <linux/types.h>
 
-#define JUMP_TABLE_ENTRY				\
+#define JUMP_TABLE_ENTRY(key, label)			\
 	".pushsection __jump_table,  \"aw\" \n\t"	\
 	_ASM_ALIGN "\n\t"				\
 	".long 1b - . \n\t"				\
-	".long %l[l_yes] - . \n\t"			\
-	_ASM_PTR "%c0 + %c1 - .\n\t"			\
+	".long " label " - . \n\t"			\
+	_ASM_PTR " " key " - . \n\t"			\
 	".popsection \n\t"
 
+/* This macro is also expanded on the Rust side. */
 #ifdef CONFIG_HAVE_JUMP_LABEL_HACK
-
-static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
-{
-	asm goto("1:"
-		"jmp %l[l_yes] # objtool NOPs this \n\t"
-		JUMP_TABLE_ENTRY
-		: :  "i" (key), "i" (2 | branch) : : l_yes);
-
-	return false;
-l_yes:
-	return true;
-}
-
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1: jmp " label " # objtool NOPs this \n\t"	\
+	JUMP_TABLE_ENTRY(key " + 2", label)
 #else /* !CONFIG_HAVE_JUMP_LABEL_HACK */
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1: .byte " __stringify(BYTES_NOP5) "\n\t"	\
+	JUMP_TABLE_ENTRY(key, label)
+#endif /* CONFIG_HAVE_JUMP_LABEL_HACK */
 
 static __always_inline bool arch_static_branch(struct static_key * const key, const bool branch)
 {
-	asm goto("1:"
-		".byte " __stringify(BYTES_NOP5) "\n\t"
-		JUMP_TABLE_ENTRY
+	asm goto(ARCH_STATIC_BRANCH_ASM("%c0 + %c1", "%l[l_yes]")
 		: :  "i" (key), "i" (branch) : : l_yes);
 
 	return false;
@@ -48,13 +41,11 @@ static __always_inline bool arch_static_branch(struct static_key * const key, co
 	return true;
 }
 
-#endif /* CONFIG_HAVE_JUMP_LABEL_HACK */
-
 static __always_inline bool arch_static_branch_jump(struct static_key * const key, const bool branch)
 {
 	asm goto("1:"
 		"jmp %l[l_yes]\n\t"
-		JUMP_TABLE_ENTRY
+		JUMP_TABLE_ENTRY("%c0 + %c1", "%l[l_yes]")
 		: :  "i" (key), "i" (branch) : : l_yes);
 
 	return false;

-- 
2.47.0.163.g1226f6d8fa-goog

