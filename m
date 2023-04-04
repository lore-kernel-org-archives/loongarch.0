Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42335D2F2
	for <loongarch@lists.linux.dev>; Tue,  4 Apr 2023 22:09:50 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso35379801pjb.3
        for <loongarch@lists.linux.dev>; Tue, 04 Apr 2023 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680646190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhW41Lz+Mez52y9+7Sqb35hmOmVdAZ3fg2uw11nAPAE=;
        b=gUnEta5Yb6BtuCcTbAobNapAGPwc0djL/m8TaRV6zg1dmzIbN9ViSxcJdaPoUxzS4b
         lqAg8chb72IJSS+FDlhtOK8Q6TNt1dX6HhF5uUTVwsIiKbA7yXZaggFVpSNKPB/kpfG5
         UGE6OA1h2UEWP7hBlWDMJIm6VAA88W4h5iUein/TQ4pBlGSVHPr+4gtWEGZz1NccX+1O
         pzrByG745s8cPaG1Bv9BjxgAeCG+TOnfx7Zf8ZthRcuoQ7uY/PzreoHfTKIwH39L6NMf
         +ihHktT0J0n+iD3LRnqvnglDvtpJ0jraXnTyclvvFj3bOpjrIKalZFNddiclc0ueDpSP
         hxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680646190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhW41Lz+Mez52y9+7Sqb35hmOmVdAZ3fg2uw11nAPAE=;
        b=YGBgRy218UFVmN3/t19jBdUACfpFGCfRSJ1CND7+GXSuZb0PCWIfF9YS5nWW/RRKZt
         jaAUG7IIUOEhuK6lYEumXKL6RYk59WecTmZ89VdYA56oPU4MCBKsClBLmopV5x0POj0l
         y32zO4SzCZrteMz1TJKjwLxaZnzokc2qKUe5DhY8bXohvrRoufSl0am3X68C+kQ3IAZq
         OiXmzDXG2oO0H+dkTL8mS1O7VOX+ayEXricYg3d+48QiusSYWCqRnDt/LfIe6wr38HAh
         6ZmvrqyyceD1yLSLMjAG4aqEc9Or0AeLfQ5736vfwQXR9e8TuaIqm40xZbWOhwBakMDv
         muAA==
X-Gm-Message-State: AAQBX9eJLPKMQrcuwslku+9ieJ0lHaOW/nEtPCbvTRntvTDFRbmO2uIQ
	arkjYNLNO4l9jHTZbwnsNLUrkgCdDUQMNVS2lNE=
X-Google-Smtp-Source: AKy350bBMyaLkYHcsUf3JTXKneddX4ZVx0+3AX9RSmsTAdcXvoVPs11LPU8Ekd9MaEE01X2e0f3RDUQs/sOmoWXiTBE=
X-Received: by 2002:a17:90b:e09:b0:240:228:95bd with SMTP id
 ge9-20020a17090b0e0900b00240022895bdmr1533929pjb.5.1680646189645; Tue, 04 Apr
 2023 15:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230404084308.813-1-zhangqing@loongson.cn>
In-Reply-To: <20230404084308.813-1-zhangqing@loongson.cn>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 5 Apr 2023 00:09:38 +0200
Message-ID: <CA+fCnZentBDXuyyrZFzPLpt8Vdfo7YyAyxbgb506LFrR+v-D9Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] kasan: Add __HAVE_ARCH_SHADOW_MAP to support arch
 specific mapping
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
> Like the LoongArch, which has many holes between different segments
> and valid address space(256T available) is insufficient to map all
> these segments to kasan shadow memory with the common formula provided
> by kasan core, We need architecture specific mapping formula,different
> segments are mapped individually, and only limited length of space of
> that specific segment is mapped to shadow.
>
> Therefore, when the incoming address is converted to a shadow, we need
> to add a condition to determine whether it is valid.
>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  include/linux/kasan.h | 2 ++
>  mm/kasan/kasan.h      | 6 ++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index f7ef70661ce2..3b91b941873d 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -54,11 +54,13 @@ extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D]=
;
>  int kasan_populate_early_shadow(const void *shadow_start,
>                                 const void *shadow_end);
>
> +#ifndef __HAVE_ARCH_SHADOW_MAP
>  static inline void *kasan_mem_to_shadow(const void *addr)
>  {
>         return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
>                 + KASAN_SHADOW_OFFSET;
>  }
> +#endif
>
>  int kasan_add_zero_shadow(void *start, unsigned long size);
>  void kasan_remove_zero_shadow(void *start, unsigned long size);
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index a61eeee3095a..033335c13b25 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -291,16 +291,22 @@ struct kasan_stack_ring {
>
>  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
>
> +#ifndef __HAVE_ARCH_SHADOW_MAP
>  static inline const void *kasan_shadow_to_mem(const void *shadow_addr)
>  {
>         return (void *)(((unsigned long)shadow_addr - KASAN_SHADOW_OFFSET=
)
>                 << KASAN_SHADOW_SCALE_SHIFT);
>  }
> +#endif
>
>  static __always_inline bool addr_has_metadata(const void *addr)
>  {
> +#ifdef __HAVE_ARCH_SHADOW_MAP
> +       return (kasan_mem_to_shadow((void *)addr) !=3D NULL);
> +#else
>         return (kasan_reset_tag(addr) >=3D
>                 kasan_shadow_to_mem((void *)KASAN_SHADOW_START));
> +#endif
>  }
>
>  /**
> --
> 2.20.1
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Thanks!
