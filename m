Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D63F1F7586
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236136; cv=none; b=PiTvmSjqsecknmdMym3YBkfxC6hH2UpiwIXg59YH+MdAicPa9OTi42AICw50+fZA7Hi/msyEQ39069CaJBngTGacW/qprnDNtJXBRmXMc3lER0PeM0/wjaK1XR3EUgCmIvQdVN7USdrVKrdomeBs7VNTO8sl6QpvuXY3w5vCjlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236136; c=relaxed/simple;
	bh=n2INqwVk+yd638BkYDnumeQLGEodatU+jYeMcDaMneo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnNeiCeEc0s3dnU61Yvua6JnIa5Rto3GkE0Pcax+eOo9Hpwq0xuqmfpFhldAsU5suCs12U/kYak/Qu52tCphgMZeXAq96sgWSSYanv8WzfE9k76eaJsYSC5pgVHvUQhpUuKr88CwoIusQqalXZr1wXHe/ew8uzQyq3YlwegMvkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPTCdv/D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPTCdv/D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3736EC113D0
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764236136;
	bh=n2INqwVk+yd638BkYDnumeQLGEodatU+jYeMcDaMneo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iPTCdv/DwPeb63wRgd3kInr5wSfQWwkRu2XFH8HFEF+8+DijBuFjUd+4dRiEydCml
	 3yLChKwptoBUauQZtiojhweYRsEvwP3xLvqpcdKMtLWERyVvnmlQszt745/GMjXnwk
	 /j4fUqJZQeOTMEXJgm5t1JkHtH8k+xnSIe4dMeapC7GUaS4cAdhFlD2JGtEfUFLzIZ
	 sd2nmdZZr0UmNcNjLV/zRFqmeQgcGAqM0UsFwxNbk7Un50wvxc9JflNtoILkD31yAf
	 JvMQlNijcou7cz4BLY8ZbQbxp3qNl7/muhKyO9E8DpPcpTk2Nx2O8IF0LlqM2/q8Ry
	 cN4MISN37mwGw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7277324204so117123266b.0
        for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 01:35:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxv/2doBcJSbOlBAatMFGoKoz1MSBIkv4Xq2R7fleKTHZ4NkBPIBcPwvlQ+BNlhT2KzyM+no3PiJc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeD49ty3TCACF5UQk3v5MsNBOgl3PmbKyf4QBKUrcKFI3k+mo1
	LWPUA45YPOrwQ0rsR1njbjSHgC9sNSf8Z+LoxMEb4XwyhrG6TeKUg44zt1GFMY87phZf7W7jc4U
	jGg774eai7FGz3i88bl+8uKS+3ScgNQE=
X-Google-Smtp-Source: AGHT+IGDIB5pgctGSuz/rIURQTh7/DH1tKuNSADJJflizNdnW1oAKQobYUr2GZtSIg6xdkR19qKp/RGITFkBlsvgToA=
X-Received: by 2002:a17:907:1c91:b0:b73:74b4:f21a with SMTP id
 a640c23a62f3a-b76c53bfd76mr901371266b.13.1764236134783; Thu, 27 Nov 2025
 01:35:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127033123.3445519-1-maqianga@uniontech.com>
 <CAAhV-H6vmQpBhf5qiBg9C1SMSOy3O5hd6RnPc1B0Yg3r3+exSA@mail.gmail.com> <B2E7E43661ACD241+64a342c7-66c0-4564-92c9-405bc0cd911b@uniontech.com>
In-Reply-To: <B2E7E43661ACD241+64a342c7-66c0-4564-92c9-405bc0cd911b@uniontech.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 17:35:40 +0800
X-Gmail-Original-Message-ID: <CAAhV-H51t3FT6y8iYOU02FOoZ5dNsqwdpqjaWWwiQwhhuUbbYQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnQc1KsHaWLOdtWlKwTV4MJ-daW_V1DRWkzjjJQMBuJeJGhbivLuNEY5NY
Message-ID: <CAAhV-H51t3FT6y8iYOU02FOoZ5dNsqwdpqjaWWwiQwhhuUbbYQ@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Correct the calculation logic of thread_count
To: Qiang Ma <maqianga@uniontech.com>
Cc: kernel@xen0n.name, hengqi.chen@gmail.com, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 4:56=E2=80=AFPM Qiang Ma <maqianga@uniontech.com> w=
rote:
>
>
> =E5=9C=A8 2025/11/27 15:36, Huacai Chen =E5=86=99=E9=81=93:
> > Hi, Qiang,
> >
> > On Thu, Nov 27, 2025 at 11:32=E2=80=AFAM Qiang Ma <maqianga@uniontech.c=
om> wrote:
> >> For thread_count, the current calculation method has a maximum of 255,
> >> which may not be sufficient in the future. Therefore, we are correctin=
g
> >> it now.
> >>
> >> Reference: SMBIOS Specification, 7.5 Processor Information (Type 4)[1]
> >>
> >> [1]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0=
134_3.9.0.pdf
> >>
> >> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> >> ---
> >>   arch/loongarch/kernel/setup.c | 9 ++++++++-
> >>   1 file changed, 8 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/set=
up.c
> >> index 25a87378e48e..8dd25fc4bd13 100644
> >> --- a/arch/loongarch/kernel/setup.c
> >> +++ b/arch/loongarch/kernel/setup.c
> >> @@ -56,6 +56,7 @@
> >>   #define SMBIOS_FREQLOW_MASK            0xFF
> >>   #define SMBIOS_CORE_PACKAGE_OFFSET     0x23
> >>   #define SMBIOS_THREAD_PACKAGE_OFFSET   0x25
> >> +#define SMBIOS_THREAD_PACKAGE_2_OFFSET 0x2E
> >>   #define LOONGSON_EFI_ENABLE            (1 << 3)
> >>
> >>   unsigned long fw_arg0, fw_arg1, fw_arg2;
> >> @@ -120,13 +121,19 @@ static void __init parse_cpu_table(const struct =
dmi_header *dm)
> >>   {
> >>          long freq_temp =3D 0;
> >>          char *dmi_data =3D (char *)dm;
> >> +       u8 thread_count;
> >>
> >>          freq_temp =3D ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
> >>                          ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & SMBI=
OS_FREQLOW_MASK));
> >>          cpu_clock_freq =3D freq_temp * 1000000;
> >>
> >>          loongson_sysconf.cpuname =3D (void *)dmi_string_parse(dm, dmi=
_data[16]);
> >> -       loongson_sysconf.cores_per_package =3D *(dmi_data + SMBIOS_THR=
EAD_PACKAGE_OFFSET);
> >> +       thread_count =3D *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
> Yes, this one should need to be converted:
> thread_count =3D *(u8 *)(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
> >> +       if (thread_count !=3D 0)
> >> +               loongson_sysconf.cores_per_package =3D
> >> +                               dm->length >=3D 0x30 && thread_count =
=3D=3D 0xFF ?
> >> +                               *(u16 *)(dmi_data + SMBIOS_THREAD_PACK=
AGE_2_OFFSET) :
> >> +                               thread_count;
>
> This patch method refers to dmidecode, which is the same as it, like this=
:
>
>                          if (data[0x25] !=3D 0)
>                                  pr_attr("Thread Count", "%u",
>                                          h->length >=3D 0x30 && data[0x25=
]
> =3D=3D 0xFF ?
>
>                                          WORD(data + 0x2E) : data[0x25]);
>
>
> > According SPEC, it uses THREAD_COUNT_2 only if dm->length >=3D 30 and
> > thread_count =3D=3D 0xff, so the correct and simplest way is like this:
> >
> >          cpu_clock_freq =3D freq_temp * 1000000;
> >
> >          loongson_sysconf.cpuname =3D (void *)dmi_string_parse(dm, dmi_=
data[16]);
> > -       loongson_sysconf.cores_per_package =3D *(dmi_data +
> > SMBIOS_THREAD_PACKAGE_OFFSET);
> > +       if (dm->length < 0x30)
> > +               thread_count =3D *(u8 *)(dmi_data + SMBIOS_THREAD_PACKA=
GE_OFFSET);
> > +       else if (thread_count =3D=3D 0xff)
> > +               thread_count =3D *(u16 *)(dmi_data +
> > SMBIOS_THREAD_PACKAGE_2_OFFSET);
> > +       loongson_sysconf.cores_per_package =3D thread_count;
> >
> >          pr_info("CpuClock =3D %llu\n", cpu_clock_freq);
> I feel there is a problem with this method.
> I saw on the 3C6000/Q machine a few days ago that the dm->lenght is 0x30,
> but only one byte is used, and the thread_count is 128, not 0xFF.
> Is the initialization thread_count =3D *(u8 *)(dmi_data +
> SMBIOS_THREAD_PACKAGE_OFFSET) missing?
Yes, you are right. Kernel code prefers 0xff rather than 0xFF, and I
want to add a comment, so I think the below is OK.
        loongson_sysconf.cores_per_package =3D *(u8 *)(dmi_data +
SMBIOS_THREAD_PACKAGE_OFFSET);
        if (dm->length >=3D 0x30 && loongson_sysconf.cores_per_package =3D=
=3D 0xff) {
                /* SMBIOS 3.0+ has ThreadCount2 for more than 255 threads *=
/
                loongson_sysconf.cores_per_package =3D *(u16 *)(dmi_data
+ SMBIOS_THREAD_PACKAGE_2_OFFSET);
        }

Huacai

> Wouldn't it be better to change it this way?
>
> +       u8 thread_count;
>
>          freq_temp =3D ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
>                          ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) &
> SMBIOS_FREQLOW_MASK));
>          cpu_clock_freq =3D freq_temp * 1000000;
>
>          loongson_sysconf.cpuname =3D (void *)dmi_string_parse(dm,
> dmi_data[16]);
> -       loongson_sysconf.cores_per_package =3D *(dmi_data +
> SMBIOS_THREAD_PACKAGE_OFFSET);
> +       thread_count =3D *(u8 *)(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET)=
;
> +       if (thread_count =3D=3D 0xFF && dm->length >=3D 0x30)
> +               thread_count =3D *(u16 *)(dmi_data +
> SMBIOS_THREAD_PACKAGE_2_OFFSET);
> +       loongson_sysconf.cores_per_package =3D thread_count;
>
>          pr_info("CpuClock =3D %llu\n", cpu_clock_freq);
>   }
> > Huacai
> >
> >>          pr_info("CpuClock =3D %llu\n", cpu_clock_freq);
> >>   }
> >> --
> >> 2.20.1
> >>
>
