Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E32E1C3A
	for <loongarch@lists.linux.dev>; Fri,  1 Jul 2022 14:49:54 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id b2so2584190plx.7
        for <loongarch@lists.linux.dev>; Fri, 01 Jul 2022 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SlvggK8fXyNNYQEUZNwoWJeZc2unOpzkRf2a1zxWzH0=;
        b=RxhYEffU+Lcb16MOwfbYO93ucTXxdWlXpcmhVbuenxnqcY/DkZO3xrD/UzBRJXLNvX
         HLXf9xn6Fw2dmwnhBirIWpDEL2VC7+7XsFY5vEV5FPZE+l+MsZc7fV5IyXhPtbziGxlM
         xlkXYLQWgYEUnKvxUzJJHsRwqqAvkmblRDzQqaLcgwxdunp/oHuegsK/3yS0KoD2W4fx
         3PFSHyxZHI/UyzECg7otKoWindO/jwidmw7l3qjl4bnGPAjXAxJEekFqRtCqnoC/2/TR
         aEUGgrt6W5ypb6Ce/sAu2ixs6lqG/AHtZXQyij28YVkROqLWXLH/6cqP4iGP36EcHvvU
         qdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=SlvggK8fXyNNYQEUZNwoWJeZc2unOpzkRf2a1zxWzH0=;
        b=0q1xWBDUxvFKtpsKMGWDrVviDo9qxHtAWTgtzY8z0V2k7Sdwd/2XJf9aE8pSVjtXTJ
         /y1vmaM81tEaLNH2lD5DsQe3X8MzFjiRt4EdmBNq2oeOTz+0xwV7/qzBVMFKyM8J8Yfz
         lbcFEL2//1J8ZmHtd7Rt0iM/mdYWSuUjKnr5f0dvxVeArX0qFEPfQKLKlHyu7J7Xn43t
         /7kuIhi277WMY/5aNChzx3DdJetFffhwW/9YdGB3abmVvLH+1DLcSS9J/CEbEbxomXQC
         NhpJ6GdXbmTemOQC+mrfEePSJySvf99qmIEKGxxEQfrmoFh6I30kCmY3mQtE5qMksUQY
         YZcw==
X-Gm-Message-State: AJIora9MNkD4GOK2Om/2rtC+wSZd4V/XsLujx506zLI29GAH0dbOVP8L
	E6k+pDy+Mhb7KFH+3qZJE3g=
X-Google-Smtp-Source: AGRyM1uJm5isr6L5qQZaqmQQpX5g6ihzpVdP8EvcEKk/f8syJ0jCEl8bB0W3px69rXl7P5o5+p/2bw==
X-Received: by 2002:a17:90b:1e0e:b0:1ec:adbe:3b35 with SMTP id pg14-20020a17090b1e0e00b001ecadbe3b35mr19514416pjb.134.1656686993657;
        Fri, 01 Jul 2022 07:49:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u22-20020a63f656000000b0040cd8f71424sm15267144pgj.69.2022.07.01.07.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:49:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Guo Ren <guoren@kernel.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 2/3] LoongArch: Do not include file from toolchain
Date: Fri,  1 Jul 2022 07:49:45 -0700
Message-Id: <20220701144946.2528972-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220701144946.2528972-1-linux@roeck-us.net>
References: <20220701144946.2528972-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building loongarch:allnoconfig with a self-compiled toolchain fails
with the following error.

./arch/loongarch/include/asm/loongarch.h:13:10: fatal error:
	larchintrin.h: No such file or directory

loongarch.h includes a file from the toolchain which is not neccessarily
available. Drop the include, and call the builtin functions directly.

Fixes: f2ac457a6138 ("LoongArch: Add CPU definition headers")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
RFC: If the builtins are compiler or compiler version specific,
     a separate include file may be needed. Either case, the kernel
     should not include files from the toolchain.

 arch/loongarch/include/asm/loongarch.h | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 3ba4f7e87cd2..df57f88b2fc5 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -10,7 +10,6 @@
 #include <linux/types.h>
 
 #ifndef __ASSEMBLY__
-#include <larchintrin.h>
 
 /*
  * parse_r var, r - Helper assembler macro for parsing register names.
@@ -58,7 +57,7 @@ __asm__(".macro	parse_r var r\n\t"
 /* CPUCFG */
 static inline u32 read_cpucfg(u32 reg)
 {
-	return __cpucfg(reg);
+	return __builtin_loongarch_cpucfg(reg);
 }
 
 #endif /* !__ASSEMBLY__ */
@@ -229,53 +228,53 @@ static inline u32 read_cpucfg(u32 reg)
 /* CSR */
 static __always_inline u32 csr_read32(u32 reg)
 {
-	return __csrrd_w(reg);
+	return __builtin_loongarch_csrrd_d(reg);
 }
 
 static __always_inline u64 csr_read64(u32 reg)
 {
-	return __csrrd_d(reg);
+	return __builtin_loongarch_csrrd_d(reg);
 }
 
 static __always_inline void csr_write32(u32 val, u32 reg)
 {
-	__csrwr_w(val, reg);
+	__builtin_loongarch_csrwr_w(val, reg);
 }
 
 static __always_inline void csr_write64(u64 val, u32 reg)
 {
-	__csrwr_d(val, reg);
+	__builtin_loongarch_csrwr_d(val, reg);
 }
 
 static __always_inline u32 csr_xchg32(u32 val, u32 mask, u32 reg)
 {
-	return __csrxchg_w(val, mask, reg);
+	return __builtin_loongarch_csrxchg_w(val, mask, reg);
 }
 
 static __always_inline u64 csr_xchg64(u64 val, u64 mask, u32 reg)
 {
-	return __csrxchg_d(val, mask, reg);
+	return __builtin_loongarch_csrxchg_d(val, mask, reg);
 }
 
 /* IOCSR */
 static __always_inline u32 iocsr_read32(u32 reg)
 {
-	return __iocsrrd_w(reg);
+	return __builtin_loongarch_iocsrrd_w(reg);
 }
 
 static __always_inline u64 iocsr_read64(u32 reg)
 {
-	return __iocsrrd_d(reg);
+	return __builtin_loongarch_iocsrrd_d(reg);
 }
 
 static __always_inline void iocsr_write32(u32 val, u32 reg)
 {
-	__iocsrwr_w(val, reg);
+	__builtin_loongarch_iocsrwr_w(val, reg);
 }
 
 static __always_inline void iocsr_write64(u64 val, u32 reg)
 {
-	__iocsrwr_d(val, reg);
+	__builtin_loongarch_iocsrwr_d(val, reg);
 }
 
 #endif /* !__ASSEMBLY__ */
-- 
2.35.1

