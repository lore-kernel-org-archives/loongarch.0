Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A62A27721
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 12:57:08 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id nh19-20020a17090b365300b00233ceae8407so7805080pjb.3
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 04:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LvbvVZeDxlmyQ+MKMrDf7Zww7VWZ6K77IBbIyuFkUUM=;
        b=WJdnIzCNdsEVhQsGHsWOO7yTWXr+pWI+PtbYUorKW2BchHqmwSwOGYAdoPufsKo0lJ
         bXDPWjxdhH0QnGSePHf16V7IoRXQeuhXlPcWmkxu8rZSjSr3Sh7jD3eqfhHEY8D454AL
         h9BqNX+KCkb4XJj5QiYoEyv/SXP+BeQ/BY4l0AmplspY3uh+sSGXDRYM23x/cN3z17v4
         7mVXCjohMU5LW8N+7VSWMBw+LVgUYmGtE+fRcUV+X7h/ZuXCVclocMVqOgQVU0PU1ZT/
         Iaxkx1YKf72wvTPUawYrrDuiNA9tC+Rro4eK9+FeLt6f2iRUNM5NC3UOCLKbbbVT0kzB
         CWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvbvVZeDxlmyQ+MKMrDf7Zww7VWZ6K77IBbIyuFkUUM=;
        b=oODw6t+ed7x3Gk8Eo8U/Fz+K75Y6Irgq+44OIgvEo/qlfCMAKQ7szq6okk/JrCDkdF
         7SdKMIU5uvXAbj/d2QF8Zql7csgmAo5tlBC57gyeS8RTRbrt1QXJUH8Uj4KtemHIoy2n
         b6Mk9KVyHiHydCcWwUYpOgEPcOMk4mLeOMgTFeAnFyfm6c9BnUhycLMk7UNP1dBMWpjI
         QA6Xnm/+ej86Y7CkUwBTRWEPOqq0t4ZTs1Yt+RCb2/UrksWIo5JXh5pFeWRBNtf8ghd5
         uVDFaW8ty2aNAXVrthhQwg5Y9csbI4E29YJRJ96YEegdhbFGX1pQAyAzG6dmI7I33VhB
         4qyQ==
X-Gm-Message-State: AO0yUKXQ+AxuptypCT73+LlKJFe26PtNzn8tJj/b3l8jg4+oQ1yJo9xY
	aPdQR/NERnsnGMlk1PCDwDtEOzKLCmiOi5RcExw=
X-Google-Smtp-Source: AK7set8VxH7lwiKYZQHjj1alCNiwWZsomKyHPncWio7rYDiPFQWyD3jSnBu7216hvtJHxDxHzVWwlnilO9YoLshnmQM=
X-Received: by 2002:a17:90a:d486:b0:233:c720:e6d5 with SMTP id
 s6-20020a17090ad48600b00233c720e6d5mr2292500pju.94.1676379427739; Tue, 14 Feb
 2023 04:57:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-12-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-12-alexghiti@rivosinc.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Feb 2023 04:56:56 -0800
Message-ID: <CAMo8BfJ_RF2C7EkZJusFuVPh0-7zpgNaj1pDf079CSKzRBrQjg@mail.gmail.com>
Subject: Re: [PATCH v3 11/24] xtensa: Remove COMMAND_LINE_SIZE from uapi
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
	linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 12:01 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/xtensa/include/asm/setup.h      | 17 +++++++++++++++++
>  arch/xtensa/include/uapi/asm/setup.h |  2 --
>  2 files changed, 17 insertions(+), 2 deletions(-)
>  create mode 100644 arch/xtensa/include/asm/setup.h

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
