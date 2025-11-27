Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779C832B9A5
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764243565; cv=none; b=doD2UqGXmwuKqMsLtdc4BzM8pLbTVHBemREiuKW7xTJxZKaivVwtFBahuPWtdy4amndzcdIvzDLFbsWlXlKPmTojOzw2eB1Ck29Vam1/WHTdvOnEXQklfIOaWbjelWfBPlljTpEHCBhyq00Yzagw7pF+XKpAKAkLer9vphzzQQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764243565; c=relaxed/simple;
	bh=VmYFJVGbSNiRXH1yQ3UAeHylPpQU5o+0M5eUQPT/G+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/RhjsaL96XdhHCfQvdtn0XqVz4V4zjCW65/s6iaNT1U0RYdB9//eK+5T0xkJiBCGFHPGXwz4Oi0DIKH+16xOKpK0kTBqVfDdI3Sur5GPnvTkvG6FiaToHHNwK5SE8yxoTfBcyAlOVz3inpLMRsGyVGvRL8n9H60fJSlbTsLKoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgBLpanQ; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgBLpanQ"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2da83f721so83982785a.1
        for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 03:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764243562; x=1764848362; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTgQXrnGbp8yRV1ffH5aOGb73MnxpAvx9lMPfkiZ/pE=;
        b=IgBLpanQ3DLSrOyQCHQUEq2OMWR1NF+22wF18B1sXkZ96GyfM82DNYsb0B2aG2qy29
         6DHRHB/WNN/Fnr2GMQfJ6Z2t1f9C8dLAj1FGYj0lsEnbG1VWVHfmWGkwSm1WdloAg8JR
         bmls/ijX2/h0PFtC7GBFXfSqFcIdDjAAmyyysGwC45GgQYk2Fxhl4aGlntmCAuydOUXf
         RMb/4/rUICZaNQ1oBfWwMM0bnOi3aP2XSyhYQOUD/eSCbvixPg8vvMyDRRxTm8vdqlj8
         Ba+jb9DpmYrzxA+GdniH1w0S7OhnWo383Z0RF82RTXy17jz8tPKpyApHVlA55XZqh7R4
         i0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764243562; x=1764848362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lTgQXrnGbp8yRV1ffH5aOGb73MnxpAvx9lMPfkiZ/pE=;
        b=JZ/5Q4p8V3WeI/C1qKWHDhPjM7Hu6hfKGV1CFnk9undQtZ3RO6hjecE4U8KqoVUlT2
         4clfWNq7fyfnFVnkSKt2v7vNpg7Q2bH+j1fv4LkONl3MwcRlyxdR3JVv8GX2JvrNgEGA
         d82j+AVyD2ApS+XIqtZnvSvHERsKyFjLaY+Biq0adEe1EWrWkDnnyz8bIgXtzN715AK6
         61CryzHhqfBj3yTfIf7svwG2xGyUy3/GO1lMoEipyGjZqo1O3uoGOG5mtVjkWTSoKDSr
         qi67rVXWOaXLB08V9PQ1tHpHLwsCXrZhn/I7QLfjo8U9zTUlibK2NLRvZGrh2a+sPOr0
         RQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVufWz4VXblc2xnFH8cTj1vKHCGlDIoh0Q2ImCyl5AinuAfvy1p2SbpQE5Gng4FKdUG1VP9zl0fBFA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDrO3CGRXSO6+l5pGI36bJKPVckT3HaaLehoiN17KVRztzCcTx
	/ysdFkxTgvhPKo8vvnrNEDw67SkxcyY1jGpAtSKMSLzcRS9AkLwLvupWPghq06m2Lq1kB3nj7o1
	2XMG0bq+LGEZSKkU4EcVTiCjRmtQJ1rc=
X-Gm-Gg: ASbGncvEWLJI8W5TtYB7niintERon4a7t+wAUgUVsmUuW5TSq7D3hpTbnrVKUWK+NG+
	5zGnNcWv/xvEW9E4A6WZoRbJEZ4oHBs/PiM+MQ5Sc5pcHfWHfmbtoq1fHH4MF2zjStFXG8NFgky
	cVgKjDLWzfXgnb3R5wv3DqhUuUo6qPlYYeqSIcNOs0F9LXvKdvWdN1+CDyOg3EYUgs2gSkIe5P7
	0Ff0sja6HRlVoLk+lcgh5NlGldaCeyVtT8Ivxh/C/U5fLZzytzhKxP2IJI3RSS4Q/E8xg==
X-Google-Smtp-Source: AGHT+IF8AX3QuwU8PWoyMHubrE0YEf7OwwbSbZImelOgI0KoQ85t34HoENkNaCeescbBRgk60ctOqyrcZAkFR1pI8MI=
X-Received: by 2002:a05:620a:4094:b0:8b2:3484:8e22 with SMTP id
 af79cd13be357-8b32a8d7accmr3051143885a.0.1764243562227; Thu, 27 Nov 2025
 03:39:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <20251127011438.6918-2-21cnbao@gmail.com>
 <5by7tko4v3kqvvpu4fdsgpw42yl5ed5qisbaz3la4an52hq4j2@v75fagey6gva>
In-Reply-To: <5by7tko4v3kqvvpu4fdsgpw42yl5ed5qisbaz3la4an52hq4j2@v75fagey6gva>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 27 Nov 2025 19:39:11 +0800
X-Gm-Features: AWmQ_bmMHpk-p6E2I_jCY1Xqg4XmWm0x9ikXHEjIDdMSrcjAo4PIsH4k_44adgY
Message-ID: <CAGsJ_4xQKARuEuhrVuV+WmBC7+NCNd==Zi9nGmze5mfSjF1kdw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] mm/filemap: Retry fault by VMA lock if the lock
 was released for I/O
To: Pedro Falcato <pfalcato@suse.de>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	Oven Liyang <liyangouwen1@oppo.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Rutland <mark.rutland@arm.com>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Robin Murphy <robin.murphy@arm.com>, 
	=?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Wentao Guan <guanwentao@uniontech.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Steven Rostedt <rostedt@goodmis.org>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Nam Cao <namcao@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 6:52=E2=80=AFPM Pedro Falcato <pfalcato@suse.de> wr=
ote:
>
> On Thu, Nov 27, 2025 at 09:14:37AM +0800, Barry Song wrote:
> > From: Oven Liyang <liyangouwen1@oppo.com>
> >
> > If the current page fault is using the per-VMA lock, and we only releas=
ed
> > the lock to wait for I/O completion (e.g., using folio_lock()), then wh=
en
> > the fault is retried after the I/O completes, it should still qualify f=
or
> > the per-VMA-lock path.
> >
> <snip>
> > Signed-off-by: Oven Liyang <liyangouwen1@oppo.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >  arch/arm/mm/fault.c       | 5 +++++
> >  arch/arm64/mm/fault.c     | 5 +++++
> >  arch/loongarch/mm/fault.c | 4 ++++
> >  arch/powerpc/mm/fault.c   | 5 ++++-
> >  arch/riscv/mm/fault.c     | 4 ++++
> >  arch/s390/mm/fault.c      | 4 ++++
> >  arch/x86/mm/fault.c       | 4 ++++
>
> If only we could unify all these paths :(

Right, it=E2=80=99s a pain, but we do have bots for that?
And it=E2=80=99s basically just copy-and-paste across different architectur=
es.

>
> >  include/linux/mm_types.h  | 9 +++++----
> >  mm/filemap.c              | 5 ++++-
> >  9 files changed, 39 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index b71625378ce3..12b2d65ef1b9 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -1670,10 +1670,11 @@ enum vm_fault_reason {
> >       VM_FAULT_NOPAGE         =3D (__force vm_fault_t)0x000100,
> >       VM_FAULT_LOCKED         =3D (__force vm_fault_t)0x000200,
> >       VM_FAULT_RETRY          =3D (__force vm_fault_t)0x000400,
> > -     VM_FAULT_FALLBACK       =3D (__force vm_fault_t)0x000800,
> > -     VM_FAULT_DONE_COW       =3D (__force vm_fault_t)0x001000,
> > -     VM_FAULT_NEEDDSYNC      =3D (__force vm_fault_t)0x002000,
> > -     VM_FAULT_COMPLETED      =3D (__force vm_fault_t)0x004000,
> > +     VM_FAULT_RETRY_VMA      =3D (__force vm_fault_t)0x000800,
>
> So, what I am wondering here is why we need one more fault flag versus
> just blindly doing this on a plain-old RETRY. Is there any particular
> reason why? I can't think of one.

Because in some cases we retry simply due to needing to take mmap_lock.
For example:

/**
 * __vmf_anon_prepare - Prepare to handle an anonymous fault.
 * @vmf: The vm_fault descriptor passed from the fault handler.
 *
 * When preparing to insert an anonymous page into a VMA from a
 * fault handler, call this function rather than anon_vma_prepare().
 * If this vma does not already have an associated anon_vma and we are
 * only protected by the per-VMA lock, the caller must retry with the
 * mmap_lock held.  __anon_vma_prepare() will look at adjacent VMAs to
 * determine if this VMA can share its anon_vma, and that's not safe to
 * do with only the per-VMA lock held for this VMA.
 *
 * Return: 0 if fault handling can proceed.  Any other value should be
 * returned to the caller.
 */
vm_fault_t __vmf_anon_prepare(struct vm_fault *vmf)
{
...
}

Thus, we have to check each branch one by one, but I/O wait is the most
frequent path, so we handle it first.

>
> I would also like to see performance numbers.

Yes. From what I understand, this patchset should improve performance in a
fairly straightforward way.
But yes, I can certainly include some data in v2.

>
> The rest of the patch looks OK to me.

Thanks
Barry
