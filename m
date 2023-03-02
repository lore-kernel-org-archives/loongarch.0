Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA9833D8
	for <loongarch@lists.linux.dev>; Thu,  2 Mar 2023 09:51:09 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso1152059wmo.0
        for <loongarch@lists.linux.dev>; Thu, 02 Mar 2023 01:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDXrUpH4uzk/doR0fj90OitraRNQjXfcQ6Va36x03uU=;
        b=rQvGiyACcWPbt022BQ4KPoifzo8RgfR9WF7Irjyc15Ofpoe2VdY9cU4LWt3/XPjXVp
         zUO52y383SVibU/tjEMRqerhVz4Xk1FY6u1X+LhjxS1bQEtbInYRzVt1zVJkwy+qQUY4
         ZYzfd/Ttv46jZdM+eSJCCX8BJ9TomlaekFXaX6lLss4Xjp0f6E2an2tqydpu1FXIvVPs
         TwshGg1w/E3+Y8dWqBWiBCmS1j06paEig+zfY/J2E+ASdmgmRUTmGM9IRmoaIsqzO4YX
         Kg7kLnPp9cQBIiAp9yNXPyoJk586xxu3D++D1O9aM0M/oTelZGBy7iVF6vpF3zTtg+PO
         PnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDXrUpH4uzk/doR0fj90OitraRNQjXfcQ6Va36x03uU=;
        b=zLTngIcz21zd9ymeVtV0omqVZsOYjLT9ARbavTz0z4Mf41YOut0H3NErnRZicuqYDY
         oe8GyNWqltZmDOrW6nNp3wjXy4/oRpyBDC2af4rKeb9VxkyNHSQgEGU4p0I+XDiyi+qA
         YUAerA/j6mIcTRh3L6htsWuvwG+p7u+yckAj0VfEaVfpYHff4yDBuOYoQbZP7tnikbFv
         6BcGjPP/3ktXMWIAE14kIGWj7PL8Zn5UHOeA+88ifVJQh4RvMo5hwrvtYSCyHxn2J12r
         YAsQCV+PW335qkBuRRzc7Uzu+oP8vjVMyfFSAjmO426xiksLU0Ou0i/sWFY/TBqxHpgT
         FsHg==
X-Gm-Message-State: AO0yUKWefHX3np/v7aV3QCSq7tYPdRhKZKiI5dG7qOeRzLdTT44Mrnmg
	U3ICmXCUytT4GVTuio74rff/bQ==
X-Google-Smtp-Source: AK7set+aEWZKQAofuTtkdEbf6zV5TySvY9JY2ZvgajiiG+o+W95xNH46kztRn/fmFa9CvC1WgbPmrQ==
X-Received: by 2002:a05:600c:45d3:b0:3ea:f883:5ac with SMTP id s19-20020a05600c45d300b003eaf88305acmr7083444wmo.5.1677750668043;
        Thu, 02 Mar 2023 01:51:08 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c458900b003e1f6e18c95sm2583433wmo.21.2023.03.02.01.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:51:07 -0800 (PST)
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
Subject: [PATCH v4 15/24] m68k: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:30 +0100
Message-Id: <20230302093539.372962-16-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/uapi/asm/setup.h | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 arch/m68k/include/uapi/asm/setup.h

diff --git a/arch/m68k/include/uapi/asm/setup.h b/arch/m68k/include/uapi/asm/setup.h
deleted file mode 100644
index 005593acc7d8..000000000000
--- a/arch/m68k/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
-** asm/setup.h -- Definition of the Linux/m68k setup information
-**
-** Copyright 1992 by Greg Harp
-**
-** This file is subject to the terms and conditions of the GNU General Public
-** License.  See the file COPYING in the main directory of this archive
-** for more details.
-*/
-
-#ifndef _UAPI_M68K_SETUP_H
-#define _UAPI_M68K_SETUP_H
-
-#endif /* _UAPI_M68K_SETUP_H */
-- 
2.37.2

