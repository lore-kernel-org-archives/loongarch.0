Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EB47E
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 10:08:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso7776518wmq.1
        for <loongarch@lists.linux.dev>; Mon, 06 Mar 2023 02:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jj1u1uhVF2sQ2RVxtjKMw18KpQKd83rLKq4resJQVxg=;
        b=1usxcaORk4vzUD7wjdTWxPIGkmkWNgCtULONTBP34T8McDvKYGW/MpGSlcjwuDrfTn
         PniNNii9N82GcQQ+BCwD2y2VKaJOj7+a0LBXroxQjjCWs8+c/oePRs3PD6QcNiookTy8
         HsE0IjeoDi+OqkZiqnMPpD/Dnv195K5+bK3HsT1aS0IyJY3m+etbpjyzPHPcgf0Dblx+
         VbsU/63YrNvC+XmZlMMMJYW/2PKq166WJKRAGBiQoXU8DYNnS8chrbImu/2FF6C7LxvM
         q8yiCPLoCakYyn/D9iUgJvTKXSNni+Qk37+EYd0xmJ3/KxDlX2zL8FsZfHSK/drojFTO
         lu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jj1u1uhVF2sQ2RVxtjKMw18KpQKd83rLKq4resJQVxg=;
        b=VlPlQTyOP9/Kc7GWsfMXQbGp33h4FEdt5tpaG+YbNPGck4mS/VopQP0V4bjssd7Q4J
         XFbIYPoPb5AJza1bv5OgS79aSN4TzhCwJPRwLTCdQJlVLhb4ofTYF79pu9d5CIrgLe99
         AsAGyWDoepUGZH8BmgttcoZ0c7jIDwVRzdRLLjpjxSuP8mBPSBvb+qQffdJVnWC2ggs1
         Xi1+K6orNnDqR7a9GnCfXPLQgew3k6SCuGZdwnDY//DvHCCbGIubNTUWja80RbEHG93T
         lj3kYQGTmr2Y04EpNyL+2oi7PDQtd13I3fk60XUx9UaDvgamLY3ldV/AvVYaVfNLmxK0
         gPVQ==
X-Gm-Message-State: AO0yUKXt8DYK8TOOE+dnoOaY5c9OSG98+gKlJstaotiUdvH9xUzkM+KH
	XQfDIQBUWD84vJ7P5O4Sc4893w==
X-Google-Smtp-Source: AK7set/ZePibjJOtk8oWIgABJFyRrkee7knkF+V6hkYaFn2pS6WICyq1eAFhhu5xpZsAhsUsORtBLQ==
X-Received: by 2002:a05:600c:1990:b0:3e2:20c7:6553 with SMTP id t16-20020a05600c199000b003e220c76553mr8682179wmq.13.1678097329516;
        Mon, 06 Mar 2023 02:08:49 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z7-20020a05600c0a0700b003dc434b39c7sm22915060wmp.0.2023.03.06.02.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:08:49 -0800 (PST)
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
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 03/26] arm: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:45 +0100
Message-Id: <20230306100508.1171812-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
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
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Russell King (Oracle) <linux@armlinux.org.uk>
---
 arch/arm/include/asm/setup.h      | 1 +
 arch/arm/include/uapi/asm/setup.h | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/setup.h b/arch/arm/include/asm/setup.h
index ba0872a8dcda..8a1e4f804d1b 100644
--- a/arch/arm/include/asm/setup.h
+++ b/arch/arm/include/asm/setup.h
@@ -13,6 +13,7 @@
 
 #include <uapi/asm/setup.h>
 
+#define COMMAND_LINE_SIZE 1024
 
 #define __tag __used __section(".taglist.init")
 #define __tagtable(tag, fn) \
diff --git a/arch/arm/include/uapi/asm/setup.h b/arch/arm/include/uapi/asm/setup.h
index 25ceda63b284..87a4f4af28e1 100644
--- a/arch/arm/include/uapi/asm/setup.h
+++ b/arch/arm/include/uapi/asm/setup.h
@@ -17,8 +17,6 @@
 
 #include <linux/types.h>
 
-#define COMMAND_LINE_SIZE 1024
-
 /* The list ends with an ATAG_NONE node. */
 #define ATAG_NONE	0x00000000
 
-- 
2.37.2

