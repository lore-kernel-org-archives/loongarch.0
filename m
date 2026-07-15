Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32E83EDE63
	for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111686; cv=none; b=Glu84STMVZUKEgPa4LTxqwFvNwk01ySy/8HG+RWpPz6Vwo8k6U2HJNoxeo+FyOoivBaZ7vImZGRNWTEmD14QJ67uBDbb5+3dYCvbJ+bSlQsu+nQRhCKJUD9g0hlv7JBlB1N9DQJfnCwF5KoO8Yv4v3ziHGln2ObWgKETMxoqi/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111686; c=relaxed/simple;
	bh=dYuyA6Dz/ajxhYT4dU+02MPd/j4lWQd1ctOD3UM1CNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cuMDs5P0v3dr0dTgu0I3EXU5KutT3e3D7o1Ca+9+wvLkiAg+I8FfK0/pft4CfHDQ2OYumcXsYhBpCPH2NjKwQVshHXjOrlXIJxaliSxZzmkc6pD91YOx+H15N0Hc+PQyNytXIDUwB5o8P5rJJym3E6FNV4TCY3pRJuiUCEIMZzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7391d5504b5so1421414137.3
        for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 03:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111683; x=1784716483;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BcTdMoZv6JVy6M/fO3WdP9FofoXGw30zAP9bsFgIqfs=;
        b=qNhi74UHYXgFyKiN7/4qYuiz68xPEvrhV46bjmpm1ybmiZYHawhCGVF1LGVKTpsgJ1
         0PE4mqOO9z/hsN0wACpF8piWvprUbqXXaxTAklc4dPjUyrQ9t7WNeMRUgXGx/prftucI
         auNrZsLtjAnnyA6pyq+ZX2jNTrTEu4+laJg4fKCZ0z2lkk3mPKI61ZOQQAIeevd++jhX
         xJwR+0KY/K+fvgWglThbKHXN+Lw53ToVoy0ZK9GJIoTR9LcPq1Uv6aJqX26A7xfPddCc
         DOncfkLryBpuU5whgtbTL9rky2ghdbPADaPkkdjYs9u8TjJauMONMg/pcJdOEvrV0IfH
         AaXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqK2j03+RnBrnHHsWX2APb1eX82PjPS53kSSKzMArZHZk8jTdD3dt13prH2HYO7H+ebn6Fj3lcRYdQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDzjyOMwYqfVI1ebyeDYCgOhmEjxXlCS7wPcNjLafZ7Q3eVhDT
	eKYM7tuPrS0WuNQkfP3u9xYcuAOW//nGAgyLZKUqWs69TI7l0y9vNNxH9j9voYoZoDU=
X-Gm-Gg: AfdE7clfb9s6XyDJbJRMN0kvbQ6b5W+4RFoh2WAuJI6k8Jqr6O/1wJwsjksMNlWVU1b
	H+60UvSRztoGFYhAhm/ngAiCXGSL1FUinzEQDDXYyg4dVh3oBXD6Fpqh1trgxwJPBgbsICyrQeD
	wHhMOpMfPBC3v0xjd0huyECzVswV2mMw41msoZ856iwvapejnkUTofr3cDhTbPbyzagSQ7Vrb3r
	vzyhpxBr486ikv8R+Du9tztQt/PoZ47ek4ZOD98B5TvB02lzXcTlAtHLRp/HovCiDHWBNJAL54U
	AZSgog/TJKH7AYFjVhWhqNdpA1F4+tKKAoC+am4JKIC1JyxetGm7jFcbMeYyd5eyEJhlap7Cw+G
	HPZoU3edOMHOHeMdf+eqKvetiyAknm4eWVO7M6HKK72pcQogjs3OTeaxKWfsXBtW2j7s2k51DMo
	rOK94fwoqsM6cC1skSxCrv9C1A/U7BxmwTNxW9GIvx3LokpAxQTjr2Uiol2RcF
X-Received: by 2002:a05:6102:15ac:b0:740:31a4:f9a1 with SMTP id ada2fe7eead31-74533e9c487mr10818354137.27.1784111683433;
        Wed, 15 Jul 2026 03:34:43 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed258bb75sm10346208241.1.2026.07.15.03.34.41
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:34:42 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-738a5cc517eso1780640137.2
        for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 03:34:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrHCsgPU2w83HltHZPSaC2VYkiHqJbNF2g6EG5ojIJFqStV/FO3TZudYp2p1kmSPkkXiOY7gOl1OrM=@lists.linux.dev
X-Received: by 2002:a05:6102:94c:b0:730:db02:1d08 with SMTP id
 ada2fe7eead31-74533c1eae8mr11245328137.10.1784111681255; Wed, 15 Jul 2026
 03:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com> <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com> <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com> <6df814c9-405c-48d8-96ea-929c4b28949b@intel.com>
 <alZe-Cu7yQw9qRXU@e129823.arm.com> <alZo9feSrSB_StfO@e129823.arm.com>
 <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com> <aldV23PwIXnFloaN@e129823.arm.com>
In-Reply-To: <aldV23PwIXnFloaN@e129823.arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 12:34:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOHm6MmP9QsNVvxLsGp1e0jC9u9RGb6+xee0ZBs4Zwfw@mail.gmail.com>
X-Gm-Features: AUfX_mxU0lxjO-fzCeQeNX344H_SVkvovWXaE8EEgaGKFYO5e9NLd2LkTofC79k
Message-ID: <CAMuHMdVOHm6MmP9QsNVvxLsGp1e0jC9u9RGb6+xee0ZBs4Zwfw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/34] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Dave Hansen <dave.hansen@intel.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org, 
	kasan-dev@googlegroups.com, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux@armlinux.org.uk, akpm@linux-foundation.org, ankur.a.arora@oracle.com, 
	rppt@kernel.org, linmag7@gmail.com, chleroy@kernel.org, klarasmodin@gmail.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, kas@kernel.org, 
	zhangtianyang@loongson.cn, wangyuli@aosc.io, tsbogend@alpha.franken.de, 
	ljs@kernel.org, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ryan.roberts@arm.com, pasha.tatashin@soleen.com, 
	rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com, tj@kernel.org, 
	kevin.brodsky@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com, 
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org, 
	guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk, 
	dinguyen@kernel.org, schuster.simon@siemens-energy.com, 
	wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev, 
	vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org, 
	djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com, 
	Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com, 
	liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	shorne@gmail.com, jonas@southpole.se, stefan.kristiansson@saunalahti.fi
Content-Type: text/plain; charset="UTF-8"

Hi Yeoreum,

On Wed, 15 Jul 2026 at 11:42, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > On Tue, 14 Jul 2026 at 18:51, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > --- a/mm/ptdump.c
> > > +++ b/mm/ptdump.c
> > > @@ -190,6 +190,23 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
> > >         st->note_page_flush(st);
> > >  }
> > >
> > > +bool pdtump_pt_level_first(struct mm_struct *mm, int level)
> > > +{
> > > +       if (!mm || level > CONFIG_PGTABLE_LEVELS)
> > > +               return false;
> > > +
> > > +       if (mm_pmd_folded(mm) && level == 3)
> > > +               return true;
> > > +       if (mm_pud_folded(mm) && level == 2)
> > > +               return true;
> > > +       if (mm_p4d_folded(mm) && level == 1)
> > > +               return true;
> >
> > Is this order (... && level == ...) the optimal order?
> > On arm64, mm_pud_folded() and mm_p4d_folded() perform several checks.
> >
> > > +       if (level == 0)
> > > +               return true;
> > > +
> > > +       return false;
> > > +}
>
> It is. since the purpose of ptdump_pt_level_first is designed to be used
> in the *callback* of pXd_entry(). IOW, if we check level 0 first,
> it always returns wrong return in folded case.

I meant the order inside the if () conditions.
E.g.
"if (mm_pud_folded(mm) && level == 2)" does the expensive check first.
"if (level == 2 && mm_pud_folded(mm))" does the cheap check first.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
