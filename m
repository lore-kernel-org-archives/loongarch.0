Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1D133D8
	for <loongarch@lists.linux.dev>; Thu,  2 Mar 2023 09:55:16 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h11so4166639wrm.5
        for <loongarch@lists.linux.dev>; Thu, 02 Mar 2023 01:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulDUS2iJXFm2m4kQCMOaQjdrnpHm4utsIFq2lL+6C40=;
        b=POzlmxOjJt+vUzjHgKiyLtmHF93D8dc8ElKS6QtpjXdmUesEpRKPxKBAc6zrtoOf9F
         EfQUD/qQ0T/79OjBhJTE8sqLESK1usXr+OZUB2gpyuSHrXMghaSar4AmmQZS9otBXuOq
         bezlKuZXTOXIIbTaLdNhjqLE7JHQMPI0R1ZZBygS0Z0KTGxwcz7LUmZ4DZDaZAkpBXGE
         dR/VgZ/ExD85vcRYDVvp/KOCY/q4r8EobUi6q81RmOCzdt+OmumHCCFVctgWhbWvZpIp
         kpDLSIqzyWoyofHRT78OAMPZFHo1dnI+KtFcPsNtH0oOfHFkWRZu0lLSKZB8FaA6knok
         i2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulDUS2iJXFm2m4kQCMOaQjdrnpHm4utsIFq2lL+6C40=;
        b=TeimFtTQvtgj6metYOsxQqT5KFlb8eZeRsSrnwj+8G1CpALP/vs1tf1s/ATt6ALuji
         QUR6BQYhKEfRLxaBVNLfwFs9ibBZpGveOo+9gkjZyLSw9H35aRA3iReBkdg1f+cvMAPo
         dbsDrRGO9qL/lnT+a6kJwV6TF4SQ3Zu9gyQ290hbnldLy+dCA9VGOaJ1XMfpCO48GKNi
         F0D093aZyZ9lbFC0HVCf9r3/BBUWN0KBsjlbneMRYJ9XNH/kzdAKoajrBE7330qw4mpk
         +A9HLjozBVlcCcSYunLVYmR9kIr6h0OqT/dt4AX0eR8T+jmQp5FyuUa33HdwlYcjEVBT
         hoTw==
X-Gm-Message-State: AO0yUKX4PRlH5k24TxX1L8rapsRVRiBStMSFW/JJwxbHgkFjzHsqNK06
	ZotVPDrO+cDtPHzHwfsIDP1pBw==
X-Google-Smtp-Source: AK7set8Navb3iBc+2hpEMWYrWKHhP8mttsp1Jdp2Zbxa1wHwXxwyR7TH8IQILh9g0msJIIvsN7M/vg==
X-Received: by 2002:a5d:40ca:0:b0:2c7:4ec:8d79 with SMTP id b10-20020a5d40ca000000b002c704ec8d79mr6522449wrq.21.1677750914917;
        Thu, 02 Mar 2023 01:55:14 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d45cf000000b002c703d59fa7sm14611580wrs.12.2023.03.02.01.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:55:14 -0800 (PST)
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
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 19/24] parisc: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:34 +0100
Message-Id: <20230302093539.372962-20-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Helge Deller <deller@gmx.de>
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

