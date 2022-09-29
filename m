Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0ACEA0
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 08:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DDDC433D7
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 08:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664440312;
	bh=BvrFJCULs2Wza/EdwzmscEXyeFBnBeIhY36lcoV68Oo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IsiY5fHsx/p744TlSHVaFTosnPyDkiR5Mc8DwJukR83HABNVkh2VbXR7N5pIw3Fq+
	 7sklrOfwh6e0K3iAlL8JCRYzeCf9Fjg5LXy4aHqrneoGdsfTKr0Dgn58COY+x8gG40
	 EW95D7cJdImGWpGYb/o9XDtuyaE3oJOeBpv4L8fiVCWZPp8iq7AKQ0V4XJNrYm8jrS
	 K04/j4vfZRReG8WmwG7ovywFWHol9FGZkiBojIufsin8myyfU1PbJb64dBzSWpYG1Y
	 VHZ46pbrEW/95+btIZLIcjN6lAjbTdsR+XXGUFGg+bYOc0ytmLKtqpxOhedoJ2jOLA
	 vo5X9uEbyIfLA==
Received: by mail-vk1-f175.google.com with SMTP id g27so300037vkl.3
        for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 01:31:52 -0700 (PDT)
X-Gm-Message-State: ACrzQf1wYwCqvwWaYHSB3i2wBUeQyhJ420gxjTxnApNVmwZI/ybfaXcs
	0zLKoYp7tsiGmtl55t3l9VbmCzaOXqAR4gyeFzA=
X-Google-Smtp-Source: AMsMyM4WxWjd8fcfLBSZLCA041Ltq5XZl+czxFiiZWrKmzvwLR+uoE/afCbryKF/4e7p0Q2hqV6T/8S5+DHo69m+tXs=
X-Received: by 2002:a1f:2596:0:b0:3a2:5864:697c with SMTP id
 l144-20020a1f2596000000b003a25864697cmr823963vkl.37.1664440311493; Thu, 29
 Sep 2022 01:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929073623.7604-1-lvjianmin@loongson.cn>
In-Reply-To: <20220929073623.7604-1-lvjianmin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 29 Sep 2022 16:31:37 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4qJROB+EXORsbc9Y0i_Myp543-3PmDsA=GQAtTu4v9Mw@mail.gmail.com>
Message-ID: <CAAhV-H4qJROB+EXORsbc9Y0i_Myp543-3PmDsA=GQAtTu4v9Mw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix cpu name after s3/s4
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi, Jianmin,

How about do it like this?

diff --git a/arch/loongarch/kernel/cpu-probe.c
b/arch/loongarch/kernel/cpu-probe.c
index 1bc9fec4e474..1734362d1fa9 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -265,7 +265,9 @@ static inline void cpu_probe_loongson(struct
cpuinfo_loongarch *c, unsigned int
        uint64_t *vendor = (void *)(&cpu_full_name[VENDOR_OFFSET]);
        uint64_t *cpuname = (void *)(&cpu_full_name[CPUNAME_OFFSET]);

-       __cpu_full_name[cpu] = cpu_full_name;
+       if (!__cpu_full_name[cpu])
+               __cpu_full_name[cpu] = cpu_full_name;
+
        *vendor = iocsr_read64(LOONGARCH_IOCSR_VENDOR);
        *cpuname = iocsr_read64(LOONGARCH_IOCSR_CPUNAME);

Huacai

On Thu, Sep 29, 2022 at 3:36 PM Jianmin Lv <lvjianmin@loongson.cn> wrote:
>
> On coming back from s3/s4, the cpu name will be overwritten
> in cpu_probe path of seconary cpu, so we adjust the postion
> of using cpu name existed in cpu hardware register, and only
> use it while failing to get cpu name from SMBIOS.
>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
>
> diff --git a/arch/loongarch/include/asm/cpu-info.h b/arch/loongarch/include/asm/cpu-info.h
> index b6c4f96079df..937dce2a930a 100644
> --- a/arch/loongarch/include/asm/cpu-info.h
> +++ b/arch/loongarch/include/asm/cpu-info.h
> @@ -64,6 +64,7 @@ extern void cpu_probe(void);
>
>  extern const char *__cpu_family[];
>  extern const char *__cpu_full_name[];
> +extern char cpu_full_name[];
>  #define cpu_family_string()    __cpu_family[raw_smp_processor_id()]
>  #define cpu_full_name_string() __cpu_full_name[raw_smp_processor_id()]
>
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
> index 529ab8f44ec6..a548b2197224 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -180,14 +180,13 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
>  #define VENDOR_OFFSET  0
>  #define CPUNAME_OFFSET 9
>
> -static char cpu_full_name[MAX_NAME_LEN] = "        -        ";
> +char cpu_full_name[MAX_NAME_LEN] = "        -        ";
>
>  static inline void cpu_probe_loongson(struct cpuinfo_loongarch *c, unsigned int cpu)
>  {
>         uint64_t *vendor = (void *)(&cpu_full_name[VENDOR_OFFSET]);
>         uint64_t *cpuname = (void *)(&cpu_full_name[CPUNAME_OFFSET]);
>
> -       __cpu_full_name[cpu] = cpu_full_name;
>         *vendor = iocsr_read64(LOONGARCH_IOCSR_VENDOR);
>         *cpuname = iocsr_read64(LOONGARCH_IOCSR_CPUNAME);
>
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index 82b478a5c665..955d82aa298e 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -44,6 +44,9 @@ static int __init init_cpu_fullname(void)
>         if (loongson_sysconf.cpuname && !strncmp(loongson_sysconf.cpuname, "Loongson", 8)) {
>                 for (cpu = 0; cpu < NR_CPUS; cpu++)
>                         __cpu_full_name[cpu] = loongson_sysconf.cpuname;
> +       } else {
> +               for (cpu = 0; cpu < NR_CPUS; cpu++)
> +                       __cpu_full_name[cpu] = cpu_full_name;
>         }
>         return 0;
>  }
> --
> 2.31.1
>
