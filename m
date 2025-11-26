Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAD23B2A0
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 04:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764132537; cv=none; b=CANp2we5qIcX1N1JMsL6fHK2dxPXXfL5030iTRCO3nJwGoi64I+j4rJvVJp1HTK1iGGYBiz5gbpguK5iolOu52Ihb1DyZl5GUBoVNqFuum93AUPjuyGMe0D4T3zpd0p4gGaX4WcUTdRuQMZstYpUssW0RACm3Enulwe92ZSX03A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764132537; c=relaxed/simple;
	bh=ImLvybmUHkTYp36WFzk33B+8/5eWQeaHdKTdwrZEMNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTH5djwErvvhvi9/LoEhHWw0MMVRRI4xQU8TPwNjJd23w59am11tvwUOM9xLRvFHv6nGmYpW2YfXfbiCKoP3XLIgUcHhlr/EjSpXRpryoq3RhfcKwsHS3IPzKIVxA6S21frnqtwfdmJIoYgqbvRiMKVbfWRNo6IaLoUFScYFVNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDDUAHBs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDDUAHBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8BEC4AF09
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 04:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764132537;
	bh=ImLvybmUHkTYp36WFzk33B+8/5eWQeaHdKTdwrZEMNU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sDDUAHBsr2VyGUcKuZBnWwDM1rbpuGjXY6GHu3CznZbr2SS3sqR0vk1kB6oTia1Qj
	 Dj0fSgZgce2RJHnH+Wl7qEXkJ+nl1yzgAUz5JvAU5/Tfi+l4eU86jdmutYBZkHd7XD
	 geoYy6LHx5e/0XXpm/fuRx3CE+1u9kZcIVWHQL0sdLHh63lcJLSBWpS2xmlIJ8p84w
	 992M3oJFu2KH10THXu+CHsglzHjYniMkE9fxkI5HhlG8BexQ8mPD25W0mvHJh1Y3wC
	 XxpkDXT5cs8NTq8xkLys+P5/wGnwmxp5hyALI3i+Dkv63/2cR3mgMIyBnyb618oQiB
	 0uyEnuOStk3Pg==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b739ef3f739so562884266b.1
        for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 20:48:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW6Qhpm0mdCdWtoS2sB5mGZb3BGShDPiM24n61idprZkOuYQvIfGLqJrTjkZfTHfyo4q7EpjtP3DfA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRzGDe+fWLI/3Z4MbtSEX0W80PWOZYkIJjFndID0z+NH73//vE
	L1ratAg/0h+9UJouoOh2MySceg3H6Qw6/YlXvfVMOhRl3K2KLhlDfsBMX4YRJRmKo8O3ueJd60m
	/QPImtX1pe7QPfZf/XtetXaLEgfwycnk=
X-Google-Smtp-Source: AGHT+IHISDHqPYK4bDvs85R3rZwhcTlzbHbtZulWaALsMx1T8W8ONvKvbVY+uQS+t375B7vpuH1Iy5Y7KYrGZmF0GOk=
X-Received: by 2002:a17:907:3e86:b0:b73:74b4:f236 with SMTP id
 a640c23a62f3a-b76c563c190mr549213266b.46.1764132536028; Tue, 25 Nov 2025
 20:48:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126023631.3143434-1-maqianga@uniontech.com>
In-Reply-To: <20251126023631.3143434-1-maqianga@uniontech.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 26 Nov 2025 12:49:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4EOTwn3fSJHWOkahgO3VHPGN9k9mbY7akpHDny_sBOsQ@mail.gmail.com>
X-Gm-Features: AWmQ_bn3Wg8SjoZzvesHZRX71Qqy3Oa1C17ticajIMtuabjoo7PpXJKicw1dnz4
Message-ID: <CAAhV-H4EOTwn3fSJHWOkahgO3VHPGN9k9mbY7akpHDny_sBOsQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Correct the calculation logic of thread_count
To: Qiang Ma <maqianga@uniontech.com>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qiang,

On Wed, Nov 26, 2025 at 10:37=E2=80=AFAM Qiang Ma <maqianga@uniontech.com> =
wrote:
>
> For thread_count, the current calculation method has a maximum of 255,
> which may not be sufficient in the future. Therefore, we are correcting
> it now.
I think you should contact the Loongson BIOS team to confirm they will do s=
o.

And we can hardly meet the case that one socket contains more than 256
cores (this is different from the case MAX_CPUS > 256)

Huacai

>
> Reference: SMBIOS Specification, 7.5 Processor Information (Type 4)[1]
>
> [1]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134=
_3.9.0.pdf
>
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> ---
>  arch/loongarch/kernel/setup.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.=
c
> index 25a87378e48e..760f5ce44384 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -56,6 +56,7 @@
>  #define SMBIOS_FREQLOW_MASK            0xFF
>  #define SMBIOS_CORE_PACKAGE_OFFSET     0x23
>  #define SMBIOS_THREAD_PACKAGE_OFFSET   0x25
> +#define SMBIOS_THREAD_PACKAGE_2_OFFSET 0x2E
>  #define LOONGSON_EFI_ENABLE            (1 << 3)
>
>  unsigned long fw_arg0, fw_arg1, fw_arg2;
> @@ -120,13 +121,19 @@ static void __init parse_cpu_table(const struct dmi=
_header *dm)
>  {
>         long freq_temp =3D 0;
>         char *dmi_data =3D (char *)dm;
> +       u8 thread_count;
> +       u16 thread_count2;
>
>         freq_temp =3D ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
>                         ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & SMBIOS_F=
REQLOW_MASK));
>         cpu_clock_freq =3D freq_temp * 1000000;
>
>         loongson_sysconf.cpuname =3D (void *)dmi_string_parse(dm, dmi_dat=
a[16]);
> -       loongson_sysconf.cores_per_package =3D *(dmi_data + SMBIOS_THREAD=
_PACKAGE_OFFSET);
> +       thread_count =3D *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
> +       thread_count2 =3D *(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE_2_OFF=
SET);
> +       if (thread_count !=3D 0)
> +               loongson_sysconf.cores_per_package =3D dm->length >=3D 0x=
30 && thread_count =3D=3D 0xFF ?
> +                                                    thread_count2 : thre=
ad_count;
>
>         pr_info("CpuClock =3D %llu\n", cpu_clock_freq);
>  }
> --
> 2.20.1
>
