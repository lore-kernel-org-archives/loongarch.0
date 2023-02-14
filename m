Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1773A3C02
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 08:11:36 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so10889494wmb.2
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 00:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvpaBOHRxynQVN76sYSm78ChjX1znmriOrQIpZIS+4U=;
        b=5NlXgVjhh9vbvViub6LhSOmr8tVa6IBVEyF0zRfB83IByLzArwAM+0qw+VxsNI/v3O
         9OWtZbrdL8JfvpiE3iq+Owwbn7WHXgFSoaFB0e4OactZe5gsW9qsGGDTPeYgJylr7/3s
         3F4MpYflrtieowDacsXG30s/rLOj/tHYjrMAdlnpeXOJLEslGasAHVP98/8wE2cbZHi+
         DtJVObK2BvR1NA+BCeSfpJ7/0/Xqxv3cM7UfBXMSNhytYiWpfcvUEjSNTOi8cKTr/Na1
         dTCAdzJ5u+E++JxwEI0i4jgV9lz/WMEz6jZfUqV1tX/DrncLas0AKVlLr+8/5kI49TKM
         W/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvpaBOHRxynQVN76sYSm78ChjX1znmriOrQIpZIS+4U=;
        b=16itIVaEAMkLZ1E4IUaJXuNlrQDjjeDNTjovP0wSfWPwiie1UUIE0EaetHByXCsZcQ
         hNYJk6HZnvY6wTcCvhxwo9A/Q4Un9UMzKpKk0XxaVWPanly0kgyWvvCTWA3pLu330urw
         cLIZx1zASJIWGC4E8IIADwoHde5z+qXqAtbzPYYgvSJMm44YJ2RTavnG7zMXCkzEn/XW
         Shx5QjWcUw28g4E5jGhFP0oX/ozuVfHYH+rU8kHbX8RChjABknZHoooBhAHDlJjlBZ+K
         4p7s/HdznvoSBi+cbgCFY0vpatXlLAQJyG7BBKh4ALybqe7xyHTaAfCMzexRdu8LnTUU
         e4Mw==
X-Gm-Message-State: AO0yUKUFVwqiTcurSDCv7bKknzVXstT0GcAaWKKny6l821Ncu0wuRXoT
	gj/Nz4eCw66EBuNVjR8jfL/+gA==
X-Google-Smtp-Source: AK7set/6ZO0GzOxTpCDrsVlt02f4BgyGKOm1zeoaq0l7Vu0+xmZuXJDnZSoDV/hFx/zxMjZLosjRIw==
X-Received: by 2002:a05:600c:994:b0:3dc:5937:35a2 with SMTP id w20-20020a05600c099400b003dc593735a2mr1855049wmp.9.1676362294487;
        Tue, 14 Feb 2023 00:11:34 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id r18-20020a05600c459200b003db03725e86sm18173022wmo.8.2023.02.14.00.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:11:34 -0800 (PST)
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
Subject: [PATCH v3 21/24] xtensa: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:22 +0100
Message-Id: <20230214074925.228106-22-alexghiti@rivosinc.com>
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
 arch/xtensa/include/uapi/asm/setup.h | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 arch/xtensa/include/uapi/asm/setup.h

diff --git a/arch/xtensa/include/uapi/asm/setup.h b/arch/xtensa/include/uapi/asm/setup.h
deleted file mode 100644
index 6f982394684a..000000000000
--- a/arch/xtensa/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * include/asm-xtensa/setup.h
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2001 - 2005 Tensilica Inc.
- */
-
-#ifndef _XTENSA_SETUP_H
-#define _XTENSA_SETUP_H
-
-#endif
-- 
2.37.2

