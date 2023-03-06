Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE142CA7
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 10:20:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id e13so8186317wro.10
        for <loongarch@lists.linux.dev>; Mon, 06 Mar 2023 02:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNfVXtm0Wz6Lcu14/VeJhPZvzJHmN/UTN+NdnetUsrI=;
        b=zEKMo006Xbug/aXmguPAFx+8GznNpbMFgiuyvBxm1/vVdhqNwuHJrYXWA7JTvtzE5c
         AIYiprni3pevhXYqTTlmoHq05GH3D1+hmikQ7K/gHy5bHLLM/FFKho9jTwKfpy1OtWhm
         7/rZv8lo40Y4YU1QIp41cEQntf2rrS65grgYMLBZqCIf6NowqCfX+okjOVG5JIJlBtW0
         zgJr+1mdxls28jOQYn94NNEjL4OdDAQTZH03VRn+jNxOHMw4L3sPNJZSZWJKXwyW3chG
         dOKgWZ4u5Agmu+Ser3XwVB0mKYFws0BtfawUKa7HDlKv+oDARrjJzr0Hbs8yzxzAi/Rx
         g76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNfVXtm0Wz6Lcu14/VeJhPZvzJHmN/UTN+NdnetUsrI=;
        b=ukogzNaZt2THFzn/iAgxOaW6fXGfhc+ZmSYhtZw2RPPHbkwI4UHEj9QPJgvtX4sKBu
         u45iEIkH4CmDuD7BuxxLInJTtC0WTKWz0MicxSSY85atyV/UL+GXkZVKOvtvUkXJvE60
         6Lf5IX4O+RAiFRUgp6pbwyvRYNw2NGRtR/ku4Z2XEjMs6pceT4Zf3F9az7w+pymlBTSx
         8R20BFUg+DTV8KfibTNTxx1Y+mGEUZ/pQUCxCT3gYMEJsMfRBKHIfyobynnQFU10DK4F
         b/WzY8gf/OcFgOCbHau7TzV7Xl+BhFjUTR+tIMSk2NNpS4up7xTjXSZ/7IV6tjMCm7+u
         j6/Q==
X-Gm-Message-State: AO0yUKUAf4zYlZdMi5tY48TSEYAZSlPKAgwaU3I5aTrGNYgR/40oKsme
	345RDXIiFxJXkbEyPyZ2oht/fA==
X-Google-Smtp-Source: AK7set+9yKsGBjI5CL2QxsviWWD6moVJ7ZpcNzljpaDW2ezgs/yExN4XMfzrZyyrCguP/BvDK6xUaw==
X-Received: by 2002:a5d:52cc:0:b0:2ca:2794:87e8 with SMTP id r12-20020a5d52cc000000b002ca279487e8mr6328197wrv.21.1678098008018;
        Mon, 06 Mar 2023 02:20:08 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a13-20020a5d508d000000b002c54536c662sm9634322wrt.34.2023.03.06.02.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:20:07 -0800 (PST)
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
Subject: [PATCH v5 14/26] alpha: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:04:56 +0100
Message-Id: <20230306100508.1171812-15-alexghiti@rivosinc.com>
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

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/alpha/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/alpha/include/uapi/asm/setup.h

diff --git a/arch/alpha/include/uapi/asm/setup.h b/arch/alpha/include/uapi/asm/setup.h
deleted file mode 100644
index 9b3b5ba39b1d..000000000000
--- a/arch/alpha/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI__ALPHA_SETUP_H
-#define _UAPI__ALPHA_SETUP_H
-
-#endif /* _UAPI__ALPHA_SETUP_H */
-- 
2.37.2

