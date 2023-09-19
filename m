Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DEA347B2
	for <loongarch@lists.linux.dev>; Tue, 19 Sep 2023 17:23:51 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59bebd5bdadso61362587b3.0
        for <loongarch@lists.linux.dev>; Tue, 19 Sep 2023 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695144230; x=1695749030; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ke+rhIpc8Yj4RHSOIcCUf04IBals1/6zBz6t3mWbRfs=;
        b=lBRGU2QEhLroC6JQQkt9+6c1J5cY2a1zCTLiRnqEwMQganUgd61GYEDtAIzUiqV1nz
         5ZTMc0+UlKilUzX78L9gCcF7HDyiMSUeFQtVgiJhjHeyzhm/mz/FMJiHsl535QQ++8Lv
         wEFglUcV6A0svIGdpPPULIB02w0QRI7mQXM38K6tgbJ+2d0MLoQ0X+AHg8v83y5/tK+B
         dWp3lLg/+fpLQNct5PU68GaPlSfcz6UPAp23XpqQbIDJQhGnri7VXkouSZD+y6uTRCqb
         SduU7ihEV+XinZfUToZYzzJDRI9UblKJecOiVRJoaR/lmNsxbjVQ7BPXiaim5hL1sF86
         N14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695144230; x=1695749030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ke+rhIpc8Yj4RHSOIcCUf04IBals1/6zBz6t3mWbRfs=;
        b=dawI0olcFHy2U5nJ+XH7eGVynluxHI8lRIRy8mVE4MDgEmOUjzSrogfBGyaRn5UY8l
         1lzGWYPsOSagVbpuhIK83/wP4OLBoK2iDY49Cv/YDkN9c0yx0y5sVqNvJ9gj6310oEWu
         QnMIoOdHf3+/RQ7cygugNApCBfvu4b8WvJgAJOv1LRRgQFxjLU5j0Ao8Pz+ni967H5yq
         krBJ7m0ymUWPw1PEuvt8FGsMwVHG9AOTBga+24UBgoEVX/kUZJPYxgtqf7vmdiQ+2XaM
         0zTJVTscKtXlpSol6hE8hHa5aeSy+TZzK00vda0bC2KK8RNLybQdcj07E6RK28HR82y5
         +DUw==
X-Gm-Message-State: AOJu0Yw0pcrv3VoYiFSkmyvAnJ0PU7gO572AkU+UblroVs7TzYK2SJwC
	X9MfDZ9VynTglF7vONc+6CU=
X-Google-Smtp-Source: AGHT+IFYba94/tWKEV5d0wk1Ylg0gSJJMGYXAHDrHy5oPNZruwSqpKZ/9cU/3wLGaHbcTR7JOuKvlQ==
X-Received: by 2002:a81:4810:0:b0:586:9c4e:a9a4 with SMTP id v16-20020a814810000000b005869c4ea9a4mr145786ywa.5.1695144230386;
        Tue, 19 Sep 2023 10:23:50 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.gmail.com with ESMTPSA id u127-20020a0dd285000000b0059bce30a498sm3316842ywd.139.2023.09.19.10.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 10:23:49 -0700 (PDT)
Date: Tue, 19 Sep 2023 10:23:46 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, will@kernel.org, aneesh.kumar@linux.ibm.com,
	npiggin@gmail.com, peterz@infradead.org, catalin.marinas@arm.com,
	chenhuacai@kernel.org, tsbogend@alpha.franken.de,
	dave.hansen@linux.intel.com, luto@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, arnd@arndb.de, willy@infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org
Subject: Re: [PATCH] mm: add statistics for PUD level pagetable
Message-ID: <ZQnZIkOfY0btsd8A@unknowna0e70b2ca394.attlocal.net>
References: <876c71c03a7e69c17722a690e3225a4f7b172fb2.1695017383.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <876c71c03a7e69c17722a690e3225a4f7b172fb2.1695017383.git.baolin.wang@linux.alibaba.com>

On Mon, Sep 18, 2023 at 02:31:42PM +0800, Baolin Wang wrote:
> Recently, we found that cross-die access to pagetable pages on ARM64
> machines can cause performance fluctuations in our business. Currently,
> there are no PMU events available to track this situation on our ARM64
> machines, so an accurate pagetable accounting can help to analyze this
> issue, but now the PUD level pagetable accounting is missed.
> 
> So introducing pagetable_pud_ctor/dtor() to help to get an accurate
> PUD pagetable accounting, as well as converting the architectures with
> using generic PUD pagatable allocation to add corresponding PUD pagetable
> accounting. Moreover this patch will also mark the PUD level pagetable
> with PG_table flag, which will help to do sanity validation in unpoison_memory().
> 
> On my testing machine, I can see more pagetables statistics after the patch
> with page-types tool:
> 
> Before patch:
>         flags           page-count      MB  symbolic-flags                     long-symbolic-flags
> 0x0000000004000000           27326      106  __________________________g_________________       pgtable
> After patch:
> 0x0000000004000000           27541      107  __________________________g_________________       pgtable
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Acked-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
