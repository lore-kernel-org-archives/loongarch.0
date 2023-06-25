Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2B9EA4
	for <loongarch@lists.linux.dev>; Sun, 25 Jun 2023 21:31:31 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f86dbce369so3191678e87.0
        for <loongarch@lists.linux.dev>; Sun, 25 Jun 2023 14:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687728689; x=1690320689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+vBar4+CLR6TDQyNZjkELXTZBE9ucLGNyisqXCBp0c=;
        b=XnMKcu+DvVFFbNAPJoejCymxEHLsfGVjBJp8rhLjxmEH5gQg7SJJcO+T4kI0Y1n4Ly
         DU29CCkOZ/qBV0orbhS7JzmbJXaqo7Kep/2Spa7d6DqMEFuDUS20nY9chPmUXmfx6ijH
         bh4MfJ8MZYSx7pyFUNPBY0+iI64YBhhpgwD/ABzWgORbM9LN+uhFFyqfaiD1n34x9Ct3
         2u5frIDAbQ+p9EBcGuQhbG6YAZsfEv2Ltf472clzoj6EWWRIM30CfCXqEheLJd3209C9
         nE86N9MZS8o7KuH/5kcFzTTMO8SsyMKe732GFM2hHEok7qTCkimlzvoxg+LY/lDe0AxU
         GNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728689; x=1690320689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+vBar4+CLR6TDQyNZjkELXTZBE9ucLGNyisqXCBp0c=;
        b=fBK+HiKs6v4G0NTxWjUrjDESUJiPcMyKvSmfFd6DB4vBPjBDC9Qy8ZC/HR0CpqZgpD
         jjeFxFZn11goFIP0xdZqvPfZgqrHLgoepbFM/uJU3HIGbNPDNJKAabtSn3OQUF930l07
         OzMMHnbDoQ4YCZUsyB+LATG/RaJKEobGk/wtt+vYuui+UyBK7hOTl/UHccS7UfXuKdgk
         RwOckfaXE3QBchCqJxqkGXnBeL0Su9t+yZfGc5/Gt+ZDiRFxTHZakKZqxiGaj8RG1CPo
         04kWMxkRChrnlyNzCIu5XvvYoK64MtOFAruaUPXuL0P7yjYUVw9OB8AFb73PswXlr2k6
         5gBA==
X-Gm-Message-State: AC+VfDxWtZ3HVHQbo8IvvQXwFvr40a1LJPCUy/ep/Azd4r2xjX3ysz2K
	3NMYVpgi2LFGYuPJpzAUpaAQCg==
X-Google-Smtp-Source: ACHHUZ4ueF7pB37Kjx3og+hVW79MU4Pnt3oR5acFEBC4M80kOtrhpKljcmf7bk4yPZDdm8+PgN44JQ==
X-Received: by 2002:a05:6512:10ca:b0:4f9:6b64:9a36 with SMTP id k10-20020a05651210ca00b004f96b649a36mr6138182lfg.62.1687728689066;
        Sun, 25 Jun 2023 14:31:29 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.212.184])
        by smtp.gmail.com with ESMTPSA id y12-20020a05600c364c00b003f7f249e7dfsm8710877wmq.4.2023.06.25.14.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 14:31:28 -0700 (PDT)
Message-ID: <3849d2e3-43d7-4059-aead-fd78ded3b475@linaro.org>
Date: Sun, 25 Jun 2023 23:31:24 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [patch 11/17] init: Remove check_bugs() leftovers
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Nikolay Borisov <nik.borisov@suse.com>,
 "Ahmed S. Darwish" <darwi@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Chris Zankel <chris@zankel.net>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.553215951@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230613224545.553215951@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/6/23 01:39, Thomas Gleixner wrote:
> Everything is converted over to arch_cpu_finalize_init(). Remove the
> check_bugs() leftovers including the empty stubs in asm-generic, alpha,
> parisc, powerpc and xtensa.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Chris Zankel <chris@zankel.net>
> ---
>   arch/alpha/include/asm/bugs.h   |   20 --------------------
>   arch/parisc/include/asm/bugs.h  |   20 --------------------
>   arch/powerpc/include/asm/bugs.h |   15 ---------------
>   arch/xtensa/include/asm/bugs.h  |   18 ------------------
>   include/asm-generic/bugs.h      |   11 -----------
>   init/main.c                     |    5 -----
>   6 files changed, 89 deletions(-)

Yay!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

