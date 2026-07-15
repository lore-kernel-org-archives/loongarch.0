Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFFA3C4169
	for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 07:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101523; cv=none; b=jJdF1Lrz151a92AVHWjtYdnZ3QwvvKNSGwSChuXnNsKUM7I+sMGHIc3AeArNyiPYSsFFKspbRV10amoIUx5GpymMjP6B+R5Np6xIWiPOdlibTmtRjZQdKkyBRYEOVnUvhCL8y6YLmDpPg8QCEOxwgPIIMYHihkZMtj3m3iZ5hM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101523; c=relaxed/simple;
	bh=u8cicfkmRrJrH6XZK18EpfmqX98dxO0lsa0zsnA4eZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4YEtXZQ9eLRlhJ6Z1mjJSsJwTQiieBZGSM9kE6vgKs2ccf5GY/AkZeeJZcybZecs2qZ3ouDQArWKbzOYgcaQgGrXSCLt4eK/UTklzJWa30cRf9vKuhTbv+R0eYiiuT0tIbUqOl08MeoLs/APERMFYH3cwXnYWkMUpQeGl5iM/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-73b7c3791dbso2683184137.1
        for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 00:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101519; x=1784706319;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hqKDqOfd26TqLmXrf6Sno+8+vAQxzNMwBOFafeUJRw4=;
        b=TSHbFfwg7AKBV01jsYN4s3ma6uz1f67tXIxhb3WMdCb854qPjoYA4wZS89H/2Oqm0j
         GFjKCGTROOJYvYVcObiWU5AljnNLyWtuorG8LLWC4bk6vTWC3NHBjcydk6qWv9m2kq1f
         VZ4KlfXTDnTO4QWiWOLT+r170GOWHY64HDPbPCKjgU3rDwtN1mFfT0S8BjBnU2tLT/rG
         oYfONc5fEhdKrfw8uB6vXpbmNa0FeG/gQePOksS4PPrBitIKg/BFNsGsBEmvZJRuciaQ
         BjGtE2/wVZoS4IW+A/yXRRniX4GlgEygZkVbFHBCBl3ur6nB+OQheeVFlBNTErraza5l
         H6wA==
X-Forwarded-Encrypted: i=1; AHgh+RqEH6jLkUc04XxOrv015ir/M6QzjAqqAwmQhxcrpxqoCLqK7LwBpBZZH5pHdPnuQI/HLuGoh6yXmfM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYGRHKYyDhXYh+dyhdFKsWkvC3rZYL5dyQ3MyUI3JCNmVag0fD
	LftNSX/7jrGEjVwuNKdjN9XvTiYn7qyhuP7PhM+1le3SN4GSYqabqj5iRtX/mPUb8pA=
X-Gm-Gg: AfdE7cmCsATVcj8APNGJqw+powT6TGgRPUQLG1ozeqtEBfY24T+bbY318x/GA944ZeH
	KhYpI0UBfgyTb9XKaBRMRu4/gX6ddNoSFVvyqVAAUgSrbkt9LIkjfuVP0xS548bLu7B6ZBj1JU9
	3Y9LekH7XH8a/Zzbz9YSZlZCCIN7lXQXt/pBdFyphKW88zNcdqj3yqJcwb1lJR4+xS5oPC5eHRM
	sMwhzFnf5MOPUNFu6zHCtePThov88M5RY4mBcOXNIkD30TcuqLF/v9OEB7N4VUoo4Bpi9/Gnv0B
	GcwY5OPR5CotBASpMYWFRs8gmfyFNO3UcXXmwyLxsTMPu6VqUO7VPXMVFArUbTxXJy2KvVPLbRC
	idzcbnaus1bDd2W/r+K4qSY3bu/wLnJBGmYYVQVT+qAhMtDARRICEhTySIax1cYePrzJlDw9Aqn
	XLBwDcMnj+1f41CjsVg9NR0Y0mLIjS8PJ1qF8qY++YF+XaJoRbeg==
X-Received: by 2002:a05:6102:3e0a:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-745874d565emr3208091137.14.1784101519445;
        Wed, 15 Jul 2026 00:45:19 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3ee7csm11530418137.2.2026.07.15.00.45.17
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 00:45:18 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so1932421241.3
        for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 00:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqHNme0rhiJVze9gQsx1mzgJ0CReO1oOHkJJcxxOVVXzPT3iYfzxw27tbXcJHDciR3hg4BWlLf8gbc=@lists.linux.dev
X-Received: by 2002:a05:6102:6891:b0:73e:9fae:584c with SMTP id
 ada2fe7eead31-745875199aemr2922337137.19.1784101517020; Wed, 15 Jul 2026
 00:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6007625e-c3f9-4ad6-99a8-61396bccbcec@kernel.org>
 <32d459d1-ad19-4baf-bbb1-0565458001d2@intel.com> <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com> <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com> <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com> <6df814c9-405c-48d8-96ea-929c4b28949b@intel.com>
 <alZe-Cu7yQw9qRXU@e129823.arm.com> <alZo9feSrSB_StfO@e129823.arm.com>
In-Reply-To: <alZo9feSrSB_StfO@e129823.arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 09:45:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com>
X-Gm-Features: AUfX_mwGugbyQZ1JX8fgK_JNKs5rGnucGlnBlUaIc_V2N3HkDTrdgggdZ_cY0do
Message-ID: <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com>
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

On Tue, 14 Jul 2026 at 18:51, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> On Tue, Jul 14, 2026 at 05:08:24PM +0100, Yeoreum Yun wrote:
> > On Tue, Jul 14, 2026 at 07:35:19AM -0700, Dave Hansen wrote:
> > > On 7/14/26 04:40, Yeoreum Yun wrote:
> > > > @@ -254,22 +255,8 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
> > > >         struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
> > > >         pgprotval_t prot = val & PTE_FLAGS_MASK;
> > > >         pgprotval_t effective;
> > > > -       bool first_level = false;
> > > >
> > > > -       /* Ignore folded levels ... */
> > > > -       if (((level == 0) && mm_p4d_folded(st->mm)) ||
> > > > -           ((level == 1) && mm_pud_folded(st->mm)) ||
> > > > -           ((level == 2) && mm_pmd_folded(st->mm)))
> > > > -               return;
> > > > -
> > > > -       /* ... and make the actual first level remember the protection. */
> > > > -       if (((level == 0)) ||
> > > > -           ((level == 1) && mm_p4d_folded(st->mm)) ||
> > > > -           ((level == 2) && mm_pud_folded(st->mm)) ||
> > > > -           ((level == 3) && mm_pmd_folded(st->mm)))
> > > > -               first_level = true;
> > > > -
> > > > -       if (!first_level) {
> > > > +       if (first_level > st->first_level) {
> > > >                 pgprotval_t higher_prot = st->prot_levels[level - 1];
> > > >
> > > >                 effective = (higher_prot & prot & (_PAGE_USER | _PAGE_RW)) |
> > > > @@ -471,6 +458,15 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
> > > >                 .seq            = m
> > > >         };
> > > >
> > > > +       if (mm_pmd_folded (mm))
> > > > +               st->first_level = 3;
> > > > +       else if (mm_pud_folded (mm))
> > > > +               st->first_level = 2;
> > > > +       else if (mm_p4d_folded (mm))
> > > > +               st->first_level = 1;
> > > > +       else
> > > > +               st->first_level = 0;
> > > > +
> > > >         ptdump_walk_pgd(&st.ptdump, mm, pgd);
> > >
> > > This is indeed an improvement and a step in the right direction! Thanks
> > > for looking at this.
> > >
> > > But one of my test for whether it's good x86 code is whether there's any
> > > actually x86-specific logic in it. Isn't this basically a translation
> > > between the integer level number and whether it is folded?
> > >
> > > That seems like a common helper that more than one arch could use. Could
> > > this be stuck in a helper so that all arch/x86 has to do is:
> > >
> > >     if (mm_pt_level_folded(mm, level))
> > >             return;
> >
> > Yes. at least the level semantic in ptdump (pgd is level 0,
> > p4d is level 1, ...) is same to all archs where use ptdump.
> > So It seems reasonable to add this common helper in ptdump.c
> >
>
> Furthermore, the effective_prot() need to require to identify whether
> it's the first pgtable to prevent the inheriting from dummy value.
> So I think it seems to make a ptdump_pt_level_first() like:
>
> diff --git a/mm/ptdump.c b/mm/ptdump.c
> index 973020000096c..2ec5700e4be5e 100644
> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -190,6 +190,23 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
>         st->note_page_flush(st);
>  }
>
> +bool pdtump_pt_level_first(struct mm_struct *mm, int level)
> +{
> +       if (!mm || level > CONFIG_PGTABLE_LEVELS)
> +               return false;
> +
> +       if (mm_pmd_folded(mm) && level == 3)
> +               return true;
> +       if (mm_pud_folded(mm) && level == 2)
> +               return true;
> +       if (mm_p4d_folded(mm) && level == 1)
> +               return true;

Is this order (... && level == ...) the optimal order?
On arm64, mm_pud_folded() and mm_p4d_folded() perform several checks.

> +       if (level == 0)
> +               return true;
> +
> +       return false;
> +}
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
