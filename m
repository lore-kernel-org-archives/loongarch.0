Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D62174EFC
	for <loongarch@lists.linux.dev>; Tue, 28 May 2024 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716923775; cv=none; b=IgvCYUsn9TGk6wMFrxt3sm+YgLJOe1rZBQbVfo5dvYMPJ4qhNax1su0BMdz6ir5rVKoegSRM6O3XIeJBrKSjTLD3NWtNtwjcUw40XyY+IdMxxSPgFCeJtgDIMtpC269OPHkwD7w9nd4H/7Na3cpQYPO2L7NZIKdYVn5Lm5HOY6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716923775; c=relaxed/simple;
	bh=ag7+h70RDNCub6CI9FhMvv9doD/tLeJlJWjTiOiUnAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mzn8QAst0DgPIr0YSMwqqGnbp4dt8rcNGDKS/4ScrraPq4OIv/jgjQmVGfZhD6WoBXrGs1lpjrnZoqUlb2o6CKM6mlGw/vqoL5ptUZhR0tSPLTHJtgJMgCTdmcp1mUFtLrUUtO+LEoJtoid/eSzkb1pchclPHM3DpaYKn6XUjBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gG9tTlJE; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gG9tTlJE"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-df789a425d3so1931622276.2
        for <loongarch@lists.linux.dev>; Tue, 28 May 2024 12:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716923773; x=1717528573; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aN1FoCckBsPH3nlr2F+fxU8+3rgvDDBf83ZZTupmDzY=;
        b=gG9tTlJErS+oT2HDHWYgold3kB/o6Y+H+3tA/Vo8X2ZYgopcNs2QWDw0PTzLlRa1pK
         u9NUIZ3IRKqjFliwRkJTEDJYOaZgve1G44nwbM8DvHNe6Mi/1t+vmXr9ra+9l11YNOpR
         nzCXq8J+cs1BHPVE2kUWAuC3Prsu5DhOTOjAHJHKnjflLaLD7NLzJROC+tZRf8YAAB2k
         DlG/TXGQWSkqRCwjZM9vdZ0Nb8P6P4jQcuf4AJWDOPT9sljZIXmwNONmEDUs98gJ/y9s
         BPhlTO3x7pzU9VOKH+gvUXyq4JOxEN96Trr+FHmpmYOL8dAKeVJ/0OmK1Qz5qd8NYe0N
         RZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923773; x=1717528573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aN1FoCckBsPH3nlr2F+fxU8+3rgvDDBf83ZZTupmDzY=;
        b=RG7ihv9JhtQRhDRi5Fi6SP6ogrPvF/0sYOPlirk1NYt8OO1/vONlN8g+OCdhGsNyl+
         0N7We9EAbkwBkHfJALWuwEdp4dTtjJ8DhIkcbAguW7XIMyY4KdVNynjWtdexfH8lojeQ
         ITJ4UDCsWHpTLjNWCNGKlTZYB1rEkolwhTOupu+cvu2DPsgxJ6Ks1EyZm4iNca1zW/3O
         f4+WHNXybhd+lspRztLox4nlTJj4fVxTfVeJLa0H8GU1YkUDy4xQ8UaB2YP9bkYPQalY
         c391uX/6OlXPhx17YKarpf21zrx8i2pb9MXtb/ptngRktclD1exOVPsjMsNYSJwn/xLS
         5BEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrTw5qcaYGPd6D5rQIVuEVO1M8YnWws1+HkKBODz+RDR2NgG3VdOFYeMq4nb8wk1hv5HSyBHfsztzwFICHy2HgNjfH3HKzaiVD
X-Gm-Message-State: AOJu0YxG/Rg75a2cTlhp11iq4NaHVd29WWA2f/iSFmCjr7kwpDfbsSBv
	xTPhf9O+KWj4lTlKTKSeiYSl2vTfx7roO3WlDwypXXjjNgHHO75nmF+m/Rqf3qEdqbzLVE52ez7
	6uA==
X-Google-Smtp-Source: AGHT+IEYffSoUdZ4cg7KX8v+KoP4uvokISlIeu5qUtxtXAQ85EyWGJZei7jVgr6jZvnufr8gfWsoMUgR1K8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:10c3:b0:df7:943d:f935 with SMTP id
 3f1490d57ef6-df7943e55a0mr788014276.2.1716923773190; Tue, 28 May 2024
 12:16:13 -0700 (PDT)
Date: Tue, 28 May 2024 12:16:11 -0700
In-Reply-To: <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com> <20240522014013.1672962-4-seanjc@google.com>
 <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com>
Message-ID: <ZlYte16cvQpPGHkx@google.com>
Subject: Re: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 24, 2024, Kai Huang wrote:
> > @@ -1548,6 +1548,9 @@ static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> >   	struct vcpu_svm *svm = to_svm(vcpu);
> >   	struct svm_cpu_data *sd = per_cpu_ptr(&svm_data, cpu);
> > +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> > +		shrink_ple_window(vcpu);
> > +
> 
> [...]
> 
> > @@ -1517,6 +1517,9 @@ void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> >   {
> >   	struct vcpu_vmx *vmx = to_vmx(vcpu);
> > +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> > +		shrink_ple_window(vcpu);
> > +
> 
> Nit:  Perhaps we need a kvm_x86_ops::shrink_ple_window()?  :-)

Heh, that duplicate code annoys me too.  The problem is the "old" window value
comes from the VMCS/VMCB, so either we'd end up with multiple kvm_x86_ops, or
we'd only be able to consolidate the scheduled_out + kvm_pause_in_guest() code,
which isn't all that interesting.

Aha!  Actually, VMX already open codes the functionality provided by VCPU_EXREG_*,
e.g. has vmx->ple_window_dirty.  If we add VCPU_EXREG_PLE_WINDOW, then the info
get be made available to common x86 code without having to add new hooks.  And
that would also allow moving the guts of handle_pause()/pause_interception() to
common code, i.e. will also allow deduplicating the "grow" side of things.
