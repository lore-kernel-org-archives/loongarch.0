Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DD01A7206
	for <loongarch@lists.linux.dev>; Wed, 31 Jul 2024 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722413480; cv=none; b=ROxxRNQX6FwFN/8/qeybiFOseGLRqjq09gvpCFMDW14p8kPIma5LwUUOFl8f3G7BqxTeibo/gft/+6Nobsz3FoLc0THa6A979VtVNHO4LPbW8XyOf+0n250QGYn3CPZWTD29Dz6CAlcNF56XlR/IApCmGHAaZcz06k2LmB+lowU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722413480; c=relaxed/simple;
	bh=2Gl8bDEMJ7EROOAewtyGSnYyggrq+9cliJTSl46a0AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df8/o457uARdSJ+fHSOTnhcmN++8P06A6zvjD0BoSoUrny9H8lXjxZYhjCTCqRfDSULJvQpvVX2vv7JkpFwtvQS2V0HUovEecWD70gYNaiwj+2egDWXZ6//l8/L8n7kqZQTqfNEmTrR79YKLa2FNPu++MQWzWMcaYYp2Nji5pkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ErkeHUWL; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ErkeHUWL"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7a8553db90so747374966b.2
        for <loongarch@lists.linux.dev>; Wed, 31 Jul 2024 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722413476; x=1723018276; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/6o5eOKMgYVhFfCfAX4KZTyTvIb4CeiZ7EcRemTMKgE=;
        b=ErkeHUWLQ5Gy3HywY+H59V4VozpgKNCzYWF91LIFe7vx27Zr7eKBM06okUvbwRVhgl
         /kvnyNMYrO4FHJ1iCCz07RAg4kW0IbZnCWl9iyMafBhHJ7eDA3u04180qGoncyuMYia+
         3Q83j6XfhRSIzwJP5MBaOtB9pm3NAiJCB+D8p4mAbLsvPDH6D+ghFoGrcWwrf0lPD2xL
         IE3DMgjdTQGJeBiEtHx0RHXD4bzShkEa3/psk9XSv7hUqeZUS+rHJJA2hHgLwZdX4k6a
         YKzck9jAFX3FftxJb4SD8DBIe1EqXfuUulV2F8Ut0XD49ZTPtWyPG0SF6KCVo3dUMBsq
         zMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722413476; x=1723018276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6o5eOKMgYVhFfCfAX4KZTyTvIb4CeiZ7EcRemTMKgE=;
        b=bI+nvgNL7V4hD9cJCQbaOhrI9VCpQgpXo6BB5G3FqCP4iCAt3p6LC6xh8LQgF66Ivo
         uLA/Po+PxEPtfR+BJB3gP/FunH7M288XqXjcxVG6mhwQLud3uxwkfWwsks8cQ3jXUe+g
         sBGXHW3+hZhhDwmiwIGjABAycn28IdpDEfsoiU3J4tbpNJzlUnXguMPoLO4Fg5ftSKa9
         uUNE2GV87FMgKQnFJ7S8vVHGb4XkgpIGYV5A2TDQBMFocSyYxKrOECMsZEGZpS0qc87x
         6JniCjq6x1/D1T0XcjtGd8qz84vrgKlF5ggmwvCQ1/FK1mbaqnre0SK1GgsAOaF5fhFA
         uvZg==
X-Forwarded-Encrypted: i=1; AJvYcCWv5NxRuXZ6Ur8UjV6ZQopPgaEsu9HJKuGKyX1OBsbg7cvpPWcPGVJsIqKWiE/rab3SgwVtnqICOsQGC7wxsbALPGxO1JeQtfiB
X-Gm-Message-State: AOJu0YxbI3Rv/5h6h6gLgUCrZHT8tquiII+kO7Mb830bqcGOQbX7HwsV
	VJKd87iaUuheGBl9rnlrkSDym3xGxbH4djaYiIRD50tFqs52YDue0zFyeBD0PtQ=
X-Google-Smtp-Source: AGHT+IF8KtMuBT/lx87J71F/lRrgIXThKYLKm0Q9zh/TR0QeaI4sQXL1DHSiINUT/9ZA+lMCzDpL5Q==
X-Received: by 2002:a17:907:1b26:b0:a7a:af5d:f312 with SMTP id a640c23a62f3a-a7d4011442emr913154866b.46.1722413475678;
        Wed, 31 Jul 2024 01:11:15 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad414e2sm738525466b.127.2024.07.31.01.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 01:11:15 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:11:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 58/84] KVM: RISC-V: Use kvm_faultin_pfn() when
 mapping pfns into the guest
Message-ID: <20240731-a5f8928d385945f049e5f96e@orel>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-59-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726235234.228822-59-seanjc@google.com>

On Fri, Jul 26, 2024 at 04:52:07PM GMT, Sean Christopherson wrote:
> Convert RISC-V to __kvm_faultin_pfn()+kvm_release_faultin_page(), which
> are new APIs to consolidate arch code and provide consistent behavior
> across all KVM architectures.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/riscv/kvm/mmu.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 806f68e70642..f73d6a79a78c 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -601,6 +601,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  	bool logging = (memslot->dirty_bitmap &&
>  			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
>  	unsigned long vma_pagesize, mmu_seq;
> +	struct page *page;
>  
>  	/* We need minimum second+third level pages */
>  	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
> @@ -631,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  
>  	/*
>  	 * Read mmu_invalidate_seq so that KVM can detect if the results of
> -	 * vma_lookup() or gfn_to_pfn_prot() become stale priort to acquiring
> +	 * vma_lookup() or __kvm_faultin_pfn() become stale priort to acquiring
                                                            ^ while here
						could fix this typo

>  	 * kvm->mmu_lock.
>  	 *
>  	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
> @@ -647,7 +648,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		return -EFAULT;
>  	}
>  
> -	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
> +	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
>  	if (hfn == KVM_PFN_ERR_HWPOISON) {
>  		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
>  				vma_pageshift, current);
> @@ -681,11 +682,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		kvm_err("Failed to map in G-stage\n");
>  
>  out_unlock:
> -	if ((!ret || ret == -EEXIST) && writable)
> -		kvm_set_pfn_dirty(hfn);
> -	else
> -		kvm_release_pfn_clean(hfn);
> -
> +	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
>  	spin_unlock(&kvm->mmu_lock);
>  	return ret;
>  }
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
