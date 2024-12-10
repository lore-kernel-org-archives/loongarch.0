Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB93A4A0C
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 00:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733789972; cv=none; b=eNAzJ4rUMSDoVzX8v50lo8hxfqM7pBoCerBlBrzeNamUXRsdR172CuvmPSxDXZHma8UI3qH7mnjH7BavimXenUjw5+YBzpNi+sGRYQ0tM+I+Pz9OVwo8MMomCTEP9cvjljyhJh5Ukh4cx8+aUih0b/OKx2wUo25AagkF+hpTz3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733789972; c=relaxed/simple;
	bh=/K4eSvI1Ipf4Aur9iVP05PUVjTwf8ShxKmTB6bwov2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVQbw4+tR7YQVnKlXnn0c9kN15akh5mHcS6qAeS1a0d/q32rTLY4qYAHc/eBylQD4sw99ozY2LumWF0o7vD96rAITkxN0NZpFg8gKdORGSh6ejdQGmSVM1Emq0FOWPFpd/b+lel+bIOQa59TFQby9PQarTQ4opVTyJ+8ljVHWrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITJkLAVu; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITJkLAVu"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7265c18d79bso1240561b3a.3
        for <loongarch@lists.linux.dev>; Mon, 09 Dec 2024 16:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789970; x=1734394770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaW3Ni06SPvaTbLHs0pbUeHaTTwDPxQuBfccVmzf3vY=;
        b=ITJkLAVuZcO032OJf4hi+Lh1LSGNLIbF8byZO8jBbL3MoMHkdQeDbE9nid07fK7FUw
         ykk0UOn3XahEREGaiuZs3UQ2UHoHrfDAv9Bp+tOldTnt9MRjZ5oo/fP1u7Wx3FgE9+hg
         qAimiAiMwcBuND9Ku2kjX2Xm308L628F8N0G19qYWh/YL5EAfw6EzFb0A1KAK2okEzBG
         ORgj0MkL44NvrrtCOcCdT9PWPRJnT9vgJGyMMZz1lrCmOCe/Xwk6FQzYiKr6oIZYXy6x
         Rs/5L7FqZUyM6qZ7TQQziDeYpzOELiuKUanDVZeqZnTA33ZHJ/h0pYAco4q/aEuENxYB
         ORKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789970; x=1734394770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaW3Ni06SPvaTbLHs0pbUeHaTTwDPxQuBfccVmzf3vY=;
        b=Z/17DFvj4bLZLV0EZkMQHNSUDnOLlu2fyORk/5UwPBk2mbLpcvgQZtbvJYE1GA9drA
         5poJGBkh6oBKIIq5mHUN6AkNytP0mTU4BP5Suv2pvReo+IBIDwddObBfaeJbyDG4pjNH
         M6oPVUDrrmMVyIPQ0nh0sCy2hDduQq7kHNeqmZOPT7U2ftm+8x++9xKEyOxJRKQyLTEt
         aF1MA04zWesBKGGepeEyZV0NYN05aTWKo1SVzzhZJasOL6/fVnffXd6Q1Fsd66WZk6MO
         UWhMZ1S9uadd6CxoOwGqPImoN6TDP13K5K3HX1aCBwYiWEjn6buZZfyQIuyASZUYhka5
         xW0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV92W/Ox1Bq2/s1IKHIwQjgzfGFN68fCVIes799Nq392okQz6KXgo0+7M2DrBsrQD3DljMLEE6Tt8g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnIGrtlD0nDLnmPwN8+AAdeSggNoyNm3db5EPTu9lvy+Kn6kF3
	iIHE0MjajFt7t0YQUI1FBUjkV4HR/KcEDnsv7mJP8+lWUJMiGUq6
X-Gm-Gg: ASbGncv+17mAUI/fGN8fwbffhX5ZNqbUKbwdKbntG49NzAVKV0vpDgSb7AZpq3Np/Qk
	aGdIt8xBsQsqFJJhw0tOaIA0s0oApwkEDIUV1D1O/AKwe8nJ1vhtQQvWiY5KgNZ+TCSW0vD26Hf
	oAo3fYW0q1e6ukUSG09O6ea0oWuorERV7+CvJQ3X+RnuQxAsF0RWUmOq0LWH+pZEnp1dLTA2EEj
	q3uQ97YGLruEuF1p5CBMXl9ccdKUp66WrdH6GU/Mc5DP0/bTWjKScREnw7YoF74KkCvBAbAt5s2
	uFeKyJgYXbg1YtDrJwMYs+5IdGIo
X-Google-Smtp-Source: AGHT+IEHFQLb+CnaKIfB/aQiVn4EtFWGkBf9ZZUksgIXRkbcaqD+tHXdDTDwGlizNlrZosk3pbCxTw==
X-Received: by 2002:a05:6a00:1d8b:b0:725:dab9:f732 with SMTP id d2e1a72fcca58-725dab9f7f2mr11873956b3a.22.1733789970068;
        Mon, 09 Dec 2024 16:19:30 -0800 (PST)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fba027sm2005005b3a.3.2024.12.09.16.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:19:29 -0800 (PST)
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
Subject: [PATCH v1 3/5] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Tue, 10 Dec 2024 09:17:59 +0900
Message-ID: <20241210001802.228725-4-fujita.tomonori@gmail.com>
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
 arch/arm64/include/asm/asm-bug.h | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 6e73809f6492..822e9d51d3e9 100644
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
@@ -41,4 +46,22 @@ _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
 
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
 #endif /* __ASM_ASM_BUG_H */
-- 
2.43.0

