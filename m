Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92E5214A68
	for <loongarch@lists.linux.dev>; Wed,  5 Mar 2025 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741173016; cv=none; b=VFCh4AqnVwPVS/gBWV+ps3HMuTQa+Pc5/ziTrpGB20z9Xu2hL2eAWR+OAXF8V9jXzw7zF4fb3anxR/ibdF85JDpzR9ytKpUUm3X7AH0pyn5/PvvIcEOyHyiVTt1kmmu19fLbmRY+plWGVFqp7efUe6wQE36MqARYc7FBREm4FjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741173016; c=relaxed/simple;
	bh=h/3P2KY8vDMPXX5OJwI4gjMRRH8LzIOf17+FXLQKEXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HWydlrJ3YKYCucBpGPchMBeG1O++nAy8tv6fWOVVelIskNspol6DJVUi/h3D6NO+3HIPLL9XU4G2be3a7aKkQw5thW5vQ0DheZ9xOq5+Oiwn3eNA6gDSLgaS9kGMj3A4xB4stEjnqIx5M71FXTSibY6nfSJZqTASSyLdQDh6/ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRTveUIy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRTveUIy"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22355618fd9so114990735ad.3
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 03:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741173014; x=1741777814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gg/V+lwtqWQq5Y/Ly9J/s6hUNho4JthxgdaqasfoAcA=;
        b=HRTveUIyG7kjDaOd06McdSj7oCjjq1v4N+msTTpBhtenIGdpbvg6aMqrcqwIlyr0if
         q1rR6uQnTHOePpODt3+yf6s4rEnAsiYiaK2oQXyBCJayTl3POlgiTu8JxRxh+i4QZMjz
         1zOGimrSLOdMaGx4SGOhU5gY5LxvT/hoTMBK+2trnn3kVLgDGa/MyykqTXlmpffUXbtj
         OlytZj9eghNASEStcXsIE6gEAz1C8wKrW3wdTbC2Rq08UQKoPxMMLzNkveP01+mJf1/Z
         VJKAPIsbD07xuEkMrnCINtju0aiue7IObixQ7MSsxIGHYiQDZCLzlBeWnEcsG8gpExJb
         bYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173014; x=1741777814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gg/V+lwtqWQq5Y/Ly9J/s6hUNho4JthxgdaqasfoAcA=;
        b=UO1qf0PKiKPMsgpICkkL+vO3DGxTFb2XuFqtyqDABlfXYAipqmuNYNc5z6iXJ/nc6i
         jfyjvsqM+m2rI6JUu3kGTfZdvhIRreCEd3ArEc2qcmZYLjMdHMFFW9W5MOZuDt+1LdQL
         cgjNk+zKZrl2oapfU4YB+fLmm4g1QWLIGST5eQ2SpjStoeflHpGImJ7Jove2+SBSLqaY
         MqLymwdbl4hjgDCuekmV3x/nrR+kAtBhe2S1Gq/ibNT3TFyuWbxtQOcWC9ILwtUZ9dhA
         S1GKlD5UsZLaJwbL4MkffwTRh435SZFYrimR7/6qOegGiw0mGTa8qHMHwfSXcQsyV08Y
         TEew==
X-Forwarded-Encrypted: i=1; AJvYcCVjtw3KgZIMhJyUWSYZpydKwpln/ZflJJK9xN5GlmtAsokEWoHNKPh9dU+MAofEXZ3iNxW0dpWCd0k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFd9zhYx8Uj66fYkf86SlC4ReI6lmNRY4s0NVw7u1q6MjUYo/L
	1hOQxu4zO+DecNc1FPg6vR1RWewATbKXstF9PqcQMegZnwruRtGQ
X-Gm-Gg: ASbGncu8XxrZlWsJ/Em+JOWKRRPijW81EYTSMkvkyahnpsfAaTMNlSt7xDq9gD2A3aB
	dTOvbpDUyfbVlcP4b9THipcZeUa4lrbzYAmdGC8VoR0GRNI8F7PB0teN3TEgAv6sOliZRvt+5p0
	3MSrn5x7xZe3T68SKRvuN4a/LElGf8azXFwLfalUHxS3+w4S4BMrDroxH2pjzBogBin3pDwtAxM
	dFt14R6O6w/XJ+uNu6Z0o+7zCVZ1TXMUVfdESTszSZBTkzp04H1RAQ+PHJNcXMXWLvgcOLoujJg
	5hJwqPyhgk706cMFXm6lk9wf3ayLzK1pPFM0EYiGGggTnQ/Oa3Fy+wuo+ROqsoI+zj1oCKZgtiZ
	8GlmlBeqesiatz/9xbHesmw==
X-Google-Smtp-Source: AGHT+IGT4sqxYXWLlVa8YluGkM22xVpQMVO/t8msCjLv92geQSngVV+IoJoiRn7vgEXbNQJrnp5b6w==
X-Received: by 2002:a17:90b:2405:b0:2ff:58c7:a71f with SMTP id 98e67ed59e1d1-2ff58c7a78emr497795a91.32.1741173013960;
        Wed, 05 Mar 2025 03:10:13 -0800 (PST)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7737a5sm1060925a91.13.2025.03.05.03.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 03:10:13 -0800 (PST)
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
Subject: [PATCH v4 1/4] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  5 Mar 2025 20:08:11 +0900
Message-ID: <20250305110814.272792-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305110814.272792-1-fujita.tomonori@gmail.com>
References: <20250305110814.272792-1-fujita.tomonori@gmail.com>
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

