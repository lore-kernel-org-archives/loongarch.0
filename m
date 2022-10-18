Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4149F4C64
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 13:29:04 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id bk15so23415920wrb.13
        for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 06:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcJzlEsI0Q0Zkw3UiSk1AeQ+ZeMU0Uy0FowbXkpqvqY=;
        b=eEqeweMgoAha2gA3agmhPrwheBhBw4LuItboa3KIkd3futKzMLro4OSFn/+GsHoO2q
         1g0UsVLbq6G7LYgkvrjjF0/aK9i1HtM2ftwQjwVtT+HxYmYOQu0iXWkYvn5R2pCAGqs4
         s9cqF+SV17FECoYNEG3BbIsBfCDRYocVPcCDrmyfVwRyAV9hx0spYE9DLW1VgzgBS4tr
         UbQ3nKR9UHhV4a0DtNBqTW1c7Zei2Dx2gjoyD+xI5pcx7YWlyHGRsdGlvYb4iC3lrx8I
         5fNhFiugt5kE/2K8pSWMOmRr7GxD0aGVofbLzCMH3mgH/+99nu8B3Ir/+6nZinH/MMQ3
         hyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcJzlEsI0Q0Zkw3UiSk1AeQ+ZeMU0Uy0FowbXkpqvqY=;
        b=dnOIAWxDlmsHhyeAs8ZHlB/AF2RSKvY3q0tfP6AiVOB4sveCknLcWNYvDFUCu/PGJi
         i+fTIrd0ONRYKf9vrJzs3beEphDMJUlhiHN38RF2Y/3nnVPsfn6QBdMbOlCby7IpidEc
         UoFF2xvslqzMxogaG4aSavPqgHPqXKzieqv/lM8+D6Zet/XCLa7YnICM6G2LGKBO22SM
         93hsZXeKlh06gvLwL3XjKMR3OHPMSBiWKhYv0d/yjO6QO3AS3UXXSTzji/qP5zso3ufj
         fSVF7fimyJd7WNfDyMelKr97qPtlZxVKfQuq5KDEQLXO3h6WHxnl5UQtEB35TEQSAR3s
         6C7g==
X-Gm-Message-State: ACrzQf1ISvXgWyabpf5Xc1pat0EYu7B4qaWxebAX1cqssxXsarYeT1aR
	im7U0LRHVJ1z+scq92CylQUWiw==
X-Google-Smtp-Source: AMsMyM51yRiBRyVMbbU7I9haBznkPLb7xvkfhQYeXVron/xlOZ8CJeyh1CIWGi75RgG0LYv0FAdxow==
X-Received: by 2002:a05:6000:1190:b0:232:c73d:7524 with SMTP id g16-20020a056000119000b00232c73d7524mr1991986wrx.371.1666099742541;
        Tue, 18 Oct 2022 06:29:02 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c089300b003c409244bb0sm12880231wmp.6.2022.10.18.06.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 06:29:01 -0700 (PDT)
Message-ID: <95a0537f-27b2-adc9-d44e-527281326b0d@linaro.org>
Date: Tue, 18 Oct 2022 15:28:58 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH V11 1/4] MIPS&LoongArch&NIOS2: Adjust prototypes of
 p?d_init()
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>
References: <20221017024027.2389370-1-chenhuacai@loongson.cn>
 <20221017024027.2389370-2-chenhuacai@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221017024027.2389370-2-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/10/22 04:40, Huacai Chen wrote:
> From: Feiyang Chen <chenfeiyang@loongson.cn>
> 
> We are preparing to add sparse vmemmap support to LoongArch. MIPS and
> LoongArch need to call pgd_init()/pud_init()/pmd_init() when populating
> page tables, so adjust their prototypes to make generic helpers can call
> them.
> 
> NIOS2 declares pmd_init() but doesn't use, just remove it to avoid build
> errors.
> 
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/include/asm/pgalloc.h | 13 ++-----------
>   arch/loongarch/include/asm/pgtable.h |  8 ++++----
>   arch/loongarch/kernel/numa.c         |  4 ++--
>   arch/loongarch/mm/pgtable.c          | 23 +++++++++++++----------
>   arch/mips/include/asm/pgalloc.h      | 10 +++++-----
>   arch/mips/include/asm/pgtable-64.h   |  8 ++++----
>   arch/mips/kvm/mmu.c                  |  3 +--
>   arch/mips/mm/pgtable-32.c            | 10 +++++-----
>   arch/mips/mm/pgtable-64.c            | 18 ++++++++++--------
>   arch/mips/mm/pgtable.c               |  2 +-
>   arch/nios2/include/asm/pgalloc.h     |  5 -----
>   11 files changed, 47 insertions(+), 57 deletions(-)

> diff --git a/arch/mips/mm/pgtable-32.c b/arch/mips/mm/pgtable-32.c
> index 61891af25019..88819a21d97e 100644
> --- a/arch/mips/mm/pgtable-32.c
> +++ b/arch/mips/mm/pgtable-32.c
> @@ -13,9 +13,9 @@
>   #include <asm/pgalloc.h>
>   #include <asm/tlbflush.h>
>   
> -void pgd_init(unsigned long page)
> +void pgd_init(void *addr)
>   {
> -	unsigned long *p = (unsigned long *) page;
> +	unsigned long *p = (unsigned long *)addr;
>   	int i;
>   
>   	for (i = 0; i < USER_PTRS_PER_PGD; i+=8) {
> @@ -61,9 +61,9 @@ void __init pagetable_init(void)
>   #endif
>   
>   	/* Initialize the entire pgd.  */
> -	pgd_init((unsigned long)swapper_pg_dir);
> -	pgd_init((unsigned long)swapper_pg_dir
> -		 + sizeof(pgd_t) * USER_PTRS_PER_PGD);
> +	pgd_init(swapper_pg_dir);
> +	pgd_init((void *)((unsigned long)swapper_pg_dir
> +		 + sizeof(pgd_t) * USER_PTRS_PER_PGD));

Pre-existing, but why not use:

         pgd_init(&swapper_pg_dir[USER_PTRS_PER_PGD]);

?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
