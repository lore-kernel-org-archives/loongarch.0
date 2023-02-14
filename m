Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FB7C5F2
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 19:48:53 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id c29so6890005pgm.5
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 11:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KPvoJ4GnlMgsohhv5ZFTkjPNgvE0397TI0CYAnCxqM=;
        b=Gr6T/uMmQW0P2TPA5kU2B0SezfYIPng0GmMu1nbsnL7n4Qhw9RF68MIXO9T2lIb4Vd
         9XqzWMo3zWupmo7DDnQIRZvSJhGTc3cJrOSj6qnw7ZLFMuv1jhehz7SDmTyxss5IvAuF
         ITBMuNHAK1NOe9nMNVZ11QjpI/ucBxZuVeSuDtnc42j7aN5Y3/LFY0jJey9dm6rJdUJ4
         LHKBtyEUPuxrQMMdOfkgTlii7etUm1Jsa4u0tgyMoqTav4keZsI205xjLS15k/6dNP48
         pxdBRqWKGSlZs5JtldCGgNcu4SmZfcR6VtsRIgsyLA6/xT3/Y75dtU4bMody4IfGBQxC
         Gv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KPvoJ4GnlMgsohhv5ZFTkjPNgvE0397TI0CYAnCxqM=;
        b=kO4ZEyOKLy8cBxBl4WLzoNIgHtruoRl/PLtrEJ9lWssNFvB0zr4QvclyYYzaYeysKX
         O/o8fOhoipFzLGkOc9IvEr8+ayMGGPfh/Om4Zcb89wmCulQuepkC9uSKQZplZxg60a0G
         n1i6oV9MrSJlwr7dK9acUD9wA2pEORRAEjcqxFVDNsRAeZQYX9cI/A/dpmA8CDwOvqBO
         o74+7BWT8cQpXfDg+2twC4BkU1Eq7WrmIzJFPIfiUMeeoQ253zkL2arQ89UsFNXXOqwC
         Gg3pnnw/d38YwrL0WrgKiLes7X+JmAexMOIzT7qbYCW8/sC5GIZPhesiekPLBaLVeJaM
         A7zA==
X-Gm-Message-State: AO0yUKXJfis7/d67umkYCbhRKZLImG0I4EzPCNMsTGCiCgdC9Hj9fr2H
	wfzOHqE0FSo27OScqrbpyBLHCB36rlprkSacsyc=
X-Google-Smtp-Source: AK7set/RjysGRw6Tb1OUrwUKy/GM2o6xSEOZ9Hy3VBjfC8/RJ69CUMocJn0vWTmElSm33m/BGVWvbyqYG1s66BcSQYs=
X-Received: by 2002:aa7:9591:0:b0:5a8:65e5:b1ba with SMTP id
 z17-20020aa79591000000b005a865e5b1bamr740284pfj.29.1676404133096; Tue, 14 Feb
 2023 11:48:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1676358308.git.jpoimboe@kernel.org> <cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
 <1b4afd82-83cb-0060-7cab-8e16d2e69ff9@linaro.org> <20230214182322.r5tyeowxzloiuh72@treble>
In-Reply-To: <20230214182322.r5tyeowxzloiuh72@treble>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Feb 2023 11:48:41 -0800
Message-ID: <CAMo8BfLzV0Oe_i-QrMzE-BE028s6GNvOd827N5+tteELidjpvA@mail.gmail.com>
Subject: Re: [PATCH v2 19/24] xtensa/cpu: Make sure cpu_die() doesn't return
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	linux-kernel@vger.kernel.org, jgross@suse.com, richard.henderson@linaro.org, 
	ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, 
	linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, 
	linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, 
	bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, 
	linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, 
	ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, 
	davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, chris@zankel.net, linux-xtensa@linux-xtensa.org, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2023 at 10:23 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote=
:
> On Tue, Feb 14, 2023 at 08:55:32AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Can you update the documentation along? Currently we have:
> >
> >   /*
> >    * Called from the idle thread for the CPU which has been shutdown.
> >    *
> >    * Note that we disable IRQs here, but do not re-enable them
> >    * before returning to the caller. This is also the behaviour
> >    * of the other hotplug-cpu capable cores, so presumably coming
> >    * out of idle fixes this.
> >    */
>
> void __ref cpu_die(void)
> {
>         idle_task_exit();
>         local_irq_disable();
>         __asm__ __volatile__(
>                         "       movi    a2, cpu_restart\n"
>                         "       jx      a2\n");
>
>         BUG();
> }
>
> Hm, not only is the comment wrong, but it seems to be branching to
> cpu_restart?  That doesn't seem right at all.

Perhaps the name is a bit misleading. The CPU that enters 'cpu_restart'
loops there until a call to 'boot_secondary' releases it, after which it go=
es
to '_startup'. So it is a restart, but not immediate.

--=20
Thanks.
-- Max
