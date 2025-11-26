Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43302F9DAB
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151618; cv=none; b=dDgfACjUSLjqIEHOPaWCrld7Nw6fh6FLH2HRe90fQKyDhzAWhWr2LS8RaSehCsFEddlEoV1U4AYvTdc5HeWa5E4zVuxpeWNTmQQgbHCTStI+42zHQjGRo/X1hoouKtrwdep+tfqS/++UWINVCINYL4bB7PlkdL7GUT5mIlbHXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151618; c=relaxed/simple;
	bh=MglHPffmY5ZqFAJHay2spb4Cr+eSaSo+9twXcuXE42w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chI0P/CNLofo70fXePddAN0dJzT+e7wlD2jXX32gVhzOWAFSkLN4Fq6GqbWpnug3PPPwjjyodHWWIZzmbvY/ob1WvwbqFW+if52QmmCYU2nb1JLtwBzuSSZ0xuwWcsHmEHV7Hr4rvGh4bZ8mgbO8nOuoHoDJdLF2hHZN8u4pzl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjVVjZN8; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjVVjZN8"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3ec47e4c20eso3957516fac.1
        for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 02:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764151614; x=1764756414; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiiC80+HVvL14Mw6SEnINW/7zdg6mTweCkDtkC5YcZ0=;
        b=AjVVjZN8zH3pe0O50WjiOUYNgzK97JmxCiup4pr2L+NA5haPF2xI2rwDeT3CGqe0/h
         XD1zfJ6fJFfmVPDpuRsVlQ9D3dCkslN7EopkZ1pbxlyZJ4djHf9pzcTqix6+N2X4HGud
         3SiUD7S7PdyksrfuZNyjY9dzZolXZqb346NaUbHX+Sv9rlOqIiW+f+Dabk8DZb70Vrqs
         vBzssLlq28zI/2V7ga8Vecmbhe+3ByxbJXCsDZv+VPfSueGjIDIZtWvOwd/VvyLOA/Qc
         lLWy2e71a/eso4g00j00DD7ffnqtJYebqSQpWjgaey5tn4trgwn2q8r0Gw8mXhvBWHQi
         Pncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764151614; x=1764756414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XiiC80+HVvL14Mw6SEnINW/7zdg6mTweCkDtkC5YcZ0=;
        b=Ax0+gqqAFKd9GvrEKqO00aDExX0930YRcLZWt0onaDMlqjVUlpxkvJR74Gs4Y4G4ww
         O2LTuE1f+AIXjuFNcWYUCCypibnbbKRkkWQIwBPS/ckvXmpUPnICl4zSvivEB7R7U4YB
         RAvJWXR8ThbMYkuncTxrcTKx0hCM7x5bNPL//sywOtreI//rec5o/HKzzeprE+bKRRQN
         ohTvjs6A5wJanxI2i4LsX0//ZPrpOnVOUf+wA1/wYfy2hPXA+Iw1noyMjMGq1/HmH0q+
         wCvQynzf+ywzILtcW3/w0ky+4Y6IG0VOqJc5WQyX57BQb0LAPHdfa3UNZPoXtoBUbtTJ
         G4bQ==
X-Gm-Message-State: AOJu0YyGKETRkQSg1SIZcL83o3kdpF4UFzbr7StemnZAALb+ZbW1foR0
	mlYgeFeNmc9KIxdfpJAOPSrA3q4L44S9Ua8Q5fl6c82dZdDCobKgkLmMIp89Vh743rvxGmFQsVP
	NJQrnIJ1zmTfE4T/feawLmWsjjpBWbIU=
X-Gm-Gg: ASbGncs3XMiZj8ZtkoXDbcuwBsxwPp5lkrGlAP63wtfYigHpXvRavdYsHjtLxx6/R5S
	fN3OxKb/TDpLvkQiSWgNW+8ytm2tXvgfG7X9e0Sct/fCxf8/Jujc+qF+uHTaF5VeeFaYaFe19zC
	Iiluuah9lgQlYpWreQNGDXUFrBT450jgNBMZGCvHFwFYZpms2A2TlYoHiitWxJWe/10com1o7D+
	hhYSHjJDC/DKa36wDg+QKGqfvvG61YBLKXaHm3YnzM12ttDpb0MYW8stNNKJKrSdCpFoA==
X-Google-Smtp-Source: AGHT+IEqORt450K9x0eAxxJolAfzMymUN1MwDnoR1mctinemQ/SnAsQrOXyIZYqFNInBcS63ojpGO7pK3f55MDjy7ZI=
X-Received: by 2002:a05:6808:c2d2:b0:450:b1a9:e7ab with SMTP id
 5614622812f47-45112874638mr7117882b6e.9.1764151614477; Wed, 26 Nov 2025
 02:06:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126023631.3143434-1-maqianga@uniontech.com> <1181117654604707+19e1f957-3fd5-4768-a575-397c17d4d1d4@uniontech.com>
In-Reply-To: <1181117654604707+19e1f957-3fd5-4768-a575-397c17d4d1d4@uniontech.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 26 Nov 2025 18:06:42 +0800
X-Gm-Features: AWmQ_bkMUPEmx4E1A7POyRe9iNMXjLBJ_s0XjSRO4qRLYhy-vo3Ft2fLqjkYZQk
Message-ID: <CAEyhmHSqF5DiM2CVyzvAjwTy+KaYAAhwtu2sn1xGWyk4ZF5-bQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Correct the calculation logic of thread_count
To: Qiang Ma <maqianga@uniontech.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 5:47=E2=80=AFPM Qiang Ma <maqianga@uniontech.com> w=
rote:
>
>
> On Wed, Nov 26, 2025 at 10:37=E2=80=AFAM Qiang Ma<maqianga@uniontech.com>=
 wrote:
>
> >   For thread_count, the current calculation method has a maximum of 255=
,
> >   which may not be sufficient in the future. Therefore, we are correcti=
ng
> >   it now.
> >
> >   Reference: SMBIOS Specification, 7.5 Processor Information (Type 4)[1=
]
> >
> >   [1]:https://www.dmtf.org/sites/default/files/standards/documents/DSP0=
134_3.9.0.pdf
> >
> >   Signed-off-by: Qiang Ma<maqianga@uniontech.com>
> >   ---
> >    arch/loongarch/kernel/setup.c | 9 ++++++++-
> >    1 file changed, 8 insertions(+), 1 deletion(-)
> >
> >   diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/se=
tup.c
> >   index 25a87378e48e..760f5ce44384 100644
> >   --- a/arch/loongarch/kernel/setup.c
> >   +++ b/arch/loongarch/kernel/setup.c
> >   @@ -56,6 +56,7 @@
> >    #define SMBIOS_FREQLOW_MASK            0xFF
> >    #define SMBIOS_CORE_PACKAGE_OFFSET     0x23
> >    #define SMBIOS_THREAD_PACKAGE_OFFSET   0x25
> >   +#define SMBIOS_THREAD_PACKAGE_2_OFFSET 0x2E
> >    #define LOONGSON_EFI_ENABLE            (1 << 3)
> >
> >    unsigned long fw_arg0, fw_arg1, fw_arg2;
> >   @@ -120,13 +121,19 @@ static void __init parse_cpu_table(const struct=
 dmi_header *dm)
> >    {
> >           long freq_temp =3D 0;
> >           char *dmi_data =3D (char *)dm;
> >   +       u8 thread_count;
> >   +       u16 thread_count2;
> >
> >           freq_temp =3D ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
> >                           ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & SMBI=
OS_FREQLOW_MASK));
> >           cpu_clock_freq =3D freq_temp * 1000000;
> >
> >           loongson_sysconf.cpuname =3D (void *)dmi_string_parse(dm, dmi=
_data[16]);
> >   -       loongson_sysconf.cores_per_package =3D *(dmi_data + SMBIOS_TH=
READ_PACKAGE_OFFSET);
> >   +       thread_count =3D *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
> >   +       thread_count2 =3D *(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE_2=
_OFFSET);
> >
> > You have `dm->length >=3D 0x30` below but the memory load already done =
here.
> After reading thread_count2, it cannot be guaranteed that the data is val=
id.
>
> 'dm->length >=3D 0x30' can detect that thread_count2 is an available data=
,
> right?
>

I mean you should perform the check before doing memory load.

>
> >   +       if (thread_count !=3D 0)
> >   +               loongson_sysconf.cores_per_package =3D dm->length >=
=3D 0x30 && thread_count =3D=3D 0xFF ?
> >   +                                                    thread_count2 : =
thread_count;
> >
> >           pr_info("CpuClock =3D %llu\n", cpu_clock_freq);
> >    }
> >   --
> >   2.20.1
