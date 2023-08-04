Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7EAC158
	for <loongarch@lists.linux.dev>; Fri,  4 Aug 2023 13:57:31 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b9cbaee7a9so34841171fa.0
        for <loongarch@lists.linux.dev>; Fri, 04 Aug 2023 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691157445; x=1691762245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQEI9Tt3LPX/UCb4Pxuia74BKZS5am/oZbLnhTBeH5c=;
        b=ODBcdetlHdar8oSXn2XVcxWt49kY6W5dGK060t1ukhvBBelvc+vMlms+NBY7BNG3jV
         M6jPTWfpzG8NL2PgIOr2HjJ/SeXvVC4oZ2fHwdXHWJYUY5x2jC0xErGIQjAnlerKPVHF
         PHk6D4yEBivhPFXsiGqWLd4HowGgvEVwfOoxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691157445; x=1691762245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQEI9Tt3LPX/UCb4Pxuia74BKZS5am/oZbLnhTBeH5c=;
        b=BMisPjjYslwgJ+hjAIVzA6CBukaiuOltJFrKttQnkFY1gBMu9P8YuBBMY+McmhTthW
         ZtMsMbe5nRY9+DVP1tPbcRZoZXDrZPNqYNU8J+hXFDcS4XudSky7XzKcZ6Br45/Gru+c
         4F5s9juJPLZKYjHgye/c1NCZE5ooM9p3O+GYg2c7nq7yVvk0qx3rIjQ22nOYJH8a+nh3
         vbzsFk6OlrjUrWSybTMeLRdelT5vd0aNyR3LvW/WxJufvM0i2fEGFyLhvP4noiHW7tEO
         C48WFi5RiWxr3jP2RA4/PPQP5BgdTfWCzqPTIVPXNb2L/GWhNjQs5d2/kffMeazgZTtu
         RHAA==
X-Gm-Message-State: AOJu0YzWHIhV+bERGjKeqL5i6awIG7vO+eDV8FpdxeAlBcDMAwHNyrfj
	DstBrNkcZoBIXmipEcPt/7aCYj079fc5gtROBKQ5Lqic
X-Google-Smtp-Source: AGHT+IFjqCaoBMsZYQ1nNUXZiheTOsLfbPT4mntNhUcioc/a714feDntK+o0QjTmWOnpZVAQH8Resw==
X-Received: by 2002:a2e:9254:0:b0:2b9:c4ce:558f with SMTP id v20-20020a2e9254000000b002b9c4ce558fmr1427146ljg.37.1691157444484;
        Fri, 04 Aug 2023 06:57:24 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id p7-20020a1709066a8700b009930042510csm1336359ejr.222.2023.08.04.06.57.24
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 06:57:24 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fe1e44fd2bso91065e9.0
        for <loongarch@lists.linux.dev>; Fri, 04 Aug 2023 06:57:24 -0700 (PDT)
X-Received: by 2002:a05:600c:1f90:b0:3f1:9a3d:4f7f with SMTP id
 je16-20020a05600c1f9000b003f19a3d4f7fmr49358wmb.1.1691157423841; Fri, 04 Aug
 2023 06:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230803160649.v3.1.Ia35521b91fc781368945161d7b28538f9996c182@changeid>
 <ZMytyEoCARgP9VR8@dhcp22.suse.cz>
In-Reply-To: <ZMytyEoCARgP9VR8@dhcp22.suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Aug 2023 06:56:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQ18JG-sMBJHrhXByCWYSgOpCq8tL=3R8pT8CnFEa=pA@mail.gmail.com>
Message-ID: <CAD=FV=UQ18JG-sMBJHrhXByCWYSgOpCq8tL=3R8pT8CnFEa=pA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] nmi_backtrace: Allow excluding an arbitrary CPU
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Darrick J. Wong" <djwong@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Gaosheng Cui <cuigaosheng1@huawei.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Jianmin Lv <lvjianmin@loongson.cn>, 
	Jinyang He <hejinyang@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, 
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Pingfan Liu <kernelfans@gmail.com>, Qing Zhang <zhangqing@loongson.cn>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Rix <trix@redhat.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Valentin Schneider <vschneid@redhat.com>, 
	WANG Xuerui <kernel@xen0n.name>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 4, 2023 at 12:50=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Thu 03-08-23 16:07:57, Douglas Anderson wrote:
> > The APIs that allow backtracing across CPUs have always had a way to
> > exclude the current CPU. This convenience means callers didn't need to
> > find a place to allocate a CPU mask just to handle the common case.
> >
> > Let's extend the API to take a CPU ID to exclude instead of just a
> > boolean. This isn't any more complex for the API to handle and allows
> > the hardlockup detector to exclude a different CPU (the one it already
> > did a trace for) without needing to find space for a CPU mask.
> >
> > Arguably, this new API also encourages safer behavior. Specifically if
> > the caller wants to avoid tracing the current CPU (maybe because they
> > already traced the current CPU) this makes it more obvious to the
> > caller that they need to make sure that the current CPU ID can't
> > change.
>
> Yes, this looks like the best way forward.
>
> It would have been slightly safer to modify arch_trigger_cpumask_backtrac=
e
> by switching arguments so that some leftovers are captured easier.

I'm not sure I understand. Oh, you're saying make the prototype of
arch_trigger_cpumask_backtrace() incompatible so that if someone is
directly calling it then it'll be a compile-time error? I guess the
hope is that nobody is calling that directly and they're calling
through the trigger_...() functions.

For now I'm going to leave this alone.


> You also have this leftover
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 00982b133dc1..9f1743ee2b28 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -190,10 +190,6 @@ static inline bool trigger_all_cpu_backtrace(void)
>  {
>         return false;
>  }
> -static inline bool trigger_allbutself_cpu_backtrace(void)
> -{
> -       return false;
> -}

Ah yes. I missed that case. Let me send a quick v4.


>  static inline bool trigger_cpumask_backtrace(struct cpumask *mask)
>  {
>         return false;
>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Anyway
> Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!
