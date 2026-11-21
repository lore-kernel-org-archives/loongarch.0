Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266224;
	b=GtHe+aW0iU7wCQpK7O0YKoHuqynMQjTD+dAJTpULY5Jk+F5ifjFZG1a1K2bWhupr4lTc
	 +LL2BQ0Fj4nn3+NGp7KRiD6hJds4LsZcYgH/dpv0LWadNC3uK9m86clZbyZDhxrFFVteE
	 7AFAhXOsMLx+s9xbh86/+9oiBq5DMv8mZ+A3oi285hoGUYM27Br7iUx2BNmRPUo95QQck
	 EVHSlNKndvLdu28mcfhBTMz9Ro6DxgBs+ATMi2uyaufpXVKammU6Yza2hU/ZFBlFmZlO7
	 5UQRWtx6w6GrrWCoyp49iIaWPYiNEK5iu3tZ/F3otlCEykKt1azZlizs+FlRlbGCx9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266224;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NN9PV3EIA0LeMNEdrMa7ju2o8RGtnqlY03dOr+4MbQs=;
	b=dq1MMVBIhsq9TTyfpqAKektozWjTdYAc2bww0ZsR5JtpCoKtSfDrqeNnZojcBt13hYTT
	 6aHwaGqCfnBkeO2CJLJ0S/AjDv2EMoyEqEBNrBwtS+cUXqp4Nr/7Jh6PVQPb9mFhI3JR+
	 uE9UKp5YveYmWw3SwFaLlXcDzQKkxLInWeYzZaINFAHOhwWBtbZMaAj28jxCICQ+Mk9D5
	 YSSb+iLVeHn99WIwpD+lG+BzU6mi50i4S6Z7H0zw4e9oPy3is3+PfrsfGj3Ji7gCr16sv
	 2TGSnaKAbeYlJ0xz5e+Dg0JnYjGtN7Zdmk29zIBz7xoFQZKTnhmx33wBRYJchVbZOIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCk6n69f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784AC606A320
	for <loongarch@lists.linux.dev>; Sat, 21 Nov 2026 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCk6n69f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CDB1F000D4
	for <loongarch@lists.linux.dev>; Sat, 21 Nov 2026 13:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795266224;
	bh=NN9PV3EIA0LeMNEdrMa7ju2o8RGtnqlY03dOr+4MbQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CCk6n69fw2sJmloh3K1tFqvaHZD5cQdd8OXIgLZyT6nVox3M4v/BKO68xzNhLeqaO
	 HXn9kWaCiI9ehpdXrs9ncUN7kQe/a0BCTlpq5ZpocS+Du/NuiVqPssINbwBy2UMGTy
	 E+zYZ2w8VeW0d2s6T3Im78sAdosMz5hg3dG1ApGShT16uZSrHT1SdV5wut6q4F0aZ/
	 wJqlenrgZSB4HmWXjArujeZFcjnUVyNatbrpNsaxP9AGz10TCh3B2fM5QjYRMH2f7e
	 QfbgLxxtJZKzb5DcTSG1RCj5r2gr6IaFuUS0DJPHlvnbe61yxJTEt58SpWbAOflOcY
	 HICcAKF4dR3DA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so2663939a12.2
        for <loongarch@lists.linux.dev>; Sat, 21 Nov 2026 05:03:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErECZttqVXUHlEY58a+24VcHr4ZFODKXPDvcq/JaoyEjp0okx1WptRGVoMuJTDJUELVXZgvsUVfqjaw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9wCJ8jFGfXwS2iG32+aT5dGqCUp+16tNxvaByi3FBoMNiMLYhX
	6WCk3ECoBD87VXO3yCLeBRMIliN3imzc0thBzC6c7UTAwviNUtXZ/Z1ns9iBPuSB/74Fqxrpo5R
	5pyAJijAlLhJs1w8YrFtbvDCIpUAyyLg=
X-Received: by 2002:a05:6402:4501:b0:6ba:144f:ae47 with SMTP id
 4fb4d7f45d1cf-6ba37ec05c3mr4590419a12.26.1795266222631; Sat, 21 Nov 2026
 05:03:42 -0800 (PST)
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
 <CAAhV-H7037=znoeU3+V086qGuDkRMVeSmt0PKe8DrdiFKcvF0A@mail.gmail.com>
 <6ADB4C8146800DEE+635e4c74-fbd8-46bc-b1b7-670a35e62cb8@kylinsec.com.cn>
 <CAAhV-H4PM0iPH0mBQy=Tj16b2o_5zNwzEyjd8LqMMQeRQpDxNg@mail.gmail.com> <6C1A5340F9F491C3+2f4be193-b25b-4386-89e5-654277569ad6@kylinsec.com.cn>
In-Reply-To: <6C1A5340F9F491C3+2f4be193-b25b-4386-89e5-654277569ad6@kylinsec.com.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 21 Nov 2026 21:03:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7W3WLvdJGVb210PU=TPUUs7X3wm=mLknZ3B3DkY_KnPA@mail.gmail.com>
X-Gm-Features: Aa3M54owCyzpPXl5Qb34BuhzUxT_xhNRDfl_3UvftNMZO-G5W6GfbCgJM06_zZc
Message-ID: <CAAhV-H7W3WLvdJGVb210PU=TPUUs7X3wm=mLknZ3B3DkY_KnPA@mail.gmail.com>
Subject: Re: [PATCH] platform/loongarch: laptop: Fix backlight device lifetime
 on unload
To: Luo Qiu <luoqiu@kylinsec.com.cn>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, Yao Zi <ziyao@disroot.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Zixing Liu <liushuyu@aosc.io>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 8:45=E2=80=AFAM Luo Qiu <luoqiu@kylinsec.com.cn> wr=
ote:
>
>
> On 11/20/26 6:16 PM, Huacai Chen wrote:
> > On Fri, Nov 20, 2026 at 5:13=E2=80=AFPM Luo Qiu <luoqiu@kylinsec.com.cn=
> wrote:
> >>
> >> On 11/20/26 4:16 PM, Huacai Chen wrote:
> >>> Hi, Qiu,
> >>>
> >>> On Thu, Nov 19, 2026 at 8:22=E2=80=AFPM Luo Qiu <luoqiu@kylinsec.com.=
cn> wrote:
> >>>> The driver registers a platform backlight device during module init =
but
> >>>> discards the returned pointer. Consequently, the device is never
> >>>> unregistered when the module is removed, leaving its ops callbacks
> >>>> pointing into freed module text. After module removal, reading the
> >>>> backlight's actual_brightness attribute can call the stale callback =
and
> >>>> crash the kernel. Registration failures are also silently ignored.
> >>>>
> >>>> Store the returned pointer, use it for resume, and unregister it on
> >>>> module exit. Propagate registration failures to avoid silently
> >>>> continuing without a backlight device.
> >>>>
> >>>> Fixes: 6246ed09111f ("LoongArch: Add ACPI-based generic laptop drive=
r")
> >>>> Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
> >>>> ---
> >>>>    drivers/platform/loongarch/loongson-laptop.c | 19 +++++++++++++--=
----
> >>>>    1 file changed, 13 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/=
platform/loongarch/loongson-laptop.c
> >>>> index 4ec56621db24..ec0742e5ed46 100644
> >>>> --- a/drivers/platform/loongarch/loongson-laptop.c
> >>>> +++ b/drivers/platform/loongarch/loongson-laptop.c
> >>>> @@ -56,6 +56,7 @@ static acpi_handle hotkey_handle;
> >>>>    static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX=
];
> >>>>
> >>>>    static bool bl_powered;
> >>>> +static struct backlight_device *backlight_dev;
> >>>>    static int loongson_laptop_backlight_update(struct backlight_devi=
ce *bd);
> >>>>
> >>>>    /* 2. ACPI Helpers and device model */
> >>>> @@ -194,13 +195,12 @@ static int loongson_hotkey_resume(struct devic=
e *dev)
> >>>>    {
> >>>>           int status =3D 0;
> >>>>           struct key_entry ke;
> >>>> -       struct backlight_device *bd;
> >>>>
> >>>> -       bd =3D backlight_device_get_by_type(BACKLIGHT_PLATFORM);
> >>>> -       if (bd) {
> >>>> -               loongson_laptop_backlight_update(bd) ?
> >>>> +       if (backlight_dev) {
> >>>> +               loongson_laptop_backlight_update(backlight_dev) ?
> >>>>                   pr_warn("Loongson_backlight: resume brightness fai=
led") :
> >>>> -               pr_info("Loongson_backlight: resume brightness %d\n"=
, bd->props.brightness);
> >>>> +               pr_info("Loongson_backlight: resume brightness %d\n"=
,
> >>>> +                               backlight_dev->props.brightness);
> >>>>           }
> >>>>
> >>>>           /*
> >>>> @@ -409,6 +409,7 @@ static int laptop_backlight_register(void)
> >>>>    {
> >>>>           int status =3D 0, ret;
> >>>>           struct backlight_properties props;
> >>>> +       struct backlight_device *bd;
> >>>>
> >>>>           memset(&props, 0, sizeof(props));
> >>>>
> >>>> @@ -426,9 +427,12 @@ static int laptop_backlight_register(void)
> >>>>           props.power =3D BACKLIGHT_POWER_ON;
> >>>>           props.type =3D BACKLIGHT_PLATFORM;
> >>>>
> >>>> -       backlight_device_register("loongson_laptop",
> >>>> +       bd =3D backlight_device_register("loongson_laptop",
> >>>>                                   NULL, NULL, &backlight_laptop_ops,=
 &props);
> >>>> +       if (IS_ERR(bd))
> >>>> +               return PTR_ERR(bd);
> >>>>
> >>>> +       backlight_dev =3D bd;
> >>>>
> >>>>           return 0;
> >>>>    }
> >>>> @@ -622,6 +626,9 @@ static void __exit generic_acpi_laptop_exit(void=
)
> >>>>                                   generic_subdriver_exit(&generic_su=
b_drivers[i]);
> >>>>                   }
> >>>>           }
> >>>> +
> >>>> +       backlight_device_unregister(backlight_dev);
> >>> backlight_device_register is called conditionally but
> >>> backlight_device_unregister() is called unconditionally, I think this
> >>> is wrong.
> >>>
> >>> Huacai
> >> Hi, Huacai.
> >>
> >> Thanks for the review. The unconditional call is intentional and is sa=
fe
> >>
> >> because backlight_device_unregister() explicitly accepts a NULL device=
:
> >>
> >>       void backlight_device_unregister(struct backlight_device *bd)
> >>       {
> >>           if (!bd)
> >>               return;
> >>           ...
> >>       }
> >>
> >> backlight_dev is statically initialized to NULL. It is only assigned a=
fter
> >> backlight_device_register() succeeds and the IS_ERR() check has passed=
. If
> >> registration is skipped or fails, the pointer remains NULL, so the cal=
l in
> >> the module exit path is a no-op rather than a NULL dereference.
> >>
> >> I can change it to `if (backlight_dev) backlight_device_unregister(...=
)` in
> >> a follow-up if you prefer that style.
> > Yes, I think that is better. And it is also better to put this block
> > before the "if (generic_inputdev)" block.
> Thanks for the suggestion. I would prefer to keep the backlight
> unregistration after the generic_inputdev cleanup block.
>
> loongson_hotkey_resume() accesses backlight_dev, and that resume callback
> belongs to loongson_hotkey_driver, which is only unregistered by
> generic_subdriver_exit(). If we unregister the backlight before that bloc=
k,
> the PM callback remains reachable while its backlight_dev dependency may
> already have been released.
>
> The backlight device itself is independent of generic_inputdev. The
> ordering is required by the hotkey PM callback lifetime, rather than by a
> device dependency between the backlight and the input device.
>
> I think keeping the teardown order as:
>
>      generic_inputdev/generic_subdriver_exit()
>      backlight_device_unregister()
>
> is safer.
OK, go ahead please.

Huacai

>
> Qiu Luo
>
> >
> > Huacai
> >
> >> Thanks.
> >>
> >> Qiu Luo
> >>>> +       backlight_dev =3D NULL;
> >>>>    }
> >>>>
> >>>>    module_init(generic_acpi_laptop_init);
> >>>> --
> >>>> 2.56.1
> >>>>
