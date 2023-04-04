Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE42D2F2
	for <loongarch@lists.linux.dev>; Tue,  4 Apr 2023 22:09:30 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso35408664pjb.2
        for <loongarch@lists.linux.dev>; Tue, 04 Apr 2023 15:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680646170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypW3uCkatd85laSwJoEHyhvz6A6Q9ytym+XuTNT93dU=;
        b=JoPIXnG83ROdZ1kq4xk1n+ZIq8MPvMAtV87d4GO9cK1Ht5tNTGA78J92/9fyfQ8qOz
         zOkXvSQyi0fCdcUqwDCF1aySQtYSj47zHGZnMA6yXhwZv9AQyrF4VswADo/gInOgv8cV
         EDAQSv8DIu5lKaQgYKo3yqqGWLmwn21LgwsYD2Hyci1hzAh6UsJvZJCr+689gc8dKlqn
         eS1k5e6m5h04Bp+/UQ/F13SBvUKzlkK5oXRvgxzxk3Kk5KyPaC5gueNPmztxsO+0cjDR
         KyU54efHq5YIukhd5Dzmoy4gKq97Wol87Sn4yfXNtziL0Ij6a9VFiH9OrZ1WyDfc4cc6
         lwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680646170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypW3uCkatd85laSwJoEHyhvz6A6Q9ytym+XuTNT93dU=;
        b=FWR0OlyikoDHompYYNRZfkSYc+RD8sJ0Vkg1YCNlt/xaXwgbDVCcrHJHPgS31MsGU+
         BOHKYQ1bzLB5tOOZfAhYWx2vK5u+S78/kTn41lSPkkdgKDpWn+kI92iEwlaJZCSdgZ6B
         B6s4wv1W7fJvNUTCmQqAJtj3UxlaCKoh+f/p74OT1CaRUHPzIFghfGCqgOjJJ1ygiDUu
         7TsZoPgyWuIH9q9kgEJkA/h94GycnYKirHPtvPqJlUtFWVK8m6GeyZi8IzKeRJMPJaGP
         INcp57nDxQT/TPCS6YZ1UfWCTa7vT9xG21y+pQ7rIpHDBG3qHBF/sTgMaW/CN82PG6Ma
         Yo1w==
X-Gm-Message-State: AAQBX9ei33WexnBv7fk5n1FFZOhBnrJ78YJaqlmv9imPFRs69zi3noVp
	Zg3rg6LoCQAThD8kswfOv2cQ31d1AuIYAq7R2Nk=
X-Google-Smtp-Source: AKy350auMB5aAW5vcPRu5Z3zk0kCG0J70wFTxHDdx38zTGhfy79hnQwCL23EHjo5fAbzVlHyZYpeRiAzV27aaZOYeGI=
X-Received: by 2002:a17:902:8604:b0:1a0:48ff:539c with SMTP id
 f4-20020a170902860400b001a048ff539cmr1636900plo.11.1680646170341; Tue, 04 Apr
 2023 15:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230404084308.813-1-zhangqing@loongson.cn> <20230404084308.813-2-zhangqing@loongson.cn>
In-Reply-To: <20230404084308.813-2-zhangqing@loongson.cn>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 5 Apr 2023 00:09:19 +0200
Message-ID: <CA+fCnZf-segLxa3QxStd6v15ZCge=3=3rOL-9Q_eMc-y2j1nhg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] kasan: Add (pmd|pud)_init for LoongArch
 zero_(pud|p4d)_populate process
To: Qing Zhang <zhangqing@loongson.cn>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Huacai Chen <chenhuacai@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, kasan-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 10:43=E2=80=AFAM Qing Zhang <zhangqing@loongson.cn> =
wrote:
>
> Loongarch populate pmd/pud with invalid_pmd_table/invalid_pud_table in
> pagetable_init, So pmd_init/pud_init(p) is required, define them as __wea=
k
> in mm/kasan/init.c, like mm/sparse-vmemmap.c.
>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  mm/kasan/init.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/mm/kasan/init.c b/mm/kasan/init.c
> index cc64ed6858c6..a7fa223b96e4 100644
> --- a/mm/kasan/init.c
> +++ b/mm/kasan/init.c
> @@ -139,6 +139,10 @@ static int __ref zero_pmd_populate(pud_t *pud, unsig=
ned long addr,
>         return 0;
>  }
>
> +void __weak __meminit pmd_init(void *addr)
> +{
> +}
> +
>  static int __ref zero_pud_populate(p4d_t *p4d, unsigned long addr,
>                                 unsigned long end)
>  {
> @@ -166,8 +170,9 @@ static int __ref zero_pud_populate(p4d_t *p4d, unsign=
ed long addr,
>                                 if (!p)
>                                         return -ENOMEM;
>                         } else {
> -                               pud_populate(&init_mm, pud,
> -                                       early_alloc(PAGE_SIZE, NUMA_NO_NO=
DE));
> +                               p =3D early_alloc(PAGE_SIZE, NUMA_NO_NODE=
);
> +                               pmd_init(p);
> +                               pud_populate(&init_mm, pud, p);
>                         }
>                 }
>                 zero_pmd_populate(pud, addr, next);
> @@ -176,6 +181,10 @@ static int __ref zero_pud_populate(p4d_t *p4d, unsig=
ned long addr,
>         return 0;
>  }
>
> +void __weak __meminit pud_init(void *addr)
> +{
> +}
> +
>  static int __ref zero_p4d_populate(pgd_t *pgd, unsigned long addr,
>                                 unsigned long end)
>  {
> @@ -207,8 +216,9 @@ static int __ref zero_p4d_populate(pgd_t *pgd, unsign=
ed long addr,
>                                 if (!p)
>                                         return -ENOMEM;
>                         } else {
> -                               p4d_populate(&init_mm, p4d,
> -                                       early_alloc(PAGE_SIZE, NUMA_NO_NO=
DE));
> +                               p =3D early_alloc(PAGE_SIZE, NUMA_NO_NODE=
);
> +                               pud_init(p);
> +                               p4d_populate(&init_mm, p4d, p);
>                         }
>                 }
>                 zero_pud_populate(p4d, addr, next);
> --
> 2.20.1
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Thanks!
