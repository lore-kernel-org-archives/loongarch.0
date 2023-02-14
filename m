Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2005B3C02
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 07:52:03 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id o36so10365959wms.1
        for <loongarch@lists.linux.dev>; Mon, 13 Feb 2023 23:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QGomR6O3S6q1h7LTqMqQGUhrMtnm9a8zoeq++2Xa7o=;
        b=fR3zO3k5w7le7EbRP/5hPFZY4uLUH4ckgrh9M19BdH9Dv5reStNddHAA25t4N3Sesc
         W25DNRjk2eDkyloYIh9FawqDzoeoM5Ihv9WzrU14UP5nmny0ohmEa7tB18dRaok9qcca
         Cg0/N9fChXGeR9QMmopc9nD283PdFxnqO1RlIt/KWu0qU3CATwIBzQpWXLSYWOSHHwKx
         jTukzmp6/vXmx9SoOo9K/bTE3PzB48TIwUC3pPgKI8wOpNsm+0N+U4RKCka40i+f5BkP
         /FvKgQ3hYM5uSvNyCCcF0tflxn/F7hAgfgHVd6eT53WfWqqvJFa/ALNyo+E9eOUo2Ak5
         AmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QGomR6O3S6q1h7LTqMqQGUhrMtnm9a8zoeq++2Xa7o=;
        b=6r2Gp3lHObSSh1BmlTfRSU5OYyK8GLBz5ANWB8c4VCv5i/nFrAIM+Smc5K2JgAbnYb
         NOFhEypUnjAyUXS0F2IoeJ3C3bGkwhCYeAVwTpVkgW3IJgL+Vslba/bC0w2v7wlPpROt
         aygFFXqndNL0jVnWloNjTW4pD0jQcp2u8jGpyuiS2kohAi3LItAZfBlmbH5U1qt7jOZX
         rtD+V1/Q7/T+n87gCVMMS7uZxdvGa3fCTLipDfTjryXyPsIn/d7I/eB/9oyP59/M2Yi/
         pO9ahX30bVjNmjmIgSJIeFMcHTvhWHCpLzstlWKUsQQf7JHHJCK+C2Z0UwudqSnEOoUz
         evxg==
X-Gm-Message-State: AO0yUKVE6682BIntwxpX4BxiMVcT8lD8FRADbajJZ3BmmETDKHX+9CAM
	IdKqaCL5bgxy/vPRZD84kZ16iQ==
X-Google-Smtp-Source: AK7set9/2z/bngt+TO0I8mQoi50ZVTNoeKRPycliCaMbwq0WtByVc0+O7QBcGv8JCO9MxNJMRmluyA==
X-Received: by 2002:a05:600c:4b20:b0:3dc:53da:328b with SMTP id i32-20020a05600c4b2000b003dc53da328bmr1128761wmp.14.1676361121511;
        Mon, 13 Feb 2023 23:52:01 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id n22-20020a05600c4f9600b003dcc82ce53fsm17982254wmq.38.2023.02.13.23.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:52:01 -0800 (PST)
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
Subject: [PATCH v3 02/24] arm64: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:03 +0100
Message-Id: <20230214074925.228106-3-alexghiti@rivosinc.com>
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

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/arm64/include/asm/setup.h      | 3 ++-
 arch/arm64/include/uapi/asm/setup.h | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index f4af547ef54c..7ca70f883cee 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -4,8 +4,9 @@
 #define __ARM64_ASM_SETUP_H
 
 #include <linux/string.h>
+#include <linux/types.h>
 
-#include <uapi/asm/setup.h>
+#define COMMAND_LINE_SIZE	2048
 
 void *get_early_fdt_ptr(void);
 void early_fdt_map(u64 dt_phys);
diff --git a/arch/arm64/include/uapi/asm/setup.h b/arch/arm64/include/uapi/asm/setup.h
index 5d703888f351..f9f51e5925aa 100644
--- a/arch/arm64/include/uapi/asm/setup.h
+++ b/arch/arm64/include/uapi/asm/setup.h
@@ -22,6 +22,4 @@
 
 #include <linux/types.h>
 
-#define COMMAND_LINE_SIZE	2048
-
 #endif
-- 
2.37.2

