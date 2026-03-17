Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8502F362B
	for <loongarch@lists.linux.dev>; Tue, 17 Mar 2026 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763218; cv=none; b=ma8T+T3jKp6wcLmMv3Re8yOZG6MQWugDkZLYgsbRRSh73eibu4RXjnjaMlbZ3VL3NX4ljVMwT4MKMJszg8YxviAQ1GG+iU2m5f9TA3JSg7qCXLYwzl6RKraxg5jFrU/Z52jaxKJ+pkhi5GQYRh6QxCBdA1dX0qi/rlysoty/g8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763218; c=relaxed/simple;
	bh=sIXRyKcBB8QlxcJr7L52j/3CiZELN2iAHmA6Aw4pzm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJKC8muYvAMD8fvPIeDkguPAv68eLTy3kHJvo/vldsDsZysXshresyC1k9CeZbZi/5ChvIRUQLpD/eATn7s7EbTIViy/ITQAS9hXO3XbHFQM8zS2pJM+nevfO2w7GuUNd576+BxNdj32J4agLnILDAU+ToUNA8KNqYUzgiktTzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a133b686f7so725408e87.0
        for <loongarch@lists.linux.dev>; Tue, 17 Mar 2026 09:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773763215; x=1774368015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twLG+LiXs44QUcz9Iwy6OkpeTFkusmg+ejXI1TbxJ+E=;
        b=OIC8xOZk9EuacDYy5Y9P8uAUI9QnR50Ghra3lQ5qeLQ22i7gVIC+hyjvGlJ288gWPT
         DcE+k0V5mm+Bavdas+x6pOXI3v36xkFP0HvxFyPrSPL3ixsYDwkFw7+SvwEd/Q00j7K6
         EeYlcbopZ32Idufzt1HAtmd5HPRvokQ+F7hctFUjOlsDB7V5+2mmRoasg0mMM0zX3lwY
         vyKdhmZVXKrftTk9DeHoBN2oZYfR5PLXuU7/TczJnUoh3ZrDx/Qa8ataqwwEirqkKnkz
         oeBGdte7i/IY+/7tT6M9fiv1a6yxAhE/3rsjvL1YzhZqVgW2VYERA3Qv/vfrmOIMzGBA
         V9Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVijGUncEiCEiRYd+XsFf9i4Y37DhJg3Rlthj/RbFnE9LSwroxrY1zFxaVraZhnH6teeHRp/OMKhVs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLtcomGWAhBnyCcVMMjei0tJ/ZSKHRxpMRWkVvUV+HXlJidoHJ
	NvmOCG//21u3YzUnic3fKHc1P4OEDrl6yPTniggbPr7o4g7p9LOSFbOIlFuS8K9szf8=
X-Gm-Gg: ATEYQzwpku4BG+VLo3s7kPFsplnl2oIbzVLR81PHxsCyE6Z4NN9e48SMCk10R4WDRr2
	xmmzmQztj3F98ok62hRpL9uL2J643Qns25Ra37kGicPVsQFylNnTOMUgJQr1MxXfPATiH4/pPCP
	MWHgKX96catfd61hS8EpxkV5tiJ8hg27ptnq4+hZ5vd/rKU+YIZJq4C5iKH/NrI2cbl9mfw40vT
	tCRR0mzwN1mfOpkBBplnC32UasEprmbIPCQbYTlGwEY62tBggoxo9n5jojO2tNFQ4XA+rddEYes
	RJVZDakJ4xrqt/VFDm+bpCODQJ/UWtmLBbirkYB+hVmm3Poz8zFNJwjyBYPbOsaxJ0sN+AW8sC4
	ZbibBKLiRV72D9YKLLtbKCJ5f00rsdDjugppZ3fAwgMn2QErTcuhvQa8a56g2En1KyZ4zDurcAE
	7ou625edLsz/zM/H06QITWJj0ANd4v7rDbfdJLC0w0IpbJZJ4/Dc5ajXdK/5Sy
X-Received: by 2002:a05:6512:3d1e:b0:5a1:2a20:9255 with SMTP id 2adb3069b0e04-5a2795909a9mr44795e87.18.1773763215160;
        Tue, 17 Mar 2026 09:00:15 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c15sm4065703e87.17.2026.03.17.09.00.12
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 09:00:13 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a107b387a5so7525775e87.2
        for <loongarch@lists.linux.dev>; Tue, 17 Mar 2026 09:00:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAb/ULzoayNTLccmhku2XYBBip7RY5BXF8neGjGVR08QveKKkAoO9iHC7oKFfaTCgNScXaUIRlGMU=@lists.linux.dev
X-Received: by 2002:a17:907:d1e:b0:b94:1d92:7eb with SMTP id
 a640c23a62f3a-b976505a45fmr1113540866b.18.1773762847178; Tue, 17 Mar 2026
 08:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org> <20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org>
In-Reply-To: <20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 16:53:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV50nOT06wKfj_X5LU2z=1XZZGd6Gac0C41qWWNZHRLXg@mail.gmail.com>
X-Gm-Features: AaiRm53kA4BcUnu8DzmJWc_bmCImw2GJpSjbqTP7vNJFqk2-PxsMkq0NOVh2FgU
Message-ID: <CAMuHMdV50nOT06wKfj_X5LU2z=1XZZGd6Gac0C41qWWNZHRLXg@mail.gmail.com>
Subject: Re: [PATCH 3/9] configs: remove obsolete assignments to CONFIG_NFS_V4_1
To: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Mikko Rapeli <mikko.rapeli@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, Heiko Stuebner <heiko@sntech.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Sricharan Ramabadhran <quic_srichara@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Anna Schumaker <anna.schumaker@oracle.com>, 
	Alexandre Gonzalo <alexandre.gonzalo@arm.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hi Vincent,

On Tue, 17 Mar 2026 at 10:16, Vincent Mailhol (Arm) <mailhol@kernel.org> wrote:
> CONFIG_NFS_V4_1 was revomed in commit 7537db24806f ("NFS: Merge
> CONFIG_NFS_V4_1 with CONFIG_NFS_V4"). However, some defconfigs are
> still referring the old configuration.
>
> Clean-up all the leftover references to CONFIG_NFS_V4_1.
>
> FYI, the suppressions were done using:
>
>   git grep -z -l '^CONFIG_NFS_V4=' -- 'arch/*/configs/*defconfig' |\
>     xargs -0 sed -i -E '/^CONFIG_NFS_V4_1=/d'
>
> CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN and CONFIG_NFS_V4_1_MIGRATION
> were not in scope of the renaming and still use V4_1 in their name, so
> keep those two untouched.
>
> Fixes: 7537db24806f ("NFS: Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4")
> Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>

Thanks for your patch!

> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -217,7 +217,6 @@ CONFIG_TMPFS=y
>  CONFIG_NFS_FS=y
>  CONFIG_NFS_V3_ACL=y
>  CONFIG_NFS_V4=y
> -CONFIG_NFS_V4_1=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ISO8859_1=y

Already done, cfr. commit 8c6cccefb33e2022 ("ARM: shmobile: defconfig:
Refresh for v7.0-rc1") in next-20260309 and later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
