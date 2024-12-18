Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1099B166F32
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 06:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502889; cv=none; b=RlOBFHdhmY3AF9oJp4Bfjzb1Rw8JaVgfzl2c4ufBDbeyPMqhAnVr2ATiPw8LYg3xqkv6SW6PDU+j40AyovJYYKj2UkIHbMi2vBfZDtSp5TLje/U+Luv91bcWRKU3ZWdWkHr49460u78+phlPFyceY+4fsY2g/3GFzqgInCq3upk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502889; c=relaxed/simple;
	bh=poPMKuxFCyNN+k+FyvPioVRFCtbD9iybhG3EXgL//Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2atBQimv+4EjSod0TF6Tski3hjTx5aoE7OGpxERx9d76ZcrAcDdugCGGecdAmad/AKjmpRGISAeYK2+VrEp2neFscwcg4pEXv8Vg81TvPujLKqYJIrOwuzqIL6ZSMS7yjQA6hlJAFNDIEFo7d06e9na2PFy10PldDaRZ2GiUGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M64pbq9a; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M64pbq9a"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7265c18d79bso6513486b3a.3
        for <loongarch@lists.linux.dev>; Tue, 17 Dec 2024 22:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502887; x=1735107687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bV4HRBWZxkX47QY6JDDMA6tt+8zgh76SAzdokkmEw1Y=;
        b=M64pbq9aQzjjCo4J1bbr754PTWmpP7Kcxmsr8BKyWW6vAvipZvzwr1kMZdmQ1cT4fb
         /280X9c2F5rGmFEnt0no4Nn/GQE3FtrcLqOPaPZhMoM4eRyLv8H2eb0oBI5epOgEjMIm
         qFSKYcs+/oCaak5AP5cHBn7CuGt6lijoti6MMrMp2tJVCBhgdTn/xsEdmY7QYF4tsnc4
         h/DaV8nV8obOtl7D+jVwXFVf4283mT1SlOgOiVmlqNsc5JFbJJnNzm79HzvfoJC25Dsr
         gmQlf0b0lhXKfVWN3z7w7Onr4cVkxu5u8g755uYwMCBXM5Thbwl6OpQkiX5SquWPqaY7
         tVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502887; x=1735107687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bV4HRBWZxkX47QY6JDDMA6tt+8zgh76SAzdokkmEw1Y=;
        b=qRNJxRcpIdMGpQhj9BbuB9gSLNx79c+U8PXlYHLIwqsMZoS0nqa0DAKxGAIQOLvTRf
         t1Df+qZMUHLMqtcDuLqRGrfyyv17l5t4oBr8XGLbrnWPj85y05Qq7irQ6cYBqsNomXuY
         kG6JicX7i/I1byWjsm9XESXRe1eqyXPmVbrFsuA5WM8ooIbvmE8PWmibQe6HoDOiuX2A
         pjTife8h0Go61tNoEquNkWGC+72Zsrk/bGr0fmU3mzlfUbyds8ozl9E+bXL5GFeolFr3
         cAeSYp+N2lh0pVWmW3iyuFuv3XAfKguecXVtkyvEU3rgpqX/QC6b0d624oLg83YOtXWy
         z9iA==
X-Forwarded-Encrypted: i=1; AJvYcCX7c9XJYFjkMOYilWk6C9/k40xGcxAL3OTH5P/kvKeGXDATalxyPnVl+arBlEpqbvzRgUtpwunRE4A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxqzz490BxLhPzNVQPUq6DTzdI4O5tt6T7Kptf6otTgIdYFG50L
	7VLlv7Qfovlao7aBoS/rQ9tP6adZ32dITLpEK3dabjcc99t9H9LD
X-Gm-Gg: ASbGnctIB2zMBMt9wfoY12kv7SpMQjxz6jQjTJtznqUZGQdjTWAFESRxWt9SAMpB7U5
	fxQWVvxgV3kIJ/uvryOSTNv+FcEu/GeasumT3+QogqnQ0hMOj4rA4G/oZZMPqAJGKPq8otD40JQ
	F3eo7Txe0ZmwOBmwA4HJSqQ/Gr7G39SGIUfj0CiqpG3kYm/AbQksY3fHDV+TFg3gxUxQ3VyjSfF
	cjcLQIEciRvIWcE4+66//9FstcywVrzu9Tojia5lFEIKaP1oH+axvGjb+J1ijC5BIgM2GXeO5AC
	jZEKwDzQGGx3J1JLtA==
X-Google-Smtp-Source: AGHT+IFlF8vY4Xu+YyeQGqBnLgvAT6KCSD+NGgBHnqg25UXCR6Ho2esifXRrWSvDZ1rmidOkpqKkqw==
X-Received: by 2002:a05:6a00:2c87:b0:729:597:4fb2 with SMTP id d2e1a72fcca58-72a8cd37353mr3156867b3a.0.1734502887210;
        Tue, 17 Dec 2024 22:21:27 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:26 -0800 (PST)
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
Subject: [PATCH v2 4/5] loongarch/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed, 18 Dec 2024 15:20:08 +0900
Message-ID: <20241218062009.2402650-5-fujita.tomonori@gmail.com>
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
 arch/loongarch/include/asm/bug.h | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index 08388876ade4..5cac2d3efd75 100644
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
+#define __BUG_LOCATION_STRING(file, line)			\
+		".long " file "- .;"				\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(file, line)
+#endif
+
+#define __BUG_ENTRY_STRING(file, line, flags)			\
+		__stringify(__BUG_ENTRY_START)			\
+		__BUG_LOCATION_STRING(file, line)		\
+		".short " flags ";"				\
+		__stringify(__BUG_ENTRY_END)
+
+#define ARCH_WARN_ASM(file, line, flags, size)			\
+	__BUG_ENTRY_STRING(file, line, flags)			\
+	__stringify(break BRK_BUG) ";"
+
 #define HAVE_ARCH_BUG
 
 #include <asm-generic/bug.h>
-- 
2.43.0

