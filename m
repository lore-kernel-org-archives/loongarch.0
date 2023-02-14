Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFABD3C02
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 08:08:30 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so10883343wmb.2
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyJad6DESnZ256fhxA8bHesaXxO8dG/mPAVgfV58f6Q=;
        b=KxydN/OER8BSTkZprK4GQuQ37SCzFfF8F7nYPrALwYIhNfjrm/iYvkH8VHUKuWljc+
         hJyGkg/DL90Xfd3/okg6L0KzhuITpBNfbia3+S/fAK125Ld0kZhDA7eIlQxw+Xw3dkT/
         aj7aiQvBLhS5B8flYpPrieoVs9sQYS/U/d/InNnelnlguIeFUUtfjunMESQtOkqWbUre
         0p2y8ksgJKMjHBB/D5NBl5ZQwQ2LKcpSbWYGBzuXkyZiix752T1VYYWIXRHDTinKb1tU
         GVrcW8XhUkirbV/nWwdIfLjqo49ekG/ObANDCnvi9dmdJjcnTcfFXFmPFIr6rbAyJRMV
         RbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyJad6DESnZ256fhxA8bHesaXxO8dG/mPAVgfV58f6Q=;
        b=IB3VatyBi1HYkoPKe14zSzeY93BP5dGFonrto/l7ietDkkitvXZ3u339KR1/QNZMpd
         X6MTBL2bD8psW4L43j7WXmOjganeT24jBeDLDPdsq8HCSkzrzZ0DMyEGTnDq9K6vF31o
         UsJswKHRjY7uF4DTlBgUvHnEMDBb0c/OI+wC9pjiWuM+7no9xMW/5db4sZ9w/SU6VOlc
         uveHkY4ikJrk9x3dvMkpYZRNCMh8uSZGni/z7TNNVLlOM61sSYtQ9kqHH+FefiwrKdoa
         FOhGYX24/zh2MNifHumYnPnE0MN2lAOCnao7UYZi8y8SaLsJipUOhud0WhO0yxIrv3yc
         ZYmQ==
X-Gm-Message-State: AO0yUKUCd0GS/BzYclsYj2lUMRAFnj9HwoW/yh6RyZ2LKRk7+jfom/xw
	ooeVNCt4D7VwyXtdzAUCHlz9fw==
X-Google-Smtp-Source: AK7set/yO4PV5gq0EJbG+vnFnrIiAFQuyxqQz9U7rGQ0C4aBtVOu7GwxW5NGHi/BdSTlV9F3RxNsHg==
X-Received: by 2002:a05:600c:538c:b0:3df:f85a:4724 with SMTP id hg12-20020a05600c538c00b003dff85a4724mr1181315wmb.39.1676362109149;
        Tue, 14 Feb 2023 00:08:29 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003dfe57f6f61sm15477391wmi.33.2023.02.14.00.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:08:28 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	linux-arch@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 18/24] sparc: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:19 +0100
Message-Id: <20230214074925.228106-19-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/sparc/include/uapi/asm/setup.h | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 arch/sparc/include/uapi/asm/setup.h

diff --git a/arch/sparc/include/uapi/asm/setup.h b/arch/sparc/include/uapi/asm/setup.h
deleted file mode 100644
index c3cf1b0d30b3..000000000000
--- a/arch/sparc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- *	Just a place holder. 
- */
-
-#ifndef _UAPI_SPARC_SETUP_H
-#define _UAPI_SPARC_SETUP_H
-
-#endif /* _UAPI_SPARC_SETUP_H */
-- 
2.37.2

