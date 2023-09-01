Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA5CC136
	for <loongarch@lists.linux.dev>; Fri,  1 Sep 2023 21:09:20 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-34df2a961a0so7797065ab.2
        for <loongarch@lists.linux.dev>; Fri, 01 Sep 2023 14:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693602560; x=1694207360; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+B2LETBRYo235Gzl9s8FV6KtOjZrwPltfhhztkFxvM=;
        b=gJsotA+U5buiE/nizI67ETFMx3Lt2PFZZZpqYIbOcmy5Oa/vzzuPgOygko7ZGXQY4P
         X6Xy9nWgB4vhw5SF1z42dwGlXly/x3dvyFQJvHYntfC9d5butkltAhcgaNZ606GtKHDE
         kBxSiCC2OlOolgFfvUENqs0JwGuDeltOGGsGxG57gjXLAvgH3zbTLksqIlslKnh/6Ma1
         X5z8Feu4qnETRu4pKYQLPh7Nah07HqKh+Om0UorXvDPVaM++C55vFXoVgcQPHVHFscNU
         QYqMj7pLR4zymqSQmPuyAMGibUOBxb6K0IQx7kvFg1KC/uX45wFEg3gzH3Jgz7t3+13t
         kkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693602560; x=1694207360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+B2LETBRYo235Gzl9s8FV6KtOjZrwPltfhhztkFxvM=;
        b=fAq8ZS2yezPPH0HzDT+yq9AG02gs9UP3e9d2DJsGH/Jpz1acVLiaRY+dW7SBhS2731
         kA9b+BOvzTp53bhQMO8SPrGRapHDlazY9uM5518GtwpsFX2B4TsirWZx9HOw+7U6i1MH
         r2ltYxAq60ILQ8YEbQKsEkGPL8rweDlM5ZZPRKh0gbOaE2w1ySTTDjIOhoxyskWpFn67
         QrBteqVVHoqYQijm29lGAt/kW1HG8k7+zJZXz487EMai9NdJB5h6ZTnwCQ0z0IO1x1h8
         hQXj7FNa0t4e5E3MFVKg7o/bmIKRFiyaFZVBdMM6ezSdJAN7tHsC6y8laN+eVPomWPmv
         3u0Q==
X-Gm-Message-State: AOJu0YwykMgaTBqC6/zJuw6Y7DBrjQuCseskEseOPFrSXr6okmFIvPHR
	F5/9/PSueNsIWvugpqWyyuQ=
X-Google-Smtp-Source: AGHT+IFbTKv1w6p0/+A5JTx82UybC+0oJ7K12y3+bx6yQvYDtzUEGH7puVOtPVweviTp68q8AP2PlQ==
X-Received: by 2002:a05:6e02:1062:b0:34c:cf1f:2a27 with SMTP id q2-20020a056e02106200b0034ccf1f2a27mr4042401ilj.0.1693602559809;
        Fri, 01 Sep 2023 14:09:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f11-20020a056638118b00b0042bb2448847sm1257257jas.53.2023.09.01.14.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 14:09:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Sep 2023 14:09:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	sparclinux@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org,
	Richard Henderson <richard.henderson@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chris Zankel <chris@zankel.net>,
	Tom Lendacky <thomas.lendacky@amd.com>, semenzato@google.com
Subject: Re: [patch 17/17] x86/fpu: Move FPU initialization into
 arch_cpu_finalize_init()
Message-ID: <e0399977-5978-42cd-82cb-67b81f285498@roeck-us.net>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.902376621@linutronix.de>
 <ba1b11e5-b3f0-457b-8920-d57d470626c3@roeck-us.net>
 <6a09294e-2c07-585b-336b-20d07e7e08ba@suse.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a09294e-2c07-585b-336b-20d07e7e08ba@suse.com>

On Fri, Sep 01, 2023 at 09:02:19PM +0300, Nikolay Borisov wrote:
> 
> 
> On 1.09.23 г. 20:30 ч., Guenter Roeck wrote:
> > Hi,
> > 
> > On Wed, Jun 14, 2023 at 01:39:46AM +0200, Thomas Gleixner wrote:
> > > Initializing the FPU during the early boot process is a pointless
> > > exercise. Early boot is convoluted and fragile enough.
> > > 
> > > Nothing requires that the FPU is set up early. It has to be initialized
> > > before fork_init() because the task_struct size depends on the FPU register
> > > buffer size.
> > > 
> > > Move the initialization to arch_cpu_finalize_init() which is the perfect
> > > place to do so.
> > > 
> > > No functional change.
> > > 
> > > This allows to remove quite some of the custom early command line parsing,
> > > but that's subject to the next installment.
> > > 
> > > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > 
> > The backport of this patch into chromeos-5.10 and chromeos-5.15 via stable
> > relase merges is causing various Chromebooks (not all of them) to crash
> > early during boot. Subsequent fixes have not addressed the problem for us,
> > so we already reverted the patch from chromeos-5.15 and will revert it
> > from chromeos-5.10 as well.
> > 
> > I don't know if this is a Chromebook specific problem, or if it affects
> > mainline, so this is just a heads-up in case others experience similar
> > problems.
> 
> 
> Another thing - if you choose to revert the arch_finalize patch then bear in
> mind that the GDS' 'force' option is rendered inoperable as the FPU can't be
> disabled due to the way things are sequenced.

I understand, but that is still better than not being able to boot
in the first place.

Thanks,
Guenter
