Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AEB3D68
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 23:08:13 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-563f752774fso865715a12.1
        for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 16:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690499293; x=1691104093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBYOBoJLYiNWyPBZ8JtjEPNaBvs8n9DfL50KMt5h7Ws=;
        b=TW0iL3mrIm54XwfUz+EJV2cICCYRH49ccpHRmXzGvXT4A7hJr3UV/RBMkrqZcYwAAw
         L4QNlaxXI0LdVwgwPzdiy4fc1QKhj4jHTt0VSmNVaNtRxJs0GFzkZDKX6DMg3PXmaG7M
         LJCOBpMV4ZHWjJlDwS1foSSce//SXGygdQL1vwfb0hsV/DBuGenykX7CIrcNf3Mex0eA
         hkJWWhxEJfV3mMhC+R/ihdzEh4DlYW6jf/+hBUZO7yRv+aVIwrkNTZlbAU+c/djQAn5g
         4SRXzmWdOX0yJPWkUwWR2WK/ET0ZuBLTFbncC0TeoxVE5ozISmfrb4V9YFtc+I6jNcNf
         HKJQ==
X-Gm-Message-State: ABy/qLbheGwpcM2G04kk1iz17BnYups6PiXFlsh0EeZXvNE3bcb+/L96
	LMRTf+l0Jx26UhQBbr53x0k=
X-Google-Smtp-Source: APBJJlGz/uqkDGdyOYbooK4qi3urMgjXZdj674zcDvx65lAKgWJKRtnlfPgUlQsBJq29niDw8iMIwQ==
X-Received: by 2002:a17:90a:bb12:b0:267:faba:705 with SMTP id u18-20020a17090abb1200b00267faba0705mr8961pjr.10.1690499292643;
        Thu, 27 Jul 2023 16:08:12 -0700 (PDT)
Received: from snowbird ([199.73.127.3])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a4d8800b0026822cb85casm1631801pjh.18.2023.07.27.16.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 16:08:12 -0700 (PDT)
Date: Thu, 27 Jul 2023 16:08:07 -0700
From: Dennis Zhou <dennis@kernel.org>
To: Bibo Mao <maobibo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH 1/3] mm/percpu: Remove some local variables in
 pcpu_populate_pte
Message-ID: <ZML414eLkT78bO5G@snowbird>
References: <20230712031622.1888321-1-maobibo@loongson.cn>
 <20230712031622.1888321-2-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712031622.1888321-2-maobibo@loongson.cn>

Hello,

On Wed, Jul 12, 2023 at 11:16:20AM +0800, Bibo Mao wrote:
> In function pcpu_populate_pte there are already variable defined,
> it can be reused for later use, here remove duplicated local
> variables.
> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  mm/percpu.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/mm/percpu.c b/mm/percpu.c
> index 28e07ede46f6..85e3f9b2a61f 100644
> --- a/mm/percpu.c
> +++ b/mm/percpu.c
> @@ -3189,32 +3189,26 @@ void __init __weak pcpu_populate_pte(unsigned long addr)
>  	pmd_t *pmd;
>  
>  	if (pgd_none(*pgd)) {
> -		p4d_t *new;
> -
> -		new = memblock_alloc(P4D_TABLE_SIZE, P4D_TABLE_SIZE);
> -		if (!new)
> +		p4d = memblock_alloc(P4D_TABLE_SIZE, P4D_TABLE_SIZE);
> +		if (!p4d)
>  			goto err_alloc;
> -		pgd_populate(&init_mm, pgd, new);
> +		pgd_populate(&init_mm, pgd, p4d);
>  	}
>  
>  	p4d = p4d_offset(pgd, addr);
>  	if (p4d_none(*p4d)) {
> -		pud_t *new;
> -
> -		new = memblock_alloc(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
> -		if (!new)
> +		pud = memblock_alloc(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
> +		if (!pud)
>  			goto err_alloc;
> -		p4d_populate(&init_mm, p4d, new);
> +		p4d_populate(&init_mm, p4d, pud);
>  	}
>  
>  	pud = pud_offset(p4d, addr);
>  	if (pud_none(*pud)) {
> -		pmd_t *new;
> -
> -		new = memblock_alloc(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
> -		if (!new)
> +		pmd = memblock_alloc(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
> +		if (!pmd)
>  			goto err_alloc;
> -		pud_populate(&init_mm, pud, new);
> +		pud_populate(&init_mm, pud, pmd);
>  	}
>  
>  	pmd = pmd_offset(pud, addr);
> -- 
> 2.27.0
> 

I've pulled this, but the other 2 are part of loongarch and should be
reviewed and pulled by those maintainers.

Thanks,
Dennis
