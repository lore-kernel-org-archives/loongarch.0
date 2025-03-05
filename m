Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40768235BE4
	for <loongarch@lists.linux.dev>; Wed,  5 Mar 2025 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741173028; cv=none; b=tJlJ2469zX80dHxz8/Y8bI4I5vkoqR4vWax8y8LNVSdUXsm6wvuZLzkoVFYh5Jeq4DkL+Yigj9twZO5OdfY/elSYSt3/TwihngVb2/dX5miGBQrqCIIX+u+mDLmDeV9YNEPSSDjcjN1EmARPy//LQFRGAjUtolcSkjsWmJ48TR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741173028; c=relaxed/simple;
	bh=mdMjqDgKLmfSj3Eltmr/eklydzSfhT7tfE+JI7T4puc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baITr5WgBe9lkqFYaiiyy5zq2ETDK/9WUiRf4UpCm/CkKc6jMSz6p+28uOe3U9SjZDz9GK7Cf1PXgy8b0a/kLcFR9MrOq0HylvW1jIPoNKJ6fCv2BbbYxLDmwIpjOu9NsBfAVFu20FrzcRc9Gxoa6xHnMPGzhTDIjHw3JJOzc/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cq0j3E+r; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cq0j3E+r"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so10615611a91.2
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 03:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741173026; x=1741777826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=cq0j3E+r0Uul5cEpanja+3Q7dH4k+PcjduuIZDAXWVUV3xCCx0tnS2briQh1+t8dZE
         9S02n7iqtKMcGgOHKz8qSUPmBa1CZWAAxtNZaN8HZlDrwYtdBBUlDZPH4vbTmefzsFrJ
         wO0WTovQWXo8/dztzwaJu/61E4uJ4t/2kuiyTVW4B96fLnWpVLuupvloT1TTxldGM+Ec
         vguhgFs1yANmxLzhyOAlt7NPdJ5FEPBZ1+9W1aK4ZBHiAh1JNHpwW/EES82YmhPlCWf6
         gBYClywhzkG0hOTXxdvQ0i+MHGSspbCLmN7Vt6r2XJGXMfIX8dtWxcJrO+aJw+LZmlPj
         YsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173026; x=1741777826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=sAEj0uS6RpMlsTcDIr2OSqB295geEmMJZbT/pleOJJOn/iQJlfa+mVK2HIbaZp6RKe
         hMyJRCbx7EfLAzqRmdsKIOsM+t84Dev9Ag5iGc9tA8GF5Nb9nmi58ksII3VPWIz0EZIi
         fxSK0EBJcivEx8euUIRvTpvZ+9GzjnwH9TqOglOOGTOkSAMp2Chpa0kQoMQ4mZhmSD+4
         0i2j1rz3iSXjr07lHzGsBsQ8mJElHBXk+vxSth3bwgsXD47dz3lwBhDaIrb23P3twA96
         +LKWbeHfMxWGSRmL5GOnJ+ek3Ox9M15pC5znTdI+XIi1IlaNFZbNurTFXcoGw7Mw+Bex
         5D0w==
X-Forwarded-Encrypted: i=1; AJvYcCWLwkCAu3ggeRazFxfIqsZVlThwlLI5rlWfcXrBvjS9EoE/udxX3/hYyptgPGovpFGPGoMn+VpmxN0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEkUQ1r+AShDg6E2aHsmDXnvCQwiUMYU/IEN5iCQKzZNVE//K9
	ic9NyQ/fzdMJSvDME33p7myDas0mDm1pCG0ZE0DZd5qavRDEmJ7+
X-Gm-Gg: ASbGnct1fX2EQGRewQaAq+pKEm8ipv2B1QzN5gnvZSp5XLW0UbIbfUeyDWYBddLBlUS
	7l+CwEP4IsWTeYWw4I6C+fxNClzBG9q9BqpQoCx0sMpXKid+7OfoU1bAO1Ia26XWjsdcleV/fml
	HqwuMd48zVxPz8vR+MrzNqx/lfcETxIRy7Sp8UW0znjYp+ki2J7hNT4De/09D6Z3d+MbdA8agIK
	VD1/d/opgvmo7fbO28r2At8zLzquCYCakUa1TGfZ1vFNKHFvmRp7ZAXVtQDbcdGW72+F427J9Px
	00+4sCSH73LfvOcfhtyfqvEp/SLr2k7uQA+wRjIKVlIOHsIXYJq7rHqXR/t0IIC3uWFGHVkaJ+S
	n69KzGf+lGCE0mWJOO87Ngw==
X-Google-Smtp-Source: AGHT+IHP0xBykbnwKXKfbmIat/96KZep+usQi4KEOXfaQ1XfgMnIYfTVt4U0//4lVI6PNsYEyT+Ccw==
X-Received: by 2002:a17:90b:1d45:b0:2f5:63a:449c with SMTP id 98e67ed59e1d1-2ff49840804mr4412875a91.28.1741173026565;
        Wed, 05 Mar 2025 03:10:26 -0800 (PST)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7737a5sm1060925a91.13.2025.03.05.03.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 03:10:26 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	x86@kernel.org,
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
Subject: [PATCH v4 3/4] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  5 Mar 2025 20:08:13 +0900
Message-ID: <20250305110814.272792-4-fujita.tomonori@gmail.com>
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
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

