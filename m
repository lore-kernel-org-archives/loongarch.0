Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076433C02
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 08:13:46 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id bk16so14711737wrb.11
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 00:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILvb9GZC9A1qdpzGm/54DVnwfbD0aC1FwyW+Sl0y38Q=;
        b=HtbuTMWUF2tj2aKTYK1yNsXduQ6APGdApj66NPfUkn3SC1NZ+4Oj58Zu/Ak7xQrox+
         8z5zWPuoQ5ax0ycvOIVDpPnca+IG5KAq9Xk8oRbw41qynenX8g1tvQQT5r4rKvCOaojV
         jPfso1gpqC7Z2cfUbExhYvaj/RucrDNjdGgvnx2nHDhZua6x3HRkpIYUHnc/zza6sfUC
         kBPr9thCBTCgRAhVcgvpLCi6AD2EkW7fcTsz6LD5+HaDqVwqa5sXnGFVtGPo6t/a8U6I
         Q2odZ240T2bFaiqA//nkU3FLd617ZdCB0HnDd7oQI/LmDmHhFW14L+tmEZwlUNudYQxs
         bOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILvb9GZC9A1qdpzGm/54DVnwfbD0aC1FwyW+Sl0y38Q=;
        b=6VBlt7fZ7wEzLnTH/6/7kR9168QPY/s/0g9vFZZJEiY2OFZeEmKpfKk7irqZA89G9M
         CHvkmQa29Khh9usXwo0SgcDmR5INpJLDbwPrYzYrgKRmeac5W3XUxTcbGLcxavxetLjm
         JjYmqDOuo3qWBAM0LzZmhCc9VaCMrOaqdVH+plktsIga1zLVt7dzTdUKXNwJuOB8+U9S
         hC9FCROWVfN2EawnU3xMOFaou9HQ4Z7R6vDbtkcNwS793bY/kfaLRO5D/witOxbkNwfQ
         vVynsO5KsC2FnCcZNLe4R8fvAEX5gYgcqm2XFxUgbqNzhG4D3vAElKkbDUtymfXAhdnq
         RPsw==
X-Gm-Message-State: AO0yUKVaN02hcqnqSUrlQxLTuhq39E+w2DReikq6fcXvvDaUOYpuCr+/
	jm04zz1oxxTww32bJ1t18KWj+g==
X-Google-Smtp-Source: AK7set8Xvkgv0Fg7/M7LlqjhmFeN/2ODZt/2XmlHUFLIKmovZq5e0GuKsxxn5/ZWllMjfmn+05RkGQ==
X-Received: by 2002:adf:f741:0:b0:2c4:872:e929 with SMTP id z1-20020adff741000000b002c40872e929mr1193948wrp.16.1676362425183;
        Tue, 14 Feb 2023 00:13:45 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002c55306f6edsm6397757wrv.54.2023.02.14.00.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:13:44 -0800 (PST)
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
Subject: [PATCH v3 23/24] mips: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:24 +0100
Message-Id: <20230214074925.228106-24-alexghiti@rivosinc.com>
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
 arch/mips/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/mips/include/uapi/asm/setup.h

diff --git a/arch/mips/include/uapi/asm/setup.h b/arch/mips/include/uapi/asm/setup.h
deleted file mode 100644
index 157c3c392fb4..000000000000
--- a/arch/mips/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_MIPS_SETUP_H
-#define _UAPI_MIPS_SETUP_H
-
-#endif /* _UAPI_MIPS_SETUP_H */
-- 
2.37.2

