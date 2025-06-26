Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F46A2BFC65
	for <loongarch@lists.linux.dev>; Thu, 26 Jun 2025 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930286; cv=none; b=vFp8F9XhLGkERN4ulhZXBwHTW9pcxejzf8KxxTo/aD13gU+vfLUA++sdjuu71YN9VUSOEgEUfeLPib9IQtSaIB2OfRTQE8c+w5a/WJCaP9PPUbKApaR2UrAkcdSJWPzietuBZuoDQEmsYUnkSVKGH7QvAPR8D/QUgA23PHc8eSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930286; c=relaxed/simple;
	bh=ekv2eO6oe4yBEEcGx/v664SW1vBsIAVNXe/2ysde03Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n40brPWjCbmlvthR+07wZ1fQqX5wT81ZpzahNi53JzA6zhrXjKblFIImEjIxflhyNdFZdfOEdtwv1DmYkJnkEDMmnGOwLli2UpKfvbU3MEScuJ7SOGlmFnSadEL4OrVpp8WrfIvV69NXwFQ3R/q9mRis/KMJQGn1wIejWKinSwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUafneKZ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUafneKZ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553bcf41440so805582e87.3
        for <loongarch@lists.linux.dev>; Thu, 26 Jun 2025 02:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750930283; x=1751535083; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuFmqpRengejqXGMt8z0krXQLsPU94kcoziX8PACH+I=;
        b=JUafneKZqpz6uVVLqmBAjHTYhblOJispS4UZcJNZ6ULb4AQJJ/7Gf13116utHM1ozJ
         j0i1n+BMIlimGmvhD0vMklmlShzGgEQHdcZYQcKa58zhRp8RCZeCmhe4Oups8/Ryv3Bn
         gDjzSwpN+L7GHESLG7Hva24w3teBLPbWxAQhJlgOmcoHlksUgKhmKLKbKc0VzF2Au6AS
         q+VeEFmooVrXVhTFSHaLTM5RWQZVmWlSifehHfdEd83ToerJkECd2mq5PnEmSmqkw5as
         axmdQ445IelLA/28tXlk6QLhpcemb/rULQr4vUdNuw8mLJbLpYj+3ITKWzd11og9cZYt
         isgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750930283; x=1751535083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuFmqpRengejqXGMt8z0krXQLsPU94kcoziX8PACH+I=;
        b=v8a6y3XaXwbQjGHDw9DpZqeHy+YtmeMxot9HJ7U1PBAwtCZ3PZm1iGuwBahRKqxhiW
         I+kKRIkNMMcPjaQ7jlhGFqHVW2NzbdAZ6urbF92VTC+N03ZLaaz99KgbntAPfFF0TCxG
         G1lqPoADRrDP7WgSkglUuPq7jHb8gRvqtmFEnq3DscmaesINiOoez8eXjhnJZoCAlvAm
         qJW7awIkxvOcokwnZ8pUwwuXvl9Xp2DhMUSmDjwa2Y1a8axepvfVPiHUCcFLAH7B3+GN
         5Awf8fVgzA7GULJaoexhRPaVjPyAzkM2ihN2lX57aTIgEN2ZqoAlUdG9sl45bPx1XuF2
         x5kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSJchiw4iep5ZyMnIV2xoiUZJu/wxHMMVI8QnDG2lnboHmuQZx+dS8tMB2iIxZPxHPUwl01ajWfuQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeQxx4N1zAdI9NjQk772Oq/yUsR5nUlfKmTepy0sEasOmzqpIN
	oMNwGc6M7nyFldzEqO45U62H00oNkvT5Y/3xsyUaXDqD9qUSBvLJMzwGvNMhngHDdHqJuU5DsDz
	8ANrHwJu2BaNfOM2qyoZt2YeFDc3NUvw=
X-Gm-Gg: ASbGncu7kJwgsTrEu6/uiYPwcE/kxIUrzPXqDyv1bn34ZEYaEE/VxuByIXXRPT2Y64n
	g4s/xmpE/GESLvMCllJN9m7UhAIzfKFACBDa91CrvhdTjFiroHHXo9XDkWvMww0B5KMajjlixzx
	DyBFK7q5cWH84BflNDt0lHDoYStO/noIuuZ7JMG/y9OOE3GrTUSwkk
X-Google-Smtp-Source: AGHT+IHKD9vv7E6n80MsMeNjpJwBWGKsDmTjk3A0J3+cAywyuJ59mQfEiaL2YVTpTIc2tcdraTY+Dh5qWDg83RmXaIY=
X-Received: by 2002:a05:6512:1150:b0:553:36b7:7b14 with SMTP id
 2adb3069b0e04-554fdf96ec2mr2102615e87.37.1750930282937; Thu, 26 Jun 2025
 02:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250625095224.118679-1-snovitoll@gmail.com> <20250625095224.118679-2-snovitoll@gmail.com>
 <db30beb6-a331-46b7-92a3-1ee7782e317a@csgroup.eu>
In-Reply-To: <db30beb6-a331-46b7-92a3-1ee7782e317a@csgroup.eu>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Thu, 26 Jun 2025 14:31:05 +0500
X-Gm-Features: Ac12FXyxTyp0b2hD3uhdVzbeUTYpXnyKRANJYa2mQoNch15i1MQX1xBLZECmC3k
Message-ID: <CACzwLxj3KWdy-mBu-te1OFf2FZ8eTp5CieYswF5NVY4qPWD93Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] kasan: unify static kasan_flag_enabled across modes
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	x86@kernel.org, hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, geert@linux-m68k.org, 
	rppt@kernel.org, tiwei.btw@antgroup.com, richard.weiyang@gmail.com, 
	benjamin.berg@intel.com, kevin.brodsky@arm.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 3:35=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 25/06/2025 =C3=A0 11:52, Sabyrzhan Tasbolatov a =C3=A9crit :
> > Historically the fast-path static key `kasan_flag_enabled` existed
> > only for `CONFIG_KASAN_HW_TAGS`. Generic and SW_TAGS either relied on
> > `kasan_arch_is_ready()` or evaluated KASAN checks unconditionally.
> > As a result every architecture had to toggle a private flag
> > in its `kasan_init()`.
> >
> > This patch turns the flag into a single global runtime predicate that
> > is built for every `CONFIG_KASAN` mode and adds a helper that flips
> > the key once KASAN is ready.
>
> Shouldn't kasan_init_generic() also perform the following line to reduce
> even more code duplication between architectures ?
>
>         init_task.kasan_depth =3D 0;

I've tried to introduce a new function kasan_mark_ready() to gather
all arch duplicated code in one place:

In mm/kasan/common.c:

void __init kasan_mark_ready(void)
{
        /* Enable error reporting */
        init_task.kasan_depth =3D 0;
        /* Mark KASAN as ready */
        static_branch_enable(&kasan_flag_enabled);
}

So we could've called it
in mm/kasan/generic.c:
void __init kasan_init_generic(void)
{
        kasan_mark_ready();
        pr_info("KernelAddressSanitizer initialized (generic)\n");
}

in mm/kasan/sw_tags.c:
void __init kasan_init_sw_tags(void)
{
...
        kasan_mark_ready();
        pr_info("KernelAddressSanitizer initialized ..");
}

in mm/kasan/hw_tags.c:
void __init kasan_init_hw_tags(void)
{
...
        kasan_mark_ready();
        pr_info("KernelAddressSanitizer initialized ..");
}

But it works only for CONFIG_KASAN_GENERIC mode,
when arch code calls kasan_init(), for example, arm64:

void __init kasan_init(void)
{
        kasan_init_shadow();
        kasan_init_generic();
}

And for HW_TAGS, SW_TAGS it won't work.
Fails during compiling:
mm/kasan/common.c:45:12: error: no member named 'kasan_depth' in
'struct task_struct'
   45 |         init_task.kasan_depth =3D 0;

because kasan_init_sw_tags(), kasan_init_hw_tags() are called
once on CPU boot. For arm64, where these KASAN modes are supported,
both functions are called in smp_prepare_boot_cpu().

So I guess, every arch kasan_init() has to set in kasan_init()
       init_task.kasan_depth =3D 0;
to enable error messages before switching KASAN readiness
via enabling kasan_flag_enabled key.

>
> Christophe
>
