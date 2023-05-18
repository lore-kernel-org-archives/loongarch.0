Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A407E
	for <loongarch@lists.linux.dev>; Thu, 18 May 2023 02:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FB9C433A0
	for <loongarch@lists.linux.dev>; Thu, 18 May 2023 02:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684376729;
	bh=BJ+zBtzidStymX1Xdsl4tnDX+vPeQYRYOTB0T2LRp38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WCHPlaknHiGRj9rCq7F41vWTl8o2TVPqZvzvbk5putWNtJGCX/vmNJXK2lW5EO8ZZ
	 9kJo1ZQSpY14g+6QnNC2+k2SClB04WQo8ful1DGFfkXR9pdJ1RVanKpfBfVGpG7+Yh
	 RXuhdSKCHVXyg0LWChtiwxtHnwHyvA4SnUqB2eiRYxGpFB/K6KLpGtG/a9VIvvpp6l
	 dAJ/DtABSenooroFbzCf5jBkWzuFBueeGc1TQ1UOMNX0M2//GKvYCNPEVOJZDd460w
	 zKBpzltZSi9KIa7CP4Osi6uWQ4Ut8/9TnzUAGmwJ0/Kc3wboUdMqVSkcORbi4ckS+Y
	 V7BL8HMeZG6rw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-50bc0117683so2687646a12.1
        for <loongarch@lists.linux.dev>; Wed, 17 May 2023 19:25:29 -0700 (PDT)
X-Gm-Message-State: AC+VfDx+wp+yQPk9x/yTeEE08/VydhZ5knR/R3LChUroPAIGg+MmEqia
	K8lZ9rRdOPJm4MDjoUA3KjcwtUez+i4Jhu6FhI0=
X-Google-Smtp-Source: ACHHUZ5drE9lWsneoeKrXat+THfTJNpI734MDx9OZr8skaG5GNqzYL2Tdyq+myp5Z5grM9LWYhtFo+Kn2wep9HM61Ls=
X-Received: by 2002:a17:907:2d90:b0:966:40ad:3aec with SMTP id
 gt16-20020a1709072d9000b0096640ad3aecmr36796716ejc.6.1684376727891; Wed, 17
 May 2023 19:25:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1684292580-2455-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1684292580-2455-1-git-send-email-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 18 May 2023 10:25:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6wtsFX+EUqzgseNmEW7FJk4b7b_PmcxKBiYu0qdHGwJQ@mail.gmail.com>
Message-ID: <CAAhV-H6wtsFX+EUqzgseNmEW7FJk4b7b_PmcxKBiYu0qdHGwJQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add support to clone a time namespace
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Christian Brauner <brauner@kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

The layout of vdso data (loongarch_vdso_data):

       struct vdso_pcpu_data pdata[NR_CPUS];
       struct vdso_data data[CS_BASES];

VDSO_DATA_SIZE is the page aligned size of loongarch_vdso_data, and in
memory, vdso code is above vdso data.

Then, get_vdso_base() returns the start of vdso code, and
get_vdso_data() returns the start of vdso data.

In your patch, __arch_get_timens_vdso_data() returns get_vdso_data() +
PAGE_SIZE, but you don't increase the size of loongarch_vdso_data. The
result is it returns an address in vdso code.

Now, do you know what the problem is? Or still insist that "I have tested"?

Huacai

On Wed, May 17, 2023 at 11:03=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> When execute the following command to test clone3 on LoongArch:
>
>   # cd tools/testing/selftests/clone3 && make && ./clone3
>
> we can see the following error info:
>
>   # [5719] Trying clone3() with flags 0x80 (size 0)
>   # Invalid argument - Failed to create new process
>   # [5719] clone3() with flags says: -22 expected 0
>   not ok 18 [5719] Result (-22) is different than expected (0)
>
> This is because if CONFIG_TIME_NS is not set, but the flag
> CLONE_NEWTIME (0x80) is used to clone a time namespace, it
> will return -EINVAL in copy_time_ns().
>
> Here is the related code in include/linux/time_namespace.h:
>
>   #ifdef CONFIG_TIME_NS
>   ...
>   struct time_namespace *copy_time_ns(unsigned long flags,
>                                       struct user_namespace *user_ns,
>                                       struct time_namespace *old_ns);
>   ...
>   #else
>   ...
>   static inline
>   struct time_namespace *copy_time_ns(unsigned long flags,
>                                       struct user_namespace *user_ns,
>                                       struct time_namespace *old_ns)
>   {
>           if (flags & CLONE_NEWTIME)
>                   return ERR_PTR(-EINVAL);
>
>           return old_ns;
>   }
>   ...
>   #endif
>
> Here is the complete call stack:
>
>   clone3()
>     kernel_clone()
>       copy_process()
>         copy_namespaces()
>           create_new_namespaces()
>             copy_time_ns()
>               clone_time_ns()
>
> Because CONFIG_TIME_NS depends on GENERIC_VDSO_TIME_NS, select
> GENERIC_VDSO_TIME_NS to enable CONFIG_TIME_NS to build the real
> implementation of copy_time_ns() in kernel/time/namespace.c.
>
> Additionally, it needs to define some arch dependent functions
> such as __arch_get_timens_vdso_data(), arch_get_vdso_data() and
> vdso_join_timens(), then the failed test can be fixed.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>
> This is based on 6.4-rc2
>
>  arch/loongarch/Kconfig                         |  1 +
>  arch/loongarch/include/asm/vdso/gettimeofday.h |  7 ++++++
>  arch/loongarch/kernel/vdso.c                   | 32 ++++++++++++++++++++=
++++++
>  3 files changed, 40 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index d38b066..93b167f 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -80,6 +80,7 @@ config LOONGARCH
>         select GENERIC_SCHED_CLOCK
>         select GENERIC_SMP_IDLE_THREAD
>         select GENERIC_TIME_VSYSCALL
> +       select GENERIC_VDSO_TIME_NS
>         select GPIOLIB
>         select HAS_IOPORT
>         select HAVE_ARCH_AUDITSYSCALL
> diff --git a/arch/loongarch/include/asm/vdso/gettimeofday.h b/arch/loonga=
rch/include/asm/vdso/gettimeofday.h
> index 7b2cd37..1af88ac 100644
> --- a/arch/loongarch/include/asm/vdso/gettimeofday.h
> +++ b/arch/loongarch/include/asm/vdso/gettimeofday.h
> @@ -94,6 +94,13 @@ static __always_inline const struct vdso_data *__arch_=
get_vdso_data(void)
>         return get_vdso_data();
>  }
>
> +#ifdef CONFIG_TIME_NS
> +static __always_inline
> +const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_da=
ta *vd)
> +{
> +       return get_vdso_data() + PAGE_SIZE;
> +}
> +#endif
>  #endif /* !__ASSEMBLY__ */
>
>  #endif /* __ASM_VDSO_GETTIMEOFDAY_H */
> diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> index eaebd2e..cf62103 100644
> --- a/arch/loongarch/kernel/vdso.c
> +++ b/arch/loongarch/kernel/vdso.c
> @@ -14,6 +14,7 @@
>  #include <linux/random.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> +#include <linux/time_namespace.h>
>  #include <linux/timekeeper_internal.h>
>
>  #include <asm/page.h>
> @@ -73,6 +74,37 @@ static int __init init_vdso(void)
>  }
>  subsys_initcall(init_vdso);
>
> +#ifdef CONFIG_TIME_NS
> +struct vdso_data *arch_get_vdso_data(void *vvar_page)
> +{
> +       return (struct vdso_data *)(vvar_page);
> +}
> +
> +/*
> + * The vvar mapping contains data for a specific time namespace, so when=
 a
> + * task changes namespace we must unmap its vvar data for the old namesp=
ace.
> + * Subsequent faults will map in data for the new namespace.
> + *
> + * For more details see timens_setup_vdso_data().
> + */
> +int vdso_join_timens(struct task_struct *task, struct time_namespace *ns=
)
> +{
> +       struct mm_struct *mm =3D task->mm;
> +       struct vm_area_struct *vma;
> +
> +       VMA_ITERATOR(vmi, mm, 0);
> +
> +       mmap_read_lock(mm);
> +       for_each_vma(vmi, vma) {
> +               if (vma_is_special_mapping(vma, &vdso_info.data_mapping))
> +                       zap_vma_pages(vma);
> +       }
> +       mmap_read_unlock(mm);
> +
> +       return 0;
> +}
> +#endif
> +
>  static unsigned long vdso_base(void)
>  {
>         unsigned long base =3D STACK_TOP;
> --
> 2.1.0
>
