Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185412AAEB
	for <loongarch@lists.linux.dev>; Fri, 19 Apr 2024 13:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713535091; cv=none; b=cxsPUDLbkQ0bbREooD0XSpnwX5B7wqqHmzdnZWpcyKtapY7gdgKJUpNRnvg8YAWMsh2GtWRdEc3w46l/g79LAAdP3YoAYd8rX4HBnpKQQvNI31rRcoG7XkSRzJlPycGG2to/ZaLCDF6dWNpXvUlEHUENZjUJ5V/fxh3bW1pt1a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713535091; c=relaxed/simple;
	bh=gKtJtEltb2GnPLMyuxs+G7n5EiHdmrtpBSJFJerWnT0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pt/+tg0vD0iMYAsmVekgBSV2oXR++VrttKfrpPrwu7amIc0CKUMKiPhhpOVcKB4QPPDCEBAlAKMyKF0zL8nS04qu0z3Nl7A0GSeMJh7/wJEoLmHjdjGr+E0EQlT49pmwwSz5cjDQGe3Gwa4C7vSxgsN4J7capsaHAQnBrHDiWBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AmC3DxMj; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AmC3DxMj"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dbe9e13775aso3836035276.1
        for <loongarch@lists.linux.dev>; Fri, 19 Apr 2024 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713535088; x=1714139888; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KgrnEQ6mmP0jFk5Zb1SZY9boKJybsIIVble8n571sqI=;
        b=AmC3DxMjFCegBnTpEWg1lUcUpV/VxpGFZJlpGry2hKL07jxm+aL70Gd8MxvTIiV4iu
         0S0610mUtepQsWNPvITcNz4Q3t5rwkWqojVMB+vH/uuKWDuUjqPXoKTJ7e76GDX+YbH4
         ayXMXc6M9v4AxQ0gVx3oolqhHNY/PbiOKyDwnwv9Q4LNIQVTae9UItAu+BbtAop8F4Y/
         Tvy9N5zBfq/Nw1iNHwT/qhX0acHc0w8ts9a2tzI6YA/7AU+9LeNoEBWStygreFBKctnF
         TSrEP/Xd5GOp1jdZ4CGcXMN103RSI+3c6IYiHnT2RqMOC0xb2qpnrVryDJGuByNCy9Zn
         Q2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535088; x=1714139888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgrnEQ6mmP0jFk5Zb1SZY9boKJybsIIVble8n571sqI=;
        b=LJcZFISyO8vEdJIHXN05UjBwhcv2rVfNRPEPLEcj6XLWzvhQMu1Vc3VkBUbLbe99dt
         ausYTYoAJIq2blTfSerYwyODMFdCv2OH5JzY+qyKs4iQRr0uYGqLFzFS/BA9HkNcBoIM
         5MfElhxUOzRKtAjw1Vk4ftp28E43xIWSs4ls5DZaX/0QCIQbWvL3/Hh3I3Gd33ptwPxG
         RyUTEucHCwnSKq7DD2s0yL/6Qoekd0do9rzmB2RNdOinKOXjicLJyp+SiGjLxy44z90y
         rxhPODLO1Y+/dfNx/hPyviQaaWN/X5y/04F5V80ETM4AfVIIP9iS8D+ONyX6Irxh5K7h
         PijQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgDJGGWS1CL/zh8YZkYze0I5XYgfMiuZrqfgg2rWgaj5et0u2Bbg60nQ/P2zSlMjorB3xhoVSam3A+/vwBykVlu1ojNTLyO86K
X-Gm-Message-State: AOJu0YwXWH9RqK2GONp+ffpr0a/a47ki5WakeBb2/ewPmP2ymWTDT8aN
	+dXImsKdrb7A302x7F2xUfg+cH6e4v1Jb0Afu7sgZn3+bBPiQsCVLpRf7Zixn0WI6jcpFs0p+/X
	GUQ==
X-Google-Smtp-Source: AGHT+IGomtDJcb51lvQMFTT5YaGoxW/vZTzkUSuhiTLoa8vZxcxiKEVXH4dmB1G1pZ9i7NSp+ryn6A1areA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ad8d:0:b0:dc6:e5d3:5f03 with SMTP id
 z13-20020a25ad8d000000b00dc6e5d35f03mr543024ybi.4.1713535088599; Fri, 19 Apr
 2024 06:58:08 -0700 (PDT)
Date: Fri, 19 Apr 2024 06:58:06 -0700
In-Reply-To: <20240419112432.GB2972@willie-the-truck>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240405115815.3226315-1-pbonzini@redhat.com> <20240405115815.3226315-2-pbonzini@redhat.com>
 <20240412104408.GA27645@willie-the-truck> <86jzl2sovz.wl-maz@kernel.org>
 <ZhlLHtfeSHk9gRRO@google.com> <86h6g5si0m.wl-maz@kernel.org>
 <Zh1d94Pl6gneVoDd@google.com> <20240418141932.GA1855@willie-the-truck>
 <ZiF6NgGYLSsPNEOg@google.com> <20240419112432.GB2972@willie-the-truck>
Message-ID: <ZiJ4bqrBUPM0E8iq@google.com>
Subject: Re: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
From: Sean Christopherson <seanjc@google.com>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 19, 2024, Will Deacon wrote:
> > @@ -663,10 +669,22 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
> >  					break;
> >  			}
> >  			r.ret |= range->handler(kvm, &gfn_range);
> > +
> > +		       /*
> > +			* Use a precise gfn-based TLB flush when possible, as
> > +			* most mmu_notifier events affect a small-ish range.
> > +			* Fall back to a full TLB flush if the gfn-based flush
> > +			* fails, and don't bother trying the gfn-based flush
> > +			* if a full flush is already pending.
> > +			*/
> > +		       if (range->flush_on_ret && !need_flush && r.ret &&
> > +			   kvm_arch_flush_remote_tlbs_range(kvm, gfn_range.start,
> > +							    gfn_range.end - gfn_range.start + 1))
> 
> What's that '+ 1' needed for here?

 (a) To see if you're paying attention.
 (b) Because more is always better.
 (c) Because math is hard.
 (d) Because I haven't tested this.
 (e) Both (c) and (d).
