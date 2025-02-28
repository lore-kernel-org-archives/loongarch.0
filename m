Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB38148827
	for <loongarch@lists.linux.dev>; Fri, 28 Feb 2025 02:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740710676; cv=none; b=P63dqJwUe311DnkPFF68yKjumPM/1b46O4iivyI8YbgI5Pt/MdLK+DGEvjp3fOq/iv4F4c1X+dlCRFwQt+7ERdoKNiNwVAkWbp81hYux2CD7sHHPP+6rc5KVGdnC74jtZm/NaZDS6mK0TKEaAlIpshU+CxJvUBz12DJdliQllZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740710676; c=relaxed/simple;
	bh=0fz6H8dlUgf8ko9N18YypQHlBg79eNoT5rDDE25IBq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cA0RFFqLSScOWXqYfgvbqXaRFeMaZ9o3kcy5Rh3lBwF2gYLBpXYT6nh/QbSAQBBOQA5mmFyS7fz21DlBDamXgFodKuD76u/B6UOkyboD80DJai6voI/oSrfS6O1rI8dKkN0zO6D8akXhuayKvAbQqCmQzNjmp2WoVAQSp308vME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iBLibaBN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iBLibaBN"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fea795bafeso2248160a91.1
        for <loongarch@lists.linux.dev>; Thu, 27 Feb 2025 18:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740710673; x=1741315473; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrHEppDznEYNt+aFJHMFnsD9ySUlfKEU8kXo3t7+HP0=;
        b=iBLibaBN2Iff76iYVuIu9B2B3BOrLJcjCexhSkKiJNWpyT4oWJ1fjkhlyCi94wMd29
         5rQ0j5Tz9PTF/c+Tg1jgP0APt/X4bbUfil564wOo+Ko17qv1ACEuP3OcDBbg22gZITcX
         ZzvTjfdg6GAevC3grwQhHRJkMdaHBVwha6GSZknx61hV5SLGeOkRjSp4tPNBfh3jgaRS
         O4wsVgydRtTNHA7hY9TdEoqbtpFqydlF803WXlnOlZkq2suNDvFCYES4AoqV3ves2Bc0
         sblGWkbcC8ZRAuAnSWtnL13nbjfoGxN8B28ycBjvLsz8roVQw/YuYeVu/cg9QZZMXnV+
         swmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740710673; x=1741315473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KrHEppDznEYNt+aFJHMFnsD9ySUlfKEU8kXo3t7+HP0=;
        b=u/kBtvhpquKTDRZC1PZs8+MbVzoF4Y4/69teK7gh+4a+XJSom4O/c5zYvIjdIG4wAq
         WYYODYMTg6PhQfWZ9KAAhNanqD6zN1ZRS+LkX1cN7yXNWvHc+tYUNGxC5PMN5FGh9cvC
         Jq8OdInJVIqKojEied+raYRlRvR1MZybE41mbkoPUZViEoifhTR6kBG9vmz3Bt55YRdU
         S99atv1NbShQaR7ly8zwa0HZOjrWNGunYYF0a/hoeWLKvZ7m8SgXIttJI2s7cBrhtF2S
         Uigo8dU9D9j30j09ded1PPqM7NPMRNHByBpZJl3z/ysaWqMH6LOq7Cbu5yv83lh/isls
         YbyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRYiHD20hj6l8/0WJyYqx+J1D345bZvV40G193qycVcN+XNT97my8ucqLxJ05AaV8BwtiQfaKcCGg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIvI8OoME+r2NaXS1UChE1IzC1kD1BYkBOU5YE94tenjffF7ko
	FFGoCvu0EP69WT7VbppD3YrniFIzLy0RfOouGzsfhXuxep2jMN8Us2fuVikv+v1HIfqZdWxgqaQ
	WK68=
X-Gm-Gg: ASbGncu1HZ6QO+rs3Y27BhWiuZ6s3jlNq6pKyc5P5I9exydprbb4N29JxyOsDvJ2eL+
	E+eeHwuxIUQ6mTa0QmUGp0a2Dax0RLNNsqkG0Sb++M78nXxclUkqXCl/R/RCjgV6Gwze1EiqZg/
	isZSLPpVU3g2hxhaZG4F7PbDwxWGP6Htr44koWesh/xnp11eAKXzDUjx8X4iT6IhRgeeIivCEyu
	DvaficJU70Me0mjbeDCXDpWcsiyrCtKN1ZhFOrMPoz+dU0LJKZJwv+JF6DRoKTj3xpLtXSt4krk
	oyS3OtsHbvGZg3orxDe4BlJBdrPk3Avcd4CjIK0n/5RAc7wvJQ==
X-Google-Smtp-Source: AGHT+IF4hsdZRiz/aSbemK655CZrsY9ZUuvu4Xu2ENST8y9hxHTSO7PJo35OmCgDgimYWycuvOakGg==
X-Received: by 2002:a05:6a20:1591:b0:1ee:d19c:45f9 with SMTP id adf61e73a8af0-1f2f3e11f86mr2902815637.19.1740710672736;
        Thu, 27 Feb 2025 18:44:32 -0800 (PST)
Received: from [10.68.122.90] ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe514besm2559832b3a.71.2025.02.27.18.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 18:44:32 -0800 (PST)
Message-ID: <e5f4e310-5bcd-4901-8ec3-757cf55dfa64@bytedance.com>
Date: Fri, 28 Feb 2025 10:44:21 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] mm: pgtable: convert some architectures to use
 tlb_remove_ptdesc()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, akpm@linux-foundation.org, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
 <CAMuHMdU8ttibKCiUPxSNBpJyrtBbrt1CqLa++jq6CpJFbFCwAg@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAMuHMdU8ttibKCiUPxSNBpJyrtBbrt1CqLa++jq6CpJFbFCwAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/27/25 9:21 PM, Geert Uytterhoeven wrote:
> Hi Qi,
> 
> On Tue, 25 Feb 2025 at 04:46, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>> Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
>> nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE,
>> and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
>> tlb_remove_page()). This is the same as the implementation of
>> tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
>> convert these architectures to use tlb_remove_ptdesc().
>>
>> The ultimate goal is to make the architecture only use tlb_remove_ptdesc()
>> or tlb_remove_table() for page table pages.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> Thanks for your patch!
> 
>>   arch/m68k/include/asm/sun3_pgalloc.h | 3 +--
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Thanks for your review.

> 
>> --- a/arch/m68k/include/asm/sun3_pgalloc.h
>> +++ b/arch/m68k/include/asm/sun3_pgalloc.h
>> @@ -19,8 +19,7 @@ extern const char bad_pmd_string[];
>>
>>   #define __pte_free_tlb(tlb, pte, addr)                         \
>>   do {                                                           \
>> -       pagetable_dtor(page_ptdesc(pte));                       \
>> -       tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));        \
>> +       tlb_remove_ptdesc((tlb), page_ptdesc(pte));             \
>>   } while (0)
>>
> 
> With only a single statement remaining, you can remove the do { ... }
> while construct, too.

Ah, right. Will do in the next version.

Thanks!

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

