Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAED83C2782
	for <loongarch@lists.linux.dev>; Sat, 11 Jul 2026 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772967; cv=pass; b=X2a+zDpyGfku/nreo2x7Bh/yzPOMgM350wICRiQGI4/5bLo4FbO+qO4Dl18y+0LlXAXNgRx7cjEYFjQguD9xW7WHBJEyXexVoMIOd95uCWu+2WpoS3Joyel04+nkbDtiLMx4H9suQ7uxy3DVIh00VC7rcUs9/b/JuXpuZapG7FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772967; c=relaxed/simple;
	bh=lgplXt8OmmYK0O5s0vGlPCfavq5E5GB8C7ljQ3QichI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n51OnNR2EJHP6s4FDY8ikpgPAfV7O7yhLpcGNGV5g4QsQyZegb/jJS34phenhluhgkKbDSxBbeVrqJ2i3Qice+kZCgzeszscz9cad28kh/Qqq8/1EgLfKWozEDx5ovyoO8NdKCvifA+7RR5WFkMD0OT5PxOs9yl9qZYpU2G3wu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skPu+chJ; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skPu+chJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so2734954a12.2
        for <loongarch@lists.linux.dev>; Sat, 11 Jul 2026 05:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783772964; cv=none;
        d=google.com; s=arc-20260327;
        b=YIwW4G7k4E6DtD9A0r6ONuivqfqdSPJOHcAnUWEP6aVQ0eUeBOilgdz+R5BJMcqO+3
         OgMy/qXjT6bSKI6hJyARctLoSXtKcevrJ9q44f/0NpEVLeTvw3urTD1AgF0AJBpTRj5Q
         F8MTk8L2x2IR/LrtZJnZBVL5v+3RO6kXfrydiXVYJSFB1IWv3ieTh9ifYqR6DIIThIy/
         i+dWIDQM8K/yKJphLM3shk78UgYBFQe5R1W6YhcF6YLpq5vua7DVdzECF0veLM1fFS08
         ctL0Lhc1TiAE3R1Mer7p/39YvwJNrdsoZKLVhKtetA0m0wFQzfPnA+jGo7d2NkU7O4W7
         ybSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        fh=4NdypxcxBms4VlJ8G+UoO+rTJ1lvvKKXfyPvncXPVRw=;
        b=qdyL5lhhoDvXGYB41FdPaSEc38yxK6q7U6JtrVSeSeQF3tS+hYE2vuvfR0txsKxRFx
         lYNaGKlJ5lcpM7mXcw2f40PyVPTBOP//bLtXLXihDCoywEQyxCAy7tFYrczj2RO/aGan
         cxY2OYsDjsCZ4PrDN9A7mB7NRVf3ZUV7wGrv0jw9hOy34QWr2u9IjWPrQ0qMeDZeWLDM
         UDpxWSXFDBiyECp8dWpuchkiMajELXJp80g6yBYdF5dTafyCwc7yJ/HH/Od9OWlPLHnH
         Z04x2j3ETLr3zaQD9+5hn316bfxKKg74F0AzyRFTlLMvqG1TNvksMarKvNDfrCqDNqfF
         B6Ww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772964; x=1784377764; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        b=skPu+chJeC1nztiUxNpYd/qJ9ByGHOhuMaxCMXXYmaUVmOfuZG6bs8tBaV3pmEHKM4
         sbzSCVAqEj91BR5eeT2JxzCHprJPxsuZsgMVZ5sEVzDKw0V6flRRDR4sGFlA3iuOUgs1
         YR6vJqghS06AzJTqbG2i2JhTGZ960qav7Br4VE2ld4f8Z8N4tObbbPlFFVbn0rS/ZJ6Y
         gHLaPKA0qbTQgOmlQk1tWudRX4WoRAs+0NKLrszRqQUzH5WAJs43+xiTxct3N+yISk9E
         qHrsMpz5tOSLcwAqG66Gq+lQ9AqqJPADmbJLNBHIUUpOqwvDtF8HdaFdMz1qPv01HghK
         FZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772964; x=1784377764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        b=eBsH7us+bVHWbLqMfMSiBLssjOwQ87obxB4WT3JXLHzmBtUHfTrVesSK+Ya9bY9qX0
         8zNKRksjGQ1kFIZB/3gtlzZhqdeZoT2D5W81ZeruOTcYXGXOpXjdFndL5mTQh2+CQUXK
         src6kaJhlDgUhTs+Ft6yb7K4hK+DIOXqmAStDeqD5esm8zi0m+SD26Frttalm8X6qDnp
         zJhJu+b8XZu2HDd5f2b8ZIqyb/YuGwMbzYMMTHhfRonMkPJaTXk/cuwcUAP7PjFCM02L
         KOSa4VfEbkAbGjvunlLggorlQ+MOzpeZiDEUq7eEedtNgXgdBX+KZwF/YSV3ShdrlcpK
         RdcQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVa0WFc1XnB/R3ZnqipaxmCP5Y8dIunmWc9PHMi5DQ0u1BaGkI5jBOScqLTkFejhflGEse7HNnxQk=@lists.linux.dev
X-Gm-Message-State: AOJu0YztA/0usM7wcEqtaHzhzJu6O+tS7gQaX4xdgSLThnEkjBJtUlFg
	SLv76r5nwrOfTbV4rqmCrM/beSAoqaGimg8Ml0otdStxkfqHmvEtdWtPwf072mPMzR1CV/alzig
	Aj5azSHdKIaJ6XuDtXyujV2NulTQGeIA=
X-Gm-Gg: AfdE7clyQ9pr/ACBBt98AW+GdOvbXVI5fDG/goPp3OhG0XPObawSyWimFNyGm22iUBG
	UvO81KHtwUlKXtxXbh96PnKXfRGnUp1oWM1ASZ0PPIvhluYCKirnz7Gyr2GgTE3b9eqU3Qi72AD
	3Rk1GOS/PLJd93GVg/OanhJHWSHqIb1qoasz4T5BvmvxZuyJPp3jadGk+EW03VXRpx4tN2HuwTg
	bWR6U+jySptFv/ruR4Fj+HL9IfcdHvOtMgXL2PbjwFbDAwHkfqOV4RxaMXOn46GP6mPy6Wi8urt
	KlYdFwcaGmqvK1Zf1wxMU+0PS/liqIp02avw8EVXJOl3mfsEaqRkTD+j7eq7bdc=
X-Received: by 2002:a05:6402:3512:b0:699:728e:48b9 with SMTP id
 4fb4d7f45d1cf-69c5edb9cb3mr1210325a12.0.1783772963919; Sat, 11 Jul 2026
 05:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org>
In-Reply-To: <20260707181957.433213175@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 11 Jul 2026 14:29:12 +0200
X-Gm-Features: AUfX_mzOlRB8ana7x7qPQc4frMU9J060tNH0Z2GPCNvL1LYqDKQBjM-XzHbrvno
Message-ID: <CA+=Fv5RpgQ-UeGAT+VcLufte2gAp0H=J5GqZEFR_SuQsmnzy=A@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> With that all architectures using the generic syscall entry code follow the
> same scheme, apply stack randomization at the correct and earliest possible
> place and skip syscall processing depending on the boolean return value of
> syscall_enter_from_user_mode[_work]().
>
> There should be no functional changes, at least there are none intended.
>
> The resulting text size for the syscall entry code on x8664 is slightly
> smaller than before these changes.
>
> Testing syscall heavy workloads and micro benchmarks shows a small
> performance gain for the general rework, but the last patch, which changes
> the logic to be more understandable has no measurable impact in either
> direction.
>
> The series applies on Linus tree and is also available from git:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry-rework-v1
>


Hi Thomas,

Thanks for the series.

I have an Alpha GENERIC_ENTRY series posted and planned for the next
merge window:

https://lore.kernel.org/linux-alpha/20260706170019.2941459-1-linmag7@gmail.com/T/#t

Only its final patch intersects with this work.

That patch removes Alpha's architecture-specific syscall_trace_enter()
and syscall_trace_leave() implementations, so the Alpha changes in
patches 11 and 12 will disappear once the GENERIC_ENTRY conversion is
applied.

It also currently uses syscall_enter_from_user_mode(), so I will need to
rebase it onto the new entry interface introduced by this series. I
expect the integration to be confined to the final GENERIC_ENTRY patch.

The Alpha-specific changes in patches 11 and 12 look correct to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
