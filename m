Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA11D6DDB
	for <loongarch@lists.linux.dev>; Tue,  6 Aug 2024 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722956654; cv=none; b=nL8FU0tYxA7jGabeb0/HMUeNgotvgItI/YhQeCARKHS8OYPMxHg6wl9O+mI0+FwIXFsWDi4uKR8z20ci5mRQNcrprPoxEgZYMPhwm9ZRoc8lmBw+oz26s+v1yRWS/lNWrCmk/ozV/c32HMM1wQlD6uvYr90gHoGglFecMIrtqbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722956654; c=relaxed/simple;
	bh=Ojp+5mgXIeLmoaOntdYobjdPsSlf5Jv2i52l1FMoU8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PE9K+o7OpknP9CGK52/Kk+kpr7H9jSZ2zuXkYhW1nq2CnnNROXgi/PpYCQ6Mqj7kq4dCYt5wyPdzsAlFqCSgXf5WRSxZIMqabMqZz6xXw6+Kp2RukptxNMGM8Qlzenr4u0fpZOthRwwpSRKd6V6NvhE3m+vs90Cgg6ba5bde3Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=QtCe5kh2; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="QtCe5kh2"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-39b3e12754eso2789965ab.1
        for <loongarch@lists.linux.dev>; Tue, 06 Aug 2024 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1722956651; x=1723561451; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nqpVJEa3gF+vLMgvdD8twTbWevyBd39Y3ES27W51MM=;
        b=QtCe5kh2oAFgYHFizC8ytOIItJmIE7nkani7O+lZs85DzAffl+IKvbL2mnTKLo4KJk
         xS26WJPqOBmG5h/m+HVwgQMaBGBGY7kcvSBJduVD57RKMf2g7J9fJsmm9klDMzvstAn3
         Z6Oho53KR4ZGiawIYr0ETRfsqZoE8fUWoScr3fWZ69szobgINEO6667SS2z6Ji4bxc/B
         H90UKwgFp4j4m9nhnkZEQmEvPAfaWb6G9ynEEZCueIOmwwL31wMNfrYlaWnTz6iuPIzi
         2iJehlP++zWeJ4v0eRij3dH2Dujc63LgI6t4y2ze9MRHQY0OvEX6eqiQcIQkfcBV9Jhs
         D99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722956651; x=1723561451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nqpVJEa3gF+vLMgvdD8twTbWevyBd39Y3ES27W51MM=;
        b=gmxWApiWE/llxegYDeEmzoJqRPkDnXzFoM9pgdD2WrA+Z6RcmzhVxUcZOSb91tJdcs
         itVDq+Z1rkBjC6R7Y3l95GascgkEK6gBonmYRItbSINakD05SqEcPYBuLROArTEweNQX
         t09SXN3AuyLXckqc36mHAhsOK47hgbyYzNCXT7WZ4YYGzyOtVfyV+QtcqCXRqd6S3+dQ
         Ptij1RAsOpgquS0TZ0SR7KCt/9jUubDg3pxKyas2aYt3TX1YQOe/Bz+2GLEbQtI9HpXj
         Ffrem5sdDTzDdPiW151SLo1OgwCPms2ztTK9Lpb8hZcEf1PUs3KfQQbAiQfp1lPuMug8
         NEEw==
X-Forwarded-Encrypted: i=1; AJvYcCVUeGUXepzp252TDOsk4DPyjpjFXAG61bkYDL1sCBdwfedEGvJxe0pHActq4P9ag51BwXVa0D5XyrYXTySXCcg3hyzrLfeKmxqp
X-Gm-Message-State: AOJu0YyTNkhUAnVYdshmNIsp65vVmkGt+b7fkBfvcWrwrGWAhznuaUt7
	GoZdd2VsoySnSSx4ikoAvzEkcnzjwviXBP0dXgvtjD/GjxdnsL6swBR2jLaw7tmhsCP80kON89G
	lqGAgFFIa/eEoZVFu/AVDWOnrt9kYwFEUgodnhQ==
X-Google-Smtp-Source: AGHT+IE5dkU8O3hsRzTzR3mqE211YMexCU92LD+ZH2mO65SVdE7w+UZ8Equ/sKTPvXFYaRtJg+9DX/UprpD7ulXsS18=
X-Received: by 2002:a92:d64d:0:b0:397:d9a9:8769 with SMTP id
 e9e14a558f8ab-39b1fc37fe5mr152610645ab.24.1722956650868; Tue, 06 Aug 2024
 08:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-57-seanjc@google.com>
In-Reply-To: <20240726235234.228822-57-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Aug 2024 20:33:59 +0530
Message-ID: <CAAhSdy1DvkU_C2jmtA1SBNfjp1gxu_6RhFKbf-hkhSNQeTXwwA@mail.gmail.com>
Subject: Re: [PATCH v12 56/84] KVM: RISC-V: Mark "struct page" pfns dirty iff
 a stage-2 PTE is installed
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
> Don't mark pages dirty if KVM bails from the page fault handler without
> installing a stage-2 mapping, i.e. if the page is guaranteed to not be
> written by the guest.
>
> In addition to being a (very) minor fix, this paves the way for convertin=
g
> RISC-V to use kvm_release_faultin_page().
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  arch/riscv/kvm/mmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index b63650f9b966..06aa5a0d056d 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -669,7 +669,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>                 goto out_unlock;
>
>         if (writable) {
> -               kvm_set_pfn_dirty(hfn);
>                 mark_page_dirty(kvm, gfn);
>                 ret =3D gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHI=
FT,
>                                       vma_pagesize, false, true);
> @@ -682,6 +681,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>                 kvm_err("Failed to map in G-stage\n");
>
>  out_unlock:
> +       if ((!ret || ret =3D=3D -EEXIST) && writable)
> +               kvm_set_pfn_dirty(hfn);
> +
>         spin_unlock(&kvm->mmu_lock);
>         kvm_set_pfn_accessed(hfn);
>         kvm_release_pfn_clean(hfn);
> --
> 2.46.0.rc1.232.g9752f9e123-goog
>
