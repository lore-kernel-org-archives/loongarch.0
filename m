Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE1F26EFF4
	for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455250; cv=none; b=mBMbUz3HVgf8clRMlxIh90oaD6z9UbMR81lOO+LCGFa7kCeynlDBKn1AdnOXCK92pLdbYYrvMF5huFC+m89hpV+j5DYkvg3ZQnT+HlYfxejuRgWLkNcNZEy72KLBwJ8YrJ/pstFsYM4eshxpGyDxoVKgOZREl8iwtETpcGU8pUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455250; c=relaxed/simple;
	bh=h/3P2KY8vDMPXX5OJwI4gjMRRH8LzIOf17+FXLQKEXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBB1LNBbvZpSgQsOUeNERL7VMIlMJMHlRVXnslcqaRrb6KKS43aOpQtBlqpA/o70dvtohgjqaTeTHvJG+hJ4dDJI8LHjGG+0ouRDyk9Yq2GXPWpAOyJLBq/AHVkXqDDlJKIgtX/n1ItAq2NQ09hpUHk/j8paiFpQ5b7Mj+2C70o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXR41Vyx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXR41Vyx"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220bff984a0so15228965ad.3
        for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 06:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455248; x=1740060048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gg/V+lwtqWQq5Y/Ly9J/s6hUNho4JthxgdaqasfoAcA=;
        b=BXR41VyxhvWxaRj08jjNkHIxFc2MmJ11yfxfoHyFS3zToFbIxAjVhcAl3RH8v6ONVU
         rxWeiKvNW2waNdd8+JUvkOVp/7msqjWQH6ulPMHxcyavImqzjcugRmpXwMdloaTXHOUV
         iXE13TbHbH3LqiIBRVwswKgj/6yXyhnE6fNxrAiaTHqUrg7kY+eQ10iMkqIB0ubAl1Yw
         KzAWt+KJR3Qw973MsWmIrsrj78Tr5nTroblKuE5lQ7hywvujsUQI1SE7+E3AXmxvS9oj
         O8y8s6poz46XRi5FOsP/hR7K9x2Zf/WqqlLROq7pxRg4e6qStimRNazXeufX5mFto8Nc
         B05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455248; x=1740060048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gg/V+lwtqWQq5Y/Ly9J/s6hUNho4JthxgdaqasfoAcA=;
        b=w+3hzbqUkiFO+/E7vesiumUOsKxO3exTz71wFno49wYfEmMsF5LTSWm8cwBkae0sz+
         MUF9bRXG6huBM2My4VpVUysaQWuNeM03XaYpp1QfayFfpHNadOvnhrOzGR4YgCOmKsA3
         Cvu9sPKfQPb5cI4Vk4Y4xR58g1dz7L8cowJHeVoWcY5i6igSps9xtXdh6C3HyVOVftJ5
         uCy+sPDgQIchgMZgtc1JBckVagaO12+/B5gm3APBf+67HNO+jTIMMnYeuU0bitmc1A+W
         K4Xlwft95BNXUsquD+7N1RSfXVYE6N0NQ3eIFF1xV/afuoqQNIRJR5PFccBhGgxLqoF1
         1jww==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1X9quz03ndcGSu0LS7V2w0+RK4VMGk1gZ93iVB+VYz9rNbRTeyJPHB3e39HpF6rHYYscDDwms58=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo6lcGCTuaIAeJRCkTy0bOXHyepUSEImNtAfLO7t5qd6D/X4Md
	lG0hcu2UqBrAEsRVU+9WOWaHCmnoZxyEIpjwgiHcyRa3Yd3LNxca
X-Gm-Gg: ASbGncusLIx17Rmx0i47jN0wjKAV2RZsbW2pdFIPK49jUXtI9X3N1BO94QQ1mva2Evt
	u3W4PWrZVmqkq0asrOYT0GOqzkPMOxdgaKwbNABznJnzAEB6Xu4brLAvSGgPbyPNzIS9o3REnl+
	GXX2vBA7xnDlvN1llMcj1vqe0WJRj/cngnrnduTw6JZvk7FplrFrIgXez5MI4PBLk6p72tQt3rv
	/v7UZ2A+ZDP7ZUUawZuBgGZievDgZ+A9/+TAjKht/ANHs/etdqJTenux3PV1ChR4DftCisTQhLB
	WJqWZhLbOXMePBFUYbhatsS7IJQetN9YsrrOM0akLimz5T3mSrTx1ui4VpHt2XN+YXA=
X-Google-Smtp-Source: AGHT+IFTuUUy1Wq3iWeeuJp7RF8h8HqcmzEsROtZ3HzF4SlUho3mcp66MzG3aF4wwbARFTyZlT5eFg==
X-Received: by 2002:a17:902:d58c:b0:20c:6399:d637 with SMTP id d9443c01a7336-220d2132be5mr57272645ad.40.1739455248450;
        Thu, 13 Feb 2025 06:00:48 -0800 (PST)
Received: from mew.. (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm12565225ad.223.2025.02.13.06.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:00:48 -0800 (PST)
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
	tmgross@umich.edu
Subject: [PATCH v3 1/5] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Thu, 13 Feb 2025 22:57:55 +0900
Message-ID: <20250213135759.190006-2-fujita.tomonori@gmail.com>
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

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/x86/include/asm/bug.h | 56 +++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index e85ac0c7c039..61570ec9464c 100644
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
 
@@ -88,11 +85,14 @@ do {								\
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

