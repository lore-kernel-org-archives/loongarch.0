Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30542DC35D
	for <loongarch@lists.linux.dev>; Fri, 18 Jul 2025 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752845053; cv=none; b=dUX1nGyGsz1AIzj9C61ovPyH8Kv72SXZLNbaD/IMgy11kZFtkXXpKuV6p4MKcHB+XhpvNwu68EwXCOzIKRlbjB5HHaEmrF8MDDanqi6n0AwM/uVEZXxtr3V1BnInTsTbTKcmlwZkk37pzkhT3L3XGOvBAy36hrTdCKsT6sTEjUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752845053; c=relaxed/simple;
	bh=mmXvmXcLDBxvPVQdU/HvC7mqfk8ZdMDK3IvrQ4Z0goM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6XkMbwheZam9SQQ5DjHSOL+4hLRYvYCLt3p04i8EiRkFcqGXSnPZ2txb4B+eL1/D3GIiqhWf++lVhoOldpMyyWMgqoj8Pt8793bXCDubERagpHEyM679eyPO653cutqipli5sYH1eAeqAmob1ea0vl8GYXUzyQNYtqYpKbcOtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fx4rPYW3; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx4rPYW3"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b3bdab4bf19so1562066a12.2
        for <loongarch@lists.linux.dev>; Fri, 18 Jul 2025 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752845051; x=1753449851; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SIdcZNxkLXX6lVhiVMbF7nofIkI0LLvCluRB4BfIRhg=;
        b=Fx4rPYW3zDsLrQxWOrPKa3EAiASMe6mRGkDFp0judJZYetXDnzVDo+a8ds8+sUXKSU
         gVzAgXQRWM6eoOy49iRu8h8LWL60KDTJSZikkAEeUZVxtdQqBRaQKGDWao2P4+57+o9P
         nbIdj54Gy9KX5ofpedYDYIuNSBOquaaRykONBPNz9rBp2Au9Olb4siDleiz+Hc2SOJZA
         5O22ss7QmFGbW/qVqLnjuXzMxC0nKnOR6hHo2lSzM1pFiZA5DrPayF8DbOQ1ZLr/Zw23
         10UUWRV8Lk8CIXn5eKgFiNi95d2hP9WKt18+1bSbAyzJPeQXIJbpG9SU0cK/Io+ENH0Q
         oPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752845051; x=1753449851;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SIdcZNxkLXX6lVhiVMbF7nofIkI0LLvCluRB4BfIRhg=;
        b=EG9ps03BUIaBrZw7JoxdzGNhmiArzmDct1ZWfOAT1PA1UdnGRTJv5ekNolBQRqUCGF
         W5dXiO6NlYd/jmYihIRHRptRQrQdTXYYvgJsJJMkaPdngVBQey/5wromFIJPg9+08wxh
         MQ+gr6Qv6AYRgYDxLWOhN9p7WswcVbeYgR658mUdb6CNNNKruWobp0PRU5xXV78WaH3o
         T/50yuQJN4rRByxd84b5/7auNk9p9wZclz7xWc/g5pbJZnbayp7tXB/vT7d3gdQmhe33
         hy1MZv6E7GSF4AHs8ulgjQnr2FUHTFFFzepLoIAhnbi3DN5qYOFTqBfl0pVS77wS+rNi
         SSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZA2+aHAMQBJgy4noeLudhu5cnvPa2E0WTiJ1/1dXRc/reeQTFaQcPjZwmCNsKGT2/HWVyQLegc+Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbwH463mEX50HofPtqhvwhrNcuBJB+Ata3UyCsMLuSMhxE0oHu
	qcbfufLmoAPAYuBtuH+ZgQsK4GtlTrVmqXpgXyGBQ8NKTuNMISsaFQO+
X-Gm-Gg: ASbGnct2kDhD+rr/V9F0RegmjykVsY6cCeOV7uilBjzTlLKCLGO0U/jQGo9cNaQR7aB
	UrXVuWACgWDtsZr9466uRsNQyVEjC70Jocqs1f1ENWL+8hVAT418YOCSCyKHSiPK9NQCx00URLh
	3/mzMva/7dZwDKuLQvMFgZd85PC7yaN5zUlO5dla3dkw/sh27FV3kz3WorQ/h2QE29oKGvvpMEr
	vO9PKqDnZPI72XI7WnPsjXNJxU3XY9qNYXh0g3Qjpi87AzrZDS3h3p0LzQPJIIGafuYngBTn1PQ
	Op/Vagou/MNBiN3EuIAX+YGwZ22fDPkTSGcdLpjiYw2af59aXFNb5ywD7bl9svzEHDIZUFYkSSF
	hkZNkHVLzxP+RoPEqnDx7cg==
X-Google-Smtp-Source: AGHT+IHpxQzVKJM4x5lAMiojCihB9xUwdI4b2u+bkg1/BkqblucnbhECD3b6zMG9R/Xus802gxBybw==
X-Received: by 2002:a17:90b:1b4d:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-31c9e799ba1mr13985557a91.30.1752845050715;
        Fri, 18 Jul 2025 06:24:10 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f2b49easm5316068a91.43.2025.07.18.06.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 06:24:09 -0700 (PDT)
Date: Fri, 18 Jul 2025 09:24:07 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] LoongArch: KVM:: simplify kvm_deliver_intr()
Message-ID: <aHpK9xMDsK7tHjT1@yury>
References: <20250716165929.22386-1-yury.norov@gmail.com>
 <20250716165929.22386-3-yury.norov@gmail.com>
 <CAAhV-H729+VA4fAWX1SOhCAptSDSwLDAOp_RwB0hkDtvm0hMLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H729+VA4fAWX1SOhCAptSDSwLDAOp_RwB0hkDtvm0hMLg@mail.gmail.com>

On Fri, Jul 18, 2025 at 12:13:46PM +0800, Huacai Chen wrote:
> Hi, Yury,
> 
> On Thu, Jul 17, 2025 at 12:59 AM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
> >
> > The function opencodes for_each_set_bit() macro, which makes it bulky.
> > Using the proper API makes all the housekeeping code going away.
> >
> > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> > ---
> >  arch/loongarch/kvm/interrupt.c | 25 ++++---------------------
> >  1 file changed, 4 insertions(+), 21 deletions(-)
> >
> > diff --git a/arch/loongarch/kvm/interrupt.c b/arch/loongarch/kvm/interrupt.c
> > index 4c3f22de4b40..8462083f0301 100644
> > --- a/arch/loongarch/kvm/interrupt.c
> > +++ b/arch/loongarch/kvm/interrupt.c
> > @@ -83,28 +83,11 @@ void kvm_deliver_intr(struct kvm_vcpu *vcpu)
> >         unsigned long *pending = &vcpu->arch.irq_pending;
> >         unsigned long *pending_clr = &vcpu->arch.irq_clear;
> >
> > -       if (!(*pending) && !(*pending_clr))
> > -               return;
> Is it necessary to keep these two lines?

No. They duplicate the existing logic, and the new one based on
for_each_set_bit(). That's why I remove them.

Thanks,
Yury

> > -
> > -       if (*pending_clr) {
> > -               priority = __ffs(*pending_clr);
> > -               while (priority <= INT_IPI) {
> > -                       kvm_irq_clear(vcpu, priority);
> > -                       priority = find_next_bit(pending_clr,
> > -                                       BITS_PER_BYTE * sizeof(*pending_clr),
> > -                                       priority + 1);
> > -               }
> > -       }
> > +       for_each_set_bit(priority, pending_clr, INT_IPI + 1)
> > +               kvm_irq_clear(vcpu, priority);
> >
> > -       if (*pending) {
> > -               priority = __ffs(*pending);
> > -               while (priority <= INT_IPI) {
> > -                       kvm_irq_deliver(vcpu, priority);
> > -                       priority = find_next_bit(pending,
> > -                                       BITS_PER_BYTE * sizeof(*pending),
> > -                                       priority + 1);
> > -               }
> > -       }
> > +       for_each_set_bit(priority, pending, INT_IPI + 1)
> > +               kvm_irq_deliver(vcpu, priority);
> >  }
> >
> >  int kvm_pending_timer(struct kvm_vcpu *vcpu)
> > --
> > 2.43.0
> >
> >
