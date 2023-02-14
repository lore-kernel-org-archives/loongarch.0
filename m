Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCDD7C
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 09:05:34 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id bu23so14847005wrb.8
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 01:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UN96HvyAH3A0F2+hA45TCkXOEUd+s53tiI7+aSVqnGA=;
        b=WP20i8MASM2rCtGp2Z93dGmU3cHmgSrcGF/TuhBxt26HL8dLV8rMBWxB7sa8KBt4Tv
         IL6JfqV+420KDLNpueRS17I87wZnHynwV7GyYH2PGB5tWYRSxhfFEZxTzExAwws6mG6P
         iakcPY+GsXyCb0Vpx7GzOxxLT7GAjj6878tQ978Llodda2xKxo9vKpEvTImdNhhBzQyU
         GBTQXOLeWISX7EYhUsOut4r3WpqCivpUPrmqlCqWIZ3Nn69+5MkbHE7fIJ058QvFHCQX
         3iiN01Fw0+PayGQK0xVI5HNTUycC8oyQptZzWy5M0sPaLFpPfPKlT60lGhE8n0Vhtc/y
         UvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UN96HvyAH3A0F2+hA45TCkXOEUd+s53tiI7+aSVqnGA=;
        b=nrWsAkecjVDMRGfQY9pz/vxOS/dlD9cSOzIJxTM5MBmW/VKgVrL8RHsoCAVk9yjfgZ
         N6bEPmscXURqfoThJl0mUvW8nX+FIkMUVgXyYgfiAiinQB14jL1TuAIN05iJmktnr4vc
         EKZ4XkvKcwvjBYAiSexQkkSdVKszjwXDMOr8WhvGefCLuJ5xUwpM+Swe1BMIK4K5pqN/
         +0pZ/gEUpXBuDppKpRUo+sXkAwTKi3BncrrMtlYFIJeuWZnuYcIYMkrbEW9WIif4kJJy
         20lrFcmZYBeNRFal72edOH4Kl9z6dAQevy4+5OMK/d5cFwjxxh5rgy6ucl6Mjbf5nlQL
         oJSg==
X-Gm-Message-State: AO0yUKU6iIWy1YFAX3owAvwz7U+GYH/vXR44TZCx2jK6BlLIivp8NVpW
	syxNYGbJ3Moyzj8EsWUYxpZMTg==
X-Google-Smtp-Source: AK7set/bnATx/QinUZEv/kaFr37XQ6gSjCAmEMskILGrw/zUjdr7eN5YeojitqRWgY6y+UsZcveJ9A==
X-Received: by 2002:adf:ef91:0:b0:2c3:e0a0:94f with SMTP id d17-20020adfef91000000b002c3e0a0094fmr1673667wro.37.1676365532856;
        Tue, 14 Feb 2023 01:05:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id o7-20020a056000010700b002c559def236sm3870899wrx.57.2023.02.14.01.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:05:32 -0800 (PST)
Message-ID: <34543e7d-f34f-a3bb-cb64-d47da577589e@linaro.org>
Date: Tue, 14 Feb 2023 10:05:29 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 24/24] s390: Remove empty <uapi/asm/setup.h>
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-25-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-25-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/2/23 08:49, Alexandre Ghiti wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   arch/s390/include/asm/setup.h      | 1 -
>   arch/s390/include/uapi/asm/setup.h | 1 -
>   2 files changed, 2 deletions(-)
>   delete mode 100644 arch/s390/include/uapi/asm/setup.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

