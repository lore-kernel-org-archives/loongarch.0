Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162631;
	b=A/VLFnWppNzpez2vg8S/X0EPNgVCyVAfKvjyo8v+7hCoKRuWbuFmV6q7SYQ0t+kNandn
	 v8iqDc/y2eQv2PrHfhPlF/b9KF1BDPuk58AMIrcUuMGAOTlvTVkCcAqjAOpe6ea94M1XV
	 EJtpyjnqLxQXAm6+rnZ5aTOsAIxGfaB01dweey5Dj7i8KAG66AcRuQTzKYMQKNLK3EzB8
	 VeP+fuIEwFeSIUomen4HRMNCbyvCMrejejAfXxcc4ZzZgKraxmziS8bGkXzt/KD0gmf+W
	 QL85sO4vZmr9YEsGF6I24EkKbnoId9fe2HT51RT8lopcoqNKb1qOAK1uBpk70lN+png==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162631;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qqugXM/ypPq015y+cj21KufNxQ3WaxwLSFccQo4vIk4=;
	b=UZb4ePWMYkQJzqwhdWHchI6diC7pe/aZXO7hAR5617MeP68ztsG7rCYy/h2qHupUlKsl
	 An36FGE+ve46myc8x8qeLqEqbqkmTw1ltdVmqxdhNrsBD62C/u1yudNQLzyco/YRae9jS
	 N+ydNtrL6UjTnb+vPTGnk5waBfmw0xABJGxsAmbxhARdCKOIvJbZ8q/7kqquxQfoZk2Uv
	 CpjjconG6ltT94pb9vkGRVaAUhrqieABboqYKDg5rr92sZcwCBl0z1smzwdCjZXN2C3xk
	 XllFvG8DmRr1Sh5VGJAQXgfRbDz9cZNmSZaTCMOXwxst+Ic8wB59Fz6qp0vaURtqBhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZhKAgtV+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D2360A2602
	for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZhKAgtV+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A711F000CF
	for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162631;
	bh=qqugXM/ypPq015y+cj21KufNxQ3WaxwLSFccQo4vIk4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZhKAgtV+iLF32YlXYM7SsKzbG9i9LAu3wAv4sqdqxIzqp3XzHbRzDczK/N6FJisKb
	 CuBf0TrollM9fgqmfEJQTt9Axe4m7yZxD8Yb5pG0gpLJY+VGfzC10aWw5B8nOJfycB
	 /6uUR14c/Qgp8yrT2ScZQ15qI355JkFRfqYTQcIP7DH7Lh3msYo9RfYq16NAe55iqb
	 fJ1Xs1zf3323lmJ88AXR+/zjwbjMGmILJcSga0vLxIV9YI2DFdIw+LDjvjp4jkVjMW
	 z3JwnRSrXbub68lNGb9cIkxdToT/OveMZD9ISOMdCepMKmTVplxNjP7YDmKkfFnr8D
	 4VhFNlzpH0eWg==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b878560a08so935483a12.1
        for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 00:17:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFmvxXHq6pZDE522fWJazVfLZ879uTXLxoK4ec01aIE2W7B+RbPmR81pBAZ0h3RQLDCURVoVhz2IR0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8b+5uO/d2RfHVdc24Eue4K+PIk/4mRjrxClOHayk++dpOmTEiG
	JjDTQwxJgC5FgSPFqlUatncyGtBX7ZtavIUZxdIROOOJbJMCNHSD5cXdkKieWMmAZcPRaM1kKP4
	746mZPBh1QTHodUpWH2HW2pQNBs8IRDs=
X-Received: by 2002:a05:6402:a594:10b0:6b8:a711:65f3 with SMTP id
 4fb4d7f45d1cf-6ba37e935e0mr1100699a12.14.1795162629394; Fri, 20 Nov 2026
 00:17:09 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <C3361EF435F90A22+20261119121937.2447021-1-luoqiu@kylinsec.com.cn>
In-Reply-To: <C3361EF435F90A22+20261119121937.2447021-1-luoqiu@kylinsec.com.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 20 Nov 2026 16:16:58 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7037=znoeU3+V086qGuDkRMVeSmt0PKe8DrdiFKcvF0A@mail.gmail.com>
X-Gm-Features: AclHuK-3MldchjvZ2Mbp5twdDrLoLp-rfbrZ5YsXDyld-9bOwrDSw_hbmasDlbs
Message-ID: <CAAhV-H7037=znoeU3+V086qGuDkRMVeSmt0PKe8DrdiFKcvF0A@mail.gmail.com>
Subject: Re: [PATCH] platform/loongarch: laptop: Fix backlight device lifetime
 on unload
To: Luo Qiu <luoqiu@kylinsec.com.cn>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, Yao Zi <ziyao@disroot.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Zixing Liu <liushuyu@aosc.io>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qiu,

On Thu, Nov 19, 2026 at 8:22=E2=80=AFPM Luo Qiu <luoqiu@kylinsec.com.cn> wr=
ote:
>
> The driver registers a platform backlight device during module init but
> discards the returned pointer. Consequently, the device is never
> unregistered when the module is removed, leaving its ops callbacks
> pointing into freed module text. After module removal, reading the
> backlight's actual_brightness attribute can call the stale callback and
> crash the kernel. Registration failures are also silently ignored.
>
> Store the returned pointer, use it for resume, and unregister it on
> module exit. Propagate registration failures to avoid silently
> continuing without a backlight device.
>
> Fixes: 6246ed09111f ("LoongArch: Add ACPI-based generic laptop driver")
> Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
> ---
>  drivers/platform/loongarch/loongson-laptop.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platf=
orm/loongarch/loongson-laptop.c
> index 4ec56621db24..ec0742e5ed46 100644
> --- a/drivers/platform/loongarch/loongson-laptop.c
> +++ b/drivers/platform/loongarch/loongson-laptop.c
> @@ -56,6 +56,7 @@ static acpi_handle hotkey_handle;
>  static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX];
>
>  static bool bl_powered;
> +static struct backlight_device *backlight_dev;
>  static int loongson_laptop_backlight_update(struct backlight_device *bd)=
;
>
>  /* 2. ACPI Helpers and device model */
> @@ -194,13 +195,12 @@ static int loongson_hotkey_resume(struct device *de=
v)
>  {
>         int status =3D 0;
>         struct key_entry ke;
> -       struct backlight_device *bd;
>
> -       bd =3D backlight_device_get_by_type(BACKLIGHT_PLATFORM);
> -       if (bd) {
> -               loongson_laptop_backlight_update(bd) ?
> +       if (backlight_dev) {
> +               loongson_laptop_backlight_update(backlight_dev) ?
>                 pr_warn("Loongson_backlight: resume brightness failed") :
> -               pr_info("Loongson_backlight: resume brightness %d\n", bd-=
>props.brightness);
> +               pr_info("Loongson_backlight: resume brightness %d\n",
> +                               backlight_dev->props.brightness);
>         }
>
>         /*
> @@ -409,6 +409,7 @@ static int laptop_backlight_register(void)
>  {
>         int status =3D 0, ret;
>         struct backlight_properties props;
> +       struct backlight_device *bd;
>
>         memset(&props, 0, sizeof(props));
>
> @@ -426,9 +427,12 @@ static int laptop_backlight_register(void)
>         props.power =3D BACKLIGHT_POWER_ON;
>         props.type =3D BACKLIGHT_PLATFORM;
>
> -       backlight_device_register("loongson_laptop",
> +       bd =3D backlight_device_register("loongson_laptop",
>                                 NULL, NULL, &backlight_laptop_ops, &props=
);
> +       if (IS_ERR(bd))
> +               return PTR_ERR(bd);
>
> +       backlight_dev =3D bd;
>
>         return 0;
>  }
> @@ -622,6 +626,9 @@ static void __exit generic_acpi_laptop_exit(void)
>                                 generic_subdriver_exit(&generic_sub_drive=
rs[i]);
>                 }
>         }
> +
> +       backlight_device_unregister(backlight_dev);
backlight_device_register is called conditionally but
backlight_device_unregister() is called unconditionally, I think this
is wrong.

Huacai

> +       backlight_dev =3D NULL;
>  }
>
>  module_init(generic_acpi_laptop_init);
> --
> 2.56.1
>
