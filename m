Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A511E52D
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 00:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733789959; cv=none; b=Tz9uaJqwk5vGuroWnsq0sNgmXlL6rcSy4BNUXFRVJCFpXRtzZhzndvJBJKybYLEK8alfy5iL1cHNFQTLfhsmCpK86ZpTejtkdE1ElwDPYMk3X/p6h2fkxzrGPkzJ8DmqR4qGgfysmpULETPobQJ20YVeAsxkW0M2Sbh+Eq3FGGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733789959; c=relaxed/simple;
	bh=Dcj41wgoErpyvv6rMccASWdZmCVr+BwsDARBxcvPC6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s4ZsID7MFOISLoFk0q6M80h0TdJTm360RwTH/dwu7ONvcY/8x4jxSDL40awJemR9KhnZXwShtccPPeeT7DjdPwpDlRe8eKXAlOST1jlAhc2n5Ze4SMq/WOjvRryquu0OgCjqUOuqvxaHmpppN6CNPFH54EgRdwlYjFObvCSD6M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGBS4eZI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGBS4eZI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-725f4623df7so1243710b3a.2
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 16:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789957; x=1734394757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvYxXwvEnjyqSBQUdMwEVvz9hfO5O8pSiGSR6Ept2V0=;
        b=lGBS4eZIDKZUwj3ytKDqud/t6u7zxtytKy7oQI6+Ubj1UmTiJNtzL/1XzqXKR/ShWk
         O8QgQI4UsKqpwAeRwBeck1XNNZOBK0f3IkSqFkv8ujqebw5qxDLEOFKhHiAL9+WaboRH
         04j/qX2L8OBmkY/Ook+W7ykR+oaJ1aBt4uya+AevcnqLwDyFvUtuACiyefsJQXLK47/N
         8j+RAV8hk2XK641+bzehCOMOewD9gPVkSBiCxS+3rJRBSUCOAMioksnc8fmQvYkZgwq7
         w+sMV4XC0pOROTyCV1WlMo+r21kiVyi64e4qMKnawbauRJ/RvZwU429aSHPXXvapi0vo
         lV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789957; x=1734394757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvYxXwvEnjyqSBQUdMwEVvz9hfO5O8pSiGSR6Ept2V0=;
        b=ZSIh/YpyccOGpP2LsVKZN+r1j0M7fUCYig7gvlr5lmiayT3XkLoJm7rUEZ7Aip6ud8
         gTkWTJW80luvCCldtUf4ZWY7vZewNf0Qandfr+4p3w5bFLRuQx9qIosZoZicb4kZFsjw
         k5GdfzTVwAg4O0nEA1gK+W055FQVb0vM2d0RnUdZFGJdzsN4eWGmyY9LxsarJrJtT6Lw
         m3CvaX8FY4isjpvwMgBFcNscsKQ7+IuGa4BHleCaCuQPqKoLa07diNtRaxAwsbjCLH1B
         nMIomKfhbaGYwnnoMFfW0m1Bq1D2d1Uh2fAaFL689271kyEeklDK9lWI9BSH2UiCSg+h
         /6pw==
X-Forwarded-Encrypted: i=1; AJvYcCX/Fg8Oak6yyQ0eZNWv/4iJcWFlv4GvVSZTVCTWm46ezzQrN1rS06Y8AIEBlj5WSaeK6pfFMhuK0i4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVlsm2qxtW5REsOreSxU8RZjrhmGMt9dPMGZtyWJtEZstfy/zx
	CMUeHImCdMdVfLQVHF2B5+KVHBOlrQwcRtaoSKg/IdNszffS2vqH
X-Gm-Gg: ASbGnct1+6VrzycZQbOYV+BrUX26zpS91diSCJbb+7IWFcj7tXlEERWP34eN7MNSt4O
	1tJ275HDkRK1QpcfY8JLdzqHpqKxsHopzB7cmYLxM4I8nDpi6GK7egIaEyxnAY5w+QJYOi6iPtN
	9/gWMA9RRF3BahhErdiN7UVj1YT4DvUQeQUlhzFDBr+gYXzsti99eMixOMy8j/MfJ8hi34JI8an
	N9yZWFPnMTl7nGeeW2jntlIVoGPDl+SLQ9GC/RYX0+TvzRPfyWbVudHXSo+qFiSsy58spuKVMs1
	g2LODWIiq8M7vxQlB6Kkqiaz8zM5
X-Google-Smtp-Source: AGHT+IGXDLB74qKfVuatRG8d4NT0q2/7WE7V1EKSlo1ahbfyprBuniJ//vSx8P3YzstgSPlCq25zXA==
X-Received: by 2002:a05:6a00:1815:b0:725:e015:9090 with SMTP id d2e1a72fcca58-7273c90ae9bmr3318953b3a.9.1733789957264;
        Mon, 09 Dec 2024 16:19:17 -0800 (PST)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fba027sm2005005b3a.3.2024.12.09.16.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:19:17 -0800 (PST)
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
Subject: [PATCH v1 1/5] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Tue, 10 Dec 2024 09:17:57 +0900
Message-ID: <20241210001802.228725-2-fujita.tomonori@gmail.com>
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

