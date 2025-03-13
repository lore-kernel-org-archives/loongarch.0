Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED28F26138E
	for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741879520; cv=none; b=MyCbjLczOPPYtHb/eyY/iYk5jRD5slPObHIjOWubUTMmgueT0l8xKmuzpIu4ZSWSzToV+w1wj3sqYyHGkOFyxtymDziRxAN8IUBjgL7I4bNQnbk62guWfK8bDENQ2oHXoXwUPNt8ytbVxD4IX69UQjQFp9YlCZ7kbBwyPzaalb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741879520; c=relaxed/simple;
	bh=FrNrmRF03ghmNEwfL8ovFyb6iLc0RrAEOh0F/ghf4Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6Tl7SysYFZ3y0rbtArThXAXefS1kwjol0glBIKHkEV6Cx5ALuWofhAK9ChbAP2Ck3gTq6Lsye0eoHZnyuxAlYSsdwF90jUHcR+57Q41rOyX2b1TdNiBd1eb0khp4amaGCfUzrfhuFFvdRIrwQfnWwC4twQVeY/ykCSzwwAKeIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab771575040so414235966b.1
        for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 08:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879517; x=1742484317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ii1IFZdoC6n5uv3UgvYeObshpXYt3dV3HzZ5zG8DvA=;
        b=Frw+krDJbVSZ85MAE5ylrGGfQKSx4/1MeJrNjO+VfnQNiWyaVQC0nkjrSfdochC4kg
         7FVjngMteZkSF+cDY2N9knHXi2F6ESiug4ov4OsJvvPZEJir4pDIeSYIenHlmL34nhBr
         84gy3jLQDRYGMBUSHb6+Khh1PjsHa2J2+CDk9uEejSVfkZEh27NZQFc7w6uEv4eADkTa
         Q8nWh8tyP4SmbrYVcvF5Mru3HwDWR5DJ2S4t3OBcw/7zoZZGQIVJrvkbjp65hMmTRJo3
         OGjktMiQUzDK3RheJHojW6gMPw49ygX+xgPxc3HgI1Pq/htCKSVHOew2Q/DxS5/H0NOV
         TxEA==
X-Forwarded-Encrypted: i=1; AJvYcCXX+BPiU2kebqUV2xWjfS/m9dURiIy/ZHPM0rGfHdD0iw9ldILTMvIYVypQNxKPOAYV1p4s6PGYVn0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+ou8hubM5EW6z7UmeyIQb6eJ0YLydIWiviLBPxZ0/Gir6MD6I
	ugQtqdKm/fIhFASri4BGTZXUZ5q7ZgJoYtMAwvyeDET5FTX2oRBYls0iOdeIvPI=
X-Gm-Gg: ASbGncuq6zNo0NY/Ur2SXjZ0syfITC+/VTFOcjNXTfgCkQDj9ovd8rBNWp0aMQ9gY6/
	NJTknGxpgAhmvP8iCSmUkdvrBsG4p7xpeDuYZ6wM9jTQkeh97ffjmoZIV0JObzZPIVoGlVB+2Gm
	Y0oKsAf+om8gsOlI1/HyQwaC+DfKBDMfY6tL7pExi31K3B3dObLY9q+4Z5RlbGsUJN/7kUFBwxk
	SfhdLcRJ+Vvv9XZ3IDbABiNA7m3wGfnEYbebo1Dukcg50NtxiEr6Y1n/t/gKLX6EbyggbVuRK6u
	t3W3l2RbqvvV0OTU8976/4mmiTwutMW/azThnfmYdfRPapfs6ZXMQI5uqN16BxmyP7YVoKrR/LR
	R03osfgY=
X-Google-Smtp-Source: AGHT+IE/b4d+eJpM+u9PAEfVZEVgMTau2sJVe1riIJpz8ZxAN15tMvIa6bDpr0Cvq5l1OTs+EiavFQ==
X-Received: by 2002:a17:907:3457:b0:ac0:4364:407e with SMTP id a640c23a62f3a-ac3122a0fa4mr300121366b.4.1741879516664;
        Thu, 13 Mar 2025 08:25:16 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cffdasm91456466b.117.2025.03.13.08.25.16
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 08:25:16 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso3909779a12.1
        for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 08:25:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUrchTReSbzr/baG2nRZ1VK+6gJjzxjC8+6oMir6Kl6vcNWOXCxfD1hsaWxf0gwuu/4xhIcbdEunE=@lists.linux.dev
X-Received: by 2002:a17:907:9626:b0:ac3:d1c:89ce with SMTP id
 a640c23a62f3a-ac312305664mr252326866b.9.1741879178133; Thu, 13 Mar 2025
 08:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250313135003.836600-1-rppt@kernel.org> <20250313135003.836600-14-rppt@kernel.org>
In-Reply-To: <20250313135003.836600-14-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Mar 2025 16:19:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
X-Gm-Features: AQ5f1Jr9qHWq5jtnIT3-BmFGhQQ_nRM0uVNr9PeQK5Y9eEomJSZyndfwbc1wpbs
Message-ID: <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] arch, mm: make releasing of memory to page
 allocator more explicit
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mark Brown <broonie@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Mar 2025 at 14:53, Mike Rapoport <rppt@kernel.org> wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> The point where the memory is released from memblock to the buddy allocator
> is hidden inside arch-specific mem_init()s and the call to
> memblock_free_all() is needlessly duplicated in every artiste cure and
> after introduction of arch_mm_preinit() hook, mem_init() implementation on
> many architecture only contains the call to memblock_free_all().
>
> Pull memblock_free_all() call into mm_core_init() and drop mem_init() on
> relevant architectures to make it more explicit where the free memory is
> released from memblock to the buddy allocator and to reduce code
> duplication in architecture specific code.
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>     # x86
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  arch/m68k/mm/init.c          |  2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
