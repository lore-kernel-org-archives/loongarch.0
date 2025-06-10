Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D52221FB2
	for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 16:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574767; cv=none; b=Dhb0pE7tXGFmbq7xu+t5ajMTPfSKv8Kffg/KHy3U8BMZ4A5dv2qWBBDXCqH6j4+GOPtak1bwQh1avBql70QCVLQUACBQRm2m2zKntfGZSZLr2Zs5WXvzS26LYrMsJjZX5qANE3e+QUv8PH8ldpkPJyIs4or8QEauY7ULFaaqzNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574767; c=relaxed/simple;
	bh=8fC38WprT2pWuEMPIy2gX/nxyA60Ti5bdwYYQsusNps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sLZN+CcVUaiSgAizW7bjXSxmvACU3marLlm9JlSAAiiD4WmqbgEIuB6e7Df7tdHthiB8NahSDNgPpGQbtAEwSeC1xA5ltNJNiyuGZQtWPPpVYu34pB8Wblb5zsNsJYqFjeXB31IeGqqOn13lGxRInRPh1fpjnppiFoGGTqNbnuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87ecdcab9ebso627068241.3
        for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 09:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749574763; x=1750179563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9I8GBRTfKx+eWF19Xfo69kH8HTUqvrSIpR7dFGCvUo=;
        b=f3ZBRLxQ+icNWW6Dr1Ogr5DRegRphpoIymS7w67asVeKaumeXAkWuFaXGm8Cdd5H9y
         9t00UBwuGv5Fk5kCFTlLXpIkJJMIYMxmSX2a7fzl5ClIKWR99Y8MAe3yy0q7MWzUxjb0
         icCtkoCpCwk8PbbymLezHUH4cNnTD4ZKLr5Oz+xGb8ki0ZkulXPVYp4YFvXsodff9E1E
         7X3/vz5jqWcbWxvxw/qovbxpR28Qoy/AdRpIirkRAKax2ralKUnepU9a480lqt/2CZ8S
         rdtqGaBDNVttSV8MIyeGf1gt7ogs9O/RWdoB11rPTpgNYmg1ULHf/h1i88tRgqw9XZzB
         FU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUh1O4Cd/UzwmJJR4gGrA2xy+dyhW8GqhSZj8qSVZJuB/3W6GYXrDzLmr8PW0dBHoZ603kdb42klXE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxwrb6PJXi2V2+4w/NtY790951CzBUYRyXN7Gu/awR+BeTlT2h7
	o3MYE8VKrQVxeVu9BvKNv+VVCZk7vvDhr4PAOAo7/z/gykVrLmLewWoL89rLlb+Q
X-Gm-Gg: ASbGncvqEiUGuKaqFE1D9wj9OGGDVoW5tI4DCdHWJgx/cUqboNR3JK93VlLSH+1DwEw
	XRQskszdTqW7LBxxTHWV9f7VshqFg+xcLvF9Q5M5/aVxGWQU+gEgcxbe2U/nJD4rC7cFDj42wCq
	6tQFAfH1+kuTQ+H1PWqzOexMD21IxmdL2qb3v7Bl/baMlQgD+a9a/LLEoJ7IlUva3liYy3yHp9o
	tD5FJ9qCzrO/4EAeBxmhJ7GcJgODadybkUVQUv/BEX49sYGGB5mo6U7KSB3ABH0K+L6LzhjF/2J
	kMZPD+GDyCKhu5qvHY0ry5DqJHaki7kMUbJ4/t+rTSPywVxg5jt2508xt+2zWp2sxz5cwKNIQ1g
	cRQOZlKz1g9Gb32Px9X1SjGID
X-Google-Smtp-Source: AGHT+IFX5WFtEgjGEQW9rb8yPzL5f5OaTyrCzqEN7MtFyYKAPMb2o71dF0DwZQ9wZ5ZPJlGeODkR8w==
X-Received: by 2002:a05:6102:3f87:b0:4e4:5ed0:19bb with SMTP id ada2fe7eead31-4e7a83a6173mr3111666137.22.1749574763413;
        Tue, 10 Jun 2025 09:59:23 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87eeaf97ea2sm1492633241.34.2025.06.10.09.59.22
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:59:22 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4c9cea30173so1961823137.3
        for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 09:59:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVq+U+ba90pEC/QCNQPH/zkm/lvxVAE90oz3qkuwO3yStz9M+4hN2j38nNYmNnileHSFaFP5VSM4Rk=@lists.linux.dev
X-Received: by 2002:a05:6102:26c1:b0:4e6:f7e9:c47d with SMTP id
 ada2fe7eead31-4e7a837baccmr3288817137.21.1749574762567; Tue, 10 Jun 2025
 09:59:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250422234830.2840784-1-superm1@kernel.org> <20250422234830.2840784-3-superm1@kernel.org>
 <CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com>
 <CAAhV-H70LXsDYMA7wz4x828rEFoJsNX0=m8F73Ge9=yfpzBpZQ@mail.gmail.com>
 <24febda9-6360-459f-82d3-6fba9ed9be83@kernel.org> <30a7f1a6-1e04-4fc5-9bea-e2b5956b28b7@kernel.org>
 <1e06c620-8f8e-4ddf-8356-0782bccd63a2@kernel.org>
In-Reply-To: <1e06c620-8f8e-4ddf-8356-0782bccd63a2@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Jun 2025 18:59:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtrJn0i5ehBSq85+gTZ7fmeeQ=r-8fzV4GRFvmgOY1DQ@mail.gmail.com>
X-Gm-Features: AX0GCFvpdglJ39T9DZCon202OR6EMGtUfWEMmg5Bmv4fBETAUsiuRMtz0OZRCPA
Message-ID: <CAMuHMdXtrJn0i5ehBSq85+gTZ7fmeeQ=r-8fzV4GRFvmgOY1DQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] i2c: piix4: Depends on X86
To: Hans de Goede <hansg@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <mario.limonciello@amd.com>, 
	Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>, 
	"open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, 10 Jun 2025 at 16:55, Hans de Goede <hansg@kernel.org> wrote:
> On 10-Jun-25 16:53, Hans de Goede wrote:
> > On 10-Jun-25 16:12, Mario Limonciello wrote:
> >> On 6/10/2025 2:24 AM, Huacai Chen wrote:
> >>> On Tue, Jun 10, 2025 at 5:16=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> >>>> On Wed, 23 Apr 2025 at 01:49, Mario Limonciello <superm1@kernel.org>=
 wrote:
> >>>>> From: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>
> >>>>> PIIX4 and compatible controllers are only for X86. As some headers =
are
> >>>>> being moved into x86 specific headers PIIX4 won't compile on non-x8=
6.
> >>>>>
> >>>>> Suggested-by: Ingo Molnar <mingo@kernel.org>
> >>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >>>>
> >>>> Thanks for your patch, which is now commit 7e173eb82ae97175
> >>>> ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86")
> >>>> in v6.16-rc1.
> >>>>
> >>>>> --- a/drivers/i2c/busses/Kconfig
> >>>>> +++ b/drivers/i2c/busses/Kconfig
> >>>>> @@ -200,7 +200,7 @@ config I2C_ISMT
> >>>>>
> >>>>>   config I2C_PIIX4
> >>>>>          tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/=
Broadcom/SMSC)"
> >>>>> -       depends on PCI && HAS_IOPORT
> >>>>> +       depends on PCI && HAS_IOPORT && X86
> >>>>
> >>>> Are you sure this south-bridge is not used on non-x86 platforms?
> >>>> It is enabled in several non-x86 defconfigs:
> >>>>
> >>>>      arch/loongarch/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=3Dy
> >>>>      arch/mips/configs/ip27_defconfig:CONFIG_I2C_PIIX4=3Dm
> >>>>      arch/mips/configs/loongson2k_defconfig:CONFIG_I2C_PIIX4=3Dy
> >>>>      arch/mips/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=3Dy
> >>>>
> >>>> The loongarch and loongson entries are probably bogus, but I wouldn'=
t
> >>>> be surprised if the SGI Onyx and Origin do use Intel south-bridges.
> >>> Loongson can use AMD SB700/SB800 south bridges, which have I2C_PIIX4.
> >>
> >> Well we could revert this patch, but it's going to be a compile failur=
e because of 624b0d5696a89b138408d385899dd35372db324b and other patches tha=
t go on top of that.
> >>
> >> My current leaning is we make a dummy fch.h header for these archs wit=
h #defines for 0.
> >
> > Move "fch.h" to include/linux/platform/x86/ so that it is available on =
all arches
> > and if necessary ifdef out anything x86 specific in the C-code referenc=
ing it ?
>
> Correction that should be include/linux/platform_data/x86/

Is that a good location?
It is not x86-specific, and I see no platform_data (struct) definitions in
arch/x86/include/asm/amd/fch.h?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
