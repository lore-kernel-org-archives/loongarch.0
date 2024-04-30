Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19651171099
	for <loongarch@lists.linux.dev>; Tue, 30 Apr 2024 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714480891; cv=none; b=c46Xv9ZA5fFc0uVykVI57mYLLpEEM3ZAYM+SMQMej8CCOcRfnaJbwHsZCI7vQhCd5ub+9kD1cRWZfMcIY5gWd0xDyF7BA1HTcn0rLFmS7DBKDw0xUxzu4DJIg3BU6e/cBCTgRNmUOd4LvneAy/nYqhkihxy+PBid2Z/aU7mt0DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714480891; c=relaxed/simple;
	bh=EAkzlUPf87vK95pHRAftB3pj+wg3xtsMqv6zZ2xItvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGn20xYNfz8oTK/1XBTKgp1Un4RwVH04uh+46B7cmiOD9GalZDllN0zLk8QY3Jq3Qpo12M53vWRhL5CoSc2DN3Cr7oAcJtiSpI29pGEtY/4dnsakfp5MiKRVaStjRGi9SKu0XNB8tutTZT3AijItAYkFTaIPNAMMMZRjQu4G+XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=snmOYIwd; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="snmOYIwd"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51abd9fcbf6so9422489e87.1
        for <loongarch@lists.linux.dev>; Tue, 30 Apr 2024 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714480887; x=1715085687; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1zoRl9JNX91wxTFZ95WC2aOVdcvQqQ9ebO1YgbX9Wg=;
        b=snmOYIwd6Kj0egBjN1tEVNvZOIy39kGb4jMPIpoCUGL5Ar/RIyaDDeqPyXOTD+Se7A
         2Dad+6vnniE5YaJye6a9Fn/1BX5N/Zpbt892CPRu4Q0i5rtiq4UEjozTNRSzzumAJFcX
         ezVwdw1B2ORQC+hoS37uGXsrCZdvhBp9y7XJM2ZZFfD++f58sZ9mBu2/SOJoC4YAgT5x
         EStDQ6g4LupANm7ThGv4THeQ1y4J+roHxNeaxErusOyKLyg05zUR+gJUppLFUYJDOkVo
         eTiPkUEEmofTv/2P6BnO1v5VNomMeblCl6XNK3dq+FK/FhXuHwbixg7obVotFZoEkL8h
         Ka5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480887; x=1715085687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1zoRl9JNX91wxTFZ95WC2aOVdcvQqQ9ebO1YgbX9Wg=;
        b=V1aOuO/uQ1OOfBktmhX3Y3skMiwTbLgwR0kbBGk94n0leiRjIlH4ubPObMfYkvwn64
         r7Y77gKCDOEOQir47XekEIAfbDHC2s5On/6WnRQriM5ej06A5Ftg3qyDRjOLhRBDRM44
         Td/4g3YYK/msRRPCC+BqiYQD3YQdxGlN6RYW8d1diUJH2CzwOD5rmEzsCHypnWRaUl3Q
         782H3EEUNiXl/y4vs56Qt5PJ9k9v8NeK2beuMpd3JtTTTk4ja0+HVGgGEdt7HTYlvQbe
         7zVqHH9ifnaZm2L2+VDqH98lps/TCOfSedaiNXc8h6GUlbbMndSgRBHJzSEVVlFRoOgX
         WpyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5MJjGvr9ic6DRZH8MNsXDqe7kU1Esqu1107nf6s8KnUbIRA2FGU4x0xboANdEhBwtoTRHvABFV1AkSz4lf9/vIZa/BRI8xnXr
X-Gm-Message-State: AOJu0YxTTkP15/ti4vrddmbgF6SyTt6yL8DC65osKEWsytoMQxjoCD0a
	YinH6UJfBmBy16yF1kcc9creVmLwc/WJPm+eClMhqxpADMm8fk+FJJR8CNT2IVo=
X-Google-Smtp-Source: AGHT+IE/W9/dkxBso0irV5VrVX3LkNO5o5h+kLfYM+38G90SJ9h02blz/dj31DJFXSXcVMXms6NQew==
X-Received: by 2002:a05:6512:45c:b0:51c:2c7e:ac92 with SMTP id y28-20020a056512045c00b0051c2c7eac92mr11527071lfk.23.1714480887229;
        Tue, 30 Apr 2024 05:41:27 -0700 (PDT)
Received: from [192.168.69.100] (mab78-h01-176-184-55-179.dsl.sta.abo.bbox.fr. [176.184.55.179])
        by smtp.gmail.com with ESMTPSA id i27-20020a17090639db00b00a58eab2bf0fsm3928326eje.179.2024.04.30.05.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 05:41:26 -0700 (PDT)
Message-ID: <c5248d22-672d-4acc-9b12-86815d6e22dc@linaro.org>
Date: Tue, 30 Apr 2024 14:41:22 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/16] module: make module_memory_{alloc,free} more
 self-contained
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
References: <20240429121620.1186447-1-rppt@kernel.org>
 <20240429121620.1186447-6-rppt@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240429121620.1186447-6-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/4/24 14:16, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Move the logic related to the memory allocation and freeing into
> module_memory_alloc() and module_memory_free().
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>   kernel/module/main.c | 64 +++++++++++++++++++++++++++-----------------
>   1 file changed, 39 insertions(+), 25 deletions(-)

Nice code simplification.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

