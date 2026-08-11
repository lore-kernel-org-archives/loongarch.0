Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8BA35677C
	for <loongarch@lists.linux.dev>; Tue, 11 Aug 2026 06:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786431358; cv=none; b=jlVMon7cYs/uuClEjT6LdZ9G8nGzg3Yka1mJOjLM5YsLuYQueGeDIXvIQQgX0xoUbGVR+ibdsRod+d7tPDirbBp6gf4oOR1pcl6p13wc8u1DM3hWaXtRtQ9gacI02/w6bPvfFncq+YMQx06zCNnzFYTWsKhIiPy6F9OfzrDgYrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786431358; c=relaxed/simple;
	bh=tZZLV6eyiwcGv5N3oyI6rD0AMUqGK1dWtQ5SUdhqr2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SyMp64CsEPC+e9L3CwV7qQnnJUMTRKmdxKopQ/aC3JRXxgvVnEpmanVlClqaFbdHqYMce3j6SZDIlf7TNBr75B6EY1/VH9/V3/GloAjU5kH/ORztWKndd5dE4orCuQdREb5JaWFQL7mpY97SZRcjHNF1Ti6c/kyOFnh2UVqFCSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84a2dcede83so3555178b3a.3
        for <loongarch@lists.linux.dev>; Mon, 10 Aug 2026 23:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786431356; x=1787036156;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0iZRfAdzYvTsaTTh/J3ab87cNtJMKi7JiQC3Jqumorg=;
        b=lwv1/PWVjcNnQ7L4I+3g/rHLBDCWYxV5vUop9+px3drpQeBPJxL+wYmL6f6HVd8FjH
         HXHWHI00pcmGe0riaL7a0zCH+ASp9mf4v7Cg4RGW8XG9N9uwCBa4KxbStudl3AH9psez
         m0irL+taxyo/6lEw6w3eSRHp7w7gaL+DVSb9EA3+6iyNkGREEvYWiJZvATHdqC+izoah
         mev7Prs7iXN+f4y3VfmCRq4ddXSgswwy6WqOeLPHM6ysoqNXToxd4ATsRGWLmZAhbg6v
         tZDfcNxu86Ar4aGWWB3HYmnn73dK+FMX4fbYvMjZYT9qYvd/5uY8ajkd8fpdDW/lj8ZF
         SmHg==
X-Forwarded-Encrypted: i=1; AHgh+RrQRnwmN3K/1n0aN/ZUEQ4EduF5eRUbz88rNaXdWLsskt4i/nQkGhJnRT+wW2z8o+I5k9VlJn6twnk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTHSKYdS2FU9GsGM/VoBj+aH4yoflbh5Jt274vL07/qwDAKRry
	VEQQwceLJvJyO76di7qz2FMM4KylvWurLOXFaIE0m9WoahF9he/4a24w9qSSxUEi
X-Gm-Gg: AR+sD13uR+TUOeXzj6gaaSBvrQ3ziHFpKmXidHfDMDxb7itxc88m/Ff0tzHBLyceYVs
	9YbJ/LaT6lZzYf2dmVdcdBRwPgyqiormnNonmPOsgULpuupt04hOPaqpvOZK0/JYlNFV2uYjJIR
	gspJ+XLBjwHWh3jzH2xSR5YzJ1ZyoS978LAjhCEnEBbO00m9zlVImNXbWBUmgHYGwo7QhsmjwBo
	zsI/K7VZ9EzWp/wcqs/VGR9x1fgQ1n68nLZ/d57lj+Hqb+alDL+7EpBng0JGh9JjAUhtpxwbquV
	oz8UXc4EDDjLQ0XXps/S0jjfwkcjhh4mW+ZMSRONFDBhLcZho7xSDl6vzkFo1M7tMmvqbvZrL7n
	wrqDHhwy6TmVpm1VvUu3pkadrL4FCoJI+3oF6X3jkro8QM2Pvu0B3aO2B5UZozwvOp6P04PfCBO
	pGWlj7kPyykmtWnZSO/FuxKMRvtqMBAP/QfZgPUIcYC09tPH4G1EHPg3ICby0B5p9ZlogeOGsxg
	ZhgJo95yQaTfyRD24SbfkGNGsuXIw==
X-Received: by 2002:a05:6a00:2d2a:b0:848:467d:293b with SMTP id d2e1a72fcca58-84fa8690b98mr1070109b3a.11.1786431355700;
        Mon, 10 Aug 2026 23:55:55 -0700 (PDT)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa954db66sm185811b3a.48.2026.08.10.23.55.55
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 23:55:55 -0700 (PDT)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84e04df8c46so2624932b3a.2
        for <loongarch@lists.linux.dev>; Mon, 10 Aug 2026 23:55:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqp5gLY5i4etfegxKQD0uXwhLxXuy8tyDDXkLX4YLjUdJZoCuIETFRoQpT6fa+JpDUSJHWMprd2V74=@lists.linux.dev
X-Received: by 2002:a05:6102:c4a:b0:738:ecd7:1984 with SMTP id
 ada2fe7eead31-76b54a7a17fmr283026137.3.1786430995503; Mon, 10 Aug 2026
 23:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811042119.3652929-1-anshuman.khandual@arm.com> <20260811042119.3652929-7-anshuman.khandual@arm.com>
In-Reply-To: <20260811042119.3652929-7-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 08:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
X-Gm-Features: AUfX_mwgji-OqM2d70As4nCfmG84npBMa5IuhuEcV5XEKzcXYS3fe_Pqx16lD20
Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
Subject: Re: [RFC V2 6/6] mm: Drop pxd_ERROR()
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Anshuman,

Thanks for your patch!

On Tue, 11 Aug 2026 at 06:22, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> pxd_ERROR() has been used in generic mm just to print the page table entry
> in pxd_clear_bad() before clearing those out with pxd_clear() later. These
> pxd_ERROR() macros have been provided by all platforms which basically did
> the same thing.
>
> Make pxd_clear_bad() use recently added ptval_to_str() instead for printing
> page table entries thus completely dropping dependency on platform provided
> pxd_ERROR() macros which can then be dropped off. First move all required
> helpers in core MM into a header file which could then be used else where.

Oh, the "x" in "pxd" is a wildcard?
Except that is not, as it does not match "pte" ;-)

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/include/asm/mcf_pgtable.h           |  6 ---
>  arch/m68k/include/asm/motorola_pgtable.h      |  8 ----
>  arch/m68k/include/asm/sun3_pgtable.h          |  7 ----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
