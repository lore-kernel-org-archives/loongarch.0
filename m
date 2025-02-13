Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31291274246
	for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455266; cv=none; b=FDStGSGtKyeXFbT8hgpOFLASbKao7qsYn/Q3/V0BZjeQzC0JN2ksWZsFADy3jVq4jbrcGIJpz6PPOOfpBlhr8Xr0hlh5peay4VXmtP/13gKCS0NJmmeq+7YAN6h/B0PWRHrZh2PjnPiKuVaysO47mfRVGyPwlUmPfmIw8osLXfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455266; c=relaxed/simple;
	bh=Nn8KuzF9O6nRbRkZEq4R22MVH1XltQW/KfhFXKsiiKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sscfiPrvDijARzZr6IA5EXrvHXbbP7Ce9kOKHCghvi3y1w9qst0NOT3sDiV6GDHFHvXkXqhe++L0wtOv3GKtK2bTy5sGnbPdnlj4+vbfCGUJI0f5fh68TDw8NizzzZNGxOMnFr3JfYSQQvTK/66lS2xSxYwlll1l2mupIu7ybWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eINV+T0m; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eINV+T0m"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f818a980cso12989215ad.3
        for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 06:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455264; x=1740060064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YTck7L/TM6YT4d7fP2I9343oTdjN2yh7jLib0/ivQs=;
        b=eINV+T0mj35tTSsFnNDY/BCwcmK8y99S7meE+LyDfLmoEQOAHnkQrzdakK+f09Qise
         CwBUBHfRBR/eWNTe6oC1FzhHyY/O2QT8vA1fygp2MaPPQ0ku7TgQ+z2LTcROP+EvSH8Y
         tbZwa+5bU7RVlyk6NyEU8vHj7oG4FkOmJaCaUhUHHGY2avZVGCyAdKFoGU+Ygn7mN5w6
         hsAHIOuWMxiDsrWVPjvaY0N1gqMQOBRR6NPojWZpP7sYysiNmjMweRTPTXGeHi0hSdDR
         MIGVZ9Iril1jToIviVvLlLjo1+Vxm4bhc7r3BnT0ppSpiRXRr+T8hQhQxh6C0zSTVRJr
         YDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455264; x=1740060064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YTck7L/TM6YT4d7fP2I9343oTdjN2yh7jLib0/ivQs=;
        b=SNTJwGmubacDyjTu0V1zw59obw7jdmnbnpeWpbKCxULbVlUfFMxfTIz0tFqUtU4GGJ
         6aQAWmZ+zNzAPtTxSgNnx+xCgUpkp+W95dvCegQIyANcrztJZymvYhuhl1IvYWY6vLyH
         QSIdb35YosVgHszZJqFake0X9apLJ8zy0HrvaqvKp4/xlZqXf6R2EU6ld0bnM0opyqPP
         wuponP4WQV0pCrlmFVNTz4jsTOZaEq0TLNqJZrxdug8LYQXHy7YN9PNXBZ60XcFBj6Ac
         tVpp0r2OjLQC3+4yRKxToKlE1wPiw381dQaYC7R13ucbjdZCtPyPqNoJSiu97Ua7Z+6H
         LfvA==
X-Forwarded-Encrypted: i=1; AJvYcCU9xHQaVuH5pOUIheIPNIwoYcXTijnErddn1HfJqIKi1OjePk5RwPWs7tCxEaop0T4TiGmZOPVZn2k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzM5rEuSPhAAzeLRnzivNy0MNRn68TuAZnCvKxfM3db0SuJ1j25
	ZctnrzDjX554zm8y7C4TZryBSOGVvgRZiNJuHmD7Vdd67wrucQmn
X-Gm-Gg: ASbGncsc//v7B1Jv/VDbrDIHL7tqP3U5rkEayyccGJMn3aq8z12xqNHrI35saUtypLv
	NCHuPMtCM5oMSGcwKi5QsMIjC1kIAmvvCDq6tumJHX21wOrgC5D8HuLTXLTvIxSfZT7ZH388t0f
	04J8plsoj+ZEoZFYvFsIcSEXke+cgJXeG0hHgXMuGDymEHbTAZ6q5EK+ArDHUKvnnbYrxy4YAf7
	gh7V07/3jd0TTCS2X9+OTTxzvDmyYIA0GG6RE9zHRLkr8VDiECRJ69Vt5dsHNKm4OfQQd3mQomP
	xHgypkDUxU268mY1oD0k6xTt6g3MLnPUlw/7KAR2+RyOoL1/85BDB4TUhyz99ejIR8s=
X-Google-Smtp-Source: AGHT+IH1x9tK23DwJyRFWv8i5Lca//kx4EQ6K/f/4h09IEIvt0Nq6qmEVopHA91pvULj+H6RHqZ0EQ==
X-Received: by 2002:a17:902:e750:b0:220:e392:c73 with SMTP id d9443c01a7336-220e3920eebmr20624875ad.22.1739455264110;
        Thu, 13 Feb 2025 06:01:04 -0800 (PST)
Received: from mew.. (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm12565225ad.223.2025.02.13.06.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:01:03 -0800 (PST)
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
Subject: [PATCH v3 3/5] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Thu, 13 Feb 2025 22:57:57 +0900
Message-ID: <20250213135759.190006-4-fujita.tomonori@gmail.com>
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

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/arm64/include/asm/asm-bug.h | 33 ++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 6e73809f6492..a5f13801b784 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -21,16 +21,21 @@
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY_START				\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
-		.short flags; 				\
+
+#define __BUG_ENTRY_END					\
 		.align 2;				\
 		.popsection;				\
 	14471:
+
+#define __BUG_ENTRY(flags)				\
+		__BUG_ENTRY_START			\
+_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
+		.short flags;				\
+		__BUG_ENTRY_END
 #else
 #define __BUG_ENTRY(flags)
 #endif
@@ -41,4 +46,24 @@ _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
 
 #define ASM_BUG()	ASM_BUG_FLAGS(0)
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_LOCATION_STRING(file, line)		\
+		".long " file "- .;"			\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(file, line)
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
+	__stringify(brk BUG_BRK_IMM)
+
+#define ARCH_WARN_REACHABLE
+
 #endif /* __ASM_ASM_BUG_H */
-- 
2.43.0

