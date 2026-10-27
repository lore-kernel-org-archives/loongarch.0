Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793069877;
	b=2yK1wC6PZOyKd9fVKjAetDato/aGFCEyz5rXEO3KqgDmpc8PKLKzpGiExMFiyNCV14ck
	 ELMmxczvpqxqKRsXI4XT/c0g0bLmUcuEAS23af+KWbodqCzka7GSwOFUbXcB04UeSFocE
	 2Q7cXnunCjONf3I981d1SWN+yvH+VpRKrfobYcqBLr7TiRqKlDgS3IG3KFK/kWwLtjq1O
	 +pDiprvf0DqSV9dC8kZaAOxSvLr/BzLaET1WDSbEKMUEradg350YtdR9vShlwMvr0xldP
	 ry4o0m14TQjTpl6aoLBLd2LUdvIzac44AzuuQlNchLBQxXrcoTkqeje4/RWiXF6L3PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=veWNjOyx0q2aoHvEbX2sAz0cuq6dhXLamwz9eTavWpQ=;
	b=I2qYBc56VN7ouJ473H3Sq6F2Uoin+E+kOviXoEfyxGyEE2ll5Ld8sbvqAnr7oUQeZpRb
	 oTbCYQbHOdCBbygi4+yeUtp4FiXuzxNZ2OyP+BpIbqAXZ6BWY6LfDNnVzfMBiXgpoHbr4
	 htv/rGnUArEe9NdPRaBCIvYUIJNJJ7xdtLWzkgUpTykKWtqZp4H26g41mx3t2EpwtiJgm
	 3o349R3+xzO7QApHuTA+QOcrZdU4c5RjQlLdaav+MSHk4o69hpEWAen32GCHpJjYU42eA
	 05WTm2Sxck6s6q+f1JsHUYrlduxoTVpcClv5etIOZMB1vo8+FhcZnBYE6bj5q9tWMaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=wUNRfVST;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53B4606A321
	for <loongarch@lists.linux.dev>; Tue, 27 Oct 2026 02:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A53B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=wUNRfVST
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-535f598d126so86161cf.1
        for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 19:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793069875; cv=none;
        d=google.com; s=arc-20260327;
        b=Xi3XXXgFm7yfn2ThMQwWJk2+mOvPMwJcGMRF9TABwDitjmSHGl/JZSiLR0/WTFdTK6
         VfnhJ3H7aplpsknuhVK0HdxhGt2CHkuaW06z8MwDVAGa7CKQtICduZlmHa8jCM7XubJq
         o30Nqa73ymTWofIbDA/EpZmImKC1UWdtGELCJKo6X7E4GTTfsQ4KYZj1S3bYJoP6/PJE
         ICtxSTvdlTADqYahuM262H+FxCD0ImzRHOQLk7PNONeINE1c5d8uO/+pUWsHwz3yA8Ik
         NtSUgI9eyO5va7KXcipWimGKbP2Ap6q0V6Uhs4FzQ3NAkcvxGxIigHEIySYxf34CR50y
         722A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=veWNjOyx0q2aoHvEbX2sAz0cuq6dhXLamwz9eTavWpQ=;
        fh=i/Km2ty2BMZNFiOZnuHBuF/hIUZFXukebtws+VNLbZ0=;
        b=Nsw121j4MMEBpvYGNdlvjlFb9ItUbL0BRa57QNMEic0aVwGTQhUzS99gTwvhwwR18F
         wq+5NSDVm6MDGL6bh83B+jk7p1mX4Vhf7twr0PegJpma79RxO7sn4U6EWOPLL9/LiDJ8
         nKxKmQt7hUkpPvn9HRpmNGpjP2IUmdzwfsUeOEfBifK/by0wFzxzfxhKV/S40wo8aq+2
         ptrdUXNWq3hz0nYbBbv9+LjCbPuapgArHu3GS+ZMxoIpTYsTliV/kcgmgBYIkVpOLeTa
         nSopxF3ii4NONZWkgG5oHQ9yEo6F1iasrBX3Lc4EitG6RmToUyUsUkoMei+yu2F1XrHp
         jKfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793069875; x=1793674675; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veWNjOyx0q2aoHvEbX2sAz0cuq6dhXLamwz9eTavWpQ=;
        b=wUNRfVST9RiT7siy3SvmzJErbNHwQm30U7vxZz60F4yfohImzHjA0L0T+4haGYu/yK
         hphOS0+cJ4d/I8ewkZUsFhEp09TzYV8cJb67y09pSGnvnLoAsrRq2v08JFGkBorvY0ii
         K6JuRO32JQJcVrSUiv8N0r9ngIQLtQFIeZw7ZdFBgVITIyq1sV8HymZUMtd9R+dur3LG
         dt3hczWkqvCC4V0OdysdbLifsYkzAOIX3120ieQYFEe01juNupuV0zxqIh6n49r2BLrf
         UgQfMhRjajMeaaieXifac/9DfMLzYKzZoUS26QwSBnw6faDKTX4csm5Ph5O4gldvbfd1
         FiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069875; x=1793674675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veWNjOyx0q2aoHvEbX2sAz0cuq6dhXLamwz9eTavWpQ=;
        b=ab7jE3ennJqBquDcCQtXyQC1poNJdesZQrd69pxEfiUqVN+xXImAJ4RRc8EVWcAqpl
         jZDE0ig7KeIYAbO0xl9btZEr9U597ZP//yAIwH0/I/JPWHLhuk3PLSZBPMCuAPOqZyGI
         7dT4+M7ZI3p0b9ihGUVz8q/sZRhs4QPXfPxwZYkCKa5ckFNxAIV0SqJtYClZNocHod89
         LrjVylGXehCO7o/KU9QxcY9F6wgSOGjPHERzbBtSYmmJjXpAEU6Vxa6AItbrarQ3/MZR
         HOjIKRvWGS0cq5ev87HJLmFL8gPniJlwNsvY8rCC+DPopvvL7T1jrKtUqNvsS+MqTdhm
         AMOg==
X-Forwarded-Encrypted: i=1; AKwUvByHL4Uph8z/l7KZc4uw9X0Fahs32uQwHEEcDP+VmmsXMpMT7E2/F4E4RTH8FpZ21ek5rw63275S4Sc=@lists.linux.dev
X-Gm-Message-State: AFq9FYI8vpbNqsxWMz6CO+vOWtUB3Ss23W++iOVtNwZPQ2CVvLWVXNM1
	Vt52bvKC9JAY1tVrmGfac1JibchhkdM8hB7q883E3mRr0UNcKBpUnbaPTOGUCKhw0bHCnVXT9cE
	6bca0d1p1sIbJ/x8eJQ4g/vk+4S6Ok2SIZO5OrzNU
X-Gm-Gg: AYBFou3vdDcqpDfB8fhnAMLzOZj6SGP4SPqgT10ATzB+KgKHOMjX+RmiZDzGAGUpoLp
	T5PJ8youUkzDKnUOhfezm4EMsh1oYs2ahiSZa5GQQDZyL3ZWoc3383KoBCgHkjYUChgMx+/nUAH
	kaomaPKUDPvSEX0z/B+WfuTYdzKzF/438uLxk9F9a/1SnC53eo4DXihdeD0573S6jjsjpn+0oum
	txQj6J2a/RfLaYZ1q0mSoA9COXJiRnpB+FRTt0gnQwL5eRamFPfY3Ru4Sev+w4WpkCdSaYmuBLJ
	smkr1n/vPbPlbjqnNZrzV3dmTu0CCBL3JpVzKmSQTIKvrPdL18aTxl4j7T9gdmeASHmPviTLd51
	enUG4amI+eP4m8HvePNc6NqgI//T/rQFqYAKo
X-Received: by 2002:ac8:5cd0:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-53e74f18ea0mr8347351cf.8.1793069874720; Mon, 26 Oct 2026
 19:57:54 -0700 (PDT)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
 <arFYRAa-i7CIwmHL@gremlin> <arF-E3Nsw9ZliH0t@casper.infradead.org>
 <arI_w2wTfA00Mgy9@gremlin> <armexcXDiG8ryZd6@casper.infradead.org>
 <CAGsJ_4xuFi7K+crAcFQ998SxXS0xPM6QeA34JV+6+Sy005rXLg@mail.gmail.com>
 <ar7MsOb6IJLt4eLo@casper.infradead.org> <ar-o1TrOMGrrcxLX@gremlin>
 <ataDTEZIKOYtwhUF@casper.infradead.org> <CAJuCfpH88HGXyLzBr6YGxzTrOq18HaPcRvhN9RwEBxG_ptv7KQ@mail.gmail.com>
In-Reply-To: <CAJuCfpH88HGXyLzBr6YGxzTrOq18HaPcRvhN9RwEBxG_ptv7KQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 26 Oct 2026 19:57:43 -0700
X-Gm-Features: AclHuK_KCyZzsUIRPigLpRqw3YeQAHnl6JHTenlWoPcunSyUcxCZShOICs2gDrI
Message-ID: <CAJuCfpH6o1NAN_4W6VY6o3unxr9V+YCNFiLS8oCg7giWRLz8_g@mail.gmail.com>
Subject: Re: [PATCH v6] mm: retry page faults once under the per-VMA lock
To: Matthew Wilcox <willy@infradead.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Hongru Zhang <zhanghongru06@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@kernel.org, liam@infradead.org, 
	mhocko@suse.com, rppt@kernel.org, shakeel.butt@linux.dev, vbabka@kernel.org, 
	zhaonanzhe@xiaomi.com, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, agordeev@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, linux-s390@vger.kernel.org, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, Hongru Zhang <zhanghongru@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 7:39=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, Oct 19, 2026 at 1:53=E2=80=AFPM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > On Fri, Oct 02, 2026 at 02:12:35PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On Thu, Oct 01, 2026 at 10:12:16PM +0100, Matthew Wilcox wrote:
> > > > So what I didn't realise is that fork() waits for page faults to fi=
nish.
> > > > I don't think that's necessary, so we can just stop doing that (whi=
tespace
> > > > damaged):
> > > > I think this is safe.  I've booted a kernel with this change, and
> > >
> > > I'm afraid it's not safe :)
> > >
> > > We already actually did this (by mistake I think?) before. See commit
> > > fb49c455323f ("fork: lock VMAs of the parent process when forking") -=
 we shipped
> > > that in 6.4.0 -> 6.4.2 and it corrupted memory all over the place.
> > >
> > > Reports + a consistent reproducer:
> > >
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D217624
> > > https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kern=
el.org/
> > > https://lore.kernel.org/all/b198d649-f4bf-b971-31d0-e8433ec2a34c@appl=
ied-asynchrony.com/
> >
> > I wonder if we still need this.  The commit message says:
> >
> >     A concurrent page fault on a page newly marked read-only by the pag=
e
> >     copy might trigger wp_page_copy() and a anon_vma_prepare(vma) on th=
e
> >     source vma, defeating the anon_vma_clone() that wasn't done because=
 the
> >     parent vma originally didn't have an anon_vma, but we now might end=
 up
> >     copying a pte entry for a page that has one.
> >
> > But we're holding the mmap_lock for write here, and we need to hold the
> > mmap_lock for read in order to change a vma->anon_vma (asserted in
> > __anon_vma_prepare() with mmap_assert_locked()).
> >
> > At the time of this commit, lock_vma_under_rcu() contained:
> >
> >         /* find_mergeable_anon_vma uses adjacent vmas which are not loc=
ked */
> >         if (!vma->anon_vma && !vma_is_tcp(vma))
> >                 goto inval;
> >
> > so we really did have to wait for read holders to finish the fault.
> > But commit a373baed5a9d deferred the check for a NULL anon VMA until we
> > actually needed it, so I think commit fb49c455323f's logic was invalida=
ted
> > by a373baed5a9d.
> >
> > Maybe I'm wrong.  This is all a bit out of my normal area.
> >
> > > Also we have asserts for this lock in copy_page_range() and
> > > copy_hugetlb_page_range() which will now fail (and possibly more furt=
her down
> > > the stack?)
> >
> > Possibly we have to adjust some assertions to check that either we have
> > the VMA locked or we have the MM write locked.  That doesn't seem
> > unreasonable.
> >
> > > > My argument for why it's safe is that a thread which takes a page
> > > > fault during fork() might have taken the page fault either before o=
r
> > > > after fork().  The faults will definitely happen in the parent proc=
ess.
> > > > They may or may not have happened in the child process, which can't
> > > > possibly care whether or not they've happened.
> > >
> > > The problem isn't the child it's the parent - copy_page_range() _modi=
fies_ the
> > > _parent_'s page tables in-place, on assumption that nothing else can =
access
> > > them (for CoW).
> >
> > I was perhaps unclear.  What I mean is that the child may or may not
> > observe them as having happened.
> >
> > > And actually nowadays things are _even_ worse, you could also have co=
ncurrent
> > > page faults, MADV_DONTNEED, MADV_FREE, MADV_GUARD_INSTALL/REMOVE, UFF=
DIO_COPY +
> > > UFFDIO_MOVE (yikes) all of which might introduce new issues + would h=
ave to be
> > > audited too.
> >
> > Yup.
> >
> > > So - it turns out a lot of stuff implicitly assumes VMA write lock no=
w:
> > >
> > > 1. CoW - deferred TLB flush race
> > >
> > > (The issue above)
> > >
> > > https://lore.kernel.org/all/20230705171213.2843068-2-surenb@google.co=
m/
> > >
> > > This happens because __copy_present_ptes() does wrprotect_ptes() on t=
he parent
> > > without a TLB flush (that's deferred until the end of the fork).
> > >
> > > But unfortunately without a VMA write lock something can then replace=
 the page
> > > table entry in the meantime and you can end up with data loss as a re=
sult.
> >
> > Is it that fb49c455323f commit message is insufficient and we need to
> > prevent simultaneous fork/page fault for other reasons, then?
>
> Yes, I think so. It refers to one of the reasons VMA lock is needed
> during fork, but as Lorenzo points out, there are a number of other
> reasons that require fork to protect VMAs. Note that some of those
> reasons, like MADV_GUARD_INSTALL and UFFDIO_MOVE did not exist at the
> time fb49c455323f was written.

I also have to agree with Lorenzo that allowing fork to run
concurrently with page faults might only shift the mmap_lock
contention from fork to some other operation (mmap/mprotect/etc.), so
even if we fix all these cases we might end up with contention
somewhere else.

>
> Below is the list that AI pointed out, and I think Lorenzo covered
> most if not all of them:
>
> Without vma_start_write_killable(mpnt):
>       1. In-flight VMA readers that locked mpnt before
> mmap_write_lock_killable(oldmm) continue running concurrently with
> dup_mmap().
>       2. New VMA readers (page faults via lock_vma_under_rcu(),
> madvise under MADVISE_VMA_READ_LOCK, userfaultfd via uffd_lock_vma() /
> uffd_move_lock(), vma_start_read_unlocked(), etc.) continue to succeed
> on mpnt while dup_mmap() duplicates its VMA metadata and page tables.
>
>   (Note: When this lock was originally added in fb49c455323f, one
> prominent trigger was a concurrent fault calling anon_vma_prepare() on
> a VMA with mpnt->anon_vma =3D=3D NULL while anon_vma_fork() /
> vma_needs_copy() ran. Although __vmf_anon_prepare() now requires
> mmap_read_trylock()
>   when !vma->anon_vma, removing vma_start_write_killable(mpnt) today
> still breaks several critical invariants.)
>   =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>   ### What would happen if we removed it
>
>   1. **Destruction of live 2MB THP mappings ("bad pmd" -> pmd_clear())
> in copy_pmd_range()**
>   As noted in the comment in copy_pte_range(), copy_pmd_range()
> assumes no concurrent THP transitions on src_pmd:
>     if (pmd_is_huge(*src_pmd)) { ... }
>     if (pmd_none_or_clear_bad(src_pmd))
>         continue;
>   On an anonymous VMA that already has mpnt->anon_vma !=3D NULL, a
> concurrent per-VMA-locked THP fault (do_huge_pmd_anonymous_page()) or
> UFFDIO_MOVE can install a transparent huge PMD into *src_pmd right
> after pmd_is_huge(*src_pmd) observed pmd_none.
> pmd_none_or_clear_bad(src_pmd)
>   then sees pmd_bad(*src_pmd) =3D=3D true (a THP leaf PMD satisfies
> pmd_bad()), prints "bad pmd ...", and calls pmd_clear_bad(src_pmd) =E2=80=
=94
> wiping out the parent's live 2MB PMD without PTL, TLB flush, or
> rmap/refcount/deposited-pgtable/RSS cleanup (corrupting parent memory
> and
>   triggering Bad rss-counter / nr_ptes bugs on exit).
>       =E2=80=A2 The same race exists for huge PUDs in copy_pud_range()
> (pud_none_or_clear_bad(src_pud)).
>       =E2=80=A2 Similarly, copy_huge_pmd() reads special huge PMDs
> (VM_PFNMAP/VM_MIXEDMAP) locklessly and skips rechecking *src_pmd under
> src_ptl assuming it cannot change, so a concurrent MADV_DONTNEED under
> MADVISE_VMA_READ_LOCK could leave the child mapping a stale/zapped PFN
> PMD.
>   2. **Silent CoW data corruption / lost parent writes due to deferred
> flush_tlb_mm(oldmm)**
>   __copy_present_ptes(), copy_huge_pmd(), and
> copy_hugetlb_page_range() write-protect parent PTEs/PMDs without
> flushing TLBs; dup_mmap() defers the flush to flush_tlb_mm(oldmm)
> after all VMAs are copied. Normally, because each copied VMA remains
> VMA-write-locked until
>   mmap_write_unlock(oldmm), no parent thread can handle a CoW write
> fault before flush_tlb_mm(oldmm) finishes.
>   Without the VMA write lock, while CPU 0 is still in dup_mmap()
> copying later VMAs:
>       =E2=80=A2 CPU 1 (parent thread A) still holds a stale writable TLB =
entry
> to old_folio (now CoW-shared with the child).
>       =E2=80=A2 CPU 2 (parent thread B, no cached TLB entry) writes to th=
e
> same page, faults on the R/O PTE under per-VMA read lock, enters
> wp_page_copy(), and copies old_folio into new_folio
> (__wp_page_copy_user()) before taking PTL and calling
> ptep_clear_flush().
>       =E2=80=A2 Any store by CPU 1 through its stale writable TLB entry a=
fter
> __wp_page_copy_user() and before ptep_clear_flush() lands directly in
> old_folio while pte_same() still succeeds =E2=80=94 losing thread A's wri=
te in
> the parent (new_folio) and leaking it into the child (old_folio).
>   3. Broken guard-page (MADV_GUARD_INSTALL) state and KCSAN race on vm_fl=
ags
>   madvise(MADV_GUARD_INSTALL) runs under MADVISE_VMA_READ_LOCK and
> atomically sets VMA_MAYBE_GUARD_BIT on mpnt via vma_set_atomic_flag()
> before installing PTE_MARKER_GUARD entries:
>       =E2=80=A2 vm_area_dup(mpnt) asserts
> ASSERT_EXCLUSIVE_WRITER(orig->vm_flags), which would trip under KCSAN.
>       =E2=80=A2 If vm_area_dup(mpnt) copies mpnt->vm_flags just before
> MADV_GUARD_INSTALL sets VMA_MAYBE_GUARD_BIT and installs
> PTE_MARKER_GUARD PTEs:
>           =E2=80=A2 On a file-backed VMA without anon_vma, tmp misses
> VM_MAYBE_GUARD (part of VM_COPY_ON_FORK), so vma_needs_copy() returns
> false and drops the guard regions in the child.
>           =E2=80=A2 On a VMA with anon_vma !=3D NULL, copy_page_range() c=
opies
> the PTE_MARKER_GUARD entries into tmp, leaving the child VMA with
> guard PTE markers without VM_MAYBE_GUARD set (breaking collapse checks
> such as file_backed_vma_is_retractable() and future merges/forks).
>
>   4. Inconsistent address-space snapshots against UFFDIO_MOVE and
> tcp_zerocopy_receive()
>       =E2=80=A2 When UFFD_FEATURE_EVENT_FORK is not enabled, dup_userfaul=
tfd()
> never increments octx->mmap_changing. Because move_pages()
> (UFFDIO_MOVE) only takes per-VMA read locks (uffd_move_lock()), it
> could move an exclusive folio from a not-yet-copied src address/VMA
> into an
>       already-copied dst address/VMA (losing the page at both
> addresses in the child), or move a zero page from an already-copied
> src to a not-yet-copied dst (duplicating it at both). Even with
> UFFD_FEATURE_EVENT_FORK, octx->mmap_changing is only incremented once
> dup_mmap()
>       reaches the first VMA using octx, so earlier non-uffd VMAs rely
> on VMA write-locking to prevent cross-VMA moves.
>       =E2=80=A2 tcp_mmap() sets VM_MIXEDMAP (in VM_COPY_ON_FORK, without
> VM_DONTCOPY), so copy_page_range() would race with
> tcp_zerocopy_receive() zapping and inserting pages under
> vma_start_read_unlocked().
>   5. Immediate debug assertions (CONFIG_DEBUG_VM)
>   Both copy_page_range() and copy_hugetlb_page_range() call
> vma_assert_write_locked(src_vma) on every CoW VMA, which immediately
> fires VM_WARN_ON_ONCE_VMA(!__is_vma_write_locked(vma), vma) because
> oldmm->mm_lock_seq was bumped by mmap_write_lock_killable(oldmm) while
> mpnt-
>   =EF=BF=BA>vm_lock_seq was never updated.
>
> >
> > > Same issue exists with hugetlb wp too. And god only knows with uffd w=
p :)
> > >
> > > 2. THP - can destroy parent THP mappings
> > >
> > > copy_pmd_range() does:
> > >
> > >       if (pmd_is_huge(*src_pmd)) { copy_huge_pmd(); ... }
> > >       if (pmd_none_or_clear_bad(src_pmd))
> > >               continue;
> > >
> > > Without the write lock, a concurrent fault can install a huge PMD via
> > > do_huge_pmd_anonymous_page() or filemap_map_pmd()/do_set_pmd().
> > >
> > > The issue is that pmd_bad() fires for leaf PMD (ugh) on at least x86 =
and arm64,
> > > meaning that'll clear the page table entry.
> > >
> > > I think Hugh left a comment alluding to this before:
> > >
> > >        * copy_pmd_range()'s prior pmd_none_or_clear_bad(src_pmd), and=
 the
> > >        * error handling here, assume that exclusive mmap_lock on dst =
and src
> > >        * protects anon from unexpected THP transitions; ...
> > >
> > > It's like the mess around pmd_trans_unstable() :(
> >
> > ... could we fix this by taking the ptlock during the copy operation?
> >
> > > 3. copy_pte_range() skips the required pmd_same() recheck assuming wr=
ite lock
> > >
> > > It uses pte_offset_map_rw_nolock() with a dummy pmdval and:
> > >
> > >        * We already hold the exclusive mmap_lock, the copy_pte_range(=
) and
> > >        * retract_page_tables() are using vma->anon_vma to be exclusiv=
e, so
> > >        * the PTE page is stable, and there is no need to get pmdval a=
nd do
> > >        * pmd_same() check.
> > >
> > > (Probably needs updating for VMA write lock...)
> > >
> > > 4. The asserts
> > >
> > > Mentioned above!
> > >
> > > I suspect there's more as well.
> > >
> > > Some of it could be changed, but it'd all be at the cost of behaving =
very
> > > strangely (no VMA lock but mmap write lock) while manipulating things=
.
> > >
> > > And I am not really happy with changing page table entries in the par=
ent VMA
> > > (for CoW) without a VMA write lock held.
> > >
> > > I also wonder whether it would achieve all that much really - the iss=
ue is with
> > > holding the VMA lock across I/O, anything else that tries to grab a w=
rite lock
> > > is going to end up being the new thing that's blocked (mprotect, munm=
ap, mremap,
> > > mlock etc.)
> > >
> > > I think doing something like this would need a very significant redes=
ign and I'm
> > > not convinced it's one that really achieves what we want given all th=
e other
> > > cases that'd get blocked by the VMA lock being held still.
> > >
> > > --
> > > Cheers, Lorenzo
