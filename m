Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0C72CA7
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 10:21:11 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so7781099wmb.5
        for <loongarch@lists.linux.dev>; Mon, 06 Mar 2023 02:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+Ect6Q4Z/51Ss7kNoue4ZgIVIoWQVVZbpFfKkrpRUw=;
        b=eKLpoO9ARR6byQoI3KfBvzhVk6oe6tP+suH4MHwkIJcy/wnL2MWwPVlq3KLS4NJYuC
         npg5z0T2YBn/ekgqpnS/gNer4hyqDKqYzgmIxENE3SgezTEwqliE0zYvr1fPH2GwQmt9
         jcx1NZi01pxBQ8XJzaRbcQsUYYsPfqsPA8Xrv5yjnuSnQHXj/GpNSw6rf6ah3jgmbxsg
         5zflN2ad7NQHZvZAnNO7AQDSJOT5MmVleuf7siqRD5syVZugGRJ+AhyVsYNsIzfeu+J7
         VpepoXaaVFgjZInk8H50HM4y5yJKfoYFvZxa+/DInESeQ0WBP4e+4PFuGrx7eKGY+RhS
         PH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+Ect6Q4Z/51Ss7kNoue4ZgIVIoWQVVZbpFfKkrpRUw=;
        b=FVb2pjADunxl7E05OpNxhlhDfBA/BCpv5tAkWPODXNVudoNivg6W7zZ2a8AaiAzP6s
         1/EfTcwG7Ljoh9U1tASqhTwZRRiKADk+QylSElT+mGt7TziuccY4APqUZU7lCjBy0gLb
         +im6xcMY9r+Oc5ltwwA0XTuBracsoyOgfXVJUTTO+s+UTmX5SMDk9nmnQYlSP9f4i6Iu
         UdBobpP/Bi17pSmJ3s1753V85IowJv1qvQsRxsl8Fla+9O+gcZd729Iy/dJEJBUXDgBG
         PaIXmy/z1TSTnQyFRjDnXGw++HfIWsYQ6pSRxgApuWzubhc2P5dTZiXXt017A6xN6zN0
         HX/Q==
X-Gm-Message-State: AO0yUKWHoJ0VrknhFjgnsN5kzU9j0vTba+RZABKuVkboP4y57eIVOtuk
	HETFi4yRQlUbsM/v3hYCSQAHXQ==
X-Google-Smtp-Source: AK7set/wPuCwO2+/CS8VAJ7eTry4Cq+2CHA4Y8YGXKD1MQFrurlRBakmEmc3JjUrX5cCPEVIcMP5rQ==
X-Received: by 2002:a05:600c:5254:b0:3eb:432d:8279 with SMTP id fc20-20020a05600c525400b003eb432d8279mr9240197wmb.13.1678098069733;
        Mon, 06 Mar 2023 02:21:09 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c15d200b003e20a6fd604sm9521693wmf.4.2023.03.06.02.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:21:09 -0800 (PST)
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
Subject: [PATCH v5 15/26] arc: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:04:57 +0100
Message-Id: <20230306100508.1171812-16-alexghiti@rivosinc.com>
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

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 arch/arc/include/asm/setup.h      | 1 -
 arch/arc/include/uapi/asm/setup.h | 6 ------
 2 files changed, 7 deletions(-)
 delete mode 100644 arch/arc/include/uapi/asm/setup.h

diff --git a/arch/arc/include/asm/setup.h b/arch/arc/include/asm/setup.h
index 028a8cf76206..fe45ff4681bc 100644
--- a/arch/arc/include/asm/setup.h
+++ b/arch/arc/include/asm/setup.h
@@ -7,7 +7,6 @@
 
 
 #include <linux/types.h>
-#include <uapi/asm/setup.h>
 
 #define COMMAND_LINE_SIZE 256
 
diff --git a/arch/arc/include/uapi/asm/setup.h b/arch/arc/include/uapi/asm/setup.h
deleted file mode 100644
index a6d4e44938be..000000000000
--- a/arch/arc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/*
- * setup.h is part of userspace header ABI so UAPI scripts have to generate it
- * even if there's nothing to export - causing empty <uapi/asm/setup.h>
- * However to prevent "patch" from discarding it we add this placeholder
- * comment
- */
-- 
2.37.2

