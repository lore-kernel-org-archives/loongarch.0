Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799007C
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 09:04:55 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id y1so14877183wru.2
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 01:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZk18aUwfr/crPnHPA/QNPK0H4tWzNL+2OmakVamCi8=;
        b=FuqeOAA0zOBxZDuVrmVbvP8dKvoEf0MRrKKfm5NpFSyLOS1syMedD57gIqKmrL5zko
         qHpdqh+1Qi4vk3xY+Y+b00Y3rfjpVOFAPuWKFoaNHXYX+NhTIfQLIuO5WcCVUFUjRwy7
         xMFDBg0c617IjgdOAOjwaUswIiGz5V4UI7DfJ8LBDe8ExR38WilQf/7hqV4J4nMfP3dK
         +NkXzLhRfCI4LG9OC+J6fTkyG/7he+OYSDs5hlMQV6UXzYF2Dol240t6thsBMIDBZKNF
         mf4lP1Tmk2bhebKijyv57HPqf77+Ml7M9RiO9cyGc/K41l5a0L/IdrW6ctCufCt4MQrg
         Mpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZk18aUwfr/crPnHPA/QNPK0H4tWzNL+2OmakVamCi8=;
        b=XgkcQqjG3vDeHoIVXbLS00DzAO2eRWixrRD6XFE55wXg11pPjhDH3Gljkui5dVhFzd
         /q3/p5qxZxbymS8nVOLgXesFX9cDnLYfbgewidMnGaBiqOafq8URIr8nw1cDdob4jFoC
         XGIW62ZAvLoVSnmtPJ4uIF9eE7Rt/K+6M7tGRX63kRWL+lpH7U/MPP7ecJ8M0X+Uhl2z
         GzDWQ0cZ3Ys6UX9luEctJmw39OiBiqeSzMVWZL0PyNP/3hx2CpyZ6jCS3PNyt5tIvU7U
         gXCxpVTEGAwn2H+KT2Fo6naBhqY7HzG5bj/BazJd5ZTG+rdx2dHa6jheC+7516qdYDY5
         6kYQ==
X-Gm-Message-State: AO0yUKXqEl7/UXGVtM/eE3Al8iwdsvnJUwMKmqjPquhwnuh2hVoJDva9
	+HLwRS9hu3CftetxJaZXQ4CEWA==
X-Google-Smtp-Source: AK7set+jlADAGeMno/J4b9rMaQi1OSFbGE2cOeHJ3WYCoMJkKRkmj2/GQpc+G+sprep4ghyf/aRSVg==
X-Received: by 2002:a05:6000:8b:b0:2bd:f5bd:5482 with SMTP id m11-20020a056000008b00b002bdf5bd5482mr1310606wrx.28.1676365493352;
        Tue, 14 Feb 2023 01:04:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id d13-20020adfe88d000000b002c54f4d0f71sm7494931wrm.38.2023.02.14.01.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:04:52 -0800 (PST)
Message-ID: <a018ab25-b545-1227-951b-a7b4e1c25d5e@linaro.org>
Date: Tue, 14 Feb 2023 10:04:48 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 20/24] x86: Remove empty <uapi/asm/setup.h>
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
 <20230214074925.228106-21-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-21-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/2/23 08:49, Alexandre Ghiti wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   arch/x86/include/asm/setup.h      | 2 --
>   arch/x86/include/uapi/asm/setup.h | 1 -
>   2 files changed, 3 deletions(-)
>   delete mode 100644 arch/x86/include/uapi/asm/setup.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

