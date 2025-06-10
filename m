Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C246E28B4F4
	for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547007; cv=none; b=BZELlxqQgnYkXhYxSbNY6fkagmHc0OKrQgvT4bNvag4g1p+yP8bKpZziCX8liOnROCPLimiNvi8N9Fr4piqRQYJaFBnY9THQwIxSGFqyyg5xxWKRjYPvQGX3rZHDw+o528kfDZJp03mc/1179eYuTJKwu2nhKvCxWY5AQCdoeSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547007; c=relaxed/simple;
	bh=T5SuRWpaGQwoZhvlpNpdBYid1/1wMrEkOat2uWnCvtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ck3Ct6sbvu9e/jmSdsKZ7Y6wA+JIsNy3zVoP5KLayMI4olSXcpE1z1VBHays+/nJ3T2RMtojpq8pN8x9JuAOmrb0AKJYJugc1nogjIhDVYTnSPifJjVKW8g8nMUHOjSQlSfVBv5hUoLh/WCxborfIPOJuxWW8bEYXqE1jGY7EHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5311937292fso87712e0c.3
        for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 02:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547003; x=1750151803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXmJAjCM4QXrI8PFxZnnSaMVzam0rKL8btuAAYmyx5Y=;
        b=jjDGw6ZMO+VMuxwScaTS0JmPJc0+k2kvAAzZAbeZYpNQgwsqaiDe8UehdpLjbMlA19
         4Oj+ybSn/GeA1r6/ARw4riIMhc0GGTEqYQM5fmLvfzrFOWj82LEk/+o+nV+vpSrV0IfF
         rGen31Q3scy5ygFhHsfNr4tsabaTSCsjVM2iVGnzYnuWP41TMG9SXIu736GsltVjSNgG
         byeqi+8nEbIg7kcq7jVeraxAvP+zcAmzdQ9XZK/0MprVvUGipnwQemF+kL4I2Gcjhh6c
         xC0M2zvJLLQ8hNDzct2F9T5byuX/yxIfK2NokfiUIWW2Zd1xc4EWICmlu2fmmm2DBeFW
         SNUg==
X-Forwarded-Encrypted: i=1; AJvYcCWBve+eiWi3ceu8uKn7WizqWGvNMNkEAr0cFDtvUrbohlUdgaVtJVfrFZMVMF4EdrP7ltO8DlFEq10=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFMLLHqdMEElVI3NgOm1ZHLo0WE2tvLbNdDqC/vxQqP4j5SUfK
	Cc4/9CRX1BcapLxARvGjToy8TGDByU2lnI0i6MOdc88CcWsZp0bTB1P4tMt56sea
X-Gm-Gg: ASbGncstWqvvh0/2PaLOk+s3thXq22QhQAco6M2BHiUfmM0UU8jk+jioPAnMQERsspU
	BynF/M+PM+KhZkur14NKsiuJ8Qiz+vIvCip7g9VqeuPMyhRi6gXWPJZ+UDBg/rpRka2dOTcephc
	QcOCzvL/LgkUFZJqCapnYzNcrqNih1jXglLn9h6G4KQ2qRwzqtqMlBwn1ljED4ljqe3bggyyhEs
	AmsJUH53i5Ba8MavkUtJlE9dfp/tw1pZWwkNRvRl+ERdiWigKb3+KqNH4ZmElywoxc+QEHFkgev
	lJJB1R2fDafj9fwODwqq2kXUI45+MZQTzcwJs83xBklPN83qjcPYiTYR8jmXoYlOgpAyA8hi9ER
	Mx10Q5DgJ9A65jl3fZeFj41r6oBj7
X-Google-Smtp-Source: AGHT+IHAsMRDcJcbO0slvA9gsx/fTtSs4KG9G0xW0xK/dOusrDQFFMans5cqlbjvOzDVcSF7a2Ufnw==
X-Received: by 2002:a05:6122:828b:b0:523:e9d2:404d with SMTP id 71dfb90a1353d-530e48c7ddfmr13461163e0c.11.1749547002693;
        Tue, 10 Jun 2025 02:16:42 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53113bf5b08sm944677e0c.23.2025.06.10.02.16.41
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:16:41 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5311d362528so20865e0c.0
        for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 02:16:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwXkyVeWrtaHTIsvKu19XcrnRcCklA0ojjE+PDzL1VQMu4UmweyTBb2nQptQL3A7mdb9rnSQJPbnc=@lists.linux.dev
X-Received: by 2002:a05:6102:943:b0:4e6:ddd0:9702 with SMTP id
 ada2fe7eead31-4e7729a3b75mr12821267137.15.1749547001193; Tue, 10 Jun 2025
 02:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250422234830.2840784-1-superm1@kernel.org> <20250422234830.2840784-3-superm1@kernel.org>
In-Reply-To: <20250422234830.2840784-3-superm1@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Jun 2025 11:16:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com>
X-Gm-Features: AX0GCFv1stbSgApzqPSScCybuPZoPnTcTv0OURpXKeqUfK7lSULXavQbaabojaE
Message-ID: <CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] i2c: piix4: Depends on X86
To: Mario Limonciello <superm1@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <mario.limonciello@amd.com>, 
	Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede <hdegoede@redhat.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>, 
	"open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mario,

CC mips, loongarch

On Wed, 23 Apr 2025 at 01:49, Mario Limonciello <superm1@kernel.org> wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> PIIX4 and compatible controllers are only for X86. As some headers are
> being moved into x86 specific headers PIIX4 won't compile on non-x86.
>
> Suggested-by: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks for your patch, which is now commit 7e173eb82ae97175
("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86")
in v6.16-rc1.

> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -200,7 +200,7 @@ config I2C_ISMT
>
>  config I2C_PIIX4
>         tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
> -       depends on PCI && HAS_IOPORT
> +       depends on PCI && HAS_IOPORT && X86

Are you sure this south-bridge is not used on non-x86 platforms?
It is enabled in several non-x86 defconfigs:

    arch/loongarch/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=y
    arch/mips/configs/ip27_defconfig:CONFIG_I2C_PIIX4=m
    arch/mips/configs/loongson2k_defconfig:CONFIG_I2C_PIIX4=y
    arch/mips/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=y

The loongarch and loongson entries are probably bogus, but I wouldn't
be surprised if the SGI Onyx and Origin do use Intel south-bridges.

>         select I2C_SMBUS
>         help
>           If you say yes to this option, support will be included for the Intel

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
