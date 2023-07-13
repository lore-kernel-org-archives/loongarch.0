Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB801ED53
	for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 20:12:31 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-ca4a6e11f55so994913276.1
        for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 13:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689279150; x=1691871150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJH06eQc+B3mlka9ca3yWe/BFaVZyKNH/FYbTdupon0=;
        b=sq8DoIAkiJTqj/hA0HbPY+Du/lUKvsOypg9bWyJovvwhPvhZLs9OnAATt6DyWj3fhk
         rMqRmV+ckvKtX3mqEovL47UsfIWG+DISWqHsS1jzloQgfd80YPjUGEY2gPScLUzXv3aj
         bEKoTztrMYpGlhl7OU1cNI+EkY48vwK5Af5vcxbKGaAcx3oeCKF43vTk9dp0Os+ehnOh
         4Vot+I5Pq1W7h0Qif76nH99c7qDXBLn72YuUgO10h1+BnKw70/5dvPpRQiXxmJnABb9F
         k/FYmn1X8GMw43PAkTPuZbREEdx6SXIktOvGYFRyjOtq0ls4Ne1B0u4C5shdFL81lA90
         k6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689279150; x=1691871150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJH06eQc+B3mlka9ca3yWe/BFaVZyKNH/FYbTdupon0=;
        b=kEo0MGyyeJF1vhf461cWPpYOsztd04m5U27vs4VRVzbZFpxNPUSkjtXXfQP4sPTY/1
         RLhc4+db1W2212hUJ0AzGwqrNUDnVWN1GSsRydE8OZ2ksJIPEeHhjFx7lPj+Y4RwSdhn
         lrlM30Oza49StiuIzZRWxuAn3gch79jCRzwF+JAdQS3edEiJsBcfBqMzun6LP+uEwZ7q
         6MMrwLGhTnFDul6u0xXpqEUzaPbcFMX0BmO1EFFvc9oNbmL+hjSAlcGV7HBRVZdRaVcc
         zZyCxJ4qLBosu0Vo/SHASQJ2RTZ9Ac3z6LxL4k+Vo23KBRQf78eN7YI+6Inh42WqT2TT
         bfKw==
X-Gm-Message-State: ABy/qLZeiP2MDioUcXu3ZDSlu0fzngkCp7P2R4D4AeQRvrZeqAhAAoB4
	xScavfOF0+x260Mb6OrRy8d0GNnjDYp9Ygkze4Q4Dg==
X-Google-Smtp-Source: APBJJlHsBJjb/bCQUIDnbMcslY/+BRvpuOtfSJIDEY65ZXVL8Q9oqboC4ArbmfQevCrjLrPcX1Bsga2B7wxkVG3h+b4=
X-Received: by 2002:a25:317:0:b0:c67:d3cd:6989 with SMTP id
 23-20020a250317000000b00c67d3cd6989mr2431008ybd.21.1689279150076; Thu, 13 Jul
 2023 13:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
 <20230713095339.189715-2-wangkefeng.wang@huawei.com> <ZLAjFQGgcjt4ykS7@casper.infradead.org>
In-Reply-To: <ZLAjFQGgcjt4ykS7@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 13 Jul 2023 13:12:15 -0700
Message-ID: <CAJuCfpGBaAJof=5-Xh1saoN9dhOauMiHBZzb0crVNn9OyOeZHw@mail.gmail.com>
Subject: Re: [PATCH rfc -next 01/10] mm: add a generic VMA lock-based page
 fault handler
To: Matthew Wilcox <willy@infradead.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 9:15=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> > +int try_vma_locked_page_fault(struct vm_locked_fault *vmlf, vm_fault_t=
 *ret)
> > +{
> > +     struct vm_area_struct *vma;
> > +     vm_fault_t fault;
>
>
> On Thu, Jul 13, 2023 at 05:53:29PM +0800, Kefeng Wang wrote:
> > +#define VM_LOCKED_FAULT_INIT(_name, _mm, _address, _fault_flags, _vm_f=
lags, _regs, _fault_code) \
> > +     _name.mm                =3D _mm;                  \
> > +     _name.address           =3D _address;             \
> > +     _name.fault_flags       =3D _fault_flags;         \
> > +     _name.vm_flags          =3D _vm_flags;            \
> > +     _name.regs              =3D _regs;                \
> > +     _name.fault_code        =3D _fault_code
>
> More consolidated code is a good idea; no question.  But I don't think
> this is the right way to do it.
>
> > +int __weak arch_vma_check_access(struct vm_area_struct *vma,
> > +                              struct vm_locked_fault *vmlf);
>
> This should be:
>
> #ifndef vma_check_access
> bool vma_check_access(struct vm_area_struct *vma, )
> {
>         return (vma->vm_flags & vm_flags) =3D=3D 0;
> }
> #endif
>
> and then arches which want to do something different can just define
> vma_check_access.
>
> > +int try_vma_locked_page_fault(struct vm_locked_fault *vmlf, vm_fault_t=
 *ret)
> > +{
> > +     struct vm_area_struct *vma;
> > +     vm_fault_t fault;
>
> Declaring the vmf in this function and then copying it back is just wrong=
.
> We need to declare vm_fault_t earlier (in the arch fault handler) and
> pass it in.

Did you mean to say "we need to declare vmf (struct vm_fault) earlier
(in the arch fault handler) and pass it in." ?

>  I don't think that creating struct vm_locked_fault is the
> right idea either.
>
> > +     if (!(vmlf->fault_flags & FAULT_FLAG_USER))
> > +             return -EINVAL;
> > +
> > +     vma =3D lock_vma_under_rcu(vmlf->mm, vmlf->address);
> > +     if (!vma)
> > +             return -EINVAL;
> > +
> > +     if (arch_vma_check_access(vma, vmlf)) {
> > +             vma_end_read(vma);
> > +             return -EINVAL;
> > +     }
> > +
> > +     fault =3D handle_mm_fault(vma, vmlf->address,
> > +                             vmlf->fault_flags | FAULT_FLAG_VMA_LOCK,
> > +                             vmlf->regs);
> > +     *ret =3D fault;
> > +
> > +     if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
> > +             vma_end_read(vma);
> > +
> > +     if ((fault & VM_FAULT_RETRY))
> > +             count_vm_vma_lock_event(VMA_LOCK_RETRY);
> > +     else
> > +             count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> > +
> > +     return 0;
> > +}
> > +
> >  #endif /* CONFIG_PER_VMA_LOCK */
> >
> >  #ifndef __PAGETABLE_P4D_FOLDED
> > --
> > 2.27.0
> >
> >
