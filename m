Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0BD1FD7
	for <loongarch@lists.linux.dev>; Thu,  2 Mar 2023 09:40:52 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id f11so3963203wrv.8
        for <loongarch@lists.linux.dev>; Thu, 02 Mar 2023 01:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L+Ar5AS29WjCGN6FFc/k3j0QPqZZ6/exmn1igmvNEc=;
        b=rGvdfDufQS0sTH0ShJ4oYeHFJCauY3w1NPdfXO3CaGXXh1ofyN/EnZ7BHRQIx9uoFN
         OBN5hunPl0O4XG5PjPuHrRqN16DJZJqR0sJsIFt47p1rtmhWuD6sDuRN96u6kdvTJj/b
         T2ssPAC1EOIK75EBnO8hdGehF9uK34i0WxOc0JJOyPJNa3xILyOZLoGjmZhnY5oTwNYv
         b1U7QYrUtgXW1tUaZKRC4UKJ4HVy9045rl+5s/609vTTn9pfvzMP1vrChe0YXuAjo5Z8
         uGJr4rkQXmN2+8Sm0LeEiIIvuSSxI6z/22c5lHFHfTcDPEOJmc4D63rjVeVevvqStb9C
         cUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0L+Ar5AS29WjCGN6FFc/k3j0QPqZZ6/exmn1igmvNEc=;
        b=7o8IoqAjqnUAwWlfL807bjwc4io/41yU5JCxaNLx+L9bssGK++2FnmLrL0/ZskTT2E
         m5ERcC2cez0B7AqWrjzicvlnvPy7BSBPkkpLdiq5Z3Gs+JPtJtjRzCay5H75HRSG9e4P
         /PKW9z4u9sFxoWLsPm5uyJeM58VdJ1QizzUm2hHeaH8M6mNDJNYWZBRKuELRHoAU6Yzy
         IBGuYsgNrtizHzaQNOJ1lEVdciTUJU18IbhmWujtPzTKtWWlQhXMwiNe2J+J7oOnffUZ
         /Z30KNL/TiRT9Y2gSc57vUzsOpS/XtE+U+9HYSfLedjwxA5Pcpt/GnmBIl4ChuAAH2ZQ
         U+SQ==
X-Gm-Message-State: AO0yUKWANllRMKYIHbiYf4A+igRWQHZFm5LxbiDKo+NT0SoVdOz17aNY
	9T8QwTNycKw4z7AV1UwVRf6P2g==
X-Google-Smtp-Source: AK7set8lOrf0+R9AHb5hLsEUHatiTlDjMZoXSp24p7HHFEic/nwSaQPtS5YZenLo3DI/kV1sOwHyfg==
X-Received: by 2002:adf:e5c1:0:b0:2c5:5d15:4e25 with SMTP id a1-20020adfe5c1000000b002c55d154e25mr7000920wrn.16.1677750050774;
        Thu, 02 Mar 2023 01:40:50 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a14-20020a5d4d4e000000b002c57475c375sm14878620wru.110.2023.03.02.01.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:40:50 -0800 (PST)
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
Subject: [PATCH v4 05/24] m68k: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:20 +0100
Message-Id: <20230302093539.372962-6-alexghiti@rivosinc.com>
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

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/setup.h      | 3 +--
 arch/m68k/include/uapi/asm/setup.h | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/setup.h b/arch/m68k/include/asm/setup.h
index 2c99477aaf89..9a256cc3931d 100644
--- a/arch/m68k/include/asm/setup.h
+++ b/arch/m68k/include/asm/setup.h
@@ -23,9 +23,8 @@
 #define _M68K_SETUP_H
 
 #include <uapi/asm/bootinfo.h>
-#include <uapi/asm/setup.h>
-
 
+#define COMMAND_LINE_SIZE 256
 #define CL_SIZE COMMAND_LINE_SIZE
 
 #ifndef __ASSEMBLY__
diff --git a/arch/m68k/include/uapi/asm/setup.h b/arch/m68k/include/uapi/asm/setup.h
index 25fe26d5597c..005593acc7d8 100644
--- a/arch/m68k/include/uapi/asm/setup.h
+++ b/arch/m68k/include/uapi/asm/setup.h
@@ -12,6 +12,4 @@
 #ifndef _UAPI_M68K_SETUP_H
 #define _UAPI_M68K_SETUP_H
 
-#define COMMAND_LINE_SIZE 256
-
 #endif /* _UAPI_M68K_SETUP_H */
-- 
2.37.2

