Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4CE1A8BE3
	for <loongarch@lists.linux.dev>; Wed, 31 Jul 2024 08:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722413557; cv=none; b=TlKxE7ZBRsSbQuuofy/jov3pG7R+AVwWTXbNoeUGeAxFI5cQQ2jawkiokKmkHm+Kt/3l8R3QISFATwuBux2hYhBhTnwaj5H9ViT7b5ACCkFmSjo3/d3z0TqwgoWVoftZR5b97GBNhoEeB8gs6iMSxafnkjHDu6j92kb8Mj04sd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722413557; c=relaxed/simple;
	bh=b8hVmojrUfUxc5sorDFfUegqxUC1JzH5YJUFRcGslDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWuC4a6VSlEG4DyX19VObVtAy2UpV8ArEflLVaFU0wKdfy0kcLZ5gbo5n6ZZ0lztYxBeMQH5CAWxE0pbaVhCvTHt/4sWHh621PxMz4cOCfiJ58Cxtfdlg/0OaGmuL/hEkWcJyXr/Y/fYV5pp+5LU9tL/r6hmz4MSP4na78trdaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=JQC5SEKd; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="JQC5SEKd"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5a15c2dc569so4762091a12.3
        for <loongarch@lists.linux.dev>; Wed, 31 Jul 2024 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722413552; x=1723018352; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bPhqvXPcxjB8hmfad49hCHGbmNQ9dpteVou05ijuxXo=;
        b=JQC5SEKdjghRS+1qtVUn0oMGChm650JTkWfVa9YVxgHMzMVfhi1AaDN8rBYO885W99
         XP9FABJyWdu862lW8Gl27c3gIRK5qfbRMeIk9BmF/iptcbMJbzDwiN8amGCr+OOVZXAi
         Tx6mEv1v18PnqXC9n1EakTeJ6mGI+ye2MNM31MQ4FH6F5ihr1PM9jh2r8UDjnZxf76d+
         j0MaTY2zr37lIW+5EWh9NVNJoxP92aPGDgTFQCgaulixs6zohYYhNZiMo9OXbi/ZwNW2
         TByVww7Tls8IkMwRX+nAE/3/ibpoBQhP3OkpsbFDrXXqBAk1N2JkjAoZ9jx0cQ9ujXD5
         e5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722413552; x=1723018352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPhqvXPcxjB8hmfad49hCHGbmNQ9dpteVou05ijuxXo=;
        b=ZdE5nt6kwPgZE4SFrnx6rgmhS3t4pyrZj9B9bDktnzdhqN7IPioBHR4fbjye5OYFRF
         5TbOcVXE8IAt4QpZZeJ6dKQfJTqyHFNAlwnhTpJy8ivUL46x5um6QE/ePeI869pcvmWV
         cLNuX/IaiDQ+ZY+im+qzE3ysHJ5Op5LwpnbxDFaIfcVSIKKUQgeJplH/M1K9xfPC3bhd
         LtbDFFg2wV7YDE2XAY7hWjBIibXHfSEKkW4SCA4/azeztld9guw91AU3AgUTJgG2GHcm
         M6lsoHf+TXI4E6wJtRDOMW+kudfkdsi1IiqoUr8orpLXu0MDtvaQ+FPDv7tS4FYojNpw
         7V2g==
X-Forwarded-Encrypted: i=1; AJvYcCUuJFgB2GwZGSVsc0MJ+5LUuDDr9NiCquZJJMWGiIz5olnzcSXEpNKQ7cFOs+VaYrkJ2/2uj6IC1hRI28dtYGc7gByjV8+4oF+c
X-Gm-Message-State: AOJu0YwG91MpS9dG9bnITTfVCbqQqzPUo/xOR0ko4sBzhc+q384V1mq5
	BhysgWehbubYYOezx8EGjrCTyoP4JKgtlozJicXod3x82dk+6TCTojS4SYa9PLw=
X-Google-Smtp-Source: AGHT+IGxlRCnb+W6DiXG7nTnr6lyiGJnx0i1YWV+5ADomMCnBj37OyG82iPSl5g4jXJI8y3klQMjSg==
X-Received: by 2002:a50:d7c1:0:b0:57d:3df:f881 with SMTP id 4fb4d7f45d1cf-5b021190495mr11744615a12.3.1722413552263;
        Wed, 31 Jul 2024 01:12:32 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac60918cb4sm8394451a12.0.2024.07.31.01.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 01:12:31 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:12:31 +0200
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
Subject: Re: [PATCH v12 57/84] KVM: RISC-V: Mark "struct page" pfns accessed
 before dropping mmu_lock
Message-ID: <20240731-f034f3516f0fffede877c68d@orel>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-58-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726235234.228822-58-seanjc@google.com>

On Fri, Jul 26, 2024 at 04:52:06PM GMT, Sean Christopherson wrote:
> Mark pages accessed before dropping mmu_lock when faulting in guest memory
> so that RISC-V can convert to kvm_release_faultin_page() without tripping
> its lockdep assertion on mmu_lock being held.  Marking pages accessed
> outside of mmu_lock is ok (not great, but safe), but marking pages _dirty_
> outside of mmu_lock can make filesystems unhappy.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/riscv/kvm/mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 06aa5a0d056d..806f68e70642 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -683,10 +683,10 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  out_unlock:
>  	if ((!ret || ret == -EEXIST) && writable)
>  		kvm_set_pfn_dirty(hfn);
> +	else
> +		kvm_release_pfn_clean(hfn);
>  
>  	spin_unlock(&kvm->mmu_lock);
> -	kvm_set_pfn_accessed(hfn);
> -	kvm_release_pfn_clean(hfn);
>  	return ret;
>  }
>  
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
