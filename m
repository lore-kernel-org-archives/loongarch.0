Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9561EB4AD
	for <loongarch@lists.linux.dev>; Tue,  6 Aug 2024 15:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722956675; cv=none; b=PO/WXbHE5yiNzkbUYkiEho/oNekbK+Z+p0+2HmoRnE4Cn+CWXNtUCVLKOAtMJmyw7qJfZ9N8N8GDrvTFHdnaEewRKXDFxlCxhYq8Q6u2SyM2pkosrCCZTKOB9OjRH/CXB+/HvllNfw9ulJx4L2VXd+nxeDzuv3w5TsktpZMiuJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722956675; c=relaxed/simple;
	bh=LUNW9RUIstkrjibzIwDixQZwd8z0VowIYpuqj/xpKxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LoFnySLeYhNBjL2KgqJi81+3y2wxVPJDsMI6+VSR/kTQ9c3ANSxSdOUunZ+2T5YGwjmyYoUPimqwhx3RLlEaHB1/VNiZtq0vg5DKbkjjN4YJOFMPBNJUOdsVvVaPZwyxdVgrDJgJbV+z569Z7vCZGQInaonONQLQOY0YYemzXNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=YFhpMdNJ; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="YFhpMdNJ"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-816ca307407so27876339f.2
        for <loongarch@lists.linux.dev>; Tue, 06 Aug 2024 08:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1722956672; x=1723561472; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLbAu/3JQVhbekGE1m18EyrvzfniM5U0p+PtTw3SPlQ=;
        b=YFhpMdNJsX1I38w9hgilx9IeoNEcRPfUutZDylHGvcpaEUZUGN1XOwVW4voQhU2lbB
         JsdWnC75u4LrcdlZ8IvQfHtNAv6a2Sa+f7IBoe/iB+w7l2xp7e2Rr/iz1zf/75LWOm3i
         wtYu/AgnSBcq+vqTLphUvh1YuZHi0+dEf7IfLOnzYPBcB/aYG09E2eQGcZ2EUU1slOSq
         IuqoD+egy7/Ql/+XrtY7TLOhR+Mh5WwMrIbUbZlqRBmPU/e4nEnn90kPGA+deVaXbkVC
         vr3mrrIKrcjOQgZVDAlVcbXy8+L2t8aiUOzxq6c4beYoNvXuOuDZu6Ik+EfgDl2dJo5h
         3bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722956672; x=1723561472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLbAu/3JQVhbekGE1m18EyrvzfniM5U0p+PtTw3SPlQ=;
        b=tmcTEIYg1PNhpkvidOmArsrokebV2aQoJLKVgTk0vdcUvWu1lXpjcHNfKctxO6h6vk
         mM5QkaK8aEsV1A2RbmVaaIo2ly4lQ9ynwpeKp5uBn9TnvmDIu1lYDuXp7WXLhVmvm2zL
         F4sYQelmT/TcRuUQoVLcYdE3ilS1turNT3YocJwvrLomwfGjsSF0MrkqinQQZw9J0Cs0
         8vyRgFhJdxox2KIxe+8263Bp7My3p4qrRiGn9b122DRh7TVIgiZ0RdijIOEPfkp4DA82
         Q7HRN0wV6Q/jGQA9CK+/sBbuSgyMF0HIn2xUcnol2U2R3kI0it44t1KSqwNTqauA4Anh
         F8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVnCZo9E1Lu2WNcfme8I5+GV34lTXsY4RDMV1BfZKpPEBhYSEkBPp4MKzRUw4x1nwchQi/XAriRKFUfnYHBYpbTfR/riBIyeYUd
X-Gm-Message-State: AOJu0YxSzFYU0Y8pxNo8NgetES1iZMmSBR2TFAXoveuCnwPlFU7Vtr0g
	FuyU3P04QAMaX7geYbEY/CvZOZWaSQaIFfwko0QKj8akDktzOlTs+K4H+7AuwN1LaCYmD+N8mFe
	4ByEBQ6e2j+OTbFyg/hQaXtadOpa4Sz69wnlcQA==
X-Google-Smtp-Source: AGHT+IHdYOEWf6qlsoZVXjSZ7lVz4nHt9XoyHycNquwMn333FMaz4B6ys0O5Sw1BKpWpYjBg2+pZRslO+PRicrnJai8=
X-Received: by 2002:a92:d1cd:0:b0:39a:e86b:a76a with SMTP id
 e9e14a558f8ab-39b1fc2bbbdmr148654105ab.26.1722956671518; Tue, 06 Aug 2024
 08:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-59-seanjc@google.com>
In-Reply-To: <20240726235234.228822-59-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Aug 2024 20:34:20 +0530
Message-ID: <CAAhSdy2whfRBm9HBkr=gSwxpFHGwGtB70fKNCqG1-MeHmB1K7w@mail.gmail.com>
Subject: Re: [PATCH v12 58/84] KVM: RISC-V: Use kvm_faultin_pfn() when mapping
 pfns into the guest
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 27, 2024 at 5:24=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Convert RISC-V to __kvm_faultin_pfn()+kvm_release_faultin_page(), which
> are new APIs to consolidate arch code and provide consistent behavior
> across all KVM architectures.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  arch/riscv/kvm/mmu.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 806f68e70642..f73d6a79a78c 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -601,6 +601,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>         bool logging =3D (memslot->dirty_bitmap &&
>                         !(memslot->flags & KVM_MEM_READONLY)) ? true : fa=
lse;
>         unsigned long vma_pagesize, mmu_seq;
> +       struct page *page;
>
>         /* We need minimum second+third level pages */
>         ret =3D kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
> @@ -631,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>
>         /*
>          * Read mmu_invalidate_seq so that KVM can detect if the results =
of
> -        * vma_lookup() or gfn_to_pfn_prot() become stale priort to acqui=
ring
> +        * vma_lookup() or __kvm_faultin_pfn() become stale priort to acq=
uiring
>          * kvm->mmu_lock.
>          *
>          * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pa=
irs
> @@ -647,7 +648,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>                 return -EFAULT;
>         }
>
> -       hfn =3D gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
> +       hfn =3D kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
>         if (hfn =3D=3D KVM_PFN_ERR_HWPOISON) {
>                 send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
>                                 vma_pageshift, current);
> @@ -681,11 +682,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>                 kvm_err("Failed to map in G-stage\n");
>
>  out_unlock:
> -       if ((!ret || ret =3D=3D -EEXIST) && writable)
> -               kvm_set_pfn_dirty(hfn);
> -       else
> -               kvm_release_pfn_clean(hfn);
> -
> +       kvm_release_faultin_page(kvm, page, ret && ret !=3D -EEXIST, writ=
able);
>         spin_unlock(&kvm->mmu_lock);
>         return ret;
>  }
> --
> 2.46.0.rc1.232.g9752f9e123-goog
>
