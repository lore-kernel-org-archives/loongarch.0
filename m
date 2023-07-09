Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0439F17E1
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 03:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF68C433CD
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 03:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688874617;
	bh=4GsjROMgLzxPaOtfOURyK7f4NQ3kCJVR8arfyj9BvG4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h3sntgjyIkzDGBSsgydPs2xM7JogjQzS4YE8yRes1RYt1CQjEO1yaMyp71Ws3Kv89
	 dqxHh6Hv2qOXbZOV16BcYyKlEwGnElk0cdG9WqrapN482apOdoFYOVz/Dqxtl10sO7
	 EWNix5TOJJbuKa0ahgUdp4CyP2mEMM6XtxUhMga+BkAgB+/hqAhHwC/uAFiu1D0T9r
	 aVZAkrw72j/44ShsqLi3oUUeD2svhGxL47Z52cEY8WeVxeY/u9byv2A1thzPu2WCzG
	 6N9WD1I+fiCFJhT4NsftgP38il+F6+mE2K7x543I5wOMd5FwGB2njRePY2lEPkJPLF
	 T7FteKvrEeAdw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51e429e1eabso2351215a12.2
        for <loongarch@lists.linux.dev>; Sat, 08 Jul 2023 20:50:17 -0700 (PDT)
X-Gm-Message-State: ABy/qLa2dghzrGiOf+N5wfOO1dPNxmXk76xa2LRDlPl1LvdT+eS582Sw
	b+vG4SpdUWbXq/OfD7DDt6XPxuw/AbGPBbfqMOs=
X-Google-Smtp-Source: APBJJlE88DDLkVdTyDAkLUt98wZcWvBkrIbEKvt4TmfoziEkCCrvz+XnlmOEwHp40RpFkomalkC1k4mycCMefWel/D4=
X-Received: by 2002:aa7:d052:0:b0:51d:a02d:f8fe with SMTP id
 n18-20020aa7d052000000b0051da02df8femr6401474edo.29.1688874615629; Sat, 08
 Jul 2023 20:50:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1688369658.git.chenfeiyang@loongson.cn> <cfc7b16d31d0f2dbe08d5d835f34796b2074a35a.1688369658.git.chenfeiyang@loongson.cn>
In-Reply-To: <cfc7b16d31d0f2dbe08d5d835f34796b2074a35a.1688369658.git.chenfeiyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 9 Jul 2023 11:50:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5vKoqm4Cyt7Si5fLmYKvu+YXs3gnm4fr4Tk9USCc97Pg@mail.gmail.com>
Message-ID: <CAAhV-H5vKoqm4Cyt7Si5fLmYKvu+YXs3gnm4fr4Tk9USCc97Pg@mail.gmail.com>
Subject: Re: [PATCH 1/2] LoongArch: relocatable: Provide kaslr_offset() to get
 the kernel offset
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: dvyukov@google.com, andreyknvl@gmail.com, loongarch@lists.linux.dev, 
	kasan-dev@googlegroups.com, chris.chenfeiyang@gmail.com, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Feiyang,

On Tue, Jul 4, 2023 at 8:53=E2=80=AFPM Feiyang Chen <chenfeiyang@loongson.c=
n> wrote:
>
> Provide kaslr_offset() to get the kernel offset when KASLR is enabled.
> Rename reloc_offset to __reloc_offset and export it.
>
> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> ---
>  arch/loongarch/include/asm/setup.h |  6 ++++++
>  arch/loongarch/kernel/relocate.c   | 18 ++++++++----------
>  arch/loongarch/kernel/setup.c      |  3 +++
>  3 files changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/=
asm/setup.h
> index 2dca0d1dd90a..39f9964bbdd4 100644
> --- a/arch/loongarch/include/asm/setup.h
> +++ b/arch/loongarch/include/asm/setup.h
> @@ -37,4 +37,10 @@ extern unsigned long __init relocate_kernel(void);
>
>  #endif
>
> +extern unsigned long __reloc_offset;
> +static inline unsigned long kaslr_offset(void)
> +{
> +       return __reloc_offset;
I doubt that we should return random_offset here.

Huacai
> +}
> +
>  #endif /* __SETUP_H */
> diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/rel=
ocate.c
> index 6c3eff9af9fb..9ba560d514e1 100644
> --- a/arch/loongarch/kernel/relocate.c
> +++ b/arch/loongarch/kernel/relocate.c
> @@ -16,11 +16,9 @@
>  #include <asm/sections.h>
>  #include <asm/setup.h>
>
> -#define RELOCATED(x) ((void *)((long)x + reloc_offset))
> +#define RELOCATED(x) ((void *)((long)x + __reloc_offset))
>  #define RELOCATED_KASLR(x) ((void *)((long)x + random_offset))
>
> -static unsigned long reloc_offset;
> -
>  static inline void __init relocate_relative(void)
>  {
>         Elf64_Rela *rela, *rela_end;
> @@ -154,7 +152,7 @@ static inline void __init update_reloc_offset(unsigne=
d long *addr, long random_o
>  {
>         unsigned long *new_addr =3D (unsigned long *)RELOCATED_KASLR(addr=
);
>
> -       *new_addr =3D (unsigned long)reloc_offset;
> +       *new_addr =3D (unsigned long)__reloc_offset;
>  }
>
>  unsigned long __init relocate_kernel(void)
> @@ -173,7 +171,7 @@ unsigned long __init relocate_kernel(void)
>         if (relocation_addr_valid(location_new))
>                 random_offset =3D (unsigned long)location_new - (unsigned=
 long)(_text);
>  #endif
> -       reloc_offset =3D (unsigned long)_text - VMLINUX_LOAD_ADDRESS;
> +       __reloc_offset =3D (unsigned long)_text - VMLINUX_LOAD_ADDRESS;
>
>         if (random_offset) {
>                 kernel_length =3D (long)(_end) - (long)(_text);
> @@ -187,15 +185,15 @@ unsigned long __init relocate_kernel(void)
>                         "dbar 0 \t\n"
>                         ::: "memory");
>
> -               reloc_offset +=3D random_offset;
> +               __reloc_offset +=3D random_offset;
>
>                 /* The current thread is now within the relocated kernel =
*/
>                 __current_thread_info =3D RELOCATED_KASLR(__current_threa=
d_info);
>
> -               update_reloc_offset(&reloc_offset, random_offset);
> +               update_reloc_offset(&__reloc_offset, random_offset);
>         }
>
> -       if (reloc_offset)
> +       if (__reloc_offset)
>                 relocate_relative();
>
>         relocate_absolute(random_offset);
> @@ -208,9 +206,9 @@ unsigned long __init relocate_kernel(void)
>   */
>  static void show_kernel_relocation(const char *level)
>  {
> -       if (reloc_offset > 0) {
> +       if (__reloc_offset > 0) {
>                 printk(level);
> -               pr_cont("Kernel relocated by 0x%lx\n", reloc_offset);
> +               pr_cont("Kernel relocated by 0x%lx\n", __reloc_offset);
>                 pr_cont(" .text @ 0x%px\n", _text);
>                 pr_cont(" .data @ 0x%px\n", _sdata);
>                 pr_cont(" .bss  @ 0x%px\n", __bss_start);
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.=
c
> index 95e6b579dfdd..d7bda711824f 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -65,6 +65,9 @@ struct cpuinfo_loongarch cpu_data[NR_CPUS] __read_mostl=
y;
>
>  EXPORT_SYMBOL(cpu_data);
>
> +unsigned long __reloc_offset __ro_after_init;
> +EXPORT_SYMBOL(__reloc_offset);
> +
>  struct loongson_board_info b_info;
>  static const char dmi_empty_string[] =3D "        ";
>
> --
> 2.39.3
>
