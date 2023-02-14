Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD447C
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 09:08:55 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id m20-20020a05600c3b1400b003e1e754657aso4705651wms.2
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 01:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgI+MitPy4LpPY/kxOD/cgobRuJLYDph5veEhGksnEA=;
        b=lB62HMad+osyFa/YRShwy2xvQQhT9yfoc9RwDPDM2XUSGGo5hotMUJADGxDiQ5/oie
         0UWu3aWkXWJPzO2vTsakK1Ei6DOuBI3AmUwSmqLUQ8ZTe80+NCQDOZ6/jIcjNALXtEWB
         myMm5/pYMGpx0868z9pwpjeJrpOhJ3ovmzXzQhl2yeLNk8GtyTunjqqhJ50Jqwbk2KBA
         nUku1vRER3frC96KkvlnDaokGHBYVCdqUaGsTL3zenSy+/9/+IU0+RrXFmVs8uRAFld4
         BkpKIHPTos+3uB9tCP+/qrZBOcLM/octf0KKmtrOqlUnOOZdPlOJ+FnLVLjXXtr1QHtR
         lZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgI+MitPy4LpPY/kxOD/cgobRuJLYDph5veEhGksnEA=;
        b=C09essDxe9mi/tnmh2/cW30/AiRxW+qV3Ljqgtg96Jl5psrQ9egUhnsGn0qWWHtLu6
         QKJz6LQm810tw6DKiGV1LvJ3izzUNHEio1sBg5peLAII6WA7ji4tOobUZfVmK3qCdM/d
         5GoTf11d9r1MRuKGO492zHxv1Ohwm8sBp5yUJEr1BX8+MhOhRUjdo+4Ats6bAlL4dcyB
         gXpP2YRh90HDmIMp2ab6LtfepsTkYziJw8HTTINlQk9mPgU5yPJ1Fs+NHT/tS2s/iV1T
         NQ24QhzBDNQMMam6bwfiSOX2f2k7Vj90ll9OsMObok4zhr7Aol4UCLtVlj3BjBERzcZY
         QlhA==
X-Gm-Message-State: AO0yUKXORNypzLDkVdCT9CTrT2Ztf96bShm1+5SiCVboAo2fuioLoNqe
	AcSmfhg9tmmm9hTStIx5Ed6n8Q==
X-Google-Smtp-Source: AK7set8HRSS8W1/cKITusqPpdx9jDHZBvQKOiM1WFF89CfxkBUxGtw8QxLzPMCmfytpLrqWBoPZ9zg==
X-Received: by 2002:a05:600c:3423:b0:3df:e4b4:de69 with SMTP id y35-20020a05600c342300b003dfe4b4de69mr1515046wmp.27.1676365733617;
        Tue, 14 Feb 2023 01:08:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id az7-20020a05600c600700b003dfe659f9b1sm1519398wmb.3.2023.02.14.01.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:08:53 -0800 (PST)
Message-ID: <6f9c7a6b-4f6b-dead-2d9b-14b405f18397@linaro.org>
Date: Tue, 14 Feb 2023 10:08:50 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 19/24] parisc: Remove empty <uapi/asm/setup.h>
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
 <20230214074925.228106-20-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-20-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/2/23 08:49, Alexandre Ghiti wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   arch/parisc/include/uapi/asm/setup.h | 5 -----
>   1 file changed, 5 deletions(-)
>   delete mode 100644 arch/parisc/include/uapi/asm/setup.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

