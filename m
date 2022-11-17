Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2D4612C
	for <loongarch@lists.linux.dev>; Thu, 17 Nov 2022 15:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668697933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ILTkK5az/hBLXZXqjYOlgnbsmdjpOMEywp6Rj1fgC0=;
	b=UCB3RZjo4OaFHVZluxKb41P1kpWvhwAtbrInBHKzbahjh4oCbemGrYx6n2p/V/iEOyeo51
	YjOINJ3vFXxkFgTMxVkzKPyL/WcTJax8cJzrHMewNDorK/1C7bDIqYKCWXVzKc4vgGMTzV
	YnoPsMi+FD9ymh9bdCw7PqLL3rgw5qc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-D5bKuFo1OoyC-pQxzaQMxQ-1; Thu, 17 Nov 2022 10:12:10 -0500
X-MC-Unique: D5bKuFo1OoyC-pQxzaQMxQ-1
Received: by mail-qv1-f70.google.com with SMTP id nn2-20020a056214358200b004bb7bc3dfdcso1781334qvb.23
        for <loongarch@lists.linux.dev>; Thu, 17 Nov 2022 07:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ILTkK5az/hBLXZXqjYOlgnbsmdjpOMEywp6Rj1fgC0=;
        b=YSOeOskgd96whcTxb7D6yrsoYHnSi0lR3zkR6HtVj+bOt/eGsb7pF8hAaGGaADIFaI
         cgiFL6MQuLOTFHyYCTk6s/8b11Wi7GSP0NYM8vKvgRx1Hu/K+cMDLEt3AqmdlO+A5B81
         06wOScuX5lERLq6/yR7+zR3a75jOxrPb+6nY6fhKVoG8DQMnC7xHePGu0kBpCmFShz0H
         xbGLtgVzPPEIRl9sy/IoOsCfNTxwrzhnYFTCvHyuDqzGeLM9MrRxC1r1ZCYdVJrJgaZ+
         5+YiyHF7G6uf9DOHMHE+ea+mIdLGSjqHPHZCIzpe2YDSxgCPF+R3ssULZIc7RmYt+Jsh
         LNQg==
X-Gm-Message-State: ANoB5pmZ7RYlT/Ena/m/4Z/HX2xyqFeoyuPdPxZAv0bai08t1x95AvdP
	mszcHnS8H1ijMygs7u4vl2I45GLeLt9Ibu93PiQCqBsqFaWSE0wDIB35MQp6mFRtXMIp36uoO7Q
	bEbTACz54hYcBJSEmNaxJ
X-Received: by 2002:ac8:66c5:0:b0:3a5:4666:a952 with SMTP id m5-20020ac866c5000000b003a54666a952mr2537550qtp.128.1668697929702;
        Thu, 17 Nov 2022 07:12:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5iJfLkKyyXtJLO2+rlIy0weO21fWEw8oKXTKubnbM3hXNxgl+B2lA45G59l29t4z2myNygLg==
X-Received: by 2002:ac8:66c5:0:b0:3a5:4666:a952 with SMTP id m5-20020ac866c5000000b003a54666a952mr2537516qtp.128.1668697929400;
        Thu, 17 Nov 2022 07:12:09 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id c8-20020ac853c8000000b003972790deb9sm471564qtq.84.2022.11.17.07.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 07:12:08 -0800 (PST)
Date: Thu, 17 Nov 2022 10:12:07 -0500
From: Peter Xu <peterx@redhat.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"David S . Miller" <davem@davemloft.net>,
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 04/47] LoongArch: Set _PAGE_DIRTY only if _PAGE_WRITE is
 set in {pmd,pte}_mkdirty()
Message-ID: <Y3ZPRx/VUoVvujNa@x1n>
References: <20221117042532.4064448-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20221117042532.4064448-1-chenhuacai@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, Huacai,

On Thu, Nov 17, 2022 at 12:25:32PM +0800, Huacai Chen wrote:
> Now {pmd,pte}_mkdirty() set _PAGE_DIRTY bit unconditionally, this causes
> random segmentation fault after commit 0ccf7f168e17bb7e ("mm/thp: carry
> over dirty bit when thp splits on pmd").
> 
> The reason is: when fork(), parent process use pmd_wrprotect() to clear
> huge page's _PAGE_WRITE and _PAGE_DIRTY (for COW);

Is it safe to drop dirty bit when wr-protect?  It means the mm can reclaim
the page directly assuming the page contains rubbish.

Consider after fork() and memory pressure kicks the kswapd, I don't see
anything stops the kswapd from recycling the pages and lose the data in
both processes.

> then pte_mkdirty() set
> _PAGE_DIRTY as well as _PAGE_MODIFIED while splitting dirty huge pages;
> once _PAGE_DIRTY is set, there will be no tlb modify exception so the COW
> machanism fails; and at last memory corruption occurred between parent
> and child processes.
> 
> So, we should set _PAGE_DIRTY only when _PAGE_WRITE is set in {pmd,pte}_
> mkdirty().
> 
> Cc: stable@vger.kernel.org
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> Note: CC sparc maillist because they have similar issues.

I also had a look on sparc64, it seems to not do the same as loongarch
here (not removing dirty in wr-protect):

static inline pmd_t pmd_wrprotect(pmd_t pmd)
{
	pte_t pte = __pte(pmd_val(pmd));

	pte = pte_wrprotect(pte);

	return __pmd(pte_val(pte));
}

static inline pte_t pte_wrprotect(pte_t pte)
{
	unsigned long val = pte_val(pte), tmp;

	__asm__ __volatile__(
	"\n661:	andn		%0, %3, %0\n"
	"	nop\n"
	"\n662:	nop\n"
	"	nop\n"
	"	.section	.sun4v_2insn_patch, \"ax\"\n"
	"	.word		661b\n"
	"	sethi		%%uhi(%4), %1\n"
	"	sllx		%1, 32, %1\n"
	"	.word		662b\n"
	"	or		%1, %%lo(%4), %1\n"
	"	andn		%0, %1, %0\n"
	"	.previous\n"
	: "=r" (val), "=r" (tmp)
	: "0" (val), "i" (_PAGE_WRITE_4U | _PAGE_W_4U),
	  "i" (_PAGE_WRITE_4V | _PAGE_W_4V));

	return __pte(val);
}

>  
>  arch/loongarch/include/asm/pgtable.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
> index 946704bee599..debbe116f105 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -349,7 +349,9 @@ static inline pte_t pte_mkclean(pte_t pte)
>  
>  static inline pte_t pte_mkdirty(pte_t pte)
>  {
> -	pte_val(pte) |= (_PAGE_DIRTY | _PAGE_MODIFIED);
> +	pte_val(pte) |= _PAGE_MODIFIED;
> +	if (pte_val(pte) & _PAGE_WRITE)
> +		pte_val(pte) |= _PAGE_DIRTY;

I'm not sure whether mm has rule to always set write bit then set dirty
bit, need to be careful here because the outcome may differ when use:

  pte_mkdirty(pte_mkwrite(pte))
  (expected)

VS:

  pte_mkwrite(pte_mkdirty(pte))
  (dirty not set)

I had a feeling I miss some arch-specific details here on why loongarch
needs such implementation, but I can't quickly tell.

Thanks,

>  	return pte;
>  }
>  
> @@ -478,7 +480,9 @@ static inline pmd_t pmd_mkclean(pmd_t pmd)
>  
>  static inline pmd_t pmd_mkdirty(pmd_t pmd)
>  {
> -	pmd_val(pmd) |= (_PAGE_DIRTY | _PAGE_MODIFIED);
> +	pmd_val(pmd) |= _PAGE_MODIFIED;
> +	if (pmd_val(pmd) & _PAGE_WRITE)
> +		pmd_val(pmd) |= _PAGE_DIRTY;
>  	return pmd;
>  }
>  
> -- 
> 2.31.1
> 

-- 
Peter Xu

