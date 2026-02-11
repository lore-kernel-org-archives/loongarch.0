Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4532B357A37
	for <loongarch@lists.linux.dev>; Wed, 11 Feb 2026 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770840874; cv=pass; b=dzpvnux9jBzTKBKkO+mQyrGGn9z/OhB0e+64X62QeMKOEOqPx3iJ/xBh9UlZ9H1v5jsePBd2xNVUL29Ia8IiFKFYFPH5c6wXNyy6LHhVrrTBWGAENMmIrHo1JU7ALXIibzsJLmuSCTg9VfGDMHg959PBCqX5HvkoNM10HPMzGz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770840874; c=relaxed/simple;
	bh=XTU0SZsxOmJ3FoM/DLxyJrm+s5UGvDwm08Uhn3BjVVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJzoftSCTuqK4OcmIZC4C9JYELXlr9nWh9t/Zvb+2eorOK4mCZHdoWWm+I9iy8B1dtBGDRv9HeFN1//9JI+FzLG5NFp2RkKxsX9tvp8CPji2sNqxk+4yS4c7ohoGVrn60IbgBkZjx0fc8bMcHfdNjQgQl9HOTT7M1tI2QwIiK18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiQjiJxx; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiQjiJxx"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b885d8f4092so952148666b.2
        for <loongarch@lists.linux.dev>; Wed, 11 Feb 2026 12:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770840872; cv=none;
        d=google.com; s=arc-20240605;
        b=NiLr1W+rQGWvpB1/i7V/e3sy47sRzNqtVbvQM7BHpmandCApOA7stXUG24jtJynZI4
         LZqDxPl9tyH5jjqN9Vbg63W6XaAnOd6xJOPD4Rz5JBNOZ+oERfvsvlFq/PrHV/RsY/MK
         IvRfSBF6y2WTsIQhlUi4EDA62RYOkaw6VYjpK0cCUa0/pEn8OsIiKT790UnHZlGU7iSf
         nMk+jtYAw9bSjO8+2KM7/HNiCSP9XxprLb7xBjuW2Bw+CDHD1+e4Mhmu9I57GOBfgbuM
         UrOSX4SzOWFSO/OWw+Ez6nXWOgexbWoeyRwJ4scV9WL7bGxyad4xyhLvRZQdeN7uG6+u
         RzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        fh=1rVK+mEWK88srjqhaUk7UwFAPfUMH0nlevXTR0JjQ+s=;
        b=Yiqen+iznTD/sohSFjkneiFANT5+aeIgw7DSvnCee9R57YIS9S4FhscQPHZsEeK94v
         1DHUhG07urLCtkc4A89h/ExtNDcwVrguuR4SJcr7CaJDYWD51cfkYqEfo2GKs/NFALA9
         MxQIHE8fZBsA7Mdc9FdArjTZbaoWVmRyGJ28Ztfd9SFSnxBstwjRX8r6OnW0+QeJBK5b
         ciw2iXpNtMsop4BYVLMBuiaB7Fnlt5+B2G5Sx2Ionb27iqDaH6PaaKEJhcJRgzpuIxir
         pJdFW/Sbbzxy5BTJ5KSl1G3vJmkxEKg9GKKFsV0GMuYeIufymFpa1qxI5j2gyqM/W+4r
         K5xQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770840872; x=1771445672; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=LiQjiJxxiw8jbEiMD0lQvlvyjQwqIWaXsN0Dl/08CJWe9E4HYXbh9XJ54Je+9VSt5A
         qSaMUr+ZZF9PsWhAHEHdr1+/kH2Oq31+kCoStVmsGjhuTvIeIbQZaRlvAOin4KApSqEu
         vasXDAAX37oGaLnc+qj+JW5TJV0BLfuAcgpKzZK/iwUnUg0lWoi2ZZfskYzLm/yIjF6M
         0ZgHA/8fgT5SLACmMsIOvJ0wBqRWf6KrvpzUzAQbry5WqWemiRBuUVG0HbXYgSE6IL/A
         O9xYa/Tiq4DVxgVyJ3bn3abkUAO3ECpkJQ6knq6hU73x7mYKfaNCpcB1G9fheJAiTytl
         az2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770840872; x=1771445672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=RC9cR6RV3qHLHCOA/4HRolAghSVMsABMPR0YWmaHFD34cS8boWa2SzWgkcKtHOEIwK
         sgTtMDK6qGnAyzZT60Lxnh+YTaqZdMjg2HmTJMc3qGizwo/tCTpF7Z4Y/gryyu9LG5y4
         EIwzR+mYFcWS2z8i44nqLSkRSM7jIP+184VAFxEbFE6QbS8Zr5slAp3DR7RVABKqZyRV
         6EPkzVaUuT3CqNnioFidn0PQwf4V/xZr2iG684cz5hIHrrE5AwFxkRuPL6ouoKLPM1ZU
         IbQYjFe1sne003mZ0ChxTPdYzF2pXiWlFWY3hwITGuiIHVh72MshZ142OaHTr7jNQON9
         br3w==
X-Forwarded-Encrypted: i=1; AJvYcCUmhgP8q8zCfUctXHdB82RFsHgkWsDmDgWCJZz9MsectKueKn9CdkQCPlMYydCZ5CxuyaRDPRmefJc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh6V/CVlsyJpwS0dSZYm2kIriv0PGebBPaNNIriJ+JlOsd+44X
	2/gkja85Il+Q2OWHOMTPUdaVNoTIHfFaDdyuTzBpFBifNQDsvK5ISPeXNBPzrLo2ZT3oWDJ5aKF
	sHxNssiAJnMXZCyd0W8hcQ4dnDBTYlnA=
X-Gm-Gg: AZuq6aKH0oolgEEUkA2Q9MU6beD9boOUmATBQsS/qbymDK6e5sUPlEyftWCJvI6OuBi
	/Q4G5iW0cCeVOXmZUjg18L3gLaDUstaOZfu05RniyZjwOapJGp2BK/LMMiTqvb0XRnnbfDfJfEo
	2YLXesqM0plWtaKODM0ymUeuPwd7vFHKopQD1zEmSxK1GWg6P8U3ZVNB9iVuKfdq97dNvJJAF19
	mn3ySMSt84y82Qi+ra1tqCTbJdemTsUZwQI+O4RrSvNZ2NE+day7FLzq3yHZO1xTqjVRvC1w+dm
	xcJ0amoA0R8S3pcCNININkqEsaem2R7e/S1ZtsfU9g==
X-Received: by 2002:a17:907:a08a:b0:b8e:64e:1ed with SMTP id
 a640c23a62f3a-b8f8f72d91emr17643566b.50.1770840871149; Wed, 11 Feb 2026
 12:14:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260211103141.3215197-1-rppt@kernel.org> <20260211103141.3215197-4-rppt@kernel.org>
In-Reply-To: <20260211103141.3215197-4-rppt@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Feb 2026 21:14:19 +0100
X-Gm-Features: AZwV_QgdPAvH3hw0825YIt93LQPupYFvh_AV-2zMkwGhubC87cSa2iVxpdoZwag
Message-ID: <CA+=Fv5T07oBJweU3tURD4Nuh7VRWovsf0zjHtA1nDAVNmO=D2w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arch, mm: consolidate empty_zero_page
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 11:32=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Reduce 22 declarations of empty_zero_page to 3 and 23 declarations of
> ZERO_PAGE() to 4.
>
> Every architecture defines empty_zero_page that way or another, but for t=
he
> most of them it is always a page aligned page in BSS and most definitions
> of ZERO_PAGE do virt_to_page(empty_zero_page).
>
> Move Linus vetted x86 definition of empty_zero_page and ZERO_PAGE() to th=
e
> core MM and drop these definitions in architectures that do not implement
> colored zero page (MIPS and s390).
>
> ZERO_PAGE() remains a macro because turning it to a wrapper for a static
> inline causes severe pain in header dependencies.
>
> For the most part the change is mechanical, with these being noteworthy:
>
> * alpha: aliased empty_zero_page with ZERO_PGE that was also used for boo=
t
>   parameters. Switching to a generic empty_zero_page removes the aliasing
>   and keeps ZERO_PGE for boot parameters only
> * arm64: uses __pa_symbol() in ZERO_PAGE() so that definition of
>   ZERO_PAGE() is kept intact.
> * m68k/parisc/um: allocated empty_zero_page from memblock,
>   although they do not support zero page coloring and having it in BSS
>   will work fine.
> * sparc64 can have empty_zero_page in BSS rather allocate it, but it
>   can't use virt_to_page() for BSS. Keep it's definition of ZERO_PAGE()
>   but instead of allocating it, make mem_map_zero point to
>   empty_zero_page.
> * sh: used empty_zero_page for boot parameters at the very early boot.
>   Rename the parameters page to boot_params_page and let sh use the gener=
ic
>   empty_zero_page.
> * hexagon: had an amusing comment about empty_zero_page
>
>         /* A handy thing to have if one has the RAM. Declared in head.S *=
/
>
>   that unfortunately had to go :)
>
> Acked-by: Helge Deller <deller@gmx.de>   # parisc
> Tested-by: Helge Deller <deller@gmx.de>  # parisc
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/alpha/include/asm/pgtable.h          |  6 ------

> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 90e7a9539102..12a3c5f8ece8 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -125,12 +125,6 @@ struct vm_area_struct;
>   */
>  #define pgprot_noncached(prot) (prot)
>
> -/*
> - * ZERO_PAGE is a global shared page that is always zero:  used
> - * for zero-mapped memory areas etc..
> - */
> -#define ZERO_PAGE(vaddr)       (virt_to_page(ZERO_PGE))
> -
>  /*
>   * On certain platforms whose physical address space can overlap KSEG,
>   * namely EV6 and above, we must re-twiddle the physaddr to restore the

This looks good from an Alpha perspective

Acked-by: Magnus Lindholm <linmag7@gmail.com>
