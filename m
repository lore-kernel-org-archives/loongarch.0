Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15A1156677
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502883; cv=none; b=AnSuikX9+fhKbpsrtT6nezCkA7kwln3t2m7jXr9MyrX4pr+y20PTvC9oYPC/tB9blqYNlKklVRby5NgsK1XSlI2zpnxqHL/qz3hU62so6tqMoTadiRzs0a90HrdtaRAg4DxfjdhpzdiiCRdpMluP+9WfTtx+VWbeBi4QwKlpI2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502883; c=relaxed/simple;
	bh=/K4eSvI1Ipf4Aur9iVP05PUVjTwf8ShxKmTB6bwov2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsLY/TbsU4fd/arxp/VOISz1wvbh+c7ACiQtSXdda6eYkLgK+zUfuzL6NRw8Nj3Eou0ov3Etqj+wDo7E4+EmnTZ3sHylCA8NOjAB5fuEas5K9D8LlWsGS/Nv+r9b7CXvCNMjrpZvTVq4fFnM6GY6jDCDYcZAD/zGUiZJa9tf/rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llcBivek; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llcBivek"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-728eedfca37so6259862b3a.2
        for <loongarch@lists.linux.dev>; Tue, 17 Dec 2024 22:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502881; x=1735107681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaW3Ni06SPvaTbLHs0pbUeHaTTwDPxQuBfccVmzf3vY=;
        b=llcBivekiNIgL6RoxKDqK1qHy1Hzd5MjWGDuX2cky8BecTWzr1PRglSftmLypVk5oa
         /oEU9D3W8g+ND9QfUM6XvKpFafqjBhfG+YmDyHWl2J0L9qNlRvXXNbiXz+QqO/m+cnBG
         yUcIARZVdEhYL57/0xnelER43D6dvDTb30s8qKVO9qrvN4ivC9N/QVzsEx9JYv1a7NQt
         vzVpg4TNcOkyO4dpvC2TM/mAlv7xaTj7ubzntqSstSEQ1n2JuqDzMyazaElR230yg0G0
         rv/gb13rRQ0UdMCtpxmt6/htAhJO6QvfI/G8ZOQHVI2oaTpJZrn++aFHJn4ydGnQmR3F
         nJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502881; x=1735107681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaW3Ni06SPvaTbLHs0pbUeHaTTwDPxQuBfccVmzf3vY=;
        b=IWFdYXtf5yirgYHc0lbqSj+dRU5nDnr2EuRZY9xEe2yQn39iBmDKeWnO1yqPTwftRL
         vHhPZxkTZQr42BnTFEQT1ujEw9PXwxeqnYd0ASV/F4kUrtbXhV2jJqy1BI0z/0ROFWW3
         1OxVgCaGBq8uuizOcrY2XmbpdRKsOyoNbqdqjRPGnD5QkQnJQjnrzRSkgCATW2Nitxmt
         qcoO12Ns9/2Z4Xsng6EmoV24GVr/aheK6WMc4ywRGO500dKcKsztwmjJZJk8cmq4egho
         e9DEwtDfqdinY5YgEcyrgHD12IT2xayB6/vGkXhuSl+7Rpf5dwrGd2OBQJ5ej0xmOk5y
         chQg==
X-Forwarded-Encrypted: i=1; AJvYcCWROKNS2teIRwGof05AFV1Kwllry+5Qvv+E95JD5Q4rYx37hO/sYoiZusFmwaGpmTBKEnwx/WGCiP0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyojTF+lHceMWfx0aVjgvKKEB0kBSAfpOivqowBacloxXyJRor0
	AxzNr1N1WkRbqBhc2XY19AnNo4Eckx+AkvfP/ddP1h9vv7WILICD
X-Gm-Gg: ASbGnctlY6fvGt9+/w5T3ipvEW1qD/AVj5rDn7jIcr9dyyi3fxjSNGnao/T8O12biQT
	yK1x+84zeQZNYiS0aYiLCf6AGXU6Pjzy8vj2LNQwS7Ohj+LHS71iDciuE710PGHwE6X3DcLSgq+
	L1cTN04Fvbp2sQ66zfZKUx5tmej5ZOCDjObhZi/+GScUq+HDv/XtiDGOPh7Sc3Zt5GN6CSXVu7q
	mIIkG8DRIYshtr3VmdbBs8wg7fZ5gg4AZFD+1P6HsU5iLNtmn4wZzH9Vt73OR2wfdrRfiU3H5WZ
	Y2WSe2AQgy6YLxqzjA==
X-Google-Smtp-Source: AGHT+IEuE5RibS/0PE8QGo2Gm9cyN9hV9VQKXrPoGrTJF/gtHBVwLDycc3gJhMqxVgMQzkxuMYzzBg==
X-Received: by 2002:a05:6a00:21c6:b0:71e:13ac:d835 with SMTP id d2e1a72fcca58-72a8d26988emr2575186b3a.11.1734502881056;
        Tue, 17 Dec 2024 22:21:21 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:20 -0800 (PST)
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
Subject: [PATCH v2 3/5] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed, 18 Dec 2024 15:20:07 +0900
Message-ID: <20241218062009.2402650-4-fujita.tomonori@gmail.com>
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

