Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E0E12F584
	for <loongarch@lists.linux.dev>; Fri, 17 May 2024 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715962190; cv=none; b=f8eShFEgX5Lfz+D+NKMmsV8XSMbHQz4QqEF0WJ2Bmf35t++N5m0MbeUPA5W0YdVkzt5sVo8cDh/BDXUJ57meZooohC1VejuEsoDfYo+sGtYPG0IdEuzAU1kxrF97KoKZJDnJ70oDapbIaeuaEzrmPMtW15JGLYLt+VozIJGKddM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715962190; c=relaxed/simple;
	bh=Nf4RNkeImLEAmR+itasCgmxOOOn/nmm3CPvksEHRQiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tuxzp5XeIlz98JNyy7B9bh9ettywbyYyQDGzyH9AujJTH2mUO0D5BowzXgeTubO8wdxRw6Q+jpQvqy8QfQIzFqo0HwYOQz8bcNSMzRxjFw8qO+2oRju9NZfADd+oK7SyvxiRkURSr0sSogapoEg1rM9bF+Smc4nLYu/UQy45sz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez8jDk1s; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez8jDk1s"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52232d0e5ceso1105511e87.0
        for <loongarch@lists.linux.dev>; Fri, 17 May 2024 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715962186; x=1716566986; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IstAfylTBNaTxmmaRyk4imp16sEYUHGaznoMjv7UZHs=;
        b=ez8jDk1sZBsmhZZP3GCSBivWrqJXtilOboz+yNVVyNQ6r/ZvC3w7kQkmGmWklvzLKH
         0SBE82jCmtSt/uHgMFgA0vG12/o137fMPNWCnAmPcI+dnEl5+Ub0qsm0dPgj26iiWiiT
         odOBOWwBStTcyJuDToCpPe/fHGlOlAmG8hyG2pT/Wlo3Y5DQZJFy1RXd3tLSCpdq5HxX
         Py8BJRkBDktiUkyW6kQ8BGSRa0TRPiksHH/jDw2iMa0V06zMrl3I10kjyT6vjOHjkV2B
         jGCMfD6TzbzFopCklCPqhPWyFrvMRwWYqGG++KfFg8Uxwm2qZFz1GAdNu1aFe+HP26l6
         RZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715962186; x=1716566986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IstAfylTBNaTxmmaRyk4imp16sEYUHGaznoMjv7UZHs=;
        b=ANaS+BR7ZFSeLhMjlBht1pGnP5AL8Gf8sjBVWnBckZBb4xSZxP015E4XwfDCZBRxcy
         0hWMI/nrQaW+Y7fUZWdPpzi0HLkrrJPgjx1nFt+H3lOnOjH5kp4zSEl4WYIWZB/8I5i2
         9Dkchjhzvij/bI1Yvf+e0ykOLO8i7VtTTH9xSG7IfKhD9UT9J/pAD4pPI+yIVeebBbgJ
         eabMpACt5/edS7QFe+6rjKYb9s9rHKBaqOOySenb9OktW0BCvm5RXjhqO7J+hgBShWpB
         ZO/XjOo+bqAaGXTEJsIwFxs0n7PMPHoEq753zrQiuazXX2DHziC2D5/c8LzNMXBU+GvX
         kocw==
X-Forwarded-Encrypted: i=1; AJvYcCWj/YFVT5mPGz7o/u2jQcaNKFyxvid7hDWdUEeHIOh23JSqHtN6hJOG4kaAJOqKBLXQeSyusRbaKCu/rrubRPaDjZNEu0Pk56LE
X-Gm-Message-State: AOJu0YxNqz+hOHjizncNODyGzPp1b4u/Mxqxj+BAideUmI04BYBDLDA6
	ohl9xB3aoDg6Z3HcDOf/ndUCskXMoQGw2wKuAYuoKb8Rw4r5P0F/
X-Google-Smtp-Source: AGHT+IHgmwwit2WhgD28ItKwKm0UGYj6mPQDthm9VUXNUEsMkvdnQLGvWiUajRHCK+r/d8TH466Lzg==
X-Received: by 2002:ac2:54b9:0:b0:51f:d72:cd2d with SMTP id 2adb3069b0e04-5220fc7aeb4mr13493469e87.22.1715962185544;
        Fri, 17 May 2024 09:09:45 -0700 (PDT)
Received: from ?IPV6:2001:678:a5c:1202:2659:d6e4:5d55:b864? (soda.int.kasm.eu. [2001:678:a5c:1202:2659:d6e4:5d55:b864])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d7ee4sm3314135e87.182.2024.05.17.09.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 09:09:45 -0700 (PDT)
Message-ID: <170eca58-8950-40b5-b2af-3ac3844af3aa@gmail.com>
Date: Fri, 17 May 2024 18:09:42 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 16/16] bpf: remove CONFIG_BPF_JIT dependency on
 CONFIG_MODULES of
To: Will Deacon <will@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>, Liviu Dudau
 <liviu@dudau.co.uk>, Luis Chamberlain <mcgrof@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20240505160628.2323363-1-rppt@kernel.org>
 <20240505160628.2323363-17-rppt@kernel.org>
 <7983fbbf-0127-457c-9394-8d6e4299c685@gmail.com>
 <20240517154632.GA320@willie-the-truck>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <20240517154632.GA320@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-05-17 17:46, Will Deacon wrote:
> Hi Klara,
> 
> On Fri, May 17, 2024 at 01:00:31AM +0200, Klara Modin wrote:
>>
>> This does not seem to work entirely. If build with BPF_JIT without module
>> support for my Raspberry Pi 3 B I get warnings in my kernel log (easiest way
>> to trigger it seems to be trying to ssh into it, which fails).
> 
> Thanks for the report. I was able to reproduce this using QEMU and it
> looks like the problem is because bpf_arch_text_copy() silently fails
> to write to the read-only area as a result of patch_map() faulting and
> the resulting -EFAULT being chucked away.
> 
> Please can you try the diff below?
> 
> Will
> 
> --->8
> 
> diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
> index 255534930368..94b9fea65aca 100644
> --- a/arch/arm64/kernel/patching.c
> +++ b/arch/arm64/kernel/patching.c
> @@ -36,7 +36,7 @@ static void __kprobes *patch_map(void *addr, int fixmap)
>   
>          if (image)
>                  page = phys_to_page(__pa_symbol(addr));
> -       else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
> +       else if (IS_ENABLED(CONFIG_EXECMEM))
>                  page = vmalloc_to_page(addr);
>          else
>                  return addr;
> 

This seems to work from my short testing.

Thanks,
Tested-by: Klara Modin <klarasmodin@gmail.com>
