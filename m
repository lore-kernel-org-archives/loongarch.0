Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAC01A7F6E
	for <loongarch@lists.linux.dev>; Wed, 31 Jul 2024 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722413499; cv=none; b=QpEQ/j/Lfz4bIUcFWrrCrfp7CvsLvXVcpTTD2gaJTjG2X7chwAN+qboGNAXdSrag2bq3HxNtm9BPXiQY4/cA//5zdyIfcMN0SkS8ecpvSZVJLJvoV+2v0+qZw2Yc11uDG1on+UagDrhJdUM7pzvkzOfagnAqdVvwcxHZlmiIQw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722413499; c=relaxed/simple;
	bh=7y80z9vltmygihtb/PjFOov0Ly9Wsms87Ew+RYBWeW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cd8x5tD9yMSxHRdQoDo3ScR5ZJ0DcWmYB3juNfQWqbG+SYHRaF/WeoPv6IM0TnVp/RvE7A3QMWYGe7qMX1HBahuaxxFgkYqTzd6R1m+A/Jp4gmH/Tlg4P3lVXCmwKhjSdFVxQjP7jF63MZ99mw/20xnk6MIrD1Ky9OH7IhG0fac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=MKPdIWnw; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="MKPdIWnw"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so124063366b.0
        for <loongarch@lists.linux.dev>; Wed, 31 Jul 2024 01:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722413496; x=1723018296; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1i19l7d1eZbhVp7fQ4bZoRAfF6lLDsSZcH8bPmRvWiA=;
        b=MKPdIWnwaI/BbtF1zT2mFH23/wge3S+ZXdu/6SEZuXz94eYJVdKYrnTXYdv9sEvOQb
         lS5K4OiGVc6eJvnNCWuzkxxBC1UixPlC+uR8jys8u2rHRdyjk9eAYDIsgArTYFtKdjt6
         MHpm6nmOVbDUPZ6BhsdF4j7gvXfN4gb0nmLeKTbsdfulie5YBAab8lWe2wZ6tbc2XJIR
         P/VEQeSB+i2dpvMio0m0ykqxHyNM1XLnuhPcLqZwNgH5jNjjHzO/RVQlkzQ8AeIJLW+P
         jm4JOCezZriRcFCRGGyds4DrL4wvDyn6YQ4AEyJ57GFrBJw/2L2/32+/bVv/LBkOa0W2
         VnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722413496; x=1723018296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1i19l7d1eZbhVp7fQ4bZoRAfF6lLDsSZcH8bPmRvWiA=;
        b=PGrOeKNKsMijayo7pcHhAVA+/Dpu8eXfPsWChLzU27N6otbKgOEntGjKGrq6j9n/ve
         wdzSs77+Mdtl0Vs3QQED9YN91vI6+ZysxZv30l2GnoNCyqAPqQdfjoN/lRHpMhEDBcv/
         qNpTQ7Zt3GJHxH/HkWr7uJeQfWTGP9mxoB7w3fBIzHpvLo3vgRtkoNZIUyN6lyxWylNa
         16l+Xmq9MwNBR/msPwR8AdIoQ9Mk+LlteLsarccHu9mqCsoU6ywv51U/HtXBGI3+yNCg
         7li5F3EsaB7c4s7VUKfOBn9Ex0hhqKIWhNPcXW69bERSTTwrc+wtFC/J/5LtLSsEvMu6
         jOBA==
X-Forwarded-Encrypted: i=1; AJvYcCVPJO6nz3ctZ/eO+dZ+GmHP70uC6b5tsysjVsaHV7973H8AEpxVsPD8sF5OG7JPgj9vlmgIOqgmm1vLy6HuiYHWId0HDCW6/pee
X-Gm-Message-State: AOJu0YzhxBJ22UCSBibwsNPXVixrWynchrgRNC31xQdzpFYjuIpw0hzV
	Q9+z+TrMmKUiKz5uLIbo3XBTn4U/3mar53oYHjsoNHu6pyKnNNRKws/61JE0SSs=
X-Google-Smtp-Source: AGHT+IEAM3rgFV5Nss1oeOJc4d0T/p6GjpLY5HpQ/UfV3bepvtCwNBml7jly3uQHrfiUKxZe0LrJkQ==
X-Received: by 2002:a17:907:60cb:b0:a7d:88c4:2897 with SMTP id a640c23a62f3a-a7d88c437b8mr269366466b.2.1722413495475;
        Wed, 31 Jul 2024 01:11:35 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb8361sm734690366b.207.2024.07.31.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 01:11:35 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:11:34 +0200
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
Subject: Re: [PATCH v12 56/84] KVM: RISC-V: Mark "struct page" pfns dirty iff
 a stage-2 PTE is installed
Message-ID: <20240731-0456655970f6ae99f907de43@orel>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-57-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726235234.228822-57-seanjc@google.com>

On Fri, Jul 26, 2024 at 04:52:05PM GMT, Sean Christopherson wrote:
> Don't mark pages dirty if KVM bails from the page fault handler without
> installing a stage-2 mapping, i.e. if the page is guaranteed to not be
> written by the guest.
> 
> In addition to being a (very) minor fix, this paves the way for converting
> RISC-V to use kvm_release_faultin_page().
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/riscv/kvm/mmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index b63650f9b966..06aa5a0d056d 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -669,7 +669,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		goto out_unlock;
>  
>  	if (writable) {
> -		kvm_set_pfn_dirty(hfn);
>  		mark_page_dirty(kvm, gfn);
>  		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
>  				      vma_pagesize, false, true);
> @@ -682,6 +681,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		kvm_err("Failed to map in G-stage\n");
>  
>  out_unlock:
> +	if ((!ret || ret == -EEXIST) && writable)
> +		kvm_set_pfn_dirty(hfn);
> +
>  	spin_unlock(&kvm->mmu_lock);
>  	kvm_set_pfn_accessed(hfn);
>  	kvm_release_pfn_clean(hfn);
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

