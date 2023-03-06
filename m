Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8667E
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 10:13:59 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso7766150wmi.4
        for <loongarch@lists.linux.dev>; Mon, 06 Mar 2023 02:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3X9BvECf+3SX0mMpHf0lthb5xJ0QkcE03vRTNH+hHOU=;
        b=TTSZLAdSQw2BSgSrJJ2o37VazWfyqoXDSSnKzELvvKdWaFxQn0hpc3xnanqgBRvl8f
         hMcTvxnJ8qqKyl8vSndcVLH7PbDn9kfgNB1VXKCuPDHcFGW4mKqFBhn/w6Sdh0Xgm1R6
         YM6vKZwjlOo0wqPzhmimn1eoNY7JrMrYeHStZ/t5ZuIOEXNPQKF0tExXRTn6cVEw2RP6
         dYsHwEH4Xe7lRfjF3at1i//BKyDky/XBdoPvehKfCtgR5rGkyIeUwTBKTSwBNVePHqZ+
         iJYXtXhBy/u8FL/m/g6gBbLtGB3IJ5+MqR+lTtHRiPq1uFWNBl/r9W3PzjkDk3EBJxIX
         xeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3X9BvECf+3SX0mMpHf0lthb5xJ0QkcE03vRTNH+hHOU=;
        b=6U0ixkI78OeJvFNM25PzNQRh973oHmzHxqFz6M2XsLenov2HwffBbXmbRovwgiXtNW
         tx/CUwfsev5EmGouqV7831MHz+VdNTBhgmW2g8TA6MBen/CFmkd7UYMpXeA1B9ykjwsc
         FZDg4p5dIdf2AKKuBEv2HZXwa2gA+eHk8Dho7MNvCNk7a53mkUeSma1NI2IBhmKJlr7y
         i3enpDC+FTV3CNamokcPS57kmBAn2cBVj1ZAQS7JT4iS9qHPUMrI2zJnINuW4rInkvdB
         9tZyyt9xJkFPpvMhTrPQvs+Rk/gQc6AhnEroER8FZdUM9xlTZ36cAUeI4w/IjbL857uQ
         9s2g==
X-Gm-Message-State: AO0yUKVulcGTGXd0OSAq99dhUv7Fdzn4S88UVyhgJgME1oGILx0caqZk
	wpXlhKxeWVL0WTxB6xK4l5f7oA==
X-Google-Smtp-Source: AK7set/l5GEMnq9janBGBy5D83Z+dadr5zaqw7qRz4/2MZ2rCQRE3vxRMNg0fQT2CV/QEN0Xv7ys6w==
X-Received: by 2002:a05:600c:19cf:b0:3e7:772d:22de with SMTP id u15-20020a05600c19cf00b003e7772d22demr8559008wmq.30.1678097637919;
        Mon, 06 Mar 2023 02:13:57 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q11-20020a05600c46cb00b003dc1d668866sm14417931wmo.10.2023.03.06.02.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:13:57 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
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
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 08/26] parisc: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:50 +0100
Message-Id: <20230306100508.1171812-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Palmer Dabbelt <palmer@rivosinc.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/setup.h      | 7 +++++++
 arch/parisc/include/uapi/asm/setup.h | 2 --
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 arch/parisc/include/asm/setup.h

diff --git a/arch/parisc/include/asm/setup.h b/arch/parisc/include/asm/setup.h
new file mode 100644
index 000000000000..44e1c42244bb
--- /dev/null
+++ b/arch/parisc/include/asm/setup.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _PARISC_SETUP_H
+#define _PARISC_SETUP_H
+
+#define COMMAND_LINE_SIZE	1024
+
+#endif /* _PARISC_SETUP_H */
diff --git a/arch/parisc/include/uapi/asm/setup.h b/arch/parisc/include/uapi/asm/setup.h
index 78b2f4ec7d65..bfad89428e47 100644
--- a/arch/parisc/include/uapi/asm/setup.h
+++ b/arch/parisc/include/uapi/asm/setup.h
@@ -2,6 +2,4 @@
 #ifndef _PARISC_SETUP_H
 #define _PARISC_SETUP_H
 
-#define COMMAND_LINE_SIZE	1024
-
 #endif /* _PARISC_SETUP_H */
-- 
2.37.2

