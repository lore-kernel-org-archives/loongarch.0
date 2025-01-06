Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5350C178362
	for <loongarch@lists.linux.dev>; Mon,  6 Jan 2025 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736152729; cv=none; b=qJ8w7bxBohbAbg9o5ZpNQ345ukbTIp7mlT2GN/otoZFBj1SbwZQcH5qxWsAalQU1saRvfKwyPA8w3ouWJYP2f8pgizueBCxFDMphPuySYMmtIS3zKpJU5n2SXS3P2gBdd7QyhPMzBvmczAvbVy+uf3CR5k+TA69lhA5tbAthpiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736152729; c=relaxed/simple;
	bh=+p2WuEDH6YSUra8No0eTrFef4hHj25RtnE5OhVgbkBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjSniNTb7kQQjtcypDWOgXlyvkCKjCKCPrA3JG1W3zNO9wkfVfNqTXixSUdeAoys0OwtdI077Q/u6rFXEzt3Xwm22y/OmpXdkBafUhaRbVY1nwKRjWzL2kwdVqRpljbfi+avZi1fj4bUN0f6WEtCSXYKo7BMzo58Lhz7df8eFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Zk0Mx30a; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Zk0Mx30a"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-215770613dbso148527685ad.2
        for <loongarch@lists.linux.dev>; Mon, 06 Jan 2025 00:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736152725; x=1736757525; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YiOAOk5kGRx9rmUPaHmWdeff0Y5xhlY6UwwEsQqm8Hw=;
        b=Zk0Mx30aaKtp5Xh4QhyuzYjot5C8GWFHTHwt1ZXDC0zFrsE6DvUpDMXER7VQ12aEmo
         CZUJoGjyI9AtLAaCZkId2h6wQlYk2ey1nUYx0VMDw17Yf3IUZ2vdJlCp2NQVYJMeBGIX
         94lnBiUnGvK+Tle5GI+1ZxBLLGzXiINq0A9qE0uGPgGGbsP258+pRRM06ahkdFGWvawx
         saQAurwRCcbItLVwB2IOCAgh6dIgjcFY4mC2vnbgCvbie9GUg9lcg502IdmEO2jlEFzk
         rXAU6j6ePjkHMjC0mxwmcr24f8XTGBIbOu3gXfDeHTCgb0FZGN9y2Iy+5dUCHwmnqxp2
         CjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736152725; x=1736757525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YiOAOk5kGRx9rmUPaHmWdeff0Y5xhlY6UwwEsQqm8Hw=;
        b=S/5UtD5dYFymze3TWlTQ9tdBWmWY2qfBHYlOgUWcyd0ZBumQ8dg41vmWJMLAbtSgtg
         C5k33UgvHg0tyoPst4SukzT/ucMnxSS16yMD9wgl4BGO6JHRcMNqmDZ3aCxgjL7HC4yE
         m0d+GtVBCJnWB07ytaFENU/mH69lwFzi6QAcjihmw0bWkWqM54+bc4qv5KukrKxbthZt
         lJzPMHUiuy8rI9gHNTyLvVmTsLsPVLX5KSOwoVnwdG1TNZ6VzbXIz2du/AVHkxZxR9Jj
         rg7qHJyGaXKZK32FLaIz7t3l9nmonljjZsRyO9VM5YFGFFTpL+3G/sDcfE9QleqxAXwh
         s4uw==
X-Forwarded-Encrypted: i=1; AJvYcCU48LTJO4Fc51da7qm0fhcGFrwR04uFtuCO1+FLMlvOusVuAAJaoOJ4MUcfWLqwXbxAZm46dIV0Ttc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3GL+xaOVfa9j95rXDhdwZ0/kRGFpmF+XA2XDDxIsG55aqToJL
	R4hXccbJxxj9rgjNxJRFKq5SmtN8yZISM3Lxpwr769pHpYa0n4CAn9/44Awz+84=
X-Gm-Gg: ASbGncsP6G5oVqprvppmCArttDJv7soNNfHhlJ/FNs+Za9djnGK4WMJSYlU81vw5Gu9
	GVyZFxOQ3SuDWC/o+8ynMM5N2UBMNPUYQFyfls729OXtamNvMDLp8s+Pktziz9/tab4afESLnl9
	bqXTnajK/UcwfrpPDRdlAkWB0erNzqJB9xHGyiYUITxKNjVfPGxR+c0Ans9J3nUSgc/gd7nZ+0N
	QYObynrRDwvXFC8DqHVYAANTe1eCDGGQKqtxY60/FesQ9cTfOm566T/YRqDnmynuEv4AsmkEVsS
	9XQjJA==
X-Google-Smtp-Source: AGHT+IGUVd4iqCCZ9lciazZSWpc6AL/Za8b2BM7ngUBHt9ys8AcRhMXZRUNC6JrwIwMnpr/5pGC4Lg==
X-Received: by 2002:a17:903:234c:b0:215:5a53:edee with SMTP id d9443c01a7336-219e6e85b25mr837178605ad.9.1736152725600;
        Mon, 06 Jan 2025 00:38:45 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f5087sm282364745ad.202.2025.01.06.00.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 00:38:45 -0800 (PST)
Message-ID: <ae8aa8d7-4121-4939-9890-c54e0aee7896@bytedance.com>
Date: Mon, 6 Jan 2025 16:38:32 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Account page tables at all levels
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
References: <20250103184415.2744423-1-kevin.brodsky@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250103184415.2744423-1-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/4 02:44, Kevin Brodsky wrote:
> v1: https://lore.kernel.org/linux-mm/20241219164425.2277022-1-kevin.brodsky@arm.com/
> 
> This series should be considered in conjunction with Qi's series [1].
> Together, they ensure that page table ctor/dtor are called at all levels
> (PTE to PGD) and all architectures, where page tables are regular pages.
> Besides the improvement in accounting and general cleanup, this also
> create a single place where construction/destruction hooks can be called
> for all page tables, namely the now-generic pagetable_dtor() introduced
> by Qi, and __pagetable_ctor() introduced in this series.
> 
> v2 is essentially v1 rebased on top of mm-unstable, which includes Qi's
> v4 series. A number of patches from v1 were dropped:
> 
> * v1 patch 4 is superseded by patch 6 in Qi's series.
> * v1 patch 5 and 6 moved to Qi's series from v3 onwards.
> * v1 patch 7 is superseded by patch 4 in Qi's series.
> 
> Changes from v1 in the remaining patches:
> 
> * Patch 1 only introduces __pagetable_ctor() as there is now a single
>    generic pagetable_dtor().
> 
> * Patch 3 and 6: in arch/m68k/mm/motorola.c, free_pointer_table() can
>    now unconditionally call pagetable_dtor() since it is the same for all
>    levels.
> 
> * Patch 6 just uses pagetable_dtor() instead of introducing
>    pagetable_pgd_dtor().
> 
> * Added Dave Hansen's Acked-by to all patches.
> 
> - Kevin
> 
> [1] https://lore.kernel.org/linux-mm/cover.1735549103.git.zhengqi.arch@bytedance.com/
> ---
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Will Deacon <will@kernel.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Qi Zheng <zhengqi.arch@bytedance.com>
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-openrisc@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-um@lists.infradead.org
> Cc: loongarch@lists.linux.dev
> Cc: x86@kernel.org
> ---
> Kevin Brodsky (6):
>    mm: Move common part of pagetable_*_ctor to helper
>    parisc: mm: Ensure pagetable_pmd_[cd]tor are called
>    m68k: mm: Add calls to pagetable_pmd_[cd]tor
>    ARM: mm: Rename PGD helpers
>    asm-generic: pgalloc: Provide generic __pgd_{alloc,free}
>    mm: Introduce ctor/dtor at PGD level

For this series:

Acked-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks!

