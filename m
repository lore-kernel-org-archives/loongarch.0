Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3DF3C02
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 08:09:32 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id z13so10382172wmp.2
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 00:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIGhaDfE5SLWmKnSG9ikHY6squrBg187QDirpB8eFVo=;
        b=3lVcUd9sn2zQtFJR0u5J0kIaXOBwAUdWgS6TENWUzffST6PzutUUl4KQpRH68UCRqd
         AmXoKs3y/uU0PKnWtHqvwoOcZOhZN4v1Z7I6ss2MsSWN20umEr3jHUop77luRvjOQ+bk
         v9lp8QZUxuG4bx+6A9WxrhaJL2ZCl/14dMrBN4+4+AEiSiWCOTWv1xrROBT0jCNPejG9
         KRw3spY1j9L9Rl4qLoqZjdsJkumRxyNrfV8n0f91+GGjQwwO2+2THxyXibuvkVx1Ha1Y
         3AaXyilcA+IllPgV2/eY+YJepAx3JFCIrPZ694HAOjj7uDLhBVRVm9DXebU0wkwu1Nw1
         GNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIGhaDfE5SLWmKnSG9ikHY6squrBg187QDirpB8eFVo=;
        b=0PETB3iMwAG1aZHLJMGsrH+a5f3g5ZnM2+9fg6w7GEuTNgEdfDYduEMglCPSf1Pkpa
         T4yArZ/Q+Cxvu4KSCG/wBTk6xt4R6FehPyjcokEc08NQ4DpQ1ldpvuauUrRjx5fKbzGb
         CcI/yJV+i9lZbzd3G2/hPvCbdeflFxR4dX+DHUsiqDYo91Yti+8A2ST1EjGtP/F3ys0x
         cCTaAEOM/hAfmathoqTY5vJTZ2/WVSDlVnMDZ0oaDQGiWovwzaaDP5qQA0S91N/haEf6
         Y12JR4RyLqEe3jyFJ0l4oEzyd1wyIyWyPAGCtMWS+ujRgb2YtjC2J03K3mbpqbL63Rsu
         ALtw==
X-Gm-Message-State: AO0yUKUMa+69Ovb2SNjiqKGuHMZRqn2RpYsDMZXHe7tVYZwkq9jJ+ZTc
	sv8iub8m9TB+/LQUo0ZDSDuQ5A==
X-Google-Smtp-Source: AK7set88Ec71bhliYVjT8vjP3kYFJaQCuobrrvuvuiyk+qYoiCOwcAHhOO4G490cg0AP2c/iYiSZ+A==
X-Received: by 2002:a05:600c:1817:b0:3e0:c0d:75d8 with SMTP id n23-20020a05600c181700b003e00c0d75d8mr1854136wmp.23.1676362170796;
        Tue, 14 Feb 2023 00:09:30 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id s12-20020adfdb0c000000b002c3ec1fbc0bsm12256456wri.94.2023.02.14.00.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:09:30 -0800 (PST)
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
Subject: [PATCH v3 19/24] parisc: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:20 +0100
Message-Id: <20230214074925.228106-20-alexghiti@rivosinc.com>
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
 arch/parisc/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/parisc/include/uapi/asm/setup.h

diff --git a/arch/parisc/include/uapi/asm/setup.h b/arch/parisc/include/uapi/asm/setup.h
deleted file mode 100644
index bfad89428e47..000000000000
--- a/arch/parisc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _PARISC_SETUP_H
-#define _PARISC_SETUP_H
-
-#endif /* _PARISC_SETUP_H */
-- 
2.37.2

