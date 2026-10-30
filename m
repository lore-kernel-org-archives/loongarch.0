Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386632;
	b=22FnDDW1hQGcexKG5hp2drnvEHW44kFh3xp5SXuvw5UJ7N/fjPmJAulcvwC+DmM5IWQP
	 M+l/AUclH49fw/pHfTrU8amYSCx6u8Msr2er48mi1dpQpMn9RFX+Msfiw0N3++UHGX7Cm
	 PEeBsi9Abvg/B9nuU1Mbcl8KeY2AWCTYCMpDc9bOL5OHX8AeO1mFaFjRywxbyWywFfeKn
	 3IYClXVPi7HMMeaN9Fyhq0p3hsiRR6S21k8n2aYtLV8hHQlLKQWi1xJLhENg+AJ/wiS6t
	 7E4d6VhGQTc79zLS4R/B+xohKI+RJPD4iAIp1FAVp5e5zpJBzAY6Ga1ye2v2Id0ienQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=AqsM43MOtFOSSZV0EEwrjw089w0rw12SYsGwf7bUH9w=;
	b=J36CrPxpAyPhWejlshe/43U2m/44mpwR1BhRKDItSWEN9XID7WC9O8cFedP3J2ltXsx2
	 +6AokjRcjO1MKjaFx6ZEyTgyY4Rvd8SLC1Uioonlp9MStm7BAL2wmR1Fi+8Swcbo6WVP4
	 e9p6q9U/R60Clg4m9haz/Z5rxRWoDZyebKWPL6FgXVFqDpKs1uwPEETABSI3tx27h40qO
	 1Dcq21NjGcGKppKPtEIhMLDps2dw4HTOs2cQ3otmZhCdP5IHXbY74R0Lx2JKEffg1HOHq
	 SIkwx5V8O+eaoOwRKsaTVNWgT/ejh5ae0t1+6Kl3JEaKkgQFHdouoxKHUdCh9ZBBuZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IvZg2Ts6;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFE0606A31D
	for <loongarch@lists.linux.dev>; Fri, 30 Oct 2026 18:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBFE0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IvZg2Ts6
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so1593640a91.0
        for <loongarch@lists.linux.dev>; Fri, 30 Oct 2026 11:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793386631; x=1793991431; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqsM43MOtFOSSZV0EEwrjw089w0rw12SYsGwf7bUH9w=;
        b=IvZg2Ts6Cm17FpnE69Qvvi5exfUbH1yk5N+FFocSRBGRJI7WsYLi0Ad8TbWSspp++v
         XLsRXI6Oo8o5SiKwJR/mi3mKtVDorImHXkggWiFndhCdOifTuGGy7siJi34PvLJWVu93
         U2I6CAG/d6CDm6KQBjdfgOEj5JyCEcI4+j1os4uwttUJedZAZAHGpp+ZHqfUrAnvF0/q
         rKCDJFJNMCe0oDL/ba4F1iv3kXDkOsU/VQyVJj+ct+ivp8kOEdTUhLaz9R2+EgO6xiuM
         /cbH0hSUSLlAoegKMTFdyqL+dM9lVXgOMbMP4YslbxMBYGnu5ZZlOs0PncC+fyaGeygl
         OkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793386631; x=1793991431;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqsM43MOtFOSSZV0EEwrjw089w0rw12SYsGwf7bUH9w=;
        b=Uh6YHoEIb9JNW+QEIxiuwj6WTL1VFHvSjGvMG4rPrQCvc9nF3qjZFmo/iVgmOIHjIk
         GZ5l555DG/EuUFeT4yX3oWEs0yRAVX5bmP283Z/IHznp+O/znz7DsdU0/ZQgDC2pwqwB
         P/SU1Sw4fc5tuECMJIx+NTIQO3MV7cz73WbKtNlEEgoIiKtgVFeGeba9loPQe3cGRY+8
         Hqa7QcUHFyEI5cyGcrEsjcrf4xSNosmmE5wiEF64zXtpXhAFfRZ+jQjv5+Mo7KXKCOh6
         5p87EwbbdIrqrDqLsTDkO6pcaPo+mXleD3EwrEh+VyIYXkjSpB/46J0bMNTt4J4+bi4o
         hbEg==
X-Forwarded-Encrypted: i=1; AKwUvBz2IKfcuOTIYBC3gNUHoEF+wfiKpkVscAStG7ZErQK4ENNX3SIvRKM2DrAWibRr6OZ+RVe260bI1FA=@lists.linux.dev
X-Gm-Message-State: AFq9FYLDIY4hSOkXcwLnVenUwJj9gPT4L7MCWbxADtmyN/WsZxxFmPZC
	Zr56kylKhiiU6Re3+vzvAuX2F3XTR019lIodeNMEM9ClSLvEBYMm+b5ihHqWBCmJeGSXenOK6Pg
	XfCR7pw==
X-Received: from pjbbo5.prod.google.com ([2002:a17:90b:905:b0:3ac:24b3:3484])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2c6:b0:3ac:b3c7:de04
 with SMTP id 98e67ed59e1d1-3ae897aa752mr1800362a91.34.1793386630946; Fri, 30
 Oct 2026 11:57:10 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:57:10 -0700
In-Reply-To: <auStM0rbFol79h5o@li-fbf77acc-29ba-11b2-a85c-e8e934f50a46.ibm.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com> <20261028190259.1819571-4-seanjc@google.com>
 <auStM0rbFol79h5o@li-fbf77acc-29ba-11b2-a85c-e8e934f50a46.ibm.com>
Message-ID: <auTohixp3V5-vNsB@google.com>
Subject: Re: [PATCH 3/7] KVM: PPC: Explicitly force IPIs when directly kicking vCPUs
From: Sean Christopherson <seanjc@google.com>
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 30, 2026, Gautam Menghani wrote:
> On Wed, Oct 28, 2026 at 12:02:55PM -0700, Sean Christopherson wrote:
> > Explicitly force an IPI when invoking kvm_vcpu_kick() directly instead of
> > relying on kvm_arch_vcpu_should_kick() to unconditionally return 1/true.
> > This will allow dropping kvm_arch_vcpu_should_kick() in favor of
> > kvm_request_needs_ipi().
> > 
> > No functional change intended (1 || 1 == true).
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/powerpc/include/asm/kvm_ppc.h | 13 ++++++++++++-
> >  arch/powerpc/kvm/book3s.c          |  4 ++--
> >  arch/powerpc/kvm/book3s_pr.c       |  2 +-
> >  arch/powerpc/kvm/booke.c           |  6 +++---
> >  arch/powerpc/kvm/e500_emulate.c    |  2 +-
> >  arch/powerpc/kvm/powerpc.c         |  2 +-
> >  6 files changed, 20 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> > index 169ea6a7fbad..bbe7378ad0ef 100644
> > --- a/arch/powerpc/include/asm/kvm_ppc.h
> > +++ b/arch/powerpc/include/asm/kvm_ppc.h
> > @@ -30,6 +30,17 @@
> >  #endif
> >  #include <asm/inst.h>
> >  
> > +/*
> > + * TODO: For unknown reasons, KVM PPC has historically ignored vcpu->mode when
> > + *       determining if kicking a vCPU needs an IPI.  Either document why that
> > + *       behavior is necessary, or drop this helper and the @force param from
> > + *       __kvm_vcpu_kick().
> > + */
> > +static inline void kvmppc_vcpu_kick(struct kvm_vcpu *vcpu)
> > +{
> > +	__kvm_vcpu_kick(vcpu, false, true);
> > +}
> > +
> 
> AFAICS, there is no reason for PPC to always return 1. I was looking at
> the old patches on mailing list and found this - https://lore.kernel.org/kvm/0FEE585F-5E21-47F2-A3F0-AD0DE05EBB43@suse.de
> 
> ```
> How about we return 1 for kvm_arch_vcpu_in_guest_mode() on !x86 always, just
> like it's done today basically? Then we can worry about needless IPIs later
> and don't regress from the respective current kick implementations.
> ```

FWIW, I found that as well, but there are a metric ton of kvm_vcpu_kick() calls
that have been added since then, and they scared me.

> However, I'll do some testing and get back by mid next week to make sure
> there are no suprises.

Thanks!  If we can drop the PPC behavior, that would be wonderful!  Though if
we do that, it should be for 7.5 in a follow-up (this series really should go
into 7.4 due to the SNP issue).
