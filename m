Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E3122F17B
	for <loongarch@lists.linux.dev>; Thu, 27 Feb 2025 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662501; cv=none; b=AOlhQb+d56wAZDls8gCQnvy4/soiSZFwzQptP5o8dNkYW9ZQm7lDDFJYpYpTIgHuK6PH8K45nqbZvw4oq8BOsDSZYHYEbu6u1bqo398RmjzRdA4aqZKQcPxtZVT7AMBlDKGhf2wQ9IBWK0jDrRRlpDFdc7NFN72Iax8otZiyZV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662501; c=relaxed/simple;
	bh=KHJL4aBjL/xfUEQ3dzlxRvMvpwyqdBYuM/AU5jprt9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MePiNkwflNfbl5Da6OfoZsHVIzcCEd9wUa9kjJ8yHrw/P1v5tARRXrdhw6jdVWZYQ/qWFo58Hlw0Pc7Sj5ilEutOV16TJff88VxaMZTLp3MgMhh9AzuBSlz/E1ourpNGWGYU+axrDw8PR9v4QGys5XY4EZZkqc1FrRGuimNjp0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5209dad13b5so310014e0c.2
        for <loongarch@lists.linux.dev>; Thu, 27 Feb 2025 05:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740662497; x=1741267297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZScFKf+GfAOC+cGkef77m9WTcLt48410fHxRRqxMGc=;
        b=AQ6oJvk2KEcJ7rPJf5Db7zZcu2NdxzXxZjySAdqlNj8WDJ3D1UFka900Fgrq9CG9zD
         /e/r0MFK6x9N+dMVtJBs2siiaP5e/jqGcm3bjbKtCM2iKn7g/F4vbMtuDac9OQajlhuy
         C5cgba63R0oul1/YzjKg7/K6FQ5IS25Gfa+SYECTjQlKoj9W/gunCMpSJmW8B0a9nr4G
         +Q97MRaGsx4tXcRfSWvt+kUJblc088HYcXmOq8YW2esOleWi3gth1pcIVpymQydHQGHe
         +jm6FisrSDV7ZfWKN7RvAPE7LzRYSoWuXg5eTVJ4LuADLUvl3vx0bT3XOY71PnVrjPuV
         ZBSw==
X-Forwarded-Encrypted: i=1; AJvYcCVF0qqiVQ8P74r5gPwPe1h273co86r2hHpbzziVmqbdNU/BdYkD8EhRnQys0pa7L/05l9p6GTvUKNY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwN1MQ56ohHbqyC86syzbSDQ8xP4co2gkmE9Q6Hw9IECxDcLTys
	qd8cyNbo40VcnyMwKAZWB9EVZW1YdU9szed3OxKWbZ9zCVLvpXWiOtv9ac0G
X-Gm-Gg: ASbGncsU/F7S1crIeGV/OaMfR9jVbZQV3SGR7slYjrnUZyVZjd+3n2CONJz/UxqGmrC
	ROiBwEsXbHP47wDn83YB5WacH/DTSlIDdgUQF97MioNRrvjW2U6sgusYjzH12D0DsqpDx1tgIek
	8joXPdhxiOV2Ic/CvebdXogttwXkCKSvwJkCYCmWjvdoncaqsl9WRZU4p4Ktpm7tyXZfuF3jyww
	NF9YBtDqdFGNedka4kO/irzA8QhkasKwz8/P02uQevcTP5sxxW3JqWPomEHYmzBgSLgGSNPyW+1
	DEFtiMcMx+kvqgrqSjEZ2+WaGLfIs+EmBHHf+HScUK78tXJYfw/1pfpT01uOukc4Pzbx
X-Google-Smtp-Source: AGHT+IEw8DuZTcOFhWjoFyzRD20ltGOOvO+hjwc6edzf9OQq7n8z6e+4g/MPBPMhT4r8Y7NIzSSCkA==
X-Received: by 2002:a05:6122:f8f:b0:520:6416:56f8 with SMTP id 71dfb90a1353d-5224cbcb8b0mr4117881e0c.3.1740662496934;
        Thu, 27 Feb 2025 05:21:36 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5234bf420desm205647e0c.25.2025.02.27.05.21.35
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 05:21:35 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5209437e773so404179e0c.3
        for <loongarch@lists.linux.dev>; Thu, 27 Feb 2025 05:21:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkZQr8PYaJ2p0LqbyaCC0cITM5n6Z0OTCNi7/AmQEU2gWZIM1grptlfmmLiZDgRqem0O9KpR/8I3E=@lists.linux.dev
X-Received: by 2002:a05:6122:1d53:b0:520:51a4:b81c with SMTP id
 71dfb90a1353d-5224ccbbe10mr3808700e0c.6.1740662495074; Thu, 27 Feb 2025
 05:21:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1740454179.git.zhengqi.arch@bytedance.com> <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
In-Reply-To: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 14:21:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8ttibKCiUPxSNBpJyrtBbrt1CqLa++jq6CpJFbFCwAg@mail.gmail.com>
X-Gm-Features: AQ5f1Jqe6so1GjZXdkUhIIAiYHT08E9WH9vQcbiUEIVlcQBmr8vV6ha0mxzJuRo
Message-ID: <CAMuHMdU8ttibKCiUPxSNBpJyrtBbrt1CqLa++jq6CpJFbFCwAg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com, 
	vishal.moola@gmail.com, david@redhat.com, jannh@google.com, hughd@google.com, 
	willy@infradead.org, yuzhao@google.com, muchun.song@linux.dev, 
	akpm@linux-foundation.org, will@kernel.org, aneesh.kumar@kernel.org, 
	npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com, 
	rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, x86@kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Qi,

On Tue, 25 Feb 2025 at 04:46, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
> nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE,
> and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
> tlb_remove_page()). This is the same as the implementation of
> tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
> convert these architectures to use tlb_remove_ptdesc().
>
> The ultimate goal is to make the architecture only use tlb_remove_ptdesc()
> or tlb_remove_table() for page table pages.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Thanks for your patch!

>  arch/m68k/include/asm/sun3_pgalloc.h | 3 +--

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

> --- a/arch/m68k/include/asm/sun3_pgalloc.h
> +++ b/arch/m68k/include/asm/sun3_pgalloc.h
> @@ -19,8 +19,7 @@ extern const char bad_pmd_string[];
>
>  #define __pte_free_tlb(tlb, pte, addr)                         \
>  do {                                                           \
> -       pagetable_dtor(page_ptdesc(pte));                       \
> -       tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));        \
> +       tlb_remove_ptdesc((tlb), page_ptdesc(pte));             \
>  } while (0)
>

With only a single statement remaining, you can remove the do { ... }
while construct, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
