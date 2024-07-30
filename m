Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBF718B47D
	for <loongarch@lists.linux.dev>; Tue, 30 Jul 2024 20:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722369653; cv=none; b=KK/bQFW5IrTBZXsgZ7MvaWEg01sITYzziCcMIPHwYtY2a0/mZJlfYZUbo0QKRYPvKIU2MNRMeJguWzZAUoPs5C7A6rvi0iSOUCd15hfLln8O7sfgmptq/EMXDisjhnYeTDEDwY1Rhqu9Wt1oC/VHNHVnbr1/WloK3eDCoY8uSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722369653; c=relaxed/simple;
	bh=Sm9YliIBseVNdVtXfF6wU54oboHpFF3iBhE8X9in9r4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qdNyCsWP5ly2tJkQ7tA96p1IeXRH7ZR3ld1VXsDF8erMphf+l6clzVh9fieHi2pb27CyOhktAI6MDjh1a1Zil5D7U18xNoNnvR7iLiPWoOJLN8eOytFo+OsmzGm/n2pczwmUGUBmqi2oeJNBMrg3AR+xqdK9xxZ7n933ZX9M7yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0sltv6oH; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0sltv6oH"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-79d95667cfaso5086161a12.2
        for <loongarch@lists.linux.dev>; Tue, 30 Jul 2024 13:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722369651; x=1722974451; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1b0dd+u4QtRKmjCQ1fWaclUboiBOp5PBFZF+RqiWy8=;
        b=0sltv6oHYHMWo7rkTv5Lz15aFfq8MT7UoLW6U1cZHIqnUPBtE2S7j1SoLqYR3CaWyF
         uKrY93gl3C6ButQKGcYK2mSvMmHIcPwfGEagGQ1NUwNFLyO8ooIkD91IfeHgoryuKs3F
         RRBUyZLT7nC0H6s5jarsGigvi2nsXAC6bADxJoOAfX3E+YQFjLg2u0jAmS5I1st18AjY
         w7wVyO/uMLVG+9gEim1erLnahKErDY1stYX/tfSNk/t8sxom0yJ8Hd2HtSwiJMtbTYcR
         Ik0le5q90MPUAnPQ1oNFBhdgmqkMklXsSM4E/5CkuF+t78FytvrxNO2A73l+XvcuY2GJ
         4Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722369651; x=1722974451;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1b0dd+u4QtRKmjCQ1fWaclUboiBOp5PBFZF+RqiWy8=;
        b=FmCJfmmx0Ny/AFa6NCQ3eMNaeJTO57f7MXDmZPE1ccBqIgtoQLHg6Au06wEYBNuIM3
         ALwE2jX2rGKkz73OsQGzXpnJw1+lK+2g2wbsSKSz49RHyh8yJ+Ud3gPe3GAKq64W3NAy
         3VzSY6UEvCbUI4GpWE0GkKndtjViPOme2chueaVPiJYBADy6rgab2uIy3l5rQh++eGCc
         pxHBA5VFQZy3TVDkRGQbxgFfh2rCuxs73eyiaJ7Pc/M6/eZdAJjQhvMNDRrugEaXyT2x
         YXmgPtLdq47BKHXBXGdLf20brnw6L9WSJEX0A3LL37bUhrtLrDBL8nkS33Wats2Fiwjt
         6Wmw==
X-Forwarded-Encrypted: i=1; AJvYcCUWPKq5UjqK3g9g5useFvhL70fEG89mNcY+z2Bl/9Qnl9wVs9CnHGhp15v/qhqFQuxQ17+iHSbXZebX1n2I0iAZ14bgpnT5hraH
X-Gm-Message-State: AOJu0YxH9WHhNbBTu/4lrrbE2tx3VnAJzn0BdPEKY8U1bJqvHc1ArjC6
	wT+O8VFe52738bQvJIx1YGK9MK44+ezQy9JDfXaIWESqrTH1oJlW1YDLjyvVC7nT0SLzZZ91jNs
	s+w==
X-Google-Smtp-Source: AGHT+IFIpN0t9CwDntyaqKmkPJ5cyx3sfG1IwNUw2ka0n2i9gazwPDbMR7YOpYtas1d8Mj8EPxP4qtxT2wA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:5a3:b0:6bc:b210:c1dd with SMTP id
 41be03b00d2f7-7ac8fd2ec71mr34114a12.8.1722369651264; Tue, 30 Jul 2024
 13:00:51 -0700 (PDT)
Date: Tue, 30 Jul 2024 13:00:49 -0700
In-Reply-To: <2da6b57e-d5c2-4016-b89b-d51700eeb845@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-46-seanjc@google.com>
 <2da6b57e-d5c2-4016-b89b-d51700eeb845@redhat.com>
Message-ID: <ZqlGcaESdxw5vzl8@google.com>
Subject: Re: [PATCH v12 45/84] KVM: guest_memfd: Provide "struct page" as
 output from kvm_gmem_get_pfn()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:51, Sean Christopherson wrote:
> > Provide the "struct page" associated with a guest_memfd pfn as an output
> > from __kvm_gmem_get_pfn() so that KVM guest page fault handlers can
>        ^^^^^^^^^^^^^^^^^^^^
> 
> Just "kvm_gmem_get_pfn()".
> 
> > directly put the page instead of having to rely on
> > kvm_pfn_to_refcounted_page().
> 
> This will conflict with my series, where I'm introducing
> folio_file_pfn() and using it here:
> > -	page = folio_file_page(folio, index);
> > +	*page = folio_file_page(folio, index);
> > -	*pfn = page_to_pfn(page);
> > +	*pfn = page_to_pfn(*page);
> >   	if (max_order)
> >   		*max_order = 0;
> 
> That said, I think it's better to turn kvm_gmem_get_pfn() into
> kvm_gmem_get_page() here, and pull the page_to_pfn() or page_to_phys()
> to the caller as applicable.  This highlights that the caller always
> gets a refcounted page with guest_memfd.

I have mixed feelings on this.

On one hand, it's silly/confusing to return a pfn+page pair and thus imply that
guest_memfd can return a pfn without a page.

On the other hand, if guest_memfd does ever serve pfns without a struct page,
it could be quite painful to unwind all of the arch arch code we'll accrue that
assumes guest_memfd only ever returns a refcounted page (as evidenced by this
series).

The probability of guest_memfd not having struct page for mapped pfns is likely
very low, but at the same time, providing a pfn+page pair doesn't cost us much.
And if it turns out that not having struct page is nonsensical, deferring the
kvm_gmem_get_pfn() => kvm_gmem_get_page() conversion could be annoying, but highly
unlikely to be painful since it should be 100% mechanical.  Whereas reverting back
to kvm_gmem_get_pfn() if we make the wrong decision now could mean doing surgery
on a pile of arch code.
